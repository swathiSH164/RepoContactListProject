import QtQuick 2.0
import QtQuick.Controls 1.0

TextField{
   // id:_t1
    property var myplaceholder
    property var mywidth
    property var  myheight
    property color mycolor
    placeholderText:myplaceholder
    background:
        Rectangle{

        width:mywidth
        height:myheight
        color:mycolor
    }
}

