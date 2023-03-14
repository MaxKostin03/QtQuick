import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id:appPage
    width: parent.width
    height: parent.height
    color: "#f0f0f0"

    signal onLoggedOut()

    Component.onCompleted: console.log("App Page completed")
//    Component.onDestroyed: console.log("App Page destroyed") Почему-то с этой строчкой вылезает ошибка загрузки и нет возможности проверить удаляется ли компонент

    function logOut() {
        onLoggedOut()
        appPage.destroy()
    }
    Column {
        spacing: 10
        anchors.centerIn: parent

        Button {
            text: "Exit"
            width: 200
            height: 40
            onClicked: logOut()
        }
    }
}
