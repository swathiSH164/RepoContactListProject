import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.1


Rectangle{
    id:_v2
    property real mypreferedheight
    property real mypreferedwidth
    property color mycolor
    property  real  myradius
    property string  myplaceholder
    property real myheight
    property real mywidth
    property color mycolor3
    property color mycolor1
    property real myleftmargin
    Layout.preferredHeight:mypreferedheight
    Layout.preferredWidth:mypreferedwidth
    color:mycolor3
    radius:myradius
    // Layout.right:parent.right
    Image {
        source: "qrc:/images/pink1.jpg"
        width:parent.width
        opacity: 0.6
    }
    TextField{
        id:textcontent
        placeholderText:myplaceholder
        anchors.left:parent.left
        anchors.leftMargin: 90
        anchors.top: parent.top
        anchors.topMargin: parent.height/4.5

        background:
            Rectangle{
            width:mywidth
            height:myheight
            color:mycolor1
        }
    }

}

