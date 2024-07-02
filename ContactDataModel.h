#ifndef CONTACTDATAMODEL_H
#define CONTACTDATAMODEL_H
#include "Contact.h"
#include "FileOperator.h"
#include <QList>
#include <QDebug>
#include <QAbstractListModel>
#include<QObject>
#include "Image.h"

class ContactDataModel:public QObject
{
    Q_OBJECT
public:
    ContactDataModel();
    ~ContactDataModel();

    void objectcreation();

    void show();
    void showimage();
    void edit(int ,QString name,QString phono);

    QList<Contact *> contactlist() const;
    void setContactlist(const QList<Contact *> &contactlist);

    QList<Contact *> recentcontactlist() const;
    void setRecentcontactlist(const QList<Contact *> &recentcontactlist);


    QList<Image *> imagelist() const;
    void setImagelist(const QList<Image *> &imagelist);

private:
    QList<Contact*> m_contactlist;
    FileOperator *m_fileoperator;
    QList<Contact*> m_recentcontactlist;
    QList<Image*> m_imagelist;
signals:
    void contactfound(QString);
    void recentContactListUpdated();
    void contactAdded(Contact *contact);
    void deletecontact();
    void updatedsucessfully();




public slots:
    void Addcontact(QString name, QString phonenumber, QString email, QString group, QString imagepath);
    void deleteContactInModel(QString);
    void searchcontact(QString);
    //void ondeletesuccessfully(contactname);
    // void searchcompleted(QString);

};

#endif // CONTACTDATAMODEL_H
