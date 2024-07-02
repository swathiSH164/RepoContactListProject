#include "ContactViewModel.h"


ContactViewModel::ContactViewModel(ContactDataModel *a_datamodel)
{
    cout<<"contactdata model constructor called"<<endl;
    //datamodel=new ContactDataModel;
    connect(a_datamodel,&ContactDataModel::deletecontact,this,&ContactViewModel::ondeletecontact);
    connect(a_datamodel,&ContactDataModel::updatedsucessfully,this,&ContactViewModel::onUpdatedsucessfully);
}


int ContactViewModel::rowCount(const QModelIndex &parent) const
{
    return datamodel->contactlist().size();

}

QVariant ContactViewModel::data(const QModelIndex &index, int role) const
{
    if(role==0)
    {
        return  datamodel->contactlist().at(index.row())->contactname();
        //        qDebug()<<"cname"<<cname;
    }
    if(role==1)
    {
        return datamodel->contactlist().at(index.row())->conatctnumber1();

    }
    if(role==2)
    {
        return datamodel->contactlist().at(index.row())->contactnumber2();
    }
    if(role==3)
    {
        return datamodel->contactlist().at(index.row())->imagename();

    }
    return QVariant();
}

QHash<int, QByteArray> ContactViewModel::roleNames() const
{
    QHash<int,QByteArray> contactlist;
    contactlist[contactname]="Contactname";
    contactlist[contactfirstnumber]="firstnumber";
    contactlist[contactsecondnumber]="secondnumber";
    contactlist[imagename]="Imagename";
    return contactlist;
}




void ContactViewModel::saveContact(QString name, QString phnonumber, QString email, QString group ,QString imagepath)
{
    qDebug()<<"inside------------>" <<endl;
    qDebug()<<phnonumber<<endl;
    datamodel->Addcontact(name,phnonumber,email,group,imagepath);

}


void ContactViewModel::deleteContactlistview(QString name)
{
    qDebug()<<name<<endl;
    qDebug()<<imagename<<endl;
    datamodel->deleteContactInModel(name);

}
void ContactViewModel::editcontact(int rowno,QString name,QString phono)
{
     // qDebug()<<"name is"<<name<<"phno is"<<phono<<endl;
      datamodel->edit(rowno,name,phono);
}



void ContactViewModel::onContactAdded()
{
    beginResetModel();
    endResetModel();
}

ContactDataModel *ContactViewModel::getDatamodel() const
{

    return datamodel;

}

void ContactViewModel::setDatamodel(ContactDataModel *value)
{
    datamodel = value;
}
void ContactViewModel::ondeletecontact()
{
    //qDebug()<<"delete contact slot called"<<name<<endl;
    beginResetModel();
    endResetModel();

}

void ContactViewModel::onUpdatedsucessfully()
{
    qDebug()<<"updated contactslist sucessfully"<<endl;
    // beginResetModel();
    // endResetModel();
}

