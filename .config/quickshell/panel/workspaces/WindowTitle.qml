import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland

Item {
    id: root 

    property string value 
    
    // Active window title
    Process {
        id: windowProc
        command: ["sh", "-c", "hyprctl activewindow -j | jq -r '.title // empty'"]
        stdout: SplitParser {
            onRead: data => {
                if (data && data.trim()) {
                    value = data.trim()
                }
            }
        }
        Component.onCompleted: running = true
    }
    function refresh() { windowProc.running = true }
}
