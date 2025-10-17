import Quickshell.Hyprland
import Quickshell.Widgets
import QtQuick

WrapperItem {
    WrapperRectangle {
        implicitHeight: 25
        topMargin: 3
        leftMargin: 5
        rightMargin: 5
        radius: 5
        color: Color.rosewater

        Text {
            font.pointSize: 11
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
                console.log(languageStr)
                const map = {
                    'English (Dvorak)': 'dvorak',
                    'English (US)': 'en',
                    'Ukrainian': 'ua'
                };

                if (map[languageStr]) {
                    this.name = map[languageStr];
                }
            }
        }
    }
}
