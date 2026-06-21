import QtQuick
import QtQuick.Layouts
import qs.Theme

Text {
    id: root
    property bool interactive: false
    signal clicked()

    font.family: "JetBrains Mono"
    font.pixelSize: Theme.fontSize
    font.bold: false
    Layout.alignment: Qt.AlignVCenter

    MouseArea {
        anchors.fill: parent
        enabled: root.interactive
        cursorShape: root.interactive ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: root.clicked()
    }
}
