import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.3
Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("DatingApp")
        Image {
            id: imgView
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            source: "qrc:/img/img.png"

            }
        Rectangle {
            id:formReg
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            //anchors.right: parent.right
            //anchors.left: parent.left
            anchors.bottom: parent.bottom
            anchors.margins: 10
            width: 350
            height: 500
            color: "seashell"
            border.color: "black"
            border.width: 2
            radius: 5
            opacity : 0.8
            Column {
                anchors.fill: parent
                anchors.centerIn: parent
                clip: true
                padding: 20
                spacing: 10
                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    text: "Welcome to Dating app"
                    font.pointSize: 20
                    font.family: "Verdana"
                }
                TextField {
                    id:name
                    anchors.horizontalCenter: parent.horizontalCenter
                    placeholderText: "Name"
                    width: 200
                    background: Rectangle {
                    color: "whitesmoke"
                    border.color: parent.hovered ? "green" : " black"
                    border.width: 2
                    radius: 3
                    }
                }
        RowLayout {
                anchors.horizontalCenter: parent.horizontalCenter
                Text {
                text: "Gender"
                font.family: "Verdana"
                width: 200
                font.pointSize: 12
                }
            RadioButton {
                id: man
                checked: true
                text: "Man"
                font.family: "Verdana"
                }
            RadioButton {
                id: women
                text: "Women"
                font.family: "Verdana"
                }
         }
         RowLayout {
                 anchors.horizontalCenter: parent.horizontalCenter
                 width: 200
                Label {
                     text: "Age: " + slide.value
                     font.pointSize: 12
                     font.family: "Verdana"
                     }
                 Slider {
                     id: slide
                     stepSize: 1
                     from: 18
                     to: 100
                     }
                }
         RowLayout {
             anchors.horizontalCenter: parent.horizontalCenter
             width: 200

             TextField {
                 id:education
                 placeholderText: "Education"
                 width: 300
                 background: Rectangle {
                 width: 200
                 color: "whitesmoke"
                 border.color: parent.hovered ? "green" : " black"
                 border.width: 2
                 radius: 3
                 }
             }
         }
             TextField {
                 id: town
                 anchors.horizontalCenter: parent.horizontalCenter
                 placeholderText: "Town"
                 width: 200
                 background: Rectangle {
                 color: "whitesmoke"
                 border.color: parent.hovered ? "green" : " black"
                 border.width: 2
                 radius: 3
                 }
             }

             TextArea {
                 anchors.horizontalCenter: parent.horizontalCenter
                 placeholderText: "Hobby"
                 width: 200
                 background: Rectangle {
                 color: "whitesmoke"
                 border.color: parent.hovered ? "green" : " black"
                 border.width: 2
                 radius: 3
                     }
             }

             TextArea {
                 anchors.horizontalCenter: parent.horizontalCenter
                 placeholderText: "Personal information"
                 width: 300
                 height: 50
                 wrapMode: TextEdit.Wrap
                 background: Rectangle {
                     color: "whitesmoke"
                     border.color: parent.hovered ? "green" : " black"
                     border.width: 2
                     radius: 3
                     }
             }
                     Label {
                         anchors.horizontalCenter: parent.horizontalCenter
                         text: "I'm looking for a " + (man.checked ? "women" : "men")
                         font.pointSize: 12
                         font.family: "Verdana"
                     }

                     RowLayout {
                         anchors.horizontalCenter: parent.horizontalCenter
                         Label {
                             text: "Aged: " + parseInt(findAge.first.value) + " to: " + parseInt(findAge.second.value)
                             font.pointSize: 12
                             font.family: "Verdana"
                         }

                         RangeSlider {
                             id:findAge
                             from: 18
                             to: 100
                             stepSize: 1
                             first.value: 18
                             second.value: 55
                         }
                     }
                     RowLayout {
                         anchors.horizontalCenter: parent.horizontalCenter
                         width: 200

                         TextField {
                             id:education_1
                             placeholderText: "Education"
                             width: 300
                             background: Rectangle {
                             width: 200
                             color: "whitesmoke"
                             border.color: parent.hovered ? "green" : " black"
                             border.width: 2
                             radius: 3
                             }
                         }
                     }

                         Button {
                             anchors.horizontalCenter: parent.horizontalCenter
                             id : register
                             text: "Register"
                             font.pointSize: 14
                             font.family: "Verdana"
                             height: 40
                             width: 200



                             onClicked: {
                                 console.log("Your " + name.text + ", your gender: " + (man.checked ? "men" : "women") + ", age: " +
                                             slide.value + ", education " + education.text + ", from: " + town.text +
                                             "\nYou are looking for" + (man.checked ? " women" : " men")  +
                                             ", aged: " + parseInt(findAge.first.value) + " to: " + parseInt(findAge.second.value) +
                                             ", education: " + education_1.text)
                             }
                             background: Rectangle {
                                 color: register.down ? "yellow" : (register.hovered ? "green" : "whitesmoke")
                                 //border.color: " black"
                                 border.width: 2
                                 radius: 3
                             }
                     }
                 }


             }
        }





