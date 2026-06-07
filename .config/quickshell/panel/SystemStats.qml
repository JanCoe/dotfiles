import QtQuick
import QtQuick.Layouts
import Quickshell.Io
import qs.Theme
import qs.Assets
import "systemstats"

RowLayout {
    id: stats

    KernelVersion { id: kernelVersion }
    CpuUsage { id: cpuUsage }
    MemUsage { id: memUsage }
    DiskUsage { id: diskUsage }
    Temperature { id: temperature }
    NetworkStatus { id: networkStatus }
    VolumeLevel { id: volumeLevel }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuUsage.refresh()
            memUsage.refresh()
            diskUsage.refresh()
            temperature.refresh()
            networkStatus.refresh()
            volumeLevel.refresh()
        }
    }

    spacing: 0
    Layout.alignment: Qt.AlignVCenter

    BarText {
        text: kernelVersion.value
        color: Theme.punchy1
    }

    Separator {}

    BarText {
        text: "CPU: " + cpuUsage.value + "%"
        color: Theme.punchy3
    }

    Separator {}

    BarText {
        text: "Mem: " + memUsage.value + "%"
        color: Theme.colour1
    }

    Separator {}

    BarText {
        text: "Disk: " + diskUsage.value + "%"
        color: Theme.punchy1
    }

    Separator {}

    BarText {
        text: temperature.value + "°C"
        color: temperature.value >= 80 ? Theme.punchy1 : Theme.punchy2
    }

    Separator {}

    BarText {
        text: networkStatus.connected ? networkStatus.essid + " " + networkStatus.signal + "%" : "Disconnected"
        color: networkStatus.connected ? Theme.punchy4 : Theme.punchy1
    }

    Separator {}

    BarText {
        text: "Vol: " + volumeLevel.value + "%"
        color: Theme.punchy3
    }
}
