import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.3
import database 1.0

Window {
    property var easingCurve: [0.2, 0.2, 0.13, 0.65, 0.2, 0.8, 0.624, 0.98, 0.93, 0.95, 1, 1]
    property string _dbname: ""
    property string _usrname: ""
    property string _host: ""
    property string _psswd: ""
    property string stateDb: ""
    property string db_rank: ""
    property string db_name: ""
    property string login: itemOne.lgn
    property string psswrd: itemOne.psssswrd
    property string checkData: ""
    property int margin: 23
    property int rank_cntr: -1
    property int fio_cntr: 0
    id: mainWin
    width: 640
    height: 480
    maximumHeight: 480
    minimumHeight: 480
    maximumWidth: 640
    minimumWidth: 640
    visible: true
    title: qsTr("Tabs")
    Database {
        id: db
        onGetAnswerDb: {

            stateDb = a
        }
        onGetListDb: {

            db_rank = _rank
            db_name = _name
        }
        onGetCheckData: {
            checkData = check
        }
    }
    Rectangle {

        //source: "qrc:/image/mainFon.jpeg"
        id: mainFon
        x: 0
        y: 0
        width: 640
        height: 480
        border.color: "#bfbfbf"
        border.width: 5
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

        Text {
            id: text1
            x: 373
            y: 16
            width: 134
            height: 27
            color: "#f2ebeb"
            text: qsTr("НЕБОСВОД 2.0")
            font.pixelSize: 25
            font.bold: false
        }

        BorderImage {
            id: borderImage
            x: 560
            y: 0
            width: 72
            height: 59
            source: "qrc:/image/budge.png"
        }

        Button {
            id: admpnlBtn
            x: 140
            y: 11
            width: 169
            height: 48
            text: qsTr("Администрирование")
            onClicked: {
                if (adminPanel.state == "") {

                    adminPanel.state = "right"
                } else {

                    adminPanel.state = ""
                }
            }
        }
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: 0
        anchors.bottomMargin: 0
        // interactive: false
        orientation: Qt.Vertical
        clip: true
        anchors.leftMargin: 0
        anchors.topMargin: 65

        //currentIndex: tabBar.currentIndex
        ItemOne {
            id: itemOne
            Button {
                id: button
                x: 288
                y: 360
                text: qsTr("Вход")
                enabled: (stateDb == "База данных успешно подключена") ? true : false
                onClicked: {

                    //            if (adminPanel.state == '')
                    //                adminPanel.state = "right"
                    //            else
                    //                adminPanel.state = ''
                    db.setCheckData(login, psswrd)
                }
            }

            Label {
                id: lbl_sost
                x: 259
                y: 33
                visible: true
                //anchors.horizontalCenter: parent.horizontalCenter
                //.horizontalCenterOffset: -19
                color: (db.checkData === "Данные подтверждены") ? "green" : "red"
                text: "fghf"
            }
        }
        ItemTwo {
            Rectangle {
                id: rectList
                x: 109
                y: 107
                width: 446
                height: 312
                color: "#ffffff"
                radius: 13
                border.color: "#bfbfbf"
                border.width: 3
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                ListModel {
                    id: model

                    ListElement {
                        rank: ""
                        name: ""
                        role: ""
                    }
                }
                ListView {
                    id: grdv
                    anchors.fill: parent
                    anchors.rightMargin: 14
                    anchors.bottomMargin: 8
                    anchors.leftMargin: 8
                    anchors.topMargin: 48

                    model: model

                    clip: true
                    delegate: Item {
                        id: dlglt
                        x: 5
                        width: 80
                        height: 40

                        Row {

                            spacing: 10
                            TextField {
                                id: rank_view
                                text: rank

                                color: "black"
                                font.bold: true
                            }
                            TextField {
                                id: name_view
                                text: name
                                color: "black"
                                font.bold: true
                            }
                            TextField {
                                id: role_view
                                text: role
                                color: "black"
                                font.bold: true
                            }
                        }
                    }
                }

                Row {
                    id: row
                    x: 77
                    y: 8
                    width: 361
                    height: 47
                    spacing: 79

                    Text {
                        id: textField
                        x: 8
                        y: 12
                        width: 75
                        color: "#0a0a0a"
                        text: "В/звание"
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 10
                    }

                    Text {
                        id: textField1
                        x: 152
                        y: 12
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 10
                        text: "ФИО"
                    }

                    Text {
                        id: textField2
                        x: 312
                        y: 12
                        horizontalAlignment: Text.AlignHCenter
                        font.pointSize: 10
                        text: "Роль"
                    }
                }
            }
            Button {
                id: button2
                x: 388
                y: 359
                text: qsTr("Обновить")
                onClicked: {
                    db.setListDb(rank_cntr, fio_cntr)
                    rank_cntr++
                    fio_cntr++

                    model.append({
                                     "rank": db_rank,
                                     "name": db_name,
                                     "role": "Админ"
                                 })
                }
            }

            Button {
                id: button3
                x: 489
                y: 359
                text: qsTr("Изменить")
            }
        }
    }
    Button {
        id: button1
        x: 28
        y: 11
        text: qsTr("База данных")

        onClicked: {

            dbc.state = "up"

            itemOne.enabled = false
        }
    }

    Frame {
        id: adminPanel
        x: -148
        y: 65
        width: 148
        height: 415

        states: State {
            name: "right"
            PropertyChanges {
                target: adminPanel
                x: 0
            }
        }
        transitions: Transition {

            NumberAnimation {

                property: "x"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }

    Item {

        id: dbc
        x: 211
        y: 486
        width: 260
        height: 300

        Rectangle {
            id: rcdb
            color: "#ea494f56"
            radius: 10
            border.width: 4
            anchors.fill: parent

            Column {
                id: column
                anchors.fill: rcdb

                Grid {
                    id: grid
                    anchors.fill: parent
                    spacing: 5
                    rows: 8
                    columns: 1
                    anchors.bottomMargin: 21
                    anchors.topMargin: 21

                    TextField {
                        id: usrnm
                        width: 134
                        anchors.top: parent.top
                        anchors.topMargin: margin
                        placeholderTextColor: "#c6fffefe"
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderText: qsTr("Имя пользователя")
                    }

                    TextField {
                        id: psswd
                        width: 134
                        anchors.top: parent.top
                        anchors.topMargin: margin + 47
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderTextColor: "#c6fffefe"
                        placeholderText: qsTr("Пароль")
                    }

                    TextField {
                        id: dbname
                        width: 134
                        anchors.top: parent.top
                        anchors.topMargin: margin + 47 * 2
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderTextColor: "#c6fffefe"
                        placeholderText: qsTr("База данных")
                    }

                    TextField {
                        id: hst
                        width: 134
                        color: "#ffffff"
                        anchors.top: parent.top
                        clip: false
                        anchors.topMargin: margin + 47 * 3
                        anchors.horizontalCenter: parent.horizontalCenter
                        placeholderTextColor: "#c6fffefe"
                        placeholderText: qsTr("Хост")
                    }
                }
            }

            Text {
                id: txt_connect
                x: 20
                y: 8
                color: "#f8e2e2"
                text: qsTr("Подключение к базе данных")
                font.pixelSize: 12
                anchors.horizontalCenter: parent.horizontalCenter
            }
            MouseArea {
                id: dbMa
                anchors.fill: rctngl_cnct

                onDoubleClicked: {
                    dbc.state = " "
                    itemOne.enabled = true
                }
            }

            Button {
                id: btn_connect
                x: 96
                y: 238
                text: qsTr("Подключиться")
                flat: false
                highlighted: false
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    _dbname = dbname.text.toString()
                    _psswd = psswd.text.toString()
                    _usrname = usrnm.text.toString()
                    _host = hst.text.toString()
                    db.setConnectDb(_dbname, _usrname, _psswd, _host)
                }
            }

            Rectangle {
                id: rctngl_cnct
                x: 205
                y: 250
                width: 26
                height: 25
                color: (stateDb == "База данных успешно подключена") ? "green" : "red"
            }
        }
        states: State {
            name: "up"
            PropertyChanges {
                target: dbc
                y: 100
                //color: "#454545"
            }
        }
        transitions: Transition {

            NumberAnimation {

                property: "y"
                duration: 200
                easing.type: Easing.InOutQuad
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:1.25}
}
##^##*/

