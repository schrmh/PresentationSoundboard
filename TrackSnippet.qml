import QtQuick 2.0

Rectangle {
    id:rect
    property string t: "Press to play"
    property string c: "black"
    width:100
    height:50
    color:c

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
            moveRight.start()
        }
    }

    Rectangle {
        id:progress
        height:parent.height
        color:"silver"

        PropertyAnimation {
            id:moveRight
            target:progress
            property:"width"
            from:progress.width
            to:rect.width
            duration:1000 //TODO: length of audio file
        }
    }

}
