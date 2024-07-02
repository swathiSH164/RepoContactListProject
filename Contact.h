#ifndef CONTACT_H
#define CONTACT_H
#include <QString>
#include<QDebug>


class Contact
{
public:
    Contact();
    ~Contact();

    QString contactname() const;
    void setContactname(const QString &contactname);


    QString conatctnumber1() const;
    void setConatctnumber1(const QString &conatctnumber1);

    QString contactnumber2() const;
    void setContactnumber2(const QString &contactnumber2);

    QString imagename() const;
    void setImagename(const QString &imagename);

    QString email() const;
    void setEmail(const QString &email);

    QString group() const;
    void setGroup(const QString &group);

    int cntact_index() const;
    void setCntact_index(int cntact_index);

private:
    QString m_contactname;
    QString m_conatctnumber1;
    QString m_contactnumber2;
    QString m_imagename;
    QString m_email;
    QString m_group;
    int m_cntact_index;
};

#endif // CONTACT_H
