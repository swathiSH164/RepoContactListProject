import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4


Rectangle{
    id:_first
    property real mypreferredheight
    property real mypreferredwidth
    property real mypreferredheight2
    property real mypreferredwidth2
    property real mypreferredheight3
    property real mypreferredwidth3
    property real mypreferredheight4
    property real mypreferredwidth4
    property color maincolor
    property real myheight1
    property real mywidth1
    property color maincolor2
    property color maincolor3
    property color maincolor4
    property int myradius
    property string mysource
    property string mysource2
    property string  myplaceholder
    property real mywidth
    property real myheight
    property real space
    property real myleftmargin
    property real leftshift2
    property real myleftmargin2
    property alias imgid: i2
    property var myvalidator
    property alias mytext:textcontent
    property color placeholdercolor

    Layout.preferredHeight:mypreferredheight
    Layout.preferredWidth: mypreferredwidth
    color:maincolor
    radius:myradius
    Image {
        source: "qrc:/images/pink1.jpg"
        width:parent.width
        opacity: 0.6
    }

    RowLayout{
        anchors.fill: parent
        spacing:space
        Rectangle{
            id:_child1
            Layout.preferredHeight: mypreferredheight2
            Layout.preferredWidth:mypreferredwidth2
            Layout.leftMargin: myleftmargin;
            Image{
                id:i1
                anchors.fill: parent
                source:mysource
            }
        }

        Rectangle{
            id:_child2
            Layout.preferredHeight: mypreferredheight3
            Layout.preferredWidth:mypreferredwidth3
            color: maincolor2
            TextField{
                id:textcontent
                placeholderText: myplaceholder
                color: "white"


                validator:myvalidator
                height:myheight1
                width:mywidth1
                background:
                    Rectangle{
                    id:child21
                    width:mywidth
                    height:myheight
                    color:maincolor3
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

        }
        Rectangle{
            id:_child3
            Layout.preferredHeight: mypreferredheight4
            Layout.preferredWidth:mypreferredwidth4
            color:maincolor4
            Image{
                id:i2
                anchors.fill: parent
                source:mysource2
                MouseArea{
                    id:_m1
                    anchors.fill: parent
                    onClicked: {
                        console.log("inside the image")
                        _v1.visible=true
                        _r11.visible=false

                    }
                }
            }


        }
    }
}

