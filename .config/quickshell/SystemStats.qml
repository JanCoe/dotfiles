import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import "Theme.js" as Theme

RowLayout {
    id: stats

    spacing: 0
    Layout.alignment: Qt.AlignVCenter

    // System info
    property string kernelVersion: "Linux"
    property int cpuUsage: 0
    property int memUsage: 0
    property int diskUsage: 0
    property int volumeLevel: 0


    // CPU tracking
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0

    // Kernel version
    Process {
        id: kernelProc
        command: ["uname", "-r"]
        stdout: SplitParser {
            onRead: data => {
                if (data) stats.kernelVersion = data.trim()
            }
        }
        Component.onCompleted: running = true
    }

    // CPU usage
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
                        stats.cpuUsage = Math.round(100 * (1 - idleDiff / totalDiff))
                    }
                }
                stats.lastCpuTotal = total
                stats.lastCpuIdle = idleTime
            }
        }
        Component.onCompleted: running = true
    }

    // Memory usage
    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                stats.memUsage = Math.round(100 * used / total)
            }
        }
        Component.onCompleted: running = true
    }

    // Disk usage
    Process {
        id: diskProc
        command: ["sh", "-c", "df / | tail -1"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var percentStr = parts[4] || "0%"
                stats.diskUsage = parseInt(percentStr.replace('%', '')) || 0
            }
        }
        Component.onCompleted: running = true
    }

    // Volume level
    Process {
        id: volProc
        command: ["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var match = data.match(/Volume:\s*([\d.]+)/)
                if (match) {
                    volumeLevel = Math.round(parseFloat(match[1]) * 100)
                }
            }
        }
        Component.onCompleted: running = true
    }

    // Slow timer for system stats 
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
            memProc.running = true
            diskProc.running = true
            volProc.running = true
        }
    }

    BarText {
        text: stats.kernelVersion
        color: Theme.nord11
    }

    Separator {}

    BarText {
        text: "CPU: " + stats.cpuUsage + "%"
        color: Theme.nord13
    }

    Separator {}

    BarText {
        text: "Mem: " + stats.memUsage + "%"
        color: Theme.nord8
    }

    Separator {}

    BarText {
        text: "Disk: " + stats.diskUsage + "%"
        color: Theme.nord11
    }

    Separator {}

    BarText {
        text: "Vol: " + stats.volumeLevel + "%"
        color: Theme.nord13
    }
}
