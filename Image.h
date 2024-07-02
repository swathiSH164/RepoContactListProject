#ifndef IMAGE_H
#define IMAGE_H
#include "qdebug.h"


class Image
{
public:
    Image();
    ~Image();
    QString imagepath() const;

    void setImagepath(const QString &imagepath);

private:
    QString m_imagepath;
};

#endif // IMAGE_H
