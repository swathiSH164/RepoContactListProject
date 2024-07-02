#include "ContactInterface.h"

ContactInterface::ContactInterface(QObject *parent) : QObject(parent)  
{
    qDebug()<<"contact interface constructor called"<<endl;
    //   modelview=new ContactViewModel;
    //   recentcontact=new RecentContactlistView;

    ContactDataModel *l_datamodel = new ContactDataModel;
    modelview=new ContactViewModel(l_datamodel);
    recentcontact=new RecentContactlistView(l_datamodel);
    imageview=new ImageView(l_datamodel);

    modelview->setDatamodel(l_datamodel);
    recentcontact->setDatamodel(l_datamodel); //interface
    imageview->setDatamodel(l_datamodel);
}


ContactViewModel *ContactInterface::getmodelview() const
{
    return modelview;
}


RecentContactlistView *ContactInterface::getrecentcontact() const
{
    return recentcontact;
}

ImageView *ContactInterface::getimage() const
{
    return imageview;
}

void ContactInterface::setmodelview(ContactViewModel *contactModel)
{

    if (modelview != contactModel)
        return;
    modelview = contactModel;
    emit modelChanged();

}

void ContactInterface::setrecentcontactlist(RecentContactlistView *recentcontactlist)
{
    if(recentcontact!=recentcontactlist)
        return;
    recentcontact=recentcontactlist;

    emit recentcontactChanged();
}


void ContactInterface::setimage(ImageView *viewimage)
{
    if(imageview!=viewimage)
        return;
    imageview=viewimage;

    emit imageChanged();
}


ImageView *ContactInterface::getImageview() const
{
    return imageview;
}








