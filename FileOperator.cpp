#include "FileOperator.h"
FileOperator::FileOperator()
{
    qDebug()<<"Fileoperator constructor called"<<endl;
}
FileOperator::~FileOperator()
{
    qDebug()<<"Fileoperator destructor called"<<endl;
    delete contact;
}

void FileOperator::readfile(QList<Contact *> & a_contactlist)
{
    qDebug()<<"readfile called"<<endl;
    QFile file("../ContactLIstDisplay/images/Contactlist.csv");
    file.open(QIODevice::ReadOnly | QIODevice::Text);
    if(!file.isOpen())
    {
        qDebug()<<"file not open";
    }
    else
    {
        qDebug()<<"file  open";

        QTextStream in(&file);
        while(!in.atEnd())
        {
            QString line = in.readLine();
            QStringList data = line.split(',');
            Contact *l_contact = new Contact;
            l_contact->setContactname(data.value(0).trimmed());
            l_contact->setConatctnumber1(data.value(1).trimmed());
            l_contact->setContactnumber2(data.value(2).trimmed());
            l_contact->setEmail(data.value(3).trimmed());
            l_contact->setGroup(data.value(4).trimmed());
            l_contact->setImagename(data.value(5).trimmed());

            qDebug()<<"imag in file: "<<l_contact->imagename();
            a_contactlist.append(l_contact);
            qDebug()<<"fileoprator called"<<endl;

        }
        file.close();
    }

    //qDebug()<<"find the bug"<<QDir<<endl;

}

void FileOperator::writefile(QList<Contact*> &mcontactlist)
{
    QFile file("../ContactLIstDisplay/images/Contactlist.csv");

    qDebug()<<"size of new list"<<mcontactlist.size();
    qDebug()<<"write to file"<<endl;
    if (file.open(QIODevice::WriteOnly | QIODevice::Text)) {

        QTextStream out(&file);

        for (int i=0;i<mcontactlist.count();i++) {
            out<<mcontactlist.at(i)->contactname()<<','<<
                 mcontactlist.at(i)->conatctnumber1()<<','<<
                 mcontactlist.at(i)->contactnumber2()<<','<<
                 mcontactlist.at(i)->email()<<','<<
                 mcontactlist.at(i)->group()<<','<<
                 mcontactlist.at(i)->imagename()<<endl;
            qDebug()<<("first time added");

        }
        qDebug()<<("come out of loop");


    }
    qDebug()<<("come out of loop");
    file.close();

}




















































void FileOperator::deletecontactlist(QString contactname,QList<Contact *> &a_contactlist)
{
    QFile file("../ContactLIstDisplay/images/Contactlist.csv");


    if (!file.open(QIODevice::ReadWrite | QIODevice::Text)) {
        qDebug() << "Failed to open file for deletion";
        //return false;
    }

    QTextStream in(&file);
    QStringList lines;
    bool contactFound = false;
    while (!in.atEnd()) {
        QString line = in.readLine();
        if (line.startsWith(contactname)) {
            contactFound = true;
        } else {
            lines.append(line);
        }
    }

    file.resize(0); // Clear file contents
    QTextStream out(&file);
    for (const QString &line : lines) {
        out << line << "\n";
    }
    file.close();

    if (!contactFound) {
        qDebug() << "Contact not found for deletion";
        //return false;
    }


    qDebug() << "Contact deleted successfully";
    //emit deletesuccessfully(contactname);
    //return true;
     //QString imagePath = QFileDialog::getOpenFileName(nullptr, "Select Image", "", "Images (*.png *.jpg *.jpeg)");

}

void FileOperator::readimage(QList<Image*>&a_imagelist)
{
  // FileDialog dialog(this);
//      dialog.setFileMode(QFileDialog::AnyFile);
    QString pathname = QStandardPaths::writableLocation(QStandardPaths::DownloadLocation);
    QDir dir(pathname);
    if(!dir.exists())
    {
        qDebug()<<"directory not found"<<endl;
    }
    else
    {
        QStringList file=dir.entryList(QDir::Files |QDir::NoDotAndDotDot);
        for(QString &filename:file)
        {
            if(filename.contains(".png") || filename.contains(".jpg") || filename.contains("jpeg"))
            {
                image=new Image;
                QString filep="file://";

                image->setImagepath(filep+dir.filePath(filename));
                a_imagelist.append(image);

            }
        }
    }
}







//    sort(a_contactlist.begin(), a_contactlist.end(), [](Contact *a, Contact *b) {
//        return a->contactname().compare(b->contactname(), Qt::CaseInsensitive) < 0;
//    });



































