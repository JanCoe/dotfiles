import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

Scope {
    id: root

    property bool menuVisible: false
    property var menuStack: []
    property string currentMenu: "main"
    property int selectedIndex: 0

    property var menus: ({
        main: [
            { label: "books", icon: "📖", action: "books" },
            { label: "configs", icon: "⚙️", action: "submenu", target: "configs" },
            { label: "connect", icon: "🔗", action: "submenu", target: "connect" },
            { label: "system", icon: "⚡", action: "submenu", target: "system" },
            { label: "utilities", icon: "🔧", action: "submenu", target: "utilities" }
        ],
        configs: [
            { label: "aliases", icon: "", action: "edit", file: "$HOME/.aliases" },
            { label: "bash", icon: "", action: "edit", file: "$HOME/.bashrc" },
            { label: "foot", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/foot/foot.ini" },
            { label: "hyprland", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/hypr/hyprland.conf" },
            { label: "hyprland-keymaps", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/hypr/keymaps.conf" },
            { label: "nvim", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/nvim/init.lua" },
            { label: "nvim-keymaps", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/nvim/lua/config/keymaps.lua" },
            { label: "profile", icon: "", action: "edit", file: "$HOME/.profile" },
            { label: "starship", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/starship/starship.toml" },
            { label: "quickshell", icon: "", action: "edit", file: "$XDG_CONFIG_HOME/quickshell/" }
        ],
        connect: [
            { label: "audio", icon: "🔊", action: "cmd", cmd: ["pavucontrol"] },
            { label: "bluetooth", icon: "🅱️", action: "cmd", cmd: ["blueman-manager"] },
            { label: "wifi", icon: "📶", action: "cmd", cmd: ["nm-connection-editor"] }
        ],
        system: [
            { label: "monitor", icon: "", action: "cmd", cmd: ["toggle-monitor"] },
            { label: "poweroff", icon: "⏹", action: "cmd", cmd: ["poweroff"] },
            { label: "reboot", icon: "🔄", action: "cmd", cmd: ["reboot"] }
        ],
        utilities: [
            { label: "screenshot", icon: "", action: "cmd", cmd: ["screenshot"] }
        ]
    })

    IpcHandler {
        target: "systemmenu"
        function toggle() { root.toggle() }
    }

    function toggle() {
        if (menuVisible) {
            dismiss()
        } else {
            currentMenu = "main"
            menuStack = []
            selectedIndex = 0
            menuVisible = true
        }
    }

    function dismiss() {
        menuVisible = false
        currentMenu = "main"
        menuStack = []
        selectedIndex = 0
    }

    function navigateTo(menu) {
        menuStack = menuStack.concat([currentMenu])
        currentMenu = menu
        selectedIndex = 0
    }

    function navigateBack() {
        if (menuStack.length > 0) {
            let stack = menuStack.slice()
            currentMenu = stack.pop()
            menuStack = stack
        } else {
            dismiss()
        }
        selectedIndex = 0
    }

    function executeItem(item) {
        if (item.action === "submenu") {
            navigateTo(item.target)
        } else if (item.action === "books") {
            booksScanOutput = ""
            booksScanProc.running = true
        } else if (item.action === "openbook") {
            cmdProcess.command = ["zathura", item.file]
            cmdProcess.startDetached()
            dismiss()
        } else if (item.action === "edit") {
            cmdProcess.command = ["sh", "-c", "$TERMINAL -e nvim " + item.file]
            cmdProcess.startDetached()
            dismiss()
        } else if (item.action === "cmd") {
            cmdProcess.command = item.cmd
            cmdProcess.startDetached()
            dismiss()
        }
    }

    property string booksScanOutput: ""

    Process {
        id: booksScanProc
        command: ["sh", "-c", "find ~/Sync/Books -type f -name '*.pdf' 2>/dev/null"]
        stdout: SplitParser {
            onRead: data => {
                if (data.trim()) root.booksScanOutput += data.trim() + "\n"
            }
        }
        onExited: (exitCode, exitStatus) => {
            let lines = root.booksScanOutput.trim().split("\n").filter(l => l.length > 0)
            let items = lines.map(path => {
                let parts = path.split("/")
                let name = parts[parts.length - 1].replace(/\.pdf$/i, "")
                return { label: name, icon: "", action: "openbook", file: path }
            })
            items.sort((a, b) => a.label.localeCompare(b.label))
            let updated = Object.assign({}, root.menus)
            updated.books = items
            root.menus = updated
            root.navigateTo("books")
        }
    }

    Process {
        id: cmdProcess
    }

    LazyLoader {
        id: menuLoader
        active: root.menuVisible

        PanelWindow {
            anchors {
                top: true
                left: true
            }

            implicitWidth: menuColumn.implicitWidth + 24
            implicitHeight: menuColumn.implicitHeight + 24
            color: Theme.background1

            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

            FocusScope {
                anchors.fill: parent
                focus: true

                Keys.onPressed: event => {
                    let items = root.menus[root.currentMenu] || []
                    let count = items.length
                    if (event.key === Qt.Key_Down || event.key === Qt.Key_J) {
                        root.selectedIndex = (root.selectedIndex + 1) % count
                        event.accepted = true
                    } else if (event.key === Qt.Key_Up || event.key === Qt.Key_K) {
                        root.selectedIndex = (root.selectedIndex - 1 + count) % count
                        event.accepted = true
                    } else if (event.key === Qt.Key_Return || event.key === Qt.Key_Right || event.key === Qt.Key_L) {
                        root.executeItem(items[root.selectedIndex])
                        event.accepted = true
                    } else if (event.key === Qt.Key_Escape || event.key === Qt.Key_Left || event.key === Qt.Key_H) {
                        root.navigateBack()
                        event.accepted = true
                    }
                }

                ColumnLayout {
                    id: menuColumn
                    anchors.centerIn: parent
                    spacing: 2

                    RowLayout {
                        visible: root.menuStack.length > 0
                        spacing: 4

                        Text {
                            text: "← back"
                            font.family: Theme.fontFamily
                            font.pixelSize: Theme.fontSize - 4
                            color: Theme.colour2

                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: root.navigateBack()
                            }
                        }

                        Text {
                            text: "/ (" + root.currentMenu + ")"
                            font.family: Theme.fontFamily
                            font.pixelSize: Theme.fontSize - 4
                            color: Theme.foreground2
                        }
                    }

                    Repeater {
                        model: root.menus[root.currentMenu] || []

                        Rectangle {
                            id: menuItem
                            Layout.fillWidth: true
                            implicitWidth: row.implicitWidth + 24
                            implicitHeight: row.implicitHeight + 16
                            radius: 4
                            color: (mouseArea.containsMouse || index === root.selectedIndex) ? Theme.background3 : "transparent"

                            required property var modelData
                            required property int index

                            RowLayout {
                                id: row
                                anchors.verticalCenter: parent.verticalCenter
                                anchors.left: parent.left
                                anchors.leftMargin: 8
                                spacing: 8

                                Text {
                                    text: menuItem.modelData.icon
                                    font.pixelSize: Theme.fontSize - 2
                                    visible: menuItem.modelData.icon !== ""
                                }

                                Text {
                                    text: menuItem.modelData.label
                                    font.family: Theme.fontFamily
                                    font.pixelSize: Theme.fontSize - 2
                                    color: Theme.foreground1
                                }

                                Text {
                                    text: "›"
                                    font.family: Theme.fontFamily
                                    font.pixelSize: Theme.fontSize - 2
                                    color: Theme.background4
                                    visible: menuItem.modelData.action === "submenu"
                                }
                            }

                            MouseArea {
                                id: mouseArea
                                anchors.fill: parent
                                hoverEnabled: true
                                cursorShape: Qt.PointingHandCursor
                                onEntered: root.selectedIndex = menuItem.index
                                onClicked: root.executeItem(menuItem.modelData)
                            }
                        }
                    }
                }
            }
        }
    }
}
