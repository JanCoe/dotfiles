import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts
import "workspaces"

PanelWindow {
    id: panel
    property var modelData
    screen: modelData

    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 30
    color: "transparent" 
    WlrLayershell.layer: WlrLayer.Top
    WlrLayershell.exclusiveZone: implicitHeight

    RowLayout {
        anchors.fill: parent
        spacing: 0
        
        Workspaces { }
        Item { Layout.fillWidth: true }
        Clock { }
        Item { Layout.fillWidth: true }
        Battery { }
    }
}
