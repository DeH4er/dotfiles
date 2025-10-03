//@ pragma UseQApplication
pragma ComponentBehavior: Bound

import Quickshell
import QtQuick.Layouts
import QtQuick

Scope {
    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    Variants {
        model: Quickshell.screens

        Scope {
            id: scope
            required property var modelData

            PanelWindow {
                anchors.top: true
                anchors.left: true
                anchors.right: true
                exclusiveZone: 40
                implicitWidth: 1
                implicitHeight: 1
                color: "transparent"
            }

            PanelWindow {
                id: panel
                anchors {
                    top: true
                    left: true
                    right: true
                    bottom: true
                }

                mask: Region {
                    x: 0
                    y: 40
                    width: scope.modelData.width
                    height: scope.modelData.height - 40
                    intersection: Intersection.Xor

                    regions: [
                        // Region {
                        //     x: sound.x
                        //     y: sound.y + 40
                        //     width: sound.width
                        //     height: sound.height
                        //     intersection: Intersection.Subtract
                        // }
                    ]
                }

                // Rectangle {
                //     x: sound.x
                //     y: sound.y + 40
                //     width: sound.width
                //     height: sound.height
                //     color: "red"
                // }

                exclusionMode: ExclusionMode.Ignore

                screen: scope.modelData
                color: "transparent"

                Rectangle {
                    anchors.top: parent.top
                    anchors.left: parent.left
                    anchors.right: parent.right
                    implicitHeight: 40
                    color: Color.red
                }

                RowLayout {
                    Logout {}

                    Workspaces {}
                }

                Time {
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                RowLayout {
                    anchors.right: parent.right
                    anchors.margins: 20
                    spacing: 5

                    Language {}
                    Tray {
                        panel: panel
                    }
                    Sound {
                        id: sound
                        panel: panel
                    }
                    Notification {}
                }
            }
        }
    }
}
