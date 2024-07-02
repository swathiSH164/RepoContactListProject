import QtQuick 2.0

Rectangle{

    property string mysource
    property real myheight
    property real mywidth
    property string myid:myimage.source

    Image{
        id:myimage
        source:mysource
        height:myheight
        width:mywidth


    }
}
