import Quickshell.Widgets
import QtQuick

WrapperMouseArea {
    id: mouse
    cursorShape: Qt.PointingHandCursor
    hoverEnabled: true
    required property string icon

    Rectangle {
        implicitHeight: 40
        implicitWidth: 40
        color: "transparent"

        Text {
            id: text
            anchors.centerIn: parent
            text: mouse.icon
            font.family: 'lucide'
            font.pointSize: 14
            color: Color.base

            states: State {
                name: 'hover'
                when: mouse.containsMouse
                PropertyChanges {
                    text.opacity: 0.6
                }
            }

            Behavior on opacity {
                Animate {}
            }
        }
    }
}
