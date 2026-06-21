import QtQuick
import Quickshell.Io

Item {
    id: root

    property int value: 0

    Process {
        id: tempProc
        command: ["sh", "-c", "cat /sys/class/thermal/thermal_zone0/temp"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                root.value = Math.round(parseInt(data.trim()) / 1000)
            }
        }
    }
    function refresh() { tempProc.running = true }
}
