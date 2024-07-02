#ifndef IMAGEVIEW_H
#define IMAGEVIEW_H
#include <QAbstractListModel>
#include "ContactDataModel.h"


class ImageView:public QAbstractListModel
{
    Q_OBJECT
public:
    ImageView(ContactDataModel *a_model);


    // QAbstractItemModel interface
public:
    int rowCount(const QModelIndex &parent) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QHash<int, QByteArray> roleNames() const override;
    enum{
        Imagename
    };

    ContactDataModel *getDatamodel() const;
    void setDatamodel(ContactDataModel *value);

private:
    ContactDataModel *datamodel;
};

#endif // IMAGEVIEW_H
