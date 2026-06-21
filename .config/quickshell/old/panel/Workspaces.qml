import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland
import "workspaces"
import qs.Theme
import qs.Assets

RowLayout {
    id: workspaces

    readonly property string activeWindow: windowTitle.value

    spacing: 0
    Layout.alignment: Qt.AlignVCenter

    WindowLayout { id: windowLayout }
    WindowTitle { id: windowTitle }

    Numbers {}

    Separator {}

    BarText {
        text: windowLayout.value
        color: Theme.foreground1
    }
    
    // Event-based updates for window/layout (instant)
    Connections {
        target: Hyprland
        function onRawEvent(event) {
            windowTitle.refresh()
            windowLayout.refresh()
        }
    }

}
