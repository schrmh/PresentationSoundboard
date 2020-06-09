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
        }
    }

}
