import QtQuick
import QtQuick.Layouts
import "Nord.js" as Theme

BarText {
    id: clock

    text: Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    color: Theme.nord4

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: clock.text = Qt.formatDateTime(new Date(), "ddd, MMM dd - HH:mm")
    }
}
