import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.2

Window {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Presentationssoundboard")

    Rectangle {
        id:addTrackSnippetButton
        width:50
        height:50
        color:"black"

        Canvas {
            id: lol
            width: 120; height: 120
            onPaint: {
                var ctx = getContext("2d")
                // setup the stroke
                ctx.strokeStyle = "white"
                ctx.lineWidth = 4

                // create a path
                ctx.beginPath()
                ctx.moveTo(parent.x+parent.width/2,parent.y+parent.height*0.1)
                ctx.lineTo(parent.x+parent.width/2,parent.y+parent.height*0.9)

                ctx.moveTo(parent.x+parent.width*0.1,parent.y+parent.height/2)
                ctx.lineTo(parent.x+parent.width*0.9,parent.y+parent.height/2)

                // stroke path
                ctx.stroke()
            }
        }

        MouseArea {
            id:mA
            anchors.fill:parent
            onClicked: {
                if(container.height >= container.childrenRect.height+Qt.createComponent("TrackSnippet.qml").createObject().height)
                {
                    fileDialog.open()
                }
                else
                {
                    console.log("No more space in container") //TODO: Remove limit later in favor of scrolling or collapsing?
                    object.destroy()
                }
            }
        }
    }

    Rectangle {
        id: container
        y:addTrackSnippetButton.height
        height: root.height-addTrackSnippetButton.height
        width: 100
    }

    FileDialog {
        id: fileDialog
        folder:shortcuts.music
        onAccepted: {
            //selectMultiple?
            //console.log(this.fileUrls)
                     // :
            //t.text=this.fileUrl
             console.log("You chose: " + fileDialog.fileUrl)

            var component = Qt.createComponent("TrackSnippet.qml");

            var object = component.createObject(container);

                console.log("Added Track to container")
                object.y = container.childrenRect.height
                object.recording = fileDialog.fileUrl
                //object.t = ""
                //object.c ="black"
        }
    }


}
