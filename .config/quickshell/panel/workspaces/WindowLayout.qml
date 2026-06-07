import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import Quickshell.Hyprland

Item {
    id: root 

    property string value 
    
    // Current layout (Hyprland: dwindle/master/floating)
    Process {
        id: layoutProc
        command: ["sh", "-c", "hyprctl activewindow -j | jq -r 'if .floating then \"Floating\" elif .fullscreen == 1 then \"Fullscreen\" else \"Tiled\" end'"]
        stdout: SplitParser {
            onRead: data => {
                if (data && data.trim()) {
                    value = data.trim()
                }
            }
        }
        Component.onCompleted: running = true
    }
    function refresh() { layoutProc.running = true }
}
