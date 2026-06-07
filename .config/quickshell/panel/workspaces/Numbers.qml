import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import ".."
import "../Theme.js" as Theme

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
            color: parent.isActive ? Theme.colour1 : (parent.hasWindows ? Theme.colour1 : Theme.background4)
            anchors.centerIn: parent
        }

        Rectangle {
            width: 20
            height: 3
            color: parent.isActive ? Theme.punchy5: Theme.background1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
        }

        MouseArea {
            anchors.fill: parent
            onClicked: Hyprland.dispatch("workspace " + (index + 1))
        }
    }
}
