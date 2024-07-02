#ifndef RECENTCONTACTLISTVIEW_H
#define RECENTCONTACTLISTVIEW_H
#include <QAbstractListModel>
#include "ContactDataModel.h"



class RecentContactlistView:public QAbstractListModel
{
    Q_OBJECT
public:
    RecentContactlistView(ContactDataModel *a_model);

    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    enum{
        Contactname,
        Firstnumber,
        Secondnumber,
        Imagename

    };
    ContactDataModel *getDatamodel() const;
    void setDatamodel(ContactDataModel *value);

public slots:
    void search(QString);
    void onRecentContactListUpdated();

private:
    ContactDataModel *datamodel;
};

#endif // RECENTCONTACTLISTVIEW_H
