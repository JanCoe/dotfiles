import QtQuick
import Quickshell.Io

Item {
    id: root 

    property int value: 0

    function refresh() { diskProc.running = true }

    Process {
        id: diskProc
        command: ["sh", "-c", "df / | tail -1"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var percentStr = parts[4] || "0%"
                root.value = parseInt(percentStr.replace('%', '')) || 0
            }
        }

    }
}
