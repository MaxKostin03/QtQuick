import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
    Window {
        id: primaryFrame
        width: 640
        height: 480
        visible: true
        title: qsTr("Login form")
        color: "#e5ecef"

        property string login: "1"
        property string password:  "1"

        function check() {
            if (login === loginTextField.text
                    && password === passwordTextField.text)
            {
                secondaryFrame.state = "Enter"
                thirdFrame.state = "Enter"
            }
            else
                failAnimation.start()
        }

        Rectangle {
            id: secondaryFrame
            color: "white"
            anchors.centerIn: parent
            radius: 5
            width: 300
            height: 250
            property string textColor: "#535353"
            state: "Fail"
            Column {
                id:col
                anchors.fill: parent
                padding: 32
                spacing: 32
            TextField {
                id: loginTextField
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Login")
                color: secondaryFrame.textColor

                Keys.onEnterPressed: checkCredentials()
                Keys.onReturnPressed: checkCredentials()
            }
            TextField {
                id: passwordTextField
                echoMode: TextInput.Password
                anchors.horizontalCenter: parent.horizontalCenter
                placeholderText: qsTr("Password")
                color: secondaryFrame.textColor

                Keys.onEnterPressed: check()
                Keys.onReturnPressed: check()
            }
            Button {
                id: submitButton
                width: 200
                height: 40
                background: Rectangle {
                color: parent.down ? "#bbbbbb" :(parent.hovered ? "#d6d6d6" : "#f6f6f6")
            }
                text: qsTr("Enter")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: check()
            }

            BusyIndicator {
                id: busyIndicator
                anchors.horizontalCenter: parent.horizontalCenter
                running: false
            }

        }
            states: [
                State {
                    name: "Fail"
                    PropertyChanges { target: primaryFrame; color: "#e5ecef" }
                    PropertyChanges { target: col; opacity: 1 }
                    PropertyChanges { target: loginTextField; opacity: 1}
                    PropertyChanges { target: passwordTextField; opacity: 1}
                },
                State {
                    name: "Enter"
                    PropertyChanges { target: primaryFrame; color: "palegreen" }
                    PropertyChanges { target: secondaryFrame; color: "palegreen" }
                    AnchorChanges { target: secondaryFrame; anchors.horizontalCenter: undefined}
                    AnchorChanges { target: secondaryFrame; anchors.left: parent.left}
                    PropertyChanges { target: col; opacity: 0 }
                    PropertyChanges { target: loginTextField; opacity: 0}
                    PropertyChanges { target: passwordTextField; opacity: 0}
                    PropertyChanges { target: loginTextField; enabled: false}
                    PropertyChanges { target: passwordTextField; enabled: false}
                    PropertyChanges { target: submitButton; enabled: false}
                    PropertyChanges { target: busyIndicator; running: true}
                }
            ]

            transitions: [
                Transition {
                    from: "Fail"
                    to: "Enter"
                    ParallelAnimation {
                        PropertyAnimation {
                            targets: [loginTextField, passwordTextField, secondatyFrame]
                            property: "opacity"
                            to: 0
                            duration: 600
                        }
                        PropertyAnimation { target: secondaryFrame; property: "anchors.horizontalCenterOffset"; duration: 600}
                        AnchorAnimation { duration: 1000}
                        PropertyAnimation { target: col; property: "opacity"; duration: 1000}
                        ColorAnimation { target: primaryFrame; duration: 600}
                    }
                }
            ]

        ParallelAnimation{
            id: failAnimation
            SequentialAnimation {
                PropertyAnimation {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: "red"
                    duration: 0
                }
                PropertyAnimation {
                    targets: [loginTextField, passwordTextField]
                    property: "color"
                    to: secondaryFrame.textColor
                    duration: 600
                }

            SequentialAnimation {
                NumberAnimation { target: secondaryFrame; property:"anchors.horizontalCenterOffset"; to: -10; duration: 50 }
                NumberAnimation { target: secondaryFrame; property:"anchors.horizontalCenterOffset"; to: 10; duration: 100 }
                NumberAnimation { target: secondaryFrame; property:"anchors.horizontalCenterOffset"; to: 0; duration: 50 }
            }
        }

      }
    }
}
