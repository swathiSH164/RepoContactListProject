#include "ImageView.h"

ImageView::ImageView(ContactDataModel *a_datamodel)
{
    qDebug()<<"image view constructor called"<<endl;
}


int ImageView::rowCount(const QModelIndex &parent) const
{
    // qDebug()<<"size of"<< datamodel->imagelist().size();
    return datamodel->imagelist().size();

}

QVariant ImageView::data(const QModelIndex &index, int role) const
{
    if(role==0)
    {
        return datamodel->imagelist().at(index.row())->imagepath();
        //  qDebug()<<"imagepath is"<<imagePath<<endl;
    }
    return QVariant();
}

QHash<int, QByteArray> ImageView::roleNames() const
{
    QHash <int,QByteArray> image;
    image[Imagename]="imagename";
    return image;

}

ContactDataModel *ImageView::getDatamodel() const
{
    return datamodel;
}

void ImageView::setDatamodel(ContactDataModel *value)
{
    datamodel = value;
}
