#include "Contact.h"

Contact::Contact()
{
    qDebug()<<"contact constructor called"<<endl;
}
Contact::~Contact()
{
    qDebug()<<"contact destructor called"<<endl;

}

QString Contact::contactname() const
{
    return m_contactname;
}

void Contact::setContactname(const QString &contactname)
{
    m_contactname = contactname;
    qDebug()<<"edit name"<<endl;
     qDebug()<<m_contactname;
}

QString Contact::conatctnumber1() const
{
    return m_conatctnumber1;

}

void Contact::setConatctnumber1(const QString &conatctnumber1)
{
    m_conatctnumber1 = conatctnumber1;
    //qDebug()<<  m_conatctnumber1;
}

QString Contact::contactnumber2() const
{
    return m_contactnumber2;

}

void Contact::setContactnumber2(const QString &contactnumber2)
{
    m_contactnumber2 = contactnumber2;
    //qDebug()<<m_contactnumber2;
}

QString Contact::imagename() const
{
    return m_imagename;
}

void Contact::setImagename(const QString &imagename)
{
    m_imagename = imagename;
    //qDebug()<<m_imagename;
}

QString Contact::email() const
{
    return m_email;
}

void Contact::setEmail(const QString &email)
{
    m_email = email;
}

QString Contact::group() const
{
    return m_group;
}

void Contact::setGroup(const QString &group)
{
    m_group = group;
}

int Contact::cntact_index() const
{
    return m_cntact_index;
}

void Contact::setCntact_index(int cntact_index)
{
    m_cntact_index = cntact_index;
}

