import Quickshell.Widgets
import QtQuick

WrapperMouseArea {
    id: root
    cursorShape: Qt.PointingHandCursor
    property string mode: "time"
    onClicked: this.mode = this.mode == "time" ? "day" : "time"

    Rectangle {
        implicitHeight: 40
        implicitWidth: 100
        color: "transparent"

        Text {
            id: t
            anchors.centerIn: parent
            color: Color.base
            text: root.mode == "time" ? Qt.formatDateTime(clock.date, "hh:mm AP") : Qt.formatDateTime(clock.date, "MMMM d, yyyy | dddd")
        }
    }
}
