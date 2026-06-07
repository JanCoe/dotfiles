import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import "Nord.js" as Theme

Item {
    id: root 

    property int cpuUsage: 0

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

                if (stats.lastCpuTotal > 0) {
                    var totalDiff = total - stats.lastCpuTotal
                    var idleDiff = idleTime - stats.lastCpuIdle
                    if (totalDiff > 0) {
                        root.cpuUsage = Math.round(100 * (1 - idleDiff / totalDiff))
                    }
                }
                root.lastCpuTotal = total
                root.lastCpuIdle = idleTime
            }
        }
        Component.onCompleted: running = true
    }
}
