import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2

Rectangle
{
    id:p1
    anchors.fill: parent
    color:"yellow"
    property int listViewIndex
    signal savecontact()
    signal cancel()
    property string selectimage
    property string selectnewimage
    Flickable
    {
        id:f1
        anchors.fill: parent
        flickableDirection: Flickable.VerticalFlick
        ColumnLayout
        {
            id: columnLayout
            spacing: 1

            Rectangle{
                id:_l1
                Layout.preferredHeight:  p1.height/2.5
                Layout.preferredWidth:p1.width
                Layout.fillHeight: true
                Layout.fillWidth: true
                color:"transparent"

                Image{
                    source:"qrc:/images/imagesflower.jpeg"
                    width:parent.width
                    height:p1.height

                    opacity:0.4
                }
                border.color: "black"
                Image{
                    id:img
                    width:parent.width/2
                    height: parent.height/2

                    anchors.centerIn: parent
                    source: "qrc:/images/camera.png"
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {

                            console.log("inside image")
                            _h.visible=true
                            openDialog.open()
                            // _l1.height +=80

                        }
                    }
                }


                Rectangle{
                    id:_h
                    height:_l1.height
                    width:_l1.width
                    color:"transparent"
                    visible: false

                    //square rectangle
                    Rectangle{
                        height:_h.height/2
                        width:_h.width/2
                        color:"pink"
                        anchors.top: parent.top
                        //anchors.left:parent.left
                        anchors.leftMargin: 90
                        // anchors.topMargin:10
                        anchors.centerIn: parent

                        Image{
                            id:_i2
                            anchors.fill: parent
                            //  source:   selectnewimage

                            source: selectnewimage !== "" ? selectnewimage : "qrc:/images/profile_new1 (1)-modified (1).png"
                            height:_h.height/10
                            width:_h.width/20
                            visible: true
                        }

                    }


                }
            }
            //Flickable{
            CustomRectangle{
                id:_r11
                mypreferredheight:p1.height/11
                mypreferredwidth:p1.width
                //maincolor:"#F5EEF8"
                myradius: 5
                space:50
                myleftmargin: 20
                mypreferredheight2: _r11.height/3
                mypreferredwidth2: _r11.width/18
                mysource: "qrc:/images/contact (1).png"
                mypreferredheight3: _r11.height/2
                mypreferredwidth3: _r11.width/2
                myheight1:_r11.height/1.5
                mywidth1:_r11.width/2
                myleftmargin2:12
                maincolor2: "transparent"
                myplaceholder: "Name"
                myvalidator: RegExpValidator {
                    regExp: /^(?!.*[ ]{2,})[a-zA-Z\s']+$/
                }

                mywidth: _r11.width/4
                myheight: _r11.height/2
                maincolor3:"transparent"
                mysource2: "qrc:/images/down-chevron.png"
                mypreferredheight4: _r11.height/2
                mypreferredwidth4: _r11.width/10
                maincolor4:"transparent"
            }

            //expanding uparrow
            Rectangle{
                id:_v1
                Layout.preferredHeight:p1.height/2.65
                Layout.preferredWidth: p1.width
                visible: false
                color:"transparent"
                Image {
                    source: "qrc:/images/pink1.jpg"
                    width:parent.width
                    opacity: 0.6
                }
                ColumnLayout{
                    spacing: 2


                    Rectangle{
                        id:_n12
                        Layout.preferredHeight:p1.height/11
                        Layout.preferredWidth: p1.width
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        radius:5
                        Image {
                            source: "qrc:/images/pink1.jpg"
                            width:parent.width
                            opacity: 0.6
                        }

                        RowLayout{
                            anchors.fill: parent
                            spacing: 3
                            Rectangle{
                                id:_r1234
                                Layout.preferredHeight: _r11.height/3
                                Layout.preferredWidth:_r11.width/18
                                anchors.left: parent.left
                                anchors.leftMargin: 22
                                Image{
                                    anchors.fill: parent
                                    source:"qrc:/images/contact (1).png"
                                }
                            }

                            Rectangle{
                                id:_r1345
                                Layout.preferredHeight: _r11.height/2
                                Layout.preferredWidth: _r11.width/7
                                Layout.leftMargin:60
                                color:"transparent"

                                TextField{
                                    id:textcontent9
                                    placeholderText: "Name Prefix"

                                    background:
                                        Rectangle{
                                        id:_r15
                                        width:_r11.width/4
                                        height:_r11.height/2
                                        color:"transparent"
                                    }
                                }
                            }

                            Rectangle{
                                id:_r156
                                Layout.preferredHeight: _r11.height/2
                                Layout.preferredWidth: parent.width/10
                                color:"transparent"
                                Layout.leftMargin: 150
                                Image{
                                    anchors.fill: parent
                                    source: "qrc:/images/arrow-up.png"
                                    MouseArea{
                                        anchors.fill: parent
                                        onClicked: {
                                            console.log("inside the up arrow")
                                            _v1.visible=false
                                            _r11.visible=true

                                        }

                                    }
                                }
                            }
                        }
                    }

                    CustomDropdown{
                        id:_l2

                        mypreferedheight: p1.height/11
                        mypreferedwidth:p1.width
                        //mycolor3:"#F5EEF8"
                        myradius:5
                        myplaceholder:"Firstname"
                        mywidth:50
                        myheight:50
                        mycolor1: "transparent"
                    }
                    CustomDropdown{
                        id:_l3

                        mypreferedheight: p1.height/11
                        mypreferedwidth:p1.width
                        //mycolor3:"#F5EEF8"
                        myradius:5
                        myplaceholder:"MiddleName"
                        myleftmargin:200
                        mywidth:50
                        myheight:50
                        mycolor1: "transparent"

                    }
                    CustomDropdown{
                        id:_l4
                        mypreferedheight: p1.height/11
                        mypreferedwidth:p1.width
                        //mycolor3:"#F5EEF8"
                        myradius:5
                        myplaceholder:"LastName"
                        myleftmargin:200
                        mywidth:50
                        myheight:50
                        mycolor1: "transparent"

                    }
                }
            }

            CustomRectangle{
                id:_phno
                mypreferredheight:p1.height/11
                mypreferredwidth:p1.width
                //maincolor:"#F5EEF8"
                myradius: 5
                space:50
                myleftmargin: 20
                mypreferredheight2: _r11.height/3
                mypreferredwidth2: _r11.width/18
                mysource: "qrc:/images/calling.jpg"

                myheight1:_r11.height/1.5
                mywidth1:_r11.width/2
                //                myleftmargin:  30
                mypreferredheight3: _r11.height/2
                mypreferredwidth3: _r11.width/2
                //                leftshift2:_r11.left

                //                myleftmargin2:12
                maincolor2: "transparent"
                myplaceholder: "phone Number"
                myvalidator:RegExpValidator{ regExp: /^[0-9]{0,10}$/ }
                mywidth: _r11.width/4
                myheight: _r11.height/2
                maincolor3:"transparent"
                mypreferredheight4: _r11.height/2
                mypreferredwidth4: _r11.width/10
                maincolor4:"transparent"
            }

            CustomRectangle{
                id:_email
                mypreferredheight:p1.height/11
                mypreferredwidth:p1.width
                // maincolor:"#F5EEF8"
                myradius: 5
                space:50
                myleftmargin: 20
                mypreferredheight2: _r11.height/3
                mypreferredwidth2: _r11.width/18
                mysource: "qrc:/images/email.png"
                myheight1:_r11.height/1.5
                mywidth1:_r11.width/2

                //                myleftmargin:  30
                mypreferredheight3: _r11.height/2
                mypreferredwidth3: _r11.width/2
                anchors.left:_r11.left

                myleftmargin2:12
                maincolor2: "transparent"
                myplaceholder: "Email"
                myvalidator: RegExpValidator { regExp: /^[^\s@]+@[^\s@]+\.[^\s@]+$/ }
                mywidth: _r11.width/4
                myheight: _r11.height/2
                maincolor3:"transparent"
                mypreferredheight4: _r11.height/2
                mypreferredwidth4: _r11.width/10
                maincolor4:"transparent"

            }


            CustomRectangle{
                id:_group
                mypreferredheight:p1.height/11
                mypreferredwidth:p1.width
                // maincolor:"#F5EEF8"
                myradius: 5
                space:50
                myleftmargin: 20
                mypreferredheight2: _r11.height/3
                mypreferredwidth2: _r11.width/18
                mysource: "qrc:/images/people.png"
                myheight1:_r11.height/1.5
                mywidth1:_r11.width/2

                //                myleftmargin:  30
                mypreferredheight3: _r11.height/2
                mypreferredwidth3: _r11.width/2
                anchors.left:_r11.left

                myleftmargin2:12
                maincolor2: "transparent"
                myplaceholder: "Group"
                myvalidator: RegExpValidator { regExp: /^[a-zA-Z0-9\s']+$/ }
                mywidth: _r11.width/4
                myheight: _r11.height/2
                maincolor3:"transparent"
                mypreferredheight4: _r11.height/2
                mypreferredwidth4: _r11.width/10
                maincolor4:"transparent"
            }
        }
    }

    Rectangle{
        id:button
        height:parent.height/8
        width:parent.width
        anchors.bottom: parent.bottom
        //color:"#2E4053"
        radius:10
        Image {

            source: "qrc:/images/imagesblack.jpeg"
            width:parent.width
            //opacity: 0.2
        }
        RowLayout{
            anchors.fill:parent
            Custombutton {
                id: _r2

                Layout.fillHeight: true
                Layout.fillWidth: true
                mycolor: "transparent"
                myradius: 5
                mytext: "Cancel"

                Layout.topMargin: 5

                mypixelsize: 30
                mycolor1: "white"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        _r2.color = "lightblue"; // Change color on hover
                    }
                    onExited: {
                        _r2.color = "transparent"; // Restore original color on exit
                    }
                    onClicked: {
                        console.log("inside cancel")
                        cancel()
                    }
                }
            }
            Custombutton{
                id:_r8
                Layout.fillHeight: true
                Layout.fillWidth: true
                mycolor:"transparent"
                myradius:5

                mytext:"Save"
                Layout.topMargin: 5
                mypixelsize: 30

                mycolor1:"white"

                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered:{
                        _r8.color="steelblue"
                    }
                    onExited:{
                        _r8.color="transparent"
                    }
                    onClicked: {
                        //index ++
                        if (_phno.mytext.text.trim() === "" || _r11.mytext.text=="")
                        {

                            console.log("phone number not found")
                        }
                        else
                        {
                            console.log("name : "+_r11.mytext.text+"Index")
                            viewmodellist.modelview. saveContact(_r11.mytext.text,_phno.mytext.text,_email.mytext.text,_group.mytext.text,_i2.source);
                            // rr.visible=true
                            savedialog.visible=true



                            _r11.mytext.text=""
                            _phno.mytext.text = ""
                            _email.mytext.text = ""
                            _group.mytext.text = ""
                        }

                    }

                }
            }

            Custombutton {
                id: _r

                Layout.fillHeight: true
                Layout.fillWidth: true
                mycolor: "transparent"
                myradius: 5
                mytext: "Edit"

                Layout.topMargin: 5

                mypixelsize: 30
                mycolor1: "white"

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true

                    onEntered: {
                        _r.color = "lightblue"; // Change color on hover
                    }
                    onExited: {
                        _r.color = "transparent"; // Restore original color on exit
                    }
                    onClicked: {

                        console.log("inside  listindex  edit"+_r11.mytext.text,_phno.mytext.text,listViewIndex)
                        viewmodellist.modelview.editcontact(listViewIndex,_r11.mytext.text,_phno.mytext.text)
                        editdialog.visible=true
                        editdialog.open()
                    }
                }
            }

        }
    }

    Rectangle{
        id: savedialog
        height:250
        width:250
        color: "skyblue"
        visible: false
        anchors.centerIn: parent
        border.color:"black"
        //    text:"contact saved"
        Text {
            id: name
            text: "Contact Saved Sucesfully"
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.verticalCenter: parent.verticalCenter
        }


        RowLayout{
            anchors.fill: parent
            Button{
                id:b1
                text:"OK"
                anchors.left:parent.left
                //             anchors.leftMargin: 20

                onClicked:
                {

                    console.log("clicked on cancel")
                    savedialog.visible = false;
                   // editdialog.visible=false


                }
            }
            Button{
                text:"Cancel"
                anchors.right:parent.right
                // anchors.leftMargin: 20
                onClicked:
                {
                    console.log("clicked on save")
                    savedialog.visible = false;
                    // editdialog.visible=false
                }
            }
        }
    }

    FileDialog {
        id:openDialog
        visible:false
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {

            console.log("choose");
            selectnewimage=fileUrl
        }
        onRejected: {
            console.log("Canceled")

        }
    }
    Component.onCompleted:{
        console.log("Add contact page with index = ",listViewIndex)
    }

    Rectangle{
        id: editdialog
        height:250
        width:250

        color: "skyblue"
        visible: false
        anchors.centerIn: parent
        border.color:"black"
        //    text:"contact saved"
        Text {
            id: name1
            text: "Edit data Sucesfully"
            anchors.horizontalCenter: parent.horizontalCenter
            // anchors.verticalCenter: parent.verticalCenter
        }

        RowLayout{
            anchors.fill: parent
            Button{
                id:b3
                text:"OK"
                anchors.left:parent.left
                //             anchors.leftMargin: 20

                onClicked:
                {

                    console.log("clicked on cancel")
                   // savedialog.visible = false;
                   editdialog.visible=false


                }
            }
            Button{
                text:"Cancel"
                anchors.right:parent.right
                // anchors.leftMargin: 20
                onClicked:
                {
                    console.log("clicked on save")
                   // savedialog.visible = false;
                     editdialog.visible=false
                }
            }
        }
    }

}

















