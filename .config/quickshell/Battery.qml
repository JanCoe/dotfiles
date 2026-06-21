import Quickshell
import Quickshell.Io
import Quickshell.Wayland
import QtQuick
import QtQuick.Layouts

Rectangle {
    id: batteryPill
    anchors.rightMargin: 16

    width: batteryLabel.width + 32
    height: 28
    radius: height / 2
    color: Qt.rgba(0, 0, 0, 0.55)
    border.color: Qt.rgba(1, 1, 1, 0.4)
    border.width: 1

    property int bat0val: 0
    property int bat1val: 0
    property bool bat0charging
    property bool bat1charging

    Text {
        id: batteryLabel
        property bool interactive: true
        anchors.centerIn: parent
        color: "grey"
        font.pixelSize: 18
        text: parent.batteryIcon(batteryPill.bat0val, batteryPill.bat0charging) + " " + parent.batteryIcon(batteryPill.bat1val, batteryPill.bat1charging)
        //+ " " + batteryPill.bat0val + "% " + (batteryPill.bat1charging ? "⚡" : "") + batteryPill.bat1val + "%"
        signal clicked()

        MouseArea {
            anchors.fill: parent
            enabled: batteryLabel.interactive
            cursorShape: batteryLabel.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
            onClicked: batteryLabel.clicked()
        }

        onClicked: parent.refresh()
    }

    Process {
        id: bat0Val
        command: ["cat", "/sys/class/power_supply/BAT0/capacity"]
        stdout: SplitParser {
            onRead: data => { batteryPill.bat0val = parseInt(data.trim()) }
        }
    }

    Process {
        id: bat1Val
        command: ["cat", "/sys/class/power_supply/BAT1/capacity"]
        stdout: SplitParser {
            onRead: data => { batteryPill.bat1val = parseInt(data.trim()) }
        }
    }

    Process {
        id: bat0Charging
        command: ["cat", "/sys/class/power_supply/BAT0/status"]
        stdout: SplitParser {
            onRead: data => batteryPill.bat0charging = data.trim() == "Charging"
        }
    }

    Process {
        id: bat1Charging
        command: ["cat", "/sys/class/power_supply/BAT1/status"]
        stdout: SplitParser {
            onRead: data => batteryPill.bat1charging = data.trim() == "Charging"
        }
    }

    Process {
        id: udevMonitor
        command: ["udevadm", "monitor", "--subsystem-match=power_supply", "--udev"]
        running: true
        stdout: SplitParser {
            onRead: _ => chargingRefreshDelay.restart()
        }
    }

    Timer {
        id: chargingRefreshDelay
        interval: 500
        repeat: false
        onTriggered: {
            bat0Charging.running = true
            bat1Charging.running = true
        }
    }

    function refresh() {
        bat0Val.running = true
        bat1Val.running = true
        bat0Charging.running = true
        bat1Charging.running = true
    }

    function batteryIcon(pct, charging) {
        if (charging) return "⚡" + pct + "%"
        if (pct > 90) return "󰁹 " + pct + "%"
        if (pct > 70) return "󰁿 " + pct + "%"
        if (pct > 50) return "󰁽 " + pct + "%"
        if (pct > 30) return "󰁻 " + pct + "%"
        if (pct > 10) return "󰁺 " + pct + "%"
        return "󰂃"
    }

    Timer {
        interval: 30000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: parent.refresh()
    }
}
