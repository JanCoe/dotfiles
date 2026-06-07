import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "panel/Nord.js" as Theme
import "panel"

ShellRoot {
    id: root

    // Data
    property string activeWindow: "Window"
    property string currentLayout: "Tile"

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitHeight: 30
            color: Theme.nord0

            // --- CENTER: active window (screen-centered) ---
            BarText {
                anchors.centerIn: parent
                text: root.activeWindow
                color: Theme.nord15
                width: Math.min(implicitWidth, parent.width / 3)
                elide: Text.ElideRight
            }

            RowLayout {
                anchors.fill: parent
                spacing: 0

                // --- LEFT: workspaces + layout ---
                Workspaces {
                    currentLayout: root.currentLayout
                    Layout.leftMargin: 8
                }

                // --- SPACER ---
                Item {
                    Layout.fillWidth: true
                }

                // --- RIGHT: system stats + clock ---
                SystemStats {}

                Separator {}

                Clock {
                    Layout.rightMargin: 8
                }
            }
        }
    }
}
