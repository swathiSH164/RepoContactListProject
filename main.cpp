#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "ContactInterface.h"
#include <qqmlcontext.h>
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    qDebug()<<"main"<<endl;
    ContactInterface  contactinterface;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("viewmodellist",&contactinterface);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
