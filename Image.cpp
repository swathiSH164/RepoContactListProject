#include "Image.h"

Image::Image()
{
    qDebug()<<"Image constructor called"<<endl;
}

QString Image::imagepath() const
{
    return m_imagepath;
}

void Image::setImagepath(const QString &imagepath)
{
    m_imagepath = imagepath;
}
