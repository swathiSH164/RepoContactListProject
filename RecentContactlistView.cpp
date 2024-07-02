#include "RecentContactlistView.h"

RecentContactlistView::RecentContactlistView(ContactDataModel *a_model)
{
    qDebug()<<"recentcontactlist constructor called"<<endl;

    qDebug()<<"come down"<<endl;

    connect(a_model,&ContactDataModel::recentContactListUpdated,this,&RecentContactlistView::onRecentContactListUpdated);
    qDebug()<<"come up"<<endl;
}


int RecentContactlistView::rowCount(const QModelIndex &parent) const
{
    qDebug()<<"inside"<<endl;
    return datamodel->recentcontactlist().size();
    //qDebug()<<"count recent"<<count;

}

QVariant RecentContactlistView::data(const QModelIndex &index, int role) const
{
    if(role==0)
    {

        return datamodel->recentcontactlist().at(index.row())->contactname();

    }
    if(role==1)
    {
        return datamodel->recentcontactlist().at(index.row())->conatctnumber1();
    }
    if(role==2)
    {
        return datamodel->recentcontactlist().at(index.row())->contactnumber2();
    }
    if(role==3)
    {
        return datamodel->recentcontactlist().at(index.row())->imagename();
        //qDebug()<<"imagenew"<<imagenew;
    }
    return QVariant();

}

QHash<int, QByteArray> RecentContactlistView::roleNames() const
{
    QHash<int, QByteArray>  recentlist;
    recentlist[Contactname]="Contactname";
    recentlist[Firstnumber]="FirstNumber";
    recentlist[Secondnumber]="SecondNumber";
    recentlist[Imagename]="Imagename";
    return recentlist;

}

void RecentContactlistView::search(QString name)
{
    qDebug()<<"name"<<name<<endl;
    qDebug()<<"search() the contact"<<endl;
    datamodel->searchcontact(name);
}

void RecentContactlistView::onRecentContactListUpdated()
{
    // Refresh the view when recent contact list is updated
    qDebug() << "Recent contact list updated, refreshing view" << endl;
    beginResetModel();
    endResetModel();
}

void RecentContactlistView::setDatamodel(ContactDataModel *value)
{
    datamodel = value;
}



ContactDataModel *RecentContactlistView::getDatamodel() const
{
    return datamodel;
}












//void RecentContactlistView::oncontactnamefound(QString)
//{
//    qDebug()<<"signal is emitted"<<endl;

//}

