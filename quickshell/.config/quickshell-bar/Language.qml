import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick

WrapperItem {
    Rectangle {
        implicitWidth: 30
        implicitHeight: 25
        radius: 5
        color: Color.rosewater

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 11
            y: 3
            text: language.name
            color: Color.base
        }
    }

    Connections {
        id: language
        property string name: 'en'
        target: Hyprland

        function onRawEvent(e) {
            if (e.name === 'activelayout') {
                const [_, languageStr] = e.parse(2);
                const map = {
                    'English (Dvorak)': 'en',
                    'Ukrainian': 'ua'
                };

                if (map[languageStr]) {
                    this.name = map[languageStr];
                }
            }
        }
    }
}
