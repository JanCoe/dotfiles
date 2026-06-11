import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import qs.Theme

Scope {
    id: root

    property bool menuVisible: false
    property var menuStack: []
    property string currentMenu: "main"
    property int selectedIndex: 0

    readonly property var mainMenu: [
        { label: "books", icon: "📖", action: "books" },
        { label: "configs", icon: "⚙️", action: "submenu", target: "configs" },
        { label: "connect", icon: "🔗", action: "submenu", target: "connect" },
        { label: "system", icon: "⚡", action: "submenu", target: "system" },
        { label: "utilities", icon: "🔧", action: "submenu", target: "utilities" }
    ]

    readonly property var configsMenu: [
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
    ]

    readonly property var connectMenu: [
        { label: "audio", icon: "🔊", action: "cmd", cmd: ["pavucontrol"] },
        { label: "bluetooth", icon: "🅱️", action: "cmd", cmd: ["blueman-manager"] },
        { label: "wifi", icon: "📶", action: "cmd", cmd: ["nm-connection-editor"] }
    ]

    readonly property var systemMenu: [
        { label: "monitor", icon: "", action: "cmd", cmd: ["toggle-monitor"] },
        { label: "poweroff", icon: "⏹", action: "cmd", cmd: ["poweroff"] },
        { label: "reboot", icon: "🔄", action: "cmd", cmd: ["reboot"] }
    ]

    readonly property var utilitiesMenu: [
        { label: "screenshot", icon: "", action: "cmd", cmd: ["screenshot"] }
    ]

    property var booksMenu: []

    readonly property var menuMap: ({
        main: mainMenu,
        configs: configsMenu,
        connect: connectMenu,
        system: systemMenu,
        utilities: utilitiesMenu,
        books: booksMenu
    })

    readonly property var currentItems: menuMap[currentMenu] ?? []

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
        switch (item.action) {
        case "submenu":
            navigateTo(item.target)
            return
        case "books":
            booksScanOutput = ""
            booksScanProc.running = true
            return
        case "openbook":
            cmdProcess.command = ["zathura", item.file]
            break
        case "edit":
            cmdProcess.command = ["sh", "-c", "$TERMINAL -e nvim " + item.file]
            break
        case "cmd":
            cmdProcess.command = item.cmd
            break
        }
        cmdProcess.startDetached()
        dismiss()
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
        onExited: {
            let lines = root.booksScanOutput.trim().split("\n").filter(l => l.length > 0)
            root.booksMenu = lines.map(path => {
                let name = path.split("/").pop().replace(/\.pdf$/i, "")
                return { label: name, icon: "", action: "openbook", file: path }
            }).sort((a, b) => a.label.localeCompare(b.label))
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

            implicitWidth: 260
            implicitHeight: menuColumn.implicitHeight + 24
            color: Theme.background1

            exclusionMode: ExclusionMode.Ignore
            WlrLayershell.layer: WlrLayer.Overlay
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.Exclusive

            FocusScope {
                anchors.fill: parent
                focus: true

                ColumnLayout {
                    id: menuColumn
                    anchors.fill: parent
                    anchors.margins: 12
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

                    ListView {
                        id: menuList
                        Layout.fillWidth: true
                        Layout.preferredHeight: contentHeight
                        interactive: false
                        focus: true
                        currentIndex: root.selectedIndex
                        model: root.currentItems

                        Keys.onPressed: event => {
                            let count = root.currentItems.length
                            switch (event.key) {
                            case Qt.Key_Down:
                            case Qt.Key_J:
                                root.selectedIndex = (root.selectedIndex + 1) % count
                                event.accepted = true
                                return
                            case Qt.Key_Up:
                            case Qt.Key_K:
                                root.selectedIndex = (root.selectedIndex - 1 + count) % count
                                event.accepted = true
                                return
                            case Qt.Key_Return:
                            case Qt.Key_Right:
                            case Qt.Key_L:
                                root.executeItem(root.currentItems[root.selectedIndex])
                                event.accepted = true
                                return
                            case Qt.Key_Escape:
                            case Qt.Key_Left:
                            case Qt.Key_H:
                                root.navigateBack()
                                event.accepted = true
                                return
                            }
                        }

                        highlight: Rectangle {
                            color: Theme.background3
                            radius: 4
                        }

                        delegate: ItemDelegate {
                            required property var modelData
                            required property int index

                            width: menuList.width
                            hoverEnabled: true
                            onHoveredChanged: if (hovered) root.selectedIndex = index
                            onClicked: root.executeItem(modelData)

                            contentItem: RowLayout {
                                spacing: 8

                                Text {
                                    text: modelData.icon
                                    font.pixelSize: Theme.fontSize - 2
                                    visible: text !== ""
                                }

                                Text {
                                    text: modelData.label
                                    font.family: Theme.fontFamily
                                    font.pixelSize: Theme.fontSize - 2
                                    color: Theme.foreground1
                                }

                                Item { Layout.fillWidth: true }

                                Text {
                                    text: "›"
                                    font.family: Theme.fontFamily
                                    font.pixelSize: Theme.fontSize - 2
                                    color: Theme.background4
                                    visible: modelData.action === "submenu"
                                }
                            }

                            background: Rectangle {
                                color: "transparent"
                            }
                        }
                    }
                }
            }
        }
    }
}
