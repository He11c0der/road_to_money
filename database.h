#ifndef DATABASE_H
#define DATABASE_H

#include <QObject>
#include <QString>
#include <QtSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QVariant>
#include <QSqlError>
class database : public QObject
{
    Q_OBJECT
  //  Q_PROPERTY(QString dbName READ  WRITE setname NOTIFY nameChanged)
public:
    //database();
    QSqlDatabase db;


    explicit database(QObject *parent = nullptr);
public slots:
    void setConnectDb(QVariant, QVariant, QVariant, QVariant);
    void setListDb(QVariant, QVariant);
    void setCheckData(QVariant, QVariant);
    void deleteConnect();
signals:
    //void getConnectDb(QVariant);
    void getAnswerDb(QVariant a);
    void getListDb(QVariant _rank, QVariant _name);
    void getCheckData(QVariant check);
   // void getCheckPswd (QVariant);
private:
    QString _dbName;
    QString _usrname;
    QString _psswd;
    QString _host;
    QString _dbAnswer;
    QString _login_role;
    QString _psswd_role;
};

#endif // DATABASE_H
