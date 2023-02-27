import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    width: 400
    height: 350

    visible: true

    property double a
    property double b
    property double c
    property double p
    property double q
    property double s

    property double x1
    property double x2
    property double x3
    property double y1
    property double y2
    property double y3
    property double s2

    GridLayout{
        rows: 12
        columns: 3
        Label {
            text: "DZ1.2"
            font.pixelSize: 16
            Layout.row: 0
            Layout.column: 0
        }
        Label {
            text: "Side a: "
            font.pixelSize: 14
            Layout.row: 2
            Layout.column: 0
        }
        TextField{
            id:a_side   
            placeholderText: "a"
            Layout.row: 2
            Layout.column: 1
        }
        Label {
            text: "Side b: "
            font.pixelSize: 14
            Layout.row: 3
            Layout.column: 0
        }
        TextField{
            id:b_side
            placeholderText: "b"
            Layout.row: 3
            Layout.column: 1
        }
        Label {
            text: "Side с: "
            font.pixelSize: 14
            Layout.row: 4
            Layout.column: 0
        }
        TextField{
            id:c_side
            placeholderText: "c"
        }
        Label {
            text: "Area of ​​a triangle (S):"
            font.pixelSize: 14
            Layout.row: 6
            Layout.column: 0
        }
        Label{
            id:tr_s
            Layout.row: 6
            Layout.column: 1
        }
        Button {
            id:calculatebtn
            text: "Calculation"
            onClicked: calculate1()
            Layout.row: 5
            Layout.column: 0
        }
        Label {
            text: "DZ1.3"
            font.pixelSize: 16
            Layout.row: 7
            Layout.column: 0
        }
        Label {
            text: "Apex of a triangle A: "
            font.pixelSize: 14
            Layout.row: 8
            Layout.column: 0
        }
        TextField{
            id:x1_point
            placeholderText: "X1"
            Layout.row: 8
            Layout.column: 1
        }
        TextField{
            id:y1_point
            placeholderText: "Y1"
            Layout.row: 8
            Layout.column: 2
        }
        Label {
            text: "Apex of a triangle B: "
            font.pixelSize: 14
            Layout.row: 9
            Layout.column: 0
        }
        TextField{
            id:x2_point
            placeholderText: "X2"
            Layout.row: 9
            Layout.column: 1
        }
        TextField{
            id:y2_point
            placeholderText: "Y2"
            Layout.row: 9
            Layout.column: 2
        }
        Label {
            text: "Apex of a triangle C: "
            font.pixelSize: 14
            Layout.row: 10
            Layout.column: 0
        }
        TextField{
            id:x3_point
            placeholderText: "X3"
            Layout.row: 10
            Layout.column: 1
        }
        TextField{
            id:y3_point
            placeholderText: "Y3"
            Layout.row: 10
            Layout.column: 2
        }
        Label {
            text: "Area of ​​a triangle S: "
            font.pixelSize: 14
            Layout.row: 12
            Layout.column: 0
        }
        Label{
            id:tr_s2
            Layout.row: 12
            Layout.column: 1
        }
        Button {
            id:calculatebtn2
            text: "Calculation"
            onClicked: calculate2()
            Layout.row: 11
            Layout.column: 0
        }
        Label{
            Layout.row: 0
            Layout.column: 2
            text: "         "
        }
    }
    function calculate1(){
        if(a_side.text && b_side.text && c_side.text){
            a = a_side.text
            b = b_side.text
            c = c_side.text
            p = (a+b+c) / 2
            q = p*((p-a)*(p-b)*(p-c))
            s = Math.sqrt(q)
            tr_s.text = s
        }
    }

    function calculate2(){
        if(x1_point.text && x2_point.text && x3_point.text &&
                y1_point.text && y2_point.text && y3_point.text){
            x1 = x1_point.text
            x2 = x2_point.text
            x3 = x3_point.text
            y1 = y1_point.text
            y2 = y2_point.text
            y3 = y3_point.text
            s2 = (((x2-x1)*(y3-y1))-((x3-x1)*(y2-y1))) / 2
            if(s2 < 0){
                s2 *= -1;
            }

            tr_s2.text = s2
        }
    }
}
