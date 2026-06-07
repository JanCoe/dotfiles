import QtQuick
import Quickshell.Io

Item {
    id: root

    property string essid: ""
    property int signal: 0
    property bool connected: false

    Process {
        id: netProc
        command: ["nmcli", "-t", "-f", "in-use,ssid,signal", "dev", "wifi"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.split(":")
                if (parts[0] === "*") {
                    root.essid = parts[1] || ""
                    root.signal = parseInt(parts[2]) || 0
                    root.connected = true
                }
            }
        }
    }
    function refresh() { connected = false; netProc.running = true }
}
