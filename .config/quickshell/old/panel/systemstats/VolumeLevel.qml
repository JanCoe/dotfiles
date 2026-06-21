import QtQuick
import Quickshell.Io

Item {
    id: root 

    property int value: 0

    Process {
        id: volProc
        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var match = data.match(/Volume:\s*([\d.]+)/)
                if (match) {
                    root.value = Math.min(100, Math.round(parseFloat(match[1]) * 100))
                }
            }
        }
    }
    function refresh() { volProc.running = true }
}
