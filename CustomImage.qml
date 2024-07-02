import QtQuick 2.0
import QtQuick.Layouts 1.0

Image{
    property real myheight
    property real mywidth
    property var mysource
    Layout.preferredHeight:myheight
    Layout.preferredWidth: mywidth
    Layout.topMargin: 10
    source:mysource


}
