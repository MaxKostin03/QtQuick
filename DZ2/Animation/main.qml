import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 300;
    height: 300

    Rectangle {
        id: rect
        width: 100
        height: 100
        anchors.centerIn: parent
        color: Qt.rgba(Math.random(),Math.random(),Math.random(),1)
        antialiasing: true

        MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        onClicked: (mouse)=> {
           if (mouse.button === Qt.LeftButton)
           parent.color = Qt.rgba(Math.random(),Math.random(),Math.random(),1)
           if(mouse.button === Qt.RightButton) rot360.start()
           }
        onDoubleClicked: animRound.start()
        }
         RotationAnimation  {
             id: rot360
             target: rect
             easing.type: Easing.InBack
             from: 0; to: rect.rotation + 360
             duration: 1000
         }

          PropertyAnimation {
             id: animRound
             target: rect
             property: "radius"
             to: (rect.radius === 0 ? 100 : 0)
             duration: 1000}

        }
}
