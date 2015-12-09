import QtQuick 2.0

import QtQuick.Controls 1.4

Rectangle{
    id:i_RectangleSliders

//            border.color: "red"
//            border.width: 1

    height: parent.height*0.3
    width: parent.width

    color: "#0000ffff"

    anchors.bottom: parent.bottom
    anchors.left: parent.left

    property real slider_Y_Axis_Main1_Value: slider_Y_Axis_Main1.value
    property real slider_X_Axis_Main2_Value: slider_X_Axis_Main2.value
    property real slider_Y_Axis_Main3_Value: slider_Y_Axis_Main3.value


    Column {
        anchors.leftMargin: 5
        anchors.topMargin: 10
        clip: false
        anchors.fill: parent
        antialiasing: true
        z: 0
        rotation: 0
        scale: 1
        spacing: 10

        Slider {
            id: slider_Y_Axis_Main1

            width: parent.width*0.9
            anchors.horizontalCenterOffset: 0
            anchors.leftMargin: 0
            maximumValue: 360
            stepSize: 1
            orientation: Qt.Horizontal

            Label {
                id: label1
                x: 54
                y: -6
                z: -1
                text: qsTr("Motion1")
                font.bold: true
                font.family: "Courier"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Slider {
            id: slider_X_Axis_Main2


            width: parent.width*0.9
            anchors.horizontalCenterOffset: 0
            anchors.leftMargin: 0
            maximumValue: 360
            stepSize: 1
            orientation: Qt.Horizontal

            Label {
                id: label2
                x: 54
                y: -6
                z: -1
                text: qsTr("Motion2")
                font.bold: true
                font.family: "Courier"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
            }
        }

        Slider {
            id: slider_Y_Axis_Main3

            width: parent.width*0.9
            anchors.horizontalCenterOffset: 0
            anchors.leftMargin: 0
            maximumValue: 360
            stepSize: 1
            orientation: Qt.Horizontal

            Label {
                id: label3
                x: 54
                y: -7
                z: -1
                text: qsTr("Motion3")
                font.bold: true
                font.family: "Courier"
                font.pointSize: 10
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

}

