import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import "Function.js" as F
Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Figures")

    Item {
        anchors.fill: parent
        Canvas {
            id: canvas
            anchors.fill: parent
            property string selectedSHape: "star"
            property var posHor: canvas.width / 2
            property var posVer: canvas.height / 2
            property var firstV: 20
            property var secondV: 50
            property var thirdV: 7
            property var points: 0
            onPaint: {
                var ctx = getContext("2d")
                ctx.lineWidth = 3;
                ctx.fillStyle = "White";
                ctx.fillRect(0, 0, canvas.width, canvas.height);
                ctx.fillStyle = "Black";
                ctx.clearRect(0, 0, width, height)
                switch(canvas.selectedSHape) {
                case "star":
                    var points = F.getStarPoints(posHor, posVer, firstV, secondV, thirdV)
                    break
                case "ring":
                    points = F.getRingPoints(posHor, posVer, secondV)
                    break
                case "house":
                    points = F.getHousePoints(posHor, posVer, firstV, secondV)
                    break
                case "hourglass":
                    points = F.getHourglassPoints(posHor, posVer, firstV, secondV)
                    break
                }
                ctx.beginPath()
                ctx.moveTo(points[0], points[1])
                for (var i = 0; i < points.length; i+= 2) {
                    ctx.lineTo(points[i], points[i + 1])
                }
                ctx.closePath()
                ctx.stroke()
                ctx.fillStyle = "blue";
                ctx.fill();
            }
        }

        }
        ComboBox {
            id:comboBox
            anchors.horizontalCenter: parent.horizontalCenter
            model: ["star", "ring", "house", "hourglass"]
            currentIndex: 0
            onCurrentIndexChanged: {
                canvas.selectedSHape = model[currentIndex]
                canvas.requestPaint()
            }
        }
    }

