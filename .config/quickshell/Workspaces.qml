import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import qs.Theme

Pill {
    implicitWidth: workspaceRow.implicitWidth + 16
    Layout.leftMargin: 16

    Row {
        id: workspaceRow
        anchors.centerIn: parent
        spacing: 2

        Repeater {
            model: 10

            Item {
                id: cell
                property var workspace: Hyprland.workspaces.values.find(w => w.id === index + 1) ?? null
                property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)
                property bool hasWindows: workspace !== null

                implicitWidth: Math.max(22, label.implicitWidth + 6)
                implicitHeight: 28

                // Soft highlight behind the current workspace
                Rectangle {
                    anchors.centerIn: parent
                    width: parent.width
                    height: 20
                    radius: height / 2
                    color: Qt.alpha(Theme.colour1, 0.25)
                    visible: cell.isActive
                }

                BarText {
                    id: label
                    anchors.centerIn: parent
                    text: index + 1
                    color: cell.isActive ? Theme.foreground3
                         : cell.hasWindows ? Theme.colour1
                         : Theme.background4
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: Hyprland.dispatch("workspace " + (index + 1))
                }
            }
        }
    }
}
