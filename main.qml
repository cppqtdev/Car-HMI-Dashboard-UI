import QtQuick 2.15
import CustomControls 1.0
import QtQuick.Window 2.15
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5
ApplicationWindow {
    width: 1920
    height: 960
    visible: true
    title: qsTr("Car DashBoard")
    color: "#1E1E1E"
    visibility: "FullScreen"
    property int nextSpeed: 60

    function generateRandom(maxLimit = 70){
        let rand = Math.random() * maxLimit;
        rand = Math.floor(rand);
        return rand;
    }

    Timer{
        repeat: true
        interval: 3000
        running: true
        onTriggered: {
            nextSpeed = generateRandom()
        }
    }

    Timer{
        id:speedTimer
        repeat: true
        interval: 500
        running: true
        onTriggered: {
            var currentSpeed = speedLabel.text
            if(nextSpeed > currentSpeed){
                for(let i = currentSpeed; i< nextSpeed ;i++){
                    speedLabel.text = i
                }
            }else{
                for(let j = nextSpeed; j< currentSpeed ;j++){
                    speedLabel.text = j
                }
            }
        }
    }

    Shortcut {
        sequence: StandardKey.Quit
        context: Qt.ApplicationShortcut
        onActivated: Qt.quit()
    }


    Image {
        id: dashboard
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        source: "qrc:/assets/Dashboard.svg"

        /*
          Top Bar Of Screen
        */

        Image {
            id: topBar
            width: 1357
            height: 115
            source: "qrc:/assets/Vector 70.svg"

            anchors{
                top: parent.top
                topMargin: 26.50
                horizontalCenter: parent.horizontalCenter
            }

            Image {
                id: headLight
                width: 42.5
                height: 38.25
                anchors{
                    top: parent.top
                    topMargin: 10
                    leftMargin: 230
                    left: parent.left
                }

                source: "qrc:/assets/Low beam headlights.svg"
            }

            Label{
                text: "19:30"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.DemiBold
                color: "#FFFFFF"
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Label{
                text: "02/08/2022"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.DemiBold
                color: "#FFFFFF"
                anchors.right: parent.right
                anchors.rightMargin: 230
                anchors.top: parent.top
                anchors.topMargin: 10
            }
        }



        /*
          Speed Label
        */

        Label{
            id:speedLabel
            text: "68"
            font.pixelSize: 134
            font.family: "Inter"
            color: "#01E6DE"
            font.bold: Font.DemiBold
            anchors.top: parent.top
            anchors.topMargin:Math.floor(parent.height * 0.35)
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Label{
            text: "MPH"
            font.pixelSize: 46
            font.family: "Inter"
            color: "#01E6DE"
            font.bold: Font.Normal
            anchors.top:speedLabel.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }


        /*
          Speed Limit Label
        */

        Rectangle{
            id:speedLimit
            width: 130
            height: 130
            radius: height/2
            color: "#D9D9D9"
            border.color: "#CD0303"
            border.width: 10

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50

            Label{
                text: "70"
                font.pixelSize: 52
                font.family: "Inter"
                font.bold: Font.Bold
                color: "#171717"
                anchors.centerIn: parent
            }
        }



        Image {
            anchors{
                bottom: speedLimit.top
                bottomMargin: 30
                horizontalCenter:speedLimit.horizontalCenter
            }
            source: "qrc:/assets/car.png"
        }

        // IMGonline.com.ua  ==> Compress Image With


        /*
          Left Road
        */

        Image {
            id: leftRoad
            width: 127
            height: 397
            anchors{
                left: speedLimit.left
                leftMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50
            }

            source: "qrc:/assets/Vector 2.svg"
        }

        RowLayout{
            spacing: 20

            anchors{
                left: parent.left
                leftMargin: 250
                bottom: parent.bottom
                bottomMargin: 26.50 + 65
            }

            RowLayout{
                spacing: 3
                Label{
                    text: "100.6"
                    font.pixelSize: 32
                    font.family: "Inter"
                    font.bold: Font.Normal
                    font.capitalization: Font.AllUppercase
                    color: "#FFFFFF"
                }

                Label{
                    text: "°F"
                    font.pixelSize: 32
                    font.family: "Inter"
                    font.bold: Font.Normal
                    font.capitalization: Font.AllUppercase
                    opacity: 0.2
                    color: "#FFFFFF"
                }
            }

            RowLayout{
                spacing: 1
                Layout.topMargin: 10
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#32D74B"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
                Rectangle{
                    width: 20
                    height: 15
                    color: "#01E6DC"
                }
            }

            Label{
                text: "78mph"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#FFFFFF"
            }
        }

        /*
          Right Road
        */

        Image {
            id: rightRoad
            width: 127
            height: 397
            anchors{
                right: speedLimit.right
                rightMargin: 100
                bottom: parent.bottom
                bottomMargin: 26.50
            }

            source: "qrc:/assets/Vector 1.svg"
        }

        /*
          Right Side gear
        */

        RowLayout{
            spacing: 20
            anchors{
                right: parent.right
                rightMargin: 350
                bottom: parent.bottom
                bottomMargin: 26.50 + 65
            }

            Label{
                text: "Ready"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#32D74B"
            }

            Label{
                text: "P"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                color: "#FFFFFF"
            }

            Label{
                text: "R"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "N"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
            Label{
                text: "D"
                font.pixelSize: 32
                font.family: "Inter"
                font.bold: Font.Normal
                font.capitalization: Font.AllUppercase
                opacity: 0.2
                color: "#FFFFFF"
            }
        }

         /*Left Side Icons*/
        Image {
            id:forthLeftIndicator
            width: 72
            height: 62
            anchors{
                left: parent.left
                leftMargin: 175
                bottom: thirdLeftIndicator.top
                bottomMargin: 25
            }
            source: "qrc:/assets/Parking lights.svg"
        }

        Image {
            id:thirdLeftIndicator
            width: 52
            height: 70.2
            anchors{
                left: parent.left
                leftMargin: 145
                bottom: secondLeftIndicator.top
                bottomMargin: 25
            }
            source: "qrc:/assets/Lights.svg"
        }

        Image {
            id:secondLeftIndicator
            width: 51
            height: 51
            anchors{
                left: parent.left
                leftMargin: 125
                bottom: firstLeftIndicator.top
                bottomMargin: 30
            }
            source: "qrc:/assets/Low beam headlights.svg"
        }

        Image {
            id:firstLeftIndicator
            width: 51
            height: 51
            anchors{
                left: parent.left
                leftMargin: 100
                verticalCenter: speedLabel.verticalCenter
            }
            source: "qrc:/assets/Rare fog lights.svg"
        }

        /*Right Side Icons*/

        Image {
            id:forthRightIndicator
            width: 56.83
            height: 36.17
            anchors{
                right: parent.right
                rightMargin: 195
                bottom: thirdRightIndicator.top
                bottomMargin: 50
            }
            opacity: 0.4
            source: "qrc:/assets/FourthRightIcon.svg"
        }

        Image {
            id:thirdRightIndicator
            width: 56.83
            height: 36.17
            anchors{
                right: parent.right
                rightMargin: 155
                bottom: secondRightIndicator.top
                bottomMargin: 50
            }
            opacity: 0.4
            source: "qrc:/assets/thirdRightIcon.svg"
        }

        Image {
            id:secondRightIndicator
            width: 56.83
            height: 36.17
            anchors{
                right: parent.right
                rightMargin: 125
                bottom: firstRightIndicator.top
                bottomMargin: 50
            }
            opacity: 0.4
            source: "qrc:/assets/SecondRightIcon.svg"
        }

        Image {
            id:firstRightIndicator
            width: 36
            height: 45
            anchors{
                right: parent.right
                rightMargin: 100
                verticalCenter: speedLabel.verticalCenter
            }
            source: "qrc:/assets/FirstRightIcon.svg"
        }

        // Progress Bar
        RadialBar {
            id:radialBar
            anchors{
                verticalCenter: parent.verticalCenter
                left: parent.left
                leftMargin: parent.width / 6
            }

            width: 338
            height: 338
            penStyle: Qt.RoundCap
            dialType: RadialBar.NoDial
            progressColor: "#01E4E0"
            backgroundColor: "transparent"
            dialWidth: 17
            startAngle: 270
            spanAngle: 3.6 * value
            minValue: 0
            maxValue: 100
            value: 97
            textFont {
                family: "inter"
                italic: false
                bold: Font.Medium
                pixelSize: 60
            }
            showText: false
            suffixText: ""
            textColor: "#FFFFFF"

            ColumnLayout{
                anchors.centerIn: parent
                Label{
                    text: radialBar.value + "%"
                    font.pixelSize: 65
                    font.family: "Inter"
                    font.bold: Font.Normal
                    color: "#FFFFFF"
                    Layout.alignment: Qt.AlignHCenter
                }

                Label{
                    text: "Battery charge"
                    font.pixelSize: 28
                    font.family: "Inter"
                    font.bold: Font.Normal
                    opacity: 0.8
                    color: "#FFFFFF"
                    Layout.alignment: Qt.AlignHCenter
                }
            }
        }

        ColumnLayout{
            spacing: 40

            anchors{
                verticalCenter: parent.verticalCenter
                right: parent.right
                rightMargin: parent.width / 6
            }

            RowLayout{
                spacing: 30
                Image {
                    width: 90
                    height: 50
                    source: "qrc:/assets/Group 28.svg"
                }

                ColumnLayout{
                    Label{
                        text: "188 KM"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Distance"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
            RowLayout{
                spacing: 30
                Image {
                    width: 72
                    height: 78
                    source: "qrc:/assets/fuel.svg"
                }

                ColumnLayout{
                    Label{
                        text: "34 mpg"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Avg. Fuel Usage"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
            RowLayout{
                spacing: 30
                Image {
                    width: 78.72
                    height: 78.68
                    source: "qrc:/assets/speedometer.svg"
                }

                ColumnLayout{
                    Label{
                        text: "78 mph"
                        font.pixelSize: 30
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                    Label{
                        text: "Avg. Speed"
                        font.pixelSize: 20
                        font.family: "Inter"
                        font.bold: Font.Normal
                        opacity: 0.8
                        color: "#FFFFFF"
                    }
                }
            }
        }
    }
}
