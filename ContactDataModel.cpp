#include "ContactDataModel.h"
ContactDataModel::ContactDataModel()//QObject *parent):QAbstractListModel {parent}
{

    qDebug()<<"contactdatamodel constructor called";
    objectcreation();
}

ContactDataModel::~ContactDataModel()
{
    qDebug()<<"contactdatmodel destructor called";
    delete m_fileoperator;

}

void ContactDataModel::show()
{
    qDebug()<<"show contactlist"<<endl;

    for(int i=0;i<m_contactlist.size();i++)
    {
       //qDebug()<<"Contact Index"<<m_co
       //qDebug()<<"qwerty"<< m_contactlist<<endl;
        qDebug()<<"contactname"<<m_contactlist.at(i)->contactname();
        qDebug()<<"contactnumber1"<<m_contactlist.at(i)->conatctnumber1();
        qDebug()<<"contactnumber2"<<m_contactlist.at(i)->contactnumber2();
        qDebug()<<"imagename"<<m_contactlist.at(i)->imagename();
    }
}

QList<Contact *> ContactDataModel::contactlist() const
{
    return m_contactlist;

}

void ContactDataModel::setContactlist(const QList<Contact *> &contactlist)
{
    m_contactlist = contactlist;
}

QList<Contact *> ContactDataModel::recentcontactlist() const
{
    return m_recentcontactlist;
}

void ContactDataModel::setRecentcontactlist(const QList<Contact *> &recentcontactlist)
{
    m_recentcontactlist = recentcontactlist;
    qDebug()<<"inside contact"<<m_recentcontactlist.size();
}

QList<Image *> ContactDataModel::imagelist() const
{
    return m_imagelist;
}

void ContactDataModel::setImagelist(const QList<Image *> &imagelist)
{
    m_imagelist = imagelist;
}

void ContactDataModel::Addcontact( QString name, QString phonenumber, QString email, QString group,QString imagepath)
{
   //static int i=1;
    Contact *contactobj=new Contact;
    // contactobj->setCntact_index(i);
    contactobj->setContactname(name);
    contactobj->setConatctnumber1(phonenumber);
    contactobj->setEmail(email);
    contactobj->setGroup(group);
    contactobj->setImagename(imagepath);
    m_contactlist.append(contactobj);

    m_fileoperator->writefile(m_contactlist);
    // emit contactAdded(contactobj);

}

void ContactDataModel::searchcontact(QString name)
{
    qDebug()<<"search contact name"<<name<<endl;

    m_recentcontactlist.clear();
    if (!name.isEmpty()) {
        for(int i=0;i<m_contactlist.size();i++)
        {
            if( m_contactlist.at(i)->contactname().contains(name))
            {
                m_recentcontactlist.append(m_contactlist.at(i));

                qDebug()<<"name found"<<endl;

                // emit recentContactListUpdated();

            }
            else{
                qDebug()<<"name not found"<<endl;

            }
        }
    }
    qDebug()<<"before signal emiit";
    emit recentContactListUpdated();

}

void ContactDataModel::objectcreation()
{
    m_fileoperator = new FileOperator;
    m_fileoperator->readfile(m_contactlist);
    show();
    m_fileoperator->readimage(m_imagelist);
    showimage();
}


void ContactDataModel::deleteContactInModel(QString contactname)
{
    qDebug() << "contact list before deletion:" << m_contactlist.size() << endl;

    m_fileoperator->deletecontactlist(contactname,m_contactlist);

    for(int i=0;i<m_contactlist.size();i++)
    {
       if(m_contactlist.at(i)->contactname().contains(contactname))

        {
            qDebug()<<"contactname found inlist"<<endl;
            delete m_contactlist.takeAt(i);
            emit deletecontact();
        }
    }
    qDebug() << "contact list after deletion:" << m_contactlist.size() << endl;

}


void ContactDataModel::showimage()
{
    qDebug()<<"show imagelist"<<m_imagelist.size()<<endl;


    //   for(int i=0;i<m_imagelist.size();i++)
    //   {
    //       qDebug()<<"imagepath"<<m_imagelist.at(i)->imagepath();
}

void ContactDataModel::edit(int rowno,QString name, QString phono)
{
 qDebug()<<"edit the contact in model"<<endl;
for(int index=0;index<m_contactlist.size();index++)
{
    //  qDebug()<<"before editing data:"<<endl;
    // qDebug()<<"name is:"<<name;
     if(rowno==index)
    {
        // qDebug()<<"editing done :"<<rowno<<index<<endl;
         // m_contactlist.at(index)->contactname()=name;
         // m_contactlist.at(index)->conatctnumber1()=phono;
      m_contactlist.at(index)->setContactname(name);
      m_contactlist.at(index)->setConatctnumber1(phono);

        qDebug()<<"after editing name and ophno"<<endl;
         qDebug()<<"name is:"<<m_contactlist.at(index)->contactname();
        qDebug()<<"phno is:"<<m_contactlist.at(index)->conatctnumber1();


    }
    m_fileoperator->writefile(m_contactlist);
    emit updatedsucessfully();
}
}












































































































//for( it=m_contactlist.begin();it<m_contactlist.end();it++)
//{
//   Contact *contact=*it;
//    if(contact->contactname().contains(name))
//    {
//        m_recentcontactlist.append(contact);

//        //qDebug()<<"recentlist"<<m_contactlist.at(i)<<endl;
//    }

//emit searchcompleted(name);



























//void ContactDataModel::deleteContactInModel(QString contactname)
//{
//    qDebug()<<"contsctlist before deleted"<<m_contactlist.size()<<endl;
//     m_fileoperator->deletecontactlist(contactname,m_contactlist);


//    for(int i=0;i<m_contactlist.size();i++)
//    {
//        qDebug()<<contactlist().at(i)->contactname()<<endl;
//        if(contactlist().at(i)->contactname()==contactname)
//        {

//            contactlist().removeAt(i);
//            //contactlist().at(i)->contactname();
//            qDebug()<<"deleted index"<<i<<endl;
//           //  emit deletecontact(contactname);
//            break;

//        }
//         qDebug()<<"After contsctlist deleted"<<m_contactlist.size()<<endl;

//    }
//}





















































//int ContactDataModel::rowCount(const QModelIndex &parent) const
//{
//    return m_contactlist.size();
//}

//QVariant ContactDataModel::data(const QModelIndex &index, int role) const
//{
//    if(role==0)
//    {
//        return m_contactlist.at(index.row())->contactname();
//    }
//    if(role==1)
//    {
//        return m_contactlist.at(index.row())->conatctnumber1();
//    }
//    if(role==2)
//    {
//        return m_contactlist.at(index.row())->contactnumber2();
//    }
//    if(role==3)
//    {
//        qDebug()<<"image data in cpp: "<<m_contactlist.at(index.row())->imagename();
//        return m_contactlist.at(index.row())->imagename();
//    }
//}

//QHash<int, QByteArray> ContactDataModel::roleNames() const
//{
//    QHash<int,QByteArray> contactlist;
//    contactlist[contactname]="Contactname";
//    contactlist[contactfirstnumber]="firstnumber";
//    contactlist[contactsecondnumber]="secondnumber";
//    contactlist[imagename]="Imagename";
//    return contactlist;
//}
