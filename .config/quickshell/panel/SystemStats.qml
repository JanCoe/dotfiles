import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import "Nord.js" as Theme

RowLayout {
    id: stats
    
    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuUsage.refresh()
            memUsage.refresh()
            diskUsage.refresh()
            volumeLevel.refresh()
        }
    }

    KernelVersion { id: kernelVersion }
    CpuUsage { id: cpuUsage }
    MemUsage { id: memUsage }
    DiskUsage { id: diskUsage }
    VolumeLevel { id: volumeLevel }

    spacing: 0
    Layout.alignment: Qt.AlignVCenter

    BarText {
        text: kernelVersion.value
        color: Theme.nord11
    }

    Separator {}

    BarText {
        text: "CPU: " + cpuUsage.value + "%"
        color: Theme.nord13
    }

    Separator {}

    BarText {
        text: "Mem: " + memUsage.value + "%"
        color: Theme.nord8
    }

    Separator {}

    BarText {
        text: "Disk: " + diskUsage.value + "%"
        color: Theme.nord11
    }

    Separator {}

    BarText {
        text: "Vol: " + volumeLevel.value + "%"
        color: Theme.nord13
    }
}
