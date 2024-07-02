import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Window {
    id:w1
    visible: true
    width: 350
    height: 480
    title: qsTr("Contacts")
    property var url
    property var number
    signal myclick()

    Loader{
        id:contactlist
        anchors.fill: parent
        source:"qrc:/Contactlist.qml"
    }

    Connections{
        target:contactlist.item
        ignoreUnknownSignals: true
        onAddcontact:
        {

            console.log("go to addcontactpage")
            contactlist.source="qrc:/AddcontactComponent.qml"
        }
        onSearch:
        {
            console.log("inside the search slot")
            contactlist.source="qrc:/SearchPage.qml"
        }
        onBack:
        {
            console.log("inside the back button")
            contactlist.source="qrc:/Contactlist.qml"
        }
        onBackleft:
        {
            console.log("inside left back")
            contactlist.source="qrc:/Contactlist.qml"
        }
        onCancel:
        {
            contactlist.source="qrc:/Contactlist.qml"
        }
        onKey:{
            contactlist.source="qrc:/keypad.qml"
        }
        onEdit:{
            contactlist.source="qrc:/AddcontactComponent.qml"
            contactlist.item.listViewIndex = index
            console.log("on edit slot with index = ",index)
        }
        onMoveback:{
            contactlist.source="qrc:/Contactlist.qml"
        }
        onForward:{
            contactlist.source="qrc:/Contactlist.qml"
        }
    }

}



























//    Rectangle{
//        height:parent.height
//        width: parent.width
//        color:"blue"

//        ColumnLayout{
//            anchors.fill: parent
//            Rectangle{
//                Layout.preferredHeight: parent.height/2
//                Layout.preferredWidth: parent.width/2
//                anchors.centerIn: parent

//                color:"yellow"
//                ColumnLayout{
//                    anchors.fill: parent
//                    Rectangle{
//                        Layout.preferredHeight: parent.height/3
//                        Layout.preferredWidth: parent.width/1.5
//                        color:"red"

//                RowLayout{
//                  anchors.fill: parent
//                    Label{
//                        text:"FirstName :"
//                    }

//                    TextField{
//                        placeholderText: "enter firstname"
//                    }
//                }
//                    }
//                    ColumnLayout{
//                        anchors.fill: parent

//                    Rectangle{
//                        Layout.preferredHeight: parent.height/3
//                        Layout.preferredWidth: parent.width/1.5
//                        color:"purple"

//                RowLayout{
//                    anchors.fill: parent
//                    Label{
//                        text:"LastName :"
//                    }

//                    TextField{
//                        placeholderText: "enter firstname"
//                    }
//                }
//                    }



//            }
//        }
//    }
//}
//}
//}



//Rectangle{
//    id:dialog
//    height:150
//    width:300
//    color: "transparent"
//    visible: false
//    anchors.centerIn: parent
//    border.color:"black"
////    text:"contact saved"
//    Text {
//        id: name
//        text: "Contact Saved Sucesfully"
//        anchors.horizontalCenter: parent.horizontalCenter
//       // anchors.verticalCenter: parent.verticalCenter
//    }
//    RowLayout{
//        anchors.fill: parent
//    Button{
//        id:b1
//         text:"OK"
//         anchors.left:parent.left
//         anchors.leftMargin: 20

//        onClicked:
//        {

//            console.log("clicked on cancel")
//            b1.c

//        }
//    }
//    Button{
//         text:"Cancel"
//         anchors.right:parent.right
//        // anchors.leftMargin: 20
//        onClicked:
//        {
//            console.log("clicked on save")
//        }
//    }


//}
//}
//Button{
//    text:"Save"
//    onClicked: {
//        console.log("save clicked")
//         dialog.visible=true
//    }

//}





















































////ApplicationWindow {
////    visible: true
////    width: 300
////    height: 200
////    title: "Vertical ScrollView Example"

////    ScrollView {
////        id: scrollView
////        anchors.fill: parent
////        clip: true

////        Column {
////            spacing: 10
////            width: parent.width

////            Repeater {
////                model: 50 // Number of items in the scrollable area

////                Text {
////                    text: "Item " + (index + 1)
////                    font.pixelSize: 20
////                    padding: 10
////                    width: scrollView.width
////                }
////            }
////        }

////        ScrollBar.vertical: ScrollBar {
////            active: true
////            policy: ScrollBar.AsNeeded
////            size: scrollView.height / scrollView.contentHeight
////        }
////    }
////}

































////Window{

////    visible: true
////    width: 350
////    height: 480
////    Rectangle{
////        id:r2
////        height:parent.height/8
////        width:parent.width
////        color:"pink"
////        Rectangle{
////            id:r1
////            height:parent.height/1
////            width:parent.width/2
////            color:"blue"

////             anchors.right: parent.right

////        RowLayout{
////            spacing :30

////          Layout.fillHeight: true
////          Layout.fillWidth: true

////            Image{

////                Layout.preferredHeight: r1.height
////                Layout.preferredWidth: r1.width/4.5

////                   //Layout.topMargin: 5
////                //anchors.fill: parent
////                source:"qrc:/images/plus.png"
////            }

////            Image{
////                Layout.preferredHeight: r1.height/1.5
////                Layout.preferredWidth: r1.width/4.5
////                //anchors.fill: parent
////                 Layout.topMargin: 5
////                source:"qrc:/images/search (2).png"

////            }

////            Image{
////                Layout.preferredHeight: r1.height/1.5
////                Layout.preferredWidth: r1.width/4.5
////Layout.topMargin: 5
////                //anchors.fill: parent
////                source:"qrc:/images/menu.png"

////            }

////        }
////    }
////}
////}

















////ApplicationWindow {
////    visible: true
////    width: 400
////    height: 400
////    title: "Image Path Selector"

////    property string selectedImagePath: "" // Dynamic image path

////    Image {
////        source: selectedImagePath

////        anchors.centerIn: parent
////        width: 200
////        height: 200
////        fillMode: Image.PreserveAspectCrop
////        clip: true
////        sourceSize.height: 200
////        sourceSize.width: 200
////        //radius: width/2
////        smooth: true
////    }

////    MouseArea {
////        anchors.fill: parent
////        onClicked: {
////            // Open a file dialog to select an image file
////            fileDialog.open()
////        }
////    }

////    FileDialog {
////        id: fileDialog
////        title: "Select Image"
////        folder: shortcuts.home
////        onAccepted: {
////            // Get the selected file's URL
////            var url = fileDialog.fileUrl
////            if (url !== "") {
////                // Set the selected image path
////                selectedImagePath = url.toString()
////                  console.log(selectedImagePath)
////                // Emit a signal to notify the backend that the image has been selected
////                backend.handleSelectedImage(selectedImagePath);
////            }
////        }
////        // Set supported file types
////        nameFilters: [
////            "Image files (*.jpg *.png *.bmp *.gif *.jpeg)",
////            "All files (*)"
////        ]
////    }

////    Text {
////        anchors.bottom: parent.bottom
////        anchors.horizontalCenter: parent.horizontalCenter
////        text: "Click anywhere to select an image"
////    }
////}
//}
