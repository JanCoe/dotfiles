import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland
import "workspaces"
import qs.Theme
import qs.Assets

RowLayout {
    id: workspaces

    Layout.alignment: Qt.AlignVCenter

    WindowLayout { id: windowLayout }

    Numbers {}

    Separator {}

    BarText {
        text: windowLayout.value
        color: Theme.foreground1
    }
    
    // Event-based updates for window (instant)
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            windowLayout.refresh()
        }
    }

}
