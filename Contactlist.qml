import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.1


Rectangle{
    id:root
    width: Screen.width
    height: Screen.height
    color: "transparent"
    signal addcontact()
    signal deleteContactlistview()
    signal search()
    signal key()
    signal edit(int index)
    signal editcontactlist()
    property real imagheight: 30
    property real imagewidth: 30
    ColumnLayout{
        id:c1
        anchors.fill: parent
        spacing:1

        Rectangle{
            id:_i1
            Layout.preferredHeight: root.height/10
            Layout.preferredWidth: root.width
            Image{
                source:"qrc:/images/imagescloud.jpeg"
                width:parent.width


            }


            Rectangle{
                id:r1
                height:_i1.height/1
                width:_i1.width/2
                color:"transparent"
                anchors.right: parent.right
                RowLayout{
                    id:_c2
                    //                    spacing :35
                    //                    Layout.fillHeight: true
                    //                    Layout.fillWidth: true
                    anchors.fill: parent

                    CustomImage{
                        myheight: r1.height/2
                        mywidth: r1.width/6
                        mysource: "qrc:/images/plus (1).png"

                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                addcontact()
                            }

                        }
                    }

                    CustomImage{
                        myheight:  r1.height/1.5
                        mywidth: r1.width/4.5
                        mysource: "qrc:/images/search (3).png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                search()
                            }

                        }
                    }


                    CustomImage{
                        myheight:  r1.height/2
                        mywidth: r1.width/5
                        mysource: "qrc:/images/menu.png"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                console.log("more information clicked")
                            }

                        }
                    }

                }
            }
        }


        Rectangle{
            Layout.fillHeight: true
            Layout.fillWidth: true
            ListView{
                id:listview

                anchors.fill:parent
                model:viewmodellist.modelview
                clip:true
                delegate: Rectangle{
                    id:outer
                    height:_i1.height*1.3
                    width:_i1.width
                    radius:5
                    color:"transparent"

                    // color: "#A3E4D7"
                    Image{
                        source:"qrc:/images/butterfly.jpg"
                        opacity: 0.3
                        width:parent.width
                        height:root.height
                    }

                    border.width:0.5
                    border.color: "white"
                    // anchors.horizontalCenter:  parent.horizontalCenter


                    MouseArea{
                        anchors.fill: parent
                        onClicked:{

                            if(_c.visible=!_c.visible)
                            {

                                console.log("inside name")
                                //  outer.height=_c.visible?
                                outer.height += 20
                                //  outer.width =_c.visible?
                                outer.width  +=20
                                _rowimg1.visible=true
                                _rowimg2.visible=true

                            }
                            else
                            {
                                _rowimg1.visible=false
                                _rowimg2.visible=false
                                outer.height -= 20
                                outer.width -=20
                            }

                        }

                    }

                    RowLayout{
                        id:_r2
                        spacing:50
                        Rectangle
                        {
                            id:_rowimg
                            color:"transparent"
                            border.color: "transparent"
                            radius: outer.height/1

                            Layout.preferredHeight: imagheight
                            Layout.preferredWidth:imagewidth
                            // anchors.left: parent.left
                            Layout.leftMargin: 30
                            Image
                            {
                                id:_img
                                anchors.fill: parent
                                source: Imagename
                                anchors.topMargin: 10
                            }
                        }

                        Rectangle{
                            id:_inside
                            Layout.preferredHeight: outer.height/1.1
                            Layout.preferredWidth:outer.width/3.5
                            color:"transparent"

                            ColumnLayout{

                                Rectangle{
                                    id:_cc
                                    Layout.preferredHeight: _inside.height/3
                                    Layout.preferredWidth:_inside.width/2
                                    color:"transparent"
                                    Layout.topMargin: 25

                                    Text {
                                        id: name1
                                        anchors.verticalCenter: parent.verticalCenter

                                        text: Contactname
                                        //validator: RegExpValidator { regExp: /.+/ }
                                        font.pixelSize: outer.width/25
                                        font.bold: true
                                    }

                                }

                                Rectangle{
                                    id:_c
                                    Layout.preferredHeight: _inside.height/3
                                    Layout.preferredWidth:_inside.width/2
                                    Text {
                                        id:_phno
                                        text: firstnumber
                                        font.pixelSize: 15
                                        font.bold: true
                                    }
                                    visible: false
                                    color:"transparent"
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log("inside the phno")

                                        }
                                    }

                                }

                            }}


                        Rectangle{
                            id:_inside1
                            Layout.preferredHeight: outer.height/1.1
                            Layout.preferredWidth:outer.width/2
                            color:"transparent"


                            RowLayout{
                                anchors.fill: parent
                                spacing:2

                                Rectangle{
                                    id:_rowimg1
                                    color:"brown"
                                    border.color: "black"
                                    radius: outer.height/2
                                    visible: false
                                    Layout.preferredHeight: outer.height/3
                                    Layout.preferredWidth:outer.width/10
                                    // anchors.left: parent.left
                                    //  Layout.leftMargin: parent.rightMargin
                                    Layout.topMargin: 10

                                    Image{
                                        id:_img2
                                        anchors.fill: parent
                                        source: "qrc:/images/trash (1).png"
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {

                                                console.log("delete contact",+name1.text,index)
                                                viewmodellist.modelview.deleteContactlistview(name1.text)
                                            }
                                        }
                                    }
                                }

                                Rectangle{
                                    id:_rowimg2
                                    // color:"yellow"
                                    border.color: "black"
                                    radius: outer.height/2
                                    visible: false
                                    Layout.preferredHeight: outer.height/3
                                    Layout.preferredWidth:outer.width/10
                                    Layout.rightMargin: 80
                                    //                            Layout.leftMargin: parent.rightMargin
                                    Layout.topMargin: 10

                                    Image{
                                        id:_img3
                                        anchors.fill: parent
                                        source: "qrc:/images/pencil.png"
                                        MouseArea{
                                            anchors.fill: parent
                                            onClicked: {
                                                console.log("edited contact index",index)

                                                // console.log("shared index"+shareindex)
                                                edit(index)
                                                // viewmodellist.modelview.editcontactlist(index)
                                            }
                                        }
                                    }
                                }

                            }
                        }
                    }


                }

            }
        }


        Rectangle{
            id:button
            Layout.maximumHeight:parent.height/8
            Layout.fillHeight: true
            Layout.fillWidth: true
          //  color:"transparent"
            radius:10
            Image {
                id: name
                source: "qrc:/images/imagesblack.jpeg"
                width:parent.width
                opacity: 1
            }

            RowLayout{
                anchors.fill: parent
                //spacing:100

                Rectangle{
                    id:_r
                    Layout.preferredHeight: button.height/2
                    Layout.preferredWidth:button.width/5
                    color:"transparent"
                    radius:5
                    //Layout.rightMargin: 50
                    Layout.topMargin: 15
                   Layout.leftMargin: 10
                     // Layout.rightMargin: 10


                    Text {
                        id: t1
                        text:"Keypad"
                        font.pixelSize: _r.width/4
                        color: "white"
                        anchors.centerIn: parent

                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                _r.color = "lightblue"
                            }
                            onExited: {
                                _r.color = "transparent"
                            }
                            onClicked: {
                                key()
                            }
                        }
                    }
                }

                Rectangle{
                    id:_r3
                    Layout.preferredHeight:button.height/2
                    Layout.preferredWidth:button.width/5
                    color:"transparent"
                    radius:5
                    Layout.topMargin: 10



                    Text {
                        id: t2
                        text:"Recents"
                        font.pixelSize:  _r3.width/4
                        anchors.centerIn: parent
                        color: "white"


                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered:{
                                _r3.color="lightblue"
                            }
                            onExited:{
                                _r3.color="transparent"
                            }
                            onClicked: {
                                console.log("inside the save ")

                            }

                        }
                    }
                }

                Rectangle{
                    id:_r4
                    Layout.preferredHeight:button.height/2
                    Layout.preferredWidth:button.width/5
                    color:"transparent"
                    radius:5
                    Layout.topMargin: 15
                    //                    Layout.leftMargin: 8



                    Text {
                        id: t3
                        text:"Contacts"
                        font.pixelSize: _r4.width/4
                        anchors.centerIn: parent
                        color: "white"



                        MouseArea{
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered:{
                                _r4.color="lightblue"
                            }
                            onExited:{
                                _r4.color="transparent"
                            }
                            onClicked: {
                                console.log("inside the save ")

                            }


                        }
                    }
                }
            }
        }

    }
}




















































































