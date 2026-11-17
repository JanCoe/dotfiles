import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import qs.Theme

Pill {
    id: batteryPill

    // One entry per battery found: { name, pct, charging }.
    // Empty on machines without a battery, which hides the pill entirely.
    property var batteries: []
    visible: batteries.length > 0

    implicitWidth: batteryLabel.implicitWidth + 32
    Layout.rightMargin: 8

    BarText {
        id: batteryLabel
        anchors.centerIn: parent
        color: Theme.colour1
        text: batteryPill.batteries.map(b => batteryPill.batteryIcon(b.pct, b.charging)).join(" ")

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: batteryPill.refresh()
        }
    }

    // Prints "<capacity> <status>" for every BAT* that exists
    Process {
        id: batteryRead
        command: ["sh", "-c",
            "for b in /sys/class/power_supply/BAT*; do " +
            "[ -r \"$b/capacity\" ] && echo \"$(cat \"$b/capacity\") $(cat \"$b/status\")\"; " +
            "done; true"]
        stdout: StdioCollector {
            onStreamFinished: {
                batteryPill.batteries = text.trim().split("\n")
                    .filter(line => line.length > 0)
                    .map(line => {
                        const parts = line.trim().split(" ")
                        return { pct: parseInt(parts[0]), charging: parts[1] === "Charging" }
                    })
            }
        }
    }

    Process {
        id: udevMonitor
        command: ["udevadm", "monitor", "--subsystem-match=power_supply", "--udev"]
        running: batteryPill.visible
        stdout: SplitParser {
            onRead: _ => chargingRefreshDelay.restart()
        }
    }

    Timer {
        id: chargingRefreshDelay
        interval: 500
        repeat: false
        onTriggered: batteryPill.refresh()
    }

    function refresh() {
        batteryRead.running = true
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
        onTriggered: batteryPill.refresh()
    }
}
