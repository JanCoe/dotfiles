import QtQuick
import QtQuick.Layouts

// Shared rounded background used by every block on the bar
Rectangle {
    implicitHeight: 28
    Layout.alignment: Qt.AlignVCenter
    radius: height / 2

    color: Qt.rgba(0, 0, 0, 0.55)
    border.color: Qt.rgba(1, 1, 1, 0.35)
    border.width: 1
}
