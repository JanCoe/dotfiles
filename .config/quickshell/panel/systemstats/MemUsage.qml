import QtQuick
import Quickshell.Io

Item {
    id: root 

    property int value: 0

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                root.value = Math.round(100 * used / total)
            }
        }
    }
    function refresh() { memProc.running = true }
}
