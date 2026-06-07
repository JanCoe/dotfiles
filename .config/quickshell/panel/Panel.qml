import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.Theme
import qs.Assets
import "workspaces"

PanelWindow {
    property var modelData
    screen: modelData

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30
    color: Theme.background1

    BarText {
        anchors.centerIn: parent
        text: workspacesPanel.activeWindow
        color: Theme.punchy5
        width: Math.min(implicitWidth, parent.width / 3)
        elide: Text.ElideRight
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Workspaces {
            id: workspacesPanel
            Layout.leftMargin: 8
        }

        Item { Layout.fillWidth: true }

        SystemStats {}

        Separator {}

        Clock { Layout.rightMargin: 8 }
    }
}
