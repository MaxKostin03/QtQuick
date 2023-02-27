#include "mainwindow.h"
#include <QMessageBox>
#include <QPushButton>
#include <QPropertyAnimation>
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_Login_clicked()
{
    QPushButton *pushButton_Login = new QPushButton(tr("Вход"), this);
    QPropertyAnimation *animation = new QPropertyAnimation(pushButton_Login, "pos", this);
    animation->setDuration(10000);
    animation->setStartValue(QPoint(0, 0));
    animation->setEndValue(QPoint(100, 250));
    animation->start();

    QString username = "username";
    ui->lineEdit->setText("Логин");

    QString password = ui->lineEdit_2->text();
    ui->lineEdit_2->setText("Пароль");
        if(username ==  "test" && password == "test") {
            QMessageBox::information(this, "Login", "Username and password is correct");
        }
        else {
            QMessageBox::warning(this,"Login", "Username and password is not correct");
        }
}
