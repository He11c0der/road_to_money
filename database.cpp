#include "database.h"
#include <QDebug>

database::database(QObject *parent) : QObject(parent)
{

}

void database::setConnectDb(QVariant dbname, QVariant usrname, QVariant psswd, QVariant host)
{  _dbName = dbname.toString();
    _usrname = usrname.toString();
    _psswd = psswd.toString();
    _host = host.toString();
    qDebug() << _dbName << " " <<_usrname << " " << _psswd  << " " << _host;




    db = QSqlDatabase::addDatabase("QPSQL");
    db.setDatabaseName(_dbName);
    db.setUserName(_usrname);
    db.setPassword(_psswd);
    db.setHostName(_host);


    if(db.open()){
        _dbAnswer = "База данных успешно подключена";

        emit getAnswerDb(QVariant (_dbAnswer));

    }
    else{
        _dbAnswer = db.lastError().text();
        emit getAnswerDb(QVariant (_dbAnswer));
    }
    qDebug() << "answ" << _dbAnswer;
//    QSqlQuery query;
//    query.exec("SELECT * FROM officer_list");
//    QString qrc = query.value(0).toString();
//    emit getListDb(QVariant(qrc));

}

void database::setListDb(QVariant rank_counter, QVariant fio_counter)
{
    int r = rank_counter.toInt();
    int f = fio_counter.toInt();
    QSqlQuery query;
    query.prepare("SELECT rank,fio FROM oficcer_list");
    query.exec();
    query.next();
    QString qrc = query.value(r).toString();
    query.next();
    QString qrc_fio;

    qrc_fio = query.value(f).toString();

    //qDebug() << qrc;
    emit getListDb(QVariant(qrc),QVariant(qrc_fio));
    
}

void database::setCheckData(QVariant login, QVariant psswd)
{
    _login_role = login.toString();

    _psswd = psswd.toString();
    qDebug() << _login_role << " " <<_psswd;
    QSqlQuery lgnQr;
    lgnQr.prepare("SELECT login,password FROM oficcer_list");


    QString answ = "Ошибка";
    for (int i = 0; i<4 ; i++){
        lgnQr.exec();

        lgnQr.next();

        qDebug() << lgnQr.value(i).toString();
        if(_login_role == lgnQr.value(i).toString())
        {


            lgnQr.next();

            if(_psswd == lgnQr.value(i+1).toString()){

                answ = "Данные подтверждены";
                break;

            }
        }






        }
    qDebug() << answ;
        emit getCheckData(QVariant(answ));


}

void database::deleteConnect()
{

}
    
    
    



