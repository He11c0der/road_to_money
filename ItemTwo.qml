import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    property string _rank: ""
    property string _name: ""
    property string _role: ""
    id: itm_2
    anchors.fill: swipeView

    Rectangle {
        id: rectangle
        color: "#333562"
        radius: 23
        border.color: "#efdbdee3"
        border.width: 5
        anchors.fill: itm_2
        gradient: Gradient {
            //orientation: Gradient.Vertical
            GradientStop {
                position: 0
                color: "#485563"
            }

            GradientStop {
                position: 1
                color: "#29323c"

                //09203f
            }
        }
    }
    SwipeView {
        id: swpV_2
        anchors.fill: itm_2
        Item {
            id: item1
            anchors.fill: swpV_2



            Button {
                id: button
                x: 369
                y: 414
                width: 94
                height: 48
                text: qsTr("Button")
                onClicked: {

                }
            }


        }
    }
    Component.onCompleted: {
        console.log("This", model.index, model.name)
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/

