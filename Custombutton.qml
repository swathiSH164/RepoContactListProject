import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
Rectangle{
    property var mytextid
    property real mywidth
    property real  myheight
    property var mycolor
    property real myradius
    property var mytext
    property int mypixelsize
    property var mycolor1
    property var myid
    id:myid
    color:mycolor
    radius:myradius
    Text {
        id: mytextid
        anchors.centerIn: parent
        text: mytext
        font.pixelSize: parent.width/10
        font.bold: true
        color:mycolor1
    }
}


