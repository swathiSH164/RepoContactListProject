#ifndef FILEOPERATOR_H
#define FILEOPERATOR_H
#include <QDebug>
#include <QDir>
#include "Contact.h"
#include<iostream>
#include <QList>
#include "Image.h"
#include <QString>
#include<QStandardPaths>

using namespace std;
class FileOperator
{
public:
    FileOperator();
    ~FileOperator();
    void readfile(QList<Contact*> &a_contactlist);
    void writefile(QList<Contact*> &a_contactlist);
    void  deletecontactlist(QString,QList<Contact*>&a_contactlist);
    void show();
    void readimage(QList<Image*>&a_imagelist);

signals:
    // void deletesuccessfully(contactname);
private:
    Contact *contact ;
    Image  *image;
};

#endif // FILEOPERATOR_H
