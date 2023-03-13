import QtQuick 2.12
import QtQuick.Window 2.12
import QtCharts 2.3
import GraphicsModel 1.0
import QtQuick.Controls 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Charts")
    StackView {
        id:stack
        initialItem: mainView
        anchors.fill: parent
        Page {
            id:mainView
            GraphicsModel {
                id: gr
                color: "red"
                parameterName: "y = sin(x)"
                graphType: chartView.numerationCharts
                onGraphTypeChanged: {
                    if (graphType == GraphicsModel.Sine)
                    {
                        gr.parameterName = "y = sin(x)"
                        gr.color = "red"
                        yVL.max = 2
                        yVL.min = -2
                    }
                    if (graphType == GraphicsModel.Linear)
                    {
                        gr.parameterName = "y = x"
                        gr.color = "green"
                        yVL.max = 5
                        yVL.min = 0
                    }
                    if (graphType == GraphicsModel.AbcoluteLine)
                    {
                        gr.parameterName = "y = |x - 2.5|"
                        gr.color = "blue"
                        yVL.max = 3
                        yVL.min = 0
                    }
                    if (graphType == GraphicsModel.Square)
                    {
                        gr.parameterName = "y = x^2"
                        gr.color = "black"
                        yVL.max = 25
                        yVL.min = 0
                    }
                    if (graphType == GraphicsModel.Logarithm)
                    {
                        gr.parameterName = "y = log2(x)"
                        gr.color = "brown"
                        yVL.max = 3
                        yVL.min = -5
                    }
                }
            }


            ChartView {
                id:chartView
                title: "Charts"
                anchors.fill: parent
                antialiasing: true
                property var numerationCharts: 0
                property bool flagSerais: true
                LineSeries {
                    id: line
                    name: gr.parameterName
                    color: gr.color
                    axisX: ValueAxis {
                        id:xVL
                        labelFormat: "%.0f"
                        min: 0
                        max: 5
                    }
                    axisY: ValueAxis {
                        id:yVL
                        labelFormat: "%.0f"
                        min: -5
                        max: 5
                    }


                    Component.onCompleted: {
                        var x = []
                        var y = []

                            for (var i = 0; i < 50; ++i) {
                                x = gr.xValues[i]
                                y = gr.yValues[i]
                                line.append(x,y)
                        }
                    }
                }
            }
        }
    }
}
