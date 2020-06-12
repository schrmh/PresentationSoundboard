import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id:rect
    property string t: "Press to play"
    property string c: "black"
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
                default: player.source = "http://www.kpd-ml.org/doc/musik/elbe1/TRACK_5.mp3"
                         player.play();
                    break;
            }
        }
    }

    Rectangle {
        id:progress
        height:parent.height
        width:parent.width*player.position/(player.duration+1)
        color:"silver"
    }

}
