import QtQuick 2.6
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0


Rectangle {
    id: root
    anchors.fill: parent
   // color:"yellow"
    signal backleft()
    signal search()
    Image{
        anchors.fill: parent
        source: "qrc:/images/keyimages.jpeg"
        opacity:0.65
    }

    ColumnLayout {
        Rectangle {
            id: _r
            Layout.preferredHeight: root.height / 10
            Layout.preferredWidth: root.width
            color: "#F5EEF8"


            RowLayout {
                Rectangle {
                    id: _r11
                    Layout.preferredHeight: _r.height / 2
                    Layout.preferredWidth: _r.width / 10
                    color: "transparent"
                    Layout.topMargin: 12
                    Layout.leftMargin: 10

                    Image {
                        anchors.fill: parent
                        source: "qrc:/images/left.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                backleft()

                            }
                        }
                    }
                }
                Rectangle {
                    id: _r2
                    Layout.preferredHeight: _r.height / 2
                    Layout.preferredWidth: _r.width / 10
                    color: "#F5EEF8"
                    TextField {
                        id: textcontent
                        placeholderText: "Search"
                        height: _r.height / 1.5
                        width: _r.width / 2
                        background: Rectangle {
                            id: child21
                            width: root.width / 4
                            height: root.height / 10
                            color: "transparent"
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        onTextChanged: {
                            if (textcontent.text === "") {
                                viewmodellist. recentcontact.search("");
                            } else {
                                viewmodellist.recentcontact.search(textcontent.text.trim());
                            }
                        }

                        Keys.onPressed: {
                            if (event.key === Qt.Key_Backspace && textcontent.text === "") {

                            } else if (event.key !== Qt.Key_Return && event.key !== Qt.Key_Enter) {

                                viewmodellist.recentcontact.search(textcontent.text.trim());
                            }
                        }
                    }
                }
            }
        }

        ListView {
            id: _r12
            Layout.preferredHeight: root.height/1
            Layout.preferredWidth: root.width
            model: viewmodellist.recentcontact

            delegate: Item {
                width: parent.width
                height: 50

                Rectangle {
                    id: _c2
                    Layout.preferredHeight: _r12.height
                    Layout.preferredWidth: _r12.width
                    color: "pink"
                    opacity: 0.8
                    anchors.fill: parent

                    RowLayout {
                        spacing: 10

                        Rectangle {
                            Layout.preferredHeight: _c2.height/2
                            Layout.preferredWidth: _c2.width/8
                            color: "transparent"
                            Layout.leftMargin: 30
                            Layout.topMargin: 15

                            Image {
                                anchors.centerIn: parent
                                source: model.Imagename
                                height: 20
                                width: 30
                            }
                        }


                        Rectangle {
                            Layout.preferredHeight: _c2.height/2
                            Layout.preferredWidth: _c2.width/5
                            color: "transparent"
                            Layout.topMargin: 15

                            Text {
                                anchors.centerIn: parent
                                text: model.Contactname
                                font.bold: true
                            }
                        }

                    }
                }
            }
        }
    }
}



























