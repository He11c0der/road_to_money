import QtQuick 2.12
import QtQuick.Controls 2.15

//import QtQuic
Item {
    property string lstDb: ""
    property int cntr  : value
    property string lgn: idrole.text.toString()
    property string psssswrd: pswrole.text.toString()
    id: itm
    anchors.fill: swipeView
    enabled: true
    Rectangle {
        id: rectangle
        color: "#333562"
        radius: 23
        border.color: "#efdbdee3"
        border.width: 5
        anchors.fill: itm
        gradient: Gradient {
            orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#29323c"
            }

            GradientStop {
                position: 1
                color: "#485563"
            }
        }
    }
    SwipeView {
        id: swp_one
        anchors.fill: itm

        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        currentIndex: 1
        clip: true

        Item {
            id: accessItem
            anchors.fill: swp_one

            ComboBox {
                id: comboBox
                x: 209
                y: 171
                width: 222
                height: 48

                //   displayText: "Список ролей"
                model: ["Администратор", "Офицер ЗРВ", "Офицер РТВ", "Офицер ИА"]
            }

            TextField {
                id: idrole
                x: 209
                y: 248
                width: 222
                height: 43
                placeholderText: qsTr("Идентификатор пользователя")
            }

            TextField {
                id: pswrole
                x: 209
                y: 310
                width: 222
                height: 43
                placeholderText: qsTr("Пароль")
            }
        }
        Item {
            id: variantItem
            anchors.fill: swp_one

            Label {
                id: label
                x: 209
                y: 66
                text: qsTr("Настройки варианта моделирования")
                font.pointSize: 14
                anchors.horizontalCenter: parent.horizontalCenter
            }

            ComboBox {
                id: variantCmbx
                x: 224
                y: 139
                width: 243
                height: 48
                displayText: "Варианты моделирования"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Button {
                id: button
                x: 286
                y: 400
                width: 121
                height: 50
                text: qsTr("Старт")
                anchors.horizontalCenter: parent.horizontalCenter
            }

            DelayButton {
                id: delayButton
                x: 224
                y: 207
                width: 192
                height: 48
                text: qsTr("Учет параметра №1")
            }

            DelayButton {
                id: delayButton1
                x: 224
                y: 271
                width: 192
                height: 48
                text: qsTr("Учет параметра №2")
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:15}
}
##^##*/

