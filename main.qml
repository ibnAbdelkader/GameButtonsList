import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
/*-------------------------------------------------------------------
  Author: Ahmed Abdelkader
  Date: 04/11/2021
  email: ahmed.abdelkader.ese@gmail.com
-------------------------------------------------------------------*/
/*-------------------------------------------------------------------
  ->The design consists of a window that has 3 children items.
  ->Each item has a MouseArea, a Rectangle, and a Text children.
  ->Each MouseArea covers the whole parent item, also handles 4 events:
    onEntered, onPressed, onExited, onReleased.
  ->Each Rectangle contains 3 states and 2 transitions.
  ->Text is anchored with Rectangle.

-------------------------------------------------------------------*/

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    // 1st row components
    Item{
        width: ind_play.width+t_play.width
        height:t_play.height
        id:row_play
        y:300
        x:20
        MouseArea{
            id:mA_play
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                ind_play.state= "play_hovered"
            }
            onPressed: {
                ind_play.state="play_pressed"
            }
            onExited: {
                ind_play.state="play_normal"
            }
            onReleased: {
               /* switch(ind_play.state){
                case "play_pressed":ind_play.state="play_hovered"
                    break
                }*/
                ind_play.state="play_hovered"
            }
        }
        Rectangle{
            id:ind_play
            height: t_play.height
            width: 10
            color: "red"
            anchors.margins:  10
            states: [
                //normal state for 1st row
                State {
                    name: "play_normal"
                    PropertyChanges {target: ind_play ; width:10;color:"red"}
                },
                //hovered state for 1st row
                State {
                    name: "play_hovered"
                    PropertyChanges {target: ind_play ; width:25;color:"red"}

                },
                //pressed state for 1st row
                State {
                    name: "play_pressed"
                    PropertyChanges {target: ind_play ; width:30;color:"green"}
                }
            ]
            state: "play_normal" // Current State
            transitions: [
                //transition from normal state to pressed state and vice versa duration set to 100ms
                Transition {
                    from: "play_normal";to: "play_pressed"
                    reversible: true
                    PropertyAnimation{
                        target: ind_play
                        properties: "width";duration: 100
                    }
                },
                //transition from normal state to hovered state and vice versa duration set to 100ms
                Transition {
                    from: "play_normal";to: "play_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_play
                        properties: "width";duration: 100
                    }
                },
                //transition from pressed state to hovered state and vice versa duration set to 100ms
                Transition {
                    from: "play_pressed";to: "play_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_play
                        properties: "width";duration: 100
                    }
                }
            ]
        }

        Text{
            id: t_play
            height: 30
            text: "Play"
            font.family: "Open Sans"
            font.pixelSize:16
            anchors.margins: 5
            anchors.left:  ind_play.right
        }
    }
    // 2nd row components
    Item{
        width: ind_settings.width+t_settings.width
        height:t_settings.height
        id:row_settings
        anchors.left: row_play.left
        anchors.top: row_play.bottom
        MouseArea{
            id:mA_settings
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                ind_settings.state= "settings_hovered"
            }
            onPressed: {
                ind_settings.state="settings_pressed"
            }
            onExited: {
                ind_settings.state="settings_normal"
            }
            onReleased: {
                switch(ind_settings.state){
                case "settings_pressed":ind_settings.state="settings_hovered"
                    break
                }
            }
        }
        Rectangle{
            id:ind_settings
            height: t_play.height
            width: 10
            color: "red"
            anchors.margins:  10
            states: [
                State {
                    name: "settings_normal"
                    PropertyChanges {target: ind_settings ; width:10;color:"red"}
                },
                State {
                    name: "settings_hovered"
                    PropertyChanges {target: ind_settings ; width:25;color:"red"}
                },
                State {
                    name: "settings_pressed"
                    PropertyChanges {target: ind_settings ; width:30;color:"green"}
                }
            ]
            state: "settings_normal"
            transitions: [
                Transition {
                    from: "settings_normal";to: "settings_pressed"
                    reversible: true
                    PropertyAnimation{
                        target: ind_settings
                        properties: "width";duration: 100
                    }
                },

                Transition {
                    from: "settings_normal";to: "settings_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_settings
                        properties: "width";duration: 100
                    }
                },
                //transition from pressed state to hovered state and vice versa duration set to 100ms
                Transition {
                    from: "settings_pressed";to: "settings_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_settings
                        properties: "width";duration: 100
                    }
                }
            ]
        }

        Text{
            id: t_settings
            height: 30
            text: "Settings"
            font.family: "Open Sans"
            font.pixelSize:16
            anchors.margins: 5
            anchors.left:  ind_settings.right
        }
    }

    // 3rd row components
    Item{
        width: ind_quit.width+t_quit.width
        height:t_quit.height
        id:row_quit
        anchors.left: row_play.left
        anchors.top: row_settings.bottom

        MouseArea{
            id:mA_quit
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                ind_quit.state= "quit_hovered"
            }
            onPressed: {
                ind_quit.state="quit_pressed"
            }
            onExited: {
                ind_quit.state="quit_normal"
            }
            onReleased: {
                switch(ind_quit.state){
                case "quit_pressed":ind_quit.state="quit_hovered"
                    break
                }
            }
        }
        Rectangle{
            id:ind_quit
            height: t_quit.height
            width: 10
            color: "red"
            anchors.margins:  10
            states: [
                State {
                    name: "quit_normal"
                    PropertyChanges {target: ind_quit ; width:10;color:"red"}
                },
                State {
                    name: "quit_hovered"
                    PropertyChanges {target: ind_quit ; width:25;color:"red"}
                },
                State {
                    name: "quit_pressed"
                    PropertyChanges {target: ind_quit ; width:30;color:"green"}
                }
            ]
            state: "quit_normal"
            transitions: [
                Transition {
                    from: "quit_normal";to: "quit_pressed"
                    reversible: true
                    PropertyAnimation{
                        target: ind_quit
                        properties: "width";duration: 100
                    }
                },

                Transition {
                    from: "quit_normal";to: "quit_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_quit
                        properties: "width";duration: 100
                    }
                },
                //transition from pressed state to hovered state and vice versa duration set to 100ms
                Transition {
                    from: "quit_pressed";to: "quit_hovered"
                    reversible: true
                    PropertyAnimation{
                        target: ind_quit
                        properties: "width";duration: 100
                    }
                }
            ]
        }

        Text{
            id: t_quit
            height: 30
            text: "Quit"
            font.family: "Open Sans"
            font.pixelSize:16
            anchors.margins: 5
            anchors.left:  ind_quit.right
        }
    }
}

