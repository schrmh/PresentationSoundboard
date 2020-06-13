import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id:rect
    property string t: "Press to play"
    property string c: "black"
    property string recording: "http://www.kpd-ml.org/doc/musik/elbe1/TRACK_5.mp3"
    width:100
    height:50
    color:c

    MediaPlayer {
        id: player
    }

    Text {
        id:text
        anchors.centerIn:parent
        color:"white"
        text:rect.t
    }

    MouseArea {
        id:mA
        anchors.fill:parent
        //hoverEnabled:true
        onEntered: {
            rect.color = "gray"
            text.color = "blue"

            switch(player.playbackState)
            {
                case 1: player.pause();
                    break;
                case 2: player.play();
                    break;
                default: player.source = rect.recording
                         player.play();
                    break;
            }
        }
    }

    Rectangle { //can happen that it won't move/play if clicks were too fast..
        id:progress
        height:parent.height
        width:player.duration>0?parent.width*player.position/player.duration:0
        color:player.duration!=player.position?"silver":"green"
    }

}
