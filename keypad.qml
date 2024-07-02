import QtQuick 2.5
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

    Rectangle {
    visible: true
    anchors.fill: parent
    signal moveback()
    signal forward()

    TextInput{
        id:t1
        height:parent.height
        width:parent.width
        text: ""
    }


   Rectangle{
       height:parent.height/1.4
       width:parent.width
       //color:"gray"
       Image{
           anchors.fill: parent
           source: "qrc:/images/green.jpg"
           opacity: 0.9
       }


       anchors.centerIn: parent
        GridLayout {
            id: keypadGrid
            anchors.centerIn: parent
            columns: 3
            rows:4


           Button{
               text:"1"
               onClicked: onButtonClicked(text)

           }


            Button {
                text: "2\nABC"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "3\nDEF"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "4\nGHI"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "5\nJKL"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "6\nMNO"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "7\nPQRS"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "8\nTUV"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "9\nWXYZ"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "*"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "0"
                onClicked: onButtonClicked(text)
            }
            Button {
                text: "#"
                onClicked: onButtonClicked(text)
            }
//            Button {
//                text: "Backspace"
//                onClicked: onBackspaceClicked()
//            }
            Rectangle{
                height:20
                width:20
             color:"transparent"
                radius:30
                anchors.left:parent.left
                anchors.leftMargin: 120
                Image{
                    height:50
                    width:50
                   source: "qrc:/images/calling12.png"
                }
            }
        }
   }

Rectangle{
    height:parent.height/7
    width:parent.width
    //color:"skyblue"
    Image{
        anchors.fill: parent
        source: "qrc:/images/pink1.jpg"
        opacity: 0.6


    }

anchors.bottom: parent.bottom
  GridLayout{
      anchors.fill: parent
      rows:1
      columns: 2
      anchors.bottom: parent.bottom
      Rectangle{
          id:_n2
          height:50
          width:150
          color:"transparent"

       //   border.color: "black"
          radius:5
          Text {
              id:t2
              text: "Keypad"
              color:"black"
              font.bold: true
             anchors.centerIn: parent
          }
          MouseArea{
              anchors.fill: parent
              hoverEnabled: true

              onEntered:{
                  _n2.color="#58d68d"
              }
              onExited:{
                  _n2.color="transparent"
              }

          }
      }
      Rectangle{
          id:_n1
          height:50
          width:150
          color:"transparent"
          anchors.right:parent.right
       //   border.color: "black"
          radius:5
          Text {
              id: name
              text: "Contacts"
              color:"black"
              font.bold: true
               anchors.centerIn: parent
          }
          MouseArea{
              anchors.fill: parent
              hoverEnabled: true

              onEntered:{
                  _n1.color="#58d68d"
              }
              onExited:{
                  _n1.color="transparent"
              }
              onClicked: {
             forward()

          }

      }
  }

  }


  }
function onButtonClicked(text1) {
    if (!isNaN(parseInt(text1))) { // Check if text1 is a number
        t1.text += text1; // Append the number to the TextInput
    } else {
        // Extract the number from the text (assuming it's at the beginning)
        var number = text1.match(/\d+/);
        if (number !== null) {
            t1.text += number[0]; // Append the number part to the TextInput
        }
    }
}



        function onBackspaceClicked() {
            console.log("Backspace clicked")
            // Handle backspace button click, e.g., delete the last character
        }
}

