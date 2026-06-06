import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland
import "Theme.js" as Theme

RowLayout {
    id: workspaces

    required property string currentLayout

    spacing: 0
    Layout.alignment: Qt.AlignVCenter
    

    Repeater {
        model: 10

        Rectangle {
            width: 20
            height: 30
            color: "transparent"
            Layout.alignment: Qt.AlignVCenter

            property var workspace: Hyprland.workspaces.values.find(w => w.id === index + 1) ?? null
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
            property bool hasWindows: workspace !== null

            BarText {
                text: index + 1
                color: parent.isActive ? Theme.nord8 : (parent.hasWindows ? Theme.nord8 : Theme.nord3)
                anchors.centerIn: parent
            }

            Rectangle {
                width: 20
                height: 3
                color: parent.isActive ? Theme.nord15 : Theme.nord0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
            }

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }

    Separator {}

    BarText {
        text: workspaces.currentLayout
        color: Theme.nord4
    }
    
    // Current layout (Hyprland: dwindle/master/floating)
    Process {
        id: layoutProc
        command: ["sh", "-c", "hyprctl activewindow -j | jq -r 'if .floating then \"Floating\" elif .fullscreen == 1 then \"Fullscreen\" else \"Tiled\" end'"]
        stdout: SplitParser {
            onRead: data => {
                if (data && data.trim()) {
                    currentLayout = data.trim()
                }
            }
        }
        Component.onCompleted: running = true
    }
    
    // Active window title
    Process {
        id: windowProc
        command: ["sh", "-c", "hyprctl activewindow -j | jq -r '.title // empty'"]
        stdout: SplitParser {
            onRead: data => {
                if (data && data.trim()) {
                    activeWindow = data.trim()
                }
            }
        }
        Component.onCompleted: running = true
    }
    
    // Event-based updates for window/layout (instant)
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            windowProc.running = true
            layoutProc.running = true
        }
    }

}
