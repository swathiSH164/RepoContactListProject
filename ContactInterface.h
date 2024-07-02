
#ifndef CONTACTINTERFACE_H
#define CONTACTINTERFACE_H

#include <QObject>
#include "RecentContactlistView.h"
#include "ContactViewModel.h"
#include "ImageView.h"

class ContactInterface : public QObject
{
    Q_OBJECT
    Q_PROPERTY(ContactViewModel* modelview  READ getmodelview WRITE setmodelview NOTIFY modelChanged FINAL)
    Q_PROPERTY(RecentContactlistView* recentcontact READ getrecentcontact WRITE setrecentcontactlist  NOTIFY recentcontactChanged)
    Q_PROPERTY(ImageView *imageview  READ getimage WRITE setimage NOTIFY imageChanged)

public:
    explicit ContactInterface(QObject *parent = nullptr);
    Q_INVOKABLE ContactViewModel *getmodelview() const;
    Q_INVOKABLE RecentContactlistView *getrecentcontact()const;
    Q_INVOKABLE ImageView *getimage() const;
    ImageView *getImageview() const;


signals:
    void modelChanged();
    void recentcontactChanged();
    void  imageChanged();

public slots:

private:
    void setmodelview(ContactViewModel* contactModel);
    void setrecentcontactlist(RecentContactlistView*  recentcontactlist);
    void setimage(ImageView * viewimage);
    RecentContactlistView *recentcontact;
    ContactViewModel *modelview;
    ImageView *imageview;
};

#endif // CONTACTINTERFACE_H
