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
        command: ["sh", "-c", "hyprctl activewindow -j | jq -r '(.title | select(. != \"\")) // .class // empty'"]
        stdout: SplitParser {
            onRead: data => {
                value = data ? data.trim() : ""
            }
        }
        Component.onCompleted: running = true
    }
    function refresh() { value = ""; windowProc.running = true }
}
