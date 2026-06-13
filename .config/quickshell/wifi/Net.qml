pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var networks: []
    property bool scanning: false
    property bool panelOpen: false

    function rescan() {
        root.scanning = true
        listProc.running = true
    }

    function connect(ssid, password) {
        connectProc.command = password.length > 0
        ? ["nmcli", "device", "wifi", "connect", ssid, "password", password]
        : ["nmcli", "device", "wifi", "connect", ssid]
        connectProc.running = true
    }

    Process {
        id: listProc
        command: ["nmcli", "-t", "-f", "IN-USE,SSID,SIGNAL,SECURITY", "device", "wifi", "list"]
        stdout: StdioCollector {
            onStreamFinished: {
                const seen = ({})
                const out = []
                const lines = text.trim().split("\n").filter(l => l.length > 0)
                for (const line of lines) {
                    const parts = line.replace(/\\:/g, "\u0000").split(":").map(s => s.replace(/\u0000/g, ":"))
                    const ssid = parts[1]
                    if (!ssid || seen[ssid]) continue
                    seen[ssid] = true
                    out.push({
                        ssid: ssid,
                        signal: parseInt(parts[2]) || 0,
                        secured: (parts[3] || "").length > 0,
                        inUse: parts[0] === "*"
                    })
                }
                out.sort((a, b) => b.signal - a.signal)
                root.networks = out
                root.scanning = false
            }
        }
    }

    Process {
        id: connectProc
        onExited: (code) => { if (code === 0) root.rescan() }
    }
}
