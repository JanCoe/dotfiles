import QtQuick
import Quickshell.Io

Item {
    id: root

    property int value: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                var parts = data.trim().split(/\s+/)
                var values = []
                for (var i = 1; i <= 7; i++)
                    values.push(parseInt(parts[i]) || 0)

                var total = values.reduce((sum, v) => sum + v, 0)
                var idleTime = values[3] + values[4]

                if (root.lastCpuTotal > 0) {
                    var totalDiff = total - root.lastCpuTotal
                    var idleDiff = idleTime - root.lastCpuIdle
                    if (totalDiff > 0) {
                        root.value = Math.round(100 * (1 - idleDiff / totalDiff))
                    }
                }
                root.lastCpuTotal = total
                root.lastCpuIdle = idleTime
            }
        }
    }
    function refresh() { cpuProc.running = true }
}
