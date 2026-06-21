import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell
import qs.Theme

PopupWindow {
    id: popup

    visible: _open
    property bool _open: false
    color: "transparent"

    anchor.window: panel
    implicitWidth: 320
    implicitHeight: 440

    property string pendingSsid: ""

    Connections {
        target: Net
        function onPanelOpenChanged() { if (Net.panelOpen) popup._open = true }
    }

    onVisibleChanged: if (visible) Net.rescan()

    Rectangle {
        anchors.fill: parent
        radius: 12
        color: Theme.background1
        
        transformOrigin: Item.TopRight
        scale: Net.panelOpen ? 1 : 0
        opacity: Net.panelOpen ? 1 : 0

        Behavior on scale {
            NumberAnimation {
                duration: 180
                easing.type: Easing.OutBack
                onRunningChanged: if (!running && !Net.panelOpen) popup._open = false
            }
        }

        Behavior on opacity {
            NumberAnimation { duration: 120 } }
        
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 12
            spacing: 8

            RowLayout {
                Layout.fillWidth: true
                Text {
                    Layout.fillWidth: true
                    text: "Wi-Fi"
                    color: Theme.punchy5
                    font.pixelSize: 18; font.bold: true
                }
                Text {
                    text: Net.scanning ? "scanning..." : "⟳"
                    color: Theme.punchy5
                    MouseArea { anchors.fill: parent; onClicked: Net.rescan() }
                }
            }

            ListView {
                Layout.fillWidth: true
                Layout.fillHeight: true
                clip: true
                spacing: 2
                model: Net.networks

                delegate: Rectangle {
                    required property var modelData
                    width: ListView.view.width
                    height: 38
                    radius: 8
                    color: hover.containsMouse ? Theme.background2 : "transparent"
                    RowLayout {
                        anchors.fill: parent
                        anchors.leftMargin: 10; anchors.rightMargin: 10
                        Text {
                            Layout.fillWidth: true
                            elide: Text.ElideRight
                            color: Theme.punchy5
                            text: (modelData.inUse ? "● " : "") + modelData.ssid
                        }
                        Text {
                            opacity: 0.7
                            color: Theme.punchy5
                            text: (modelData.secured ? "🔒" : "") + modelData.signal + "%"
                        }
                    }

                    MouseArea {
                        id: hover
                        anchors.fill: parent
                        hoverEnabled: true
                        onClicked: {
                            if (modelData.secured) {
                                popup.pendingSsid = modelData.ssid
                                pw.forceActiveFocus()
                            } else {
                                Net.connect(modelData.ssid, "")
                            }
                        }
                    }
                }
            }

            TextField {
                id: pw
                Layout.fillWidth: true
                visible: popup.pendingSsid.length > 0
                echoMode: TextInput.Password
                placeholderText: "Password for " + popup.pendingSsid
                onAccepted: {
                    Net.connect(popup.pendingSsid, text)
                    text = ""
                    popup.pendingSsid = ""
                }
            }
        }
    }
} 
