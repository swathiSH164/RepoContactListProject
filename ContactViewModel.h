#ifndef CONTACTVIEWMODEL_H
#define CONTACTVIEWMODEL_H
#include <QAbstractListModel>
#include "ContactDataModel.h"

class ContactViewModel:public QAbstractListModel
{
    Q_OBJECT
public:
    ContactViewModel(ContactDataModel *a_datamodel);
    // QAbstractItemModel interface

    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    enum{
        contactname,
        contactfirstnumber,
        contactsecondnumber,
        imagename
    };
    ContactDataModel *getDatamodel() const;
    void setDatamodel(ContactDataModel *value);


public slots:
    void saveContact( QString ,QString ,QString ,QString,QString );
    void deleteContactlistview(QString);
    void onContactAdded();
    void  ondeletecontact();
    void onUpdatedsucessfully();

    // void editcontactlist(QString name);
    void editcontact(int rowno,QString name,QString phno);
private:
    ContactDataModel *datamodel;
};



#endif // CONTACTVIEWMODEL_H
