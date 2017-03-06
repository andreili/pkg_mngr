#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QFileDialog>
#include <QMessageBox>
#include <QSqlQuery>

#define UNUSED(x) (void)(x)

#define add_menu(name, tw) \
    m_ ## name ## _menu = new QMenu(tw); \
    m_ ## name ## _menu ->addAction(tr("Добавить"), this, SLOT(on_ ## name ## _add())); \
    m_ ## name ## _menu ->addAction(tr("Удалить"), this, SLOT(on_ ## name ## _del()));

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    add_menu(pkgs, ui->twPckgs);
    add_menu(version, ui->twVersions);
    add_menu(source, ui->twSources);
    add_menu(prep, ui->twPrep);
    add_menu(config, ui->twConfig);
    add_menu(build, ui->twBuild);
    add_menu(inst, ui->twInstall);
    add_menu(postinst, ui->twPostInst);
    add_menu(deps, ui->twDeps);
    add_menu(opt, ui->lwOpts);

    m_use_list = new QComboBox(this);
    m_use_list->setVisible(false);
    connect(m_use_list, SIGNAL(currentIndexChanged(int)), this, SLOT(m_use_list_item_changed(int)));

    m_pkg_list = new QComboBox(this);
    m_pkg_list->setVisible(false);
    connect(m_pkg_list, SIGNAL(currentIndexChanged(int)), this, SLOT(m_pkg_list_item_changed(int)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_aOpenDB_triggered()
{
    /*QFileDialog dialog;
    dialog.setNameFilter("SQLite3 databases files (*.sql3)|*.sql3");
    if (dialog.exec())
    {
        QString fn = dialog.selectedFiles()[0].toUpper();*/
        //QString fn = "d:/Projects/pkg_mngr/build-pkg_mngr-Desktop-Debug/packages.sql3";
        #ifdef _WIN32
        QString fn = "d:/Dev/Projects/pkg_mngr/packages.sql3";
        #else
        QString fn = "/mnt/lfs/var/lib/pkg/packages.sql3";
        #endif
        m_db = QSqlDatabase::addDatabase("QSQLITE");
        m_db.setDatabaseName(fn);
        if (!m_db.open())
        {
            QMessageBox msg(tr("Ошибка"), tr("Невозможно открыть базу данных"), QMessageBox::Critical,
                        QMessageBox::Ok, QMessageBox::NoButton, QMessageBox::NoButton);
            msg.exec();
        }
        else
        {
            fill_cats();
            fill_sets();
        }
   // }
}

void MainWindow::on_twPckgs_itemExpanded(QTreeWidgetItem *item)
{
    item->takeChildren();
    int cat = item->data(0, Qt::UserRole).toInt();
    int idx = 0;
    QSqlQuery q;
    q.prepare("SELECT * FROM package_meta WHERE cat_id=:cat;");
    q.bindValue(":cat", cat);
    if (q.exec())
        while (q.next())
        {
            QTreeWidgetItem* meta = new QTreeWidgetItem();
            meta->setText(0, q.value("name").toString());
            meta->setData(0, Qt::UserRole, q.value("id"));
            item->addChild(meta);
            ++idx;
        }
    if (idx == 0)
        item->setChildIndicatorPolicy(QTreeWidgetItem::DontShowIndicator);
}

void MainWindow::fill_cats()
{
    ui->twPckgs->clear();

    QSqlQuery q("SELECT * FROM category;");
    if (q.exec())
        while (q.next())
        {
            QTreeWidgetItem* item = new QTreeWidgetItem();
            item->setText(0, q.value("name").toString());
            item->setData(0, Qt::UserRole, q.value("id"));
            item->setChildIndicatorPolicy(QTreeWidgetItem::ShowIndicator);
            ui->twPckgs->addTopLevelItem(item);
        }
}

void MainWindow::fill_sets()
{
    ui->lw_sets->clear();

    QSqlQuery q("SELECT * FROM sets;");
    if (q.exec())
        while (q.next())
        {
            QListWidgetItem* item = new QListWidgetItem();
            item->setText(q.value("name").toString());
            item->setData(Qt::UserRole, q.value("id"));
            ui->lw_sets->addItem(item);
        }
}

void MainWindow::on_twPckgs_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous)
{
    UNUSED(previous);
    if (current->parent() != nullptr)
    {
        int idx = 0;
        ui->twVersions->setRowCount(idx);

        int meta = current->data(0, Qt::UserRole).toInt();
        QSqlQuery q;
        q.prepare("SELECT * FROM package WHERE pkg_meta_id=:meta;");
        q.bindValue(":meta", meta);
        if (q.exec())
            while (q.next())
            {
                ui->twVersions->setRowCount(idx + 1);

                QTableWidgetItem *item = new QTableWidgetItem(current->text(0));
                item->setData(Qt::UserRole, q.value("id"));
                item->setFlags(Qt::NoItemFlags);
                ui->twVersions->setItem(idx, 0, item);

                item = new QTableWidgetItem(q.value("version").toString());
                item->setData(Qt::UserRole, q.value("id"));
                ui->twVersions->setItem(idx, 1, item);

                item = new QTableWidgetItem(q.value("source_name").toString());
                item->setData(Qt::UserRole, q.value("id"));
                ui->twVersions->setItem(idx, 2, item);

                ++idx;
            }

        ui->lwOpts->clear();
        q.prepare("SELECT pkg_opts.id, pkg_opts.opt_id, cfg.name AS opt_name"
                  " FROM pkg_opts"
                  " INNER JOIN config_opts AS cfg ON cfg.id=pkg_opts.opt_id"
                  " WHERE pkg_opts.pkg_id=:pkg;");
        q.bindValue(":pkg", meta);
        if (q.exec())
            while (q.next())
            {
                QListWidgetItem *item = new QListWidgetItem(q.value("opt_name").toString());
                item->setData(Qt::UserRole, q.value("opt_id"));
                item->setData(Qt::UserRole + 1, meta);
                item->setData(Qt::UserRole + 2, q.value("id"));
                ui->lwOpts->addItem(item);
            }

        ui->twDeps->setRowCount(0);
        idx = 0;
        q.prepare("SELECT dep.id, meta.id AS meta_id, dep.dep_by_opt, meta.name, opt.name AS opt_name"
                  " FROM pkg_deps AS dep"
                  " INNER JOIN package_meta AS meta ON meta.id=dep.dep_by_pkg_id"
                  "  LEFT JOIN config_opts AS opt ON opt.id=dep.dep_by_opt"
                  " WHERE dep.pkg_id=:pkg;");
        q.bindValue(":pkg", current->data(0, Qt::UserRole).toInt());
        if (q.exec())
            while (q.next())
            {
                ui->twDeps->setRowCount(idx + 1);

                QTableWidgetItem *item = new QTableWidgetItem(q.value("name").toString());
                item->setData(Qt::UserRole, q.value("id"));
                item->setData(Qt::UserRole + 1, q.value("meta_id"));
                ui->twDeps->setItem(idx, 0, item);

                item = new QTableWidgetItem(q.value("opt_name").toString());
                item->setData(Qt::UserRole, q.value("id"));
                item->setData(Qt::UserRole + 1, q.value("dep_by_opt"));
                ui->twDeps->setItem(idx, 1, item);

                ++idx;
            }
    }
}

void MainWindow::on_twVersions_itemChanged(QTableWidgetItem *item)
{
    int version = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 1:
        q.prepare("UPDATE package SET version=:version WHERE id=:id;");
        q.bindValue(":version", item->text());
        q.bindValue(":id", version);
        q.exec();
        break;
    case 2:
        q.prepare("UPDATE package SET source_name=:source WHERE id=:id;");
        q.bindValue(":source", item->text());
        q.bindValue(":id", version);
        q.exec();
        break;
    }
}

#define fill_opts_list(tw, sql) \
    { \
        tw->setRowCount(0); \
        idx = 0; \
        q.prepare(sql); \
        q.bindValue(":pkg", pkg); \
        if (q.exec()) \
            while (q.next()) \
            { \
                tw->setRowCount(idx + 1); \
 \
                QTableWidgetItem *item = new QTableWidgetItem(q.value("cmd").toString()); \
                item->setData(Qt::UserRole, q.value("id")); \
                tw->setItem(idx, 0, item); \
 \
                item = new QTableWidgetItem(q.value("dir").toString()); \
                item->setData(Qt::UserRole, q.value("id")); \
                tw->setItem(idx, 1, item); \
 \
                item = new QTableWidgetItem(""); \
                item->setData(Qt::UserRole, q.value("id")); \
                item->setData(Qt::UserRole + 2, pkg); \
                if (q.value("opt_id").isNull()) \
                { \
                    item->setText("-"); \
                    item->setData(Qt::UserRole + 1, -1); \
                } \
                else \
                { \
                    item->setText(q.value("opt_name").toString()); \
                    item->setData(Qt::UserRole + 1, q.value("opt_id").toInt()); \
                } \
                tw->setItem(idx, 2, item); \
 \
                ++idx; \
            } \
    }

void MainWindow::on_twVersions_currentItemChanged(QTableWidgetItem *current, QTableWidgetItem *previous)
{
    if (current == nullptr)
    {
        ui->twSources->setRowCount(0);
        ui->twPrep->setRowCount(0);
        ui->twConfig->setRowCount(0);
        ui->twBuild->setRowCount(0);
        ui->twInstall->setRowCount(0);
        ui->twPostInst->setRowCount(0);
        ui->twDeps->setRowCount(0);
        return;
    }

    if ((previous == nullptr) || (current->row() != previous->row()))
    {
        int pkg = current->data(Qt::UserRole).toInt();

        ui->twSources->setRowCount(0);
        int idx = 0;
        QSqlQuery q;
        q.prepare("SELECT * FROM package_sources WHERE pkg_id=:pkg;");
        q.bindValue(":pkg", pkg);
        if (q.exec())
            while (q.next())
            {
                ui->twSources->setRowCount(idx + 1);

                QTableWidgetItem *item = new QTableWidgetItem(q.value("src_url").toString());
                item->setData(Qt::UserRole, q.value("id"));
                ui->twSources->setItem(idx, 0, item);

                item = new QTableWidgetItem(q.value("md5").toString());
                item->setData(Qt::UserRole, q.value("id"));
                ui->twSources->setItem(idx, 1, item);

                item = new QTableWidgetItem(q.value("size").toString());
                item->setData(Qt::UserRole, q.value("id"));
                ui->twSources->setItem(idx, 2, item);

                ++idx;
            }

        fill_opts_list(ui->twPrep, "SELECT cmds.id, cmds.cmd, cmds.dir, opts.opt_id, opt.name AS opt_name"
                                   " FROM prepare_cmds AS cmds"
                                   " LEFT JOIN pkg_opts AS opts ON cmds.dep_by_opt_id=opts.opt_id"
                                   " LEFT JOIN config_opts AS opt ON opts.opt_id=opt.id"
                                   " WHERE cmds.pkg_id=:pkg;");
        fill_opts_list(ui->twConfig, "SELECT cmds.id, cmds.cmd, cmds.dir, opts.opt_id, opt.name AS opt_name"
                                     " FROM config_cmds AS cmds"
                                     " LEFT JOIN pkg_opts AS opts ON cmds.dep_by_opt_id=opts.opt_id"
                                     " LEFT JOIN config_opts AS opt ON opts.opt_id=opt.id"
                                     " WHERE cmds.pkg_id=:pkg;");
        fill_opts_list(ui->twBuild, "SELECT cmds.id, cmds.cmd, cmds.dir, opts.opt_id, opt.name AS opt_name"
                                    " FROM make_cmds AS cmds"
                                    " LEFT JOIN pkg_opts AS opts ON cmds.dep_by_opt_id=opts.opt_id"
                                    " LEFT JOIN config_opts AS opt ON opts.opt_id=opt.id"
                                    " WHERE cmds.pkg_id=:pkg;");
        fill_opts_list(ui->twInstall, "SELECT cmds.id, cmds.cmd, cmds.dir, opts.opt_id, opt.name AS opt_name"
                                      " FROM install_cmds AS cmds"
                                      " LEFT JOIN pkg_opts AS opts ON cmds.dep_by_opt_id=opts.opt_id"
                                      " LEFT JOIN config_opts AS opt ON opts.opt_id=opt.id"
                                      " WHERE cmds.pkg_id=:pkg;");
        fill_opts_list(ui->twPostInst, "SELECT cmds.id, cmds.cmd, cmds.dir, opts.opt_id, opt.name AS opt_name"
                                       " FROM postinstall_cmds AS cmds"
                                       " LEFT JOIN pkg_opts AS opts ON cmds.dep_by_opt_id=opts.opt_id"
                                       " LEFT JOIN config_opts AS opt ON opts.opt_id=opt.id"
                                       " WHERE cmds.pkg_id=:pkg;");
    }
}

void MainWindow::on_pkgs_add()
{
    QTreeWidgetItem *meta_item = ui->twPckgs->currentItem();
    if (meta_item == nullptr)
        return;

    int cat_id = -1;
    if (meta_item->parent() != nullptr)
        cat_id = meta_item->parent()->data(0, Qt::UserRole).toInt();
    else
        cat_id = meta_item->data(0, Qt::UserRole).toInt();

    QSqlQuery q;
    q.prepare("INSERT INTO package_meta (cat_id, name) VALUES (:cat, '-');");
    q.bindValue(":cat", cat_id);
    q.exec();

    int id = q.lastInsertId().toInt();

    QTreeWidgetItem* meta = new QTreeWidgetItem();
    meta->setText(0, "-");
    meta->setData(0, Qt::UserRole, id);

    if (meta_item->parent() != nullptr)
        meta_item->parent()->addChild(meta);
    else
        meta_item->addChild(meta);
}

void MainWindow::on_pkgs_del()
{
    QTreeWidgetItem *meta_item = ui->twPckgs->currentItem();
    if (meta_item->parent() == nullptr)
        return;

    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM package_meta WHERE id = :id ;");
    query.bindValue(":id", meta_item->data(0, Qt::UserRole).toInt());
    if (query.exec())
    {
        ui->twVersions->setRowCount(0);
        ui->twSources->setRowCount(0);
        ui->twPrep->setRowCount(0);
        ui->twConfig->setRowCount(0);
        ui->twBuild->setRowCount(0);
        ui->twInstall->setRowCount(0);
        ui->twPostInst->setRowCount(0);
        ui->twDeps->setRowCount(0);
    }
}

void MainWindow::on_version_add()
{
    QTreeWidgetItem *meta_item = ui->twPckgs->currentItem();
    if (meta_item->parent() != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO package (pkg_meta_id, version, source_name) VALUES (:meta, '0', '');");
        q.bindValue(":meta", meta_item->data(0, Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twVersions->rowCount();

        ui->twVersions->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem(meta_item->text(0));
        item->setData(Qt::UserRole, id);
        item->setFlags(Qt::NoItemFlags);
        ui->twVersions->setItem(idx, 0, item);

        item = new QTableWidgetItem("0");
        item->setData(Qt::UserRole, id);
        ui->twVersions->setItem(idx, 1, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twVersions->setItem(idx, 2, item);
    }
}

void MainWindow::on_version_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM package WHERE id = :id ;");
    query.bindValue(":id", ui->twVersions->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
    {
        ui->twVersions->removeRow(ui->twVersions->selectedItems()[0]->row());
        ui->twSources->setRowCount(0);
        ui->twPrep->setRowCount(0);
        ui->twConfig->setRowCount(0);
        ui->twBuild->setRowCount(0);
        ui->twInstall->setRowCount(0);
        ui->twPostInst->setRowCount(0);
        ui->twDeps->setRowCount(0);
    }
}

void MainWindow::on_source_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO package_sources (pkg_id, src_url, md5, size) VALUES (:pkg, '', '', 0);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twSources->rowCount();

        ui->twVersions->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twSources->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twSources->setItem(idx, 1, item);

        item = new QTableWidgetItem("0");
        item->setData(Qt::UserRole, id);
        ui->twSources->setItem(idx, 2, item);
    }
}

void MainWindow::on_source_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM package_sources WHERE id = :id ;");
    query.bindValue(":id", ui->twSources->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twSources->removeRow(ui->twSources->selectedItems()[0]->row());
}

void MainWindow::on_prep_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO prepare_cmds (pkg_id, cmd, dir, dep_by_opt_id) VALUES (:pkg, '', '', NULL);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twPrep->rowCount();

        ui->twPrep->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twPrep->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twPrep->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twPrep->setItem(idx, 2, item);
    }
}

void MainWindow::on_prep_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM prepare_cmds WHERE id = :id ;");
    query.bindValue(":id", ui->twPrep->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twPrep->removeRow(ui->twPrep->selectedItems()[0]->row());
}

void MainWindow::on_config_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO config_cmds (pkg_id, cmd, dir, dep_by_opt_id) VALUES (:pkg, '', '', NULL);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twConfig->rowCount();

        ui->twConfig->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twConfig->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twConfig->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twConfig->setItem(idx, 2, item);
    }
}

void MainWindow::on_config_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM config_cmds WHERE id = :id ;");
    query.bindValue(":id", ui->twConfig->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twConfig->removeRow(ui->twConfig->selectedItems()[0]->row());
}

void MainWindow::on_build_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO make_cmds (pkg_id, cmd, dir, dep_by_opt_id) VALUES (:pkg, '', '', NULL);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twBuild->rowCount();

        ui->twBuild->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twBuild->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twBuild->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twBuild->setItem(idx, 2, item);
    }
}

void MainWindow::on_build_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM make_cmds WHERE id = :id ;");
    query.bindValue(":id", ui->twBuild->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twBuild->removeRow(ui->twBuild->selectedItems()[0]->row());
}

void MainWindow::on_inst_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO install_cmds (pkg_id, cmd, dir, dep_by_opt_id) VALUES (:pkg, '', '', NULL);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twInstall->rowCount();

        ui->twInstall->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twInstall->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twInstall->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twInstall->setItem(idx, 2, item);
    }
}

void MainWindow::on_inst_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM install_cmds WHERE id = :id ;");
    query.bindValue(":id", ui->twInstall->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twInstall->removeRow(ui->twInstall->selectedItems()[0]->row());
}

void MainWindow::on_postinst_add()
{
    QTableWidgetItem *ver_item = ui->twVersions->currentItem();
    if (ver_item != nullptr)
    {
        QSqlQuery q;
        q.prepare("INSERT INTO postinstall_cmds (pkg_id, cmd, dir, dep_by_opt_id) VALUES (:pkg, '', '', NULL);");
        q.bindValue(":pkg", ver_item->data(Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twPostInst->rowCount();

        ui->twPostInst->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twPostInst->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twPostInst->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twPostInst->setItem(idx, 2, item);
    }
}

void MainWindow::on_postinst_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM postinstall_cmds WHERE id = :id ;");
    query.bindValue(":id", ui->twPostInst->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twPostInst->removeRow(ui->twPostInst->selectedItems()[0]->row());
}

void MainWindow::on_deps_add()
{
    QTreeWidgetItem *pkg_item = ui->twPckgs->currentItem();
    if ((pkg_item != nullptr) && (pkg_item->parent() != nullptr))
    {
        QSqlQuery q;
        q.prepare("INSERT INTO pkg_deps (pkg_id) VALUES (:pkg);");
        q.bindValue(":pkg", pkg_item->data(0, Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        int idx = ui->twDeps->rowCount();

        ui->twDeps->setRowCount(idx + 1);

        QTableWidgetItem *item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twDeps->setItem(idx, 0, item);

        item = new QTableWidgetItem("");
        item->setData(Qt::UserRole, id);
        ui->twDeps->setItem(idx, 1, item);

        item = new QTableWidgetItem("-1");
        item->setData(Qt::UserRole, id);
        ui->twDeps->setItem(idx, 2, item);
    }
}

void MainWindow::on_deps_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM pkg_deps WHERE id = :id ;");
    query.bindValue(":id", ui->twDeps->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->twDeps->removeRow(ui->twDeps->selectedItems()[0]->row());
}

void MainWindow::on_opt_add()
{
    QTreeWidgetItem *pkg_item = ui->twPckgs->currentItem();
    if ((pkg_item != nullptr) && (pkg_item->parent() != nullptr))
    {
        QSqlQuery q;
        q.prepare("INSERT INTO pkg_opts (pkg_id) VALUES (:pkg);");
        q.bindValue(":pkg", pkg_item->data(0, Qt::UserRole));
        q.exec();

        int id = q.lastInsertId().toInt();
        QListWidgetItem *item = new QListWidgetItem("<new>");
        item->setData(Qt::UserRole, QVariant());
        item->setData(Qt::UserRole + 1, pkg_item->data(0, Qt::UserRole).toInt());
        item->setData(Qt::UserRole + 2, id);
        ui->lwOpts->addItem(item);
    }
}

void MainWindow::on_opt_del()
{
    if (QMessageBox::question(this, tr("Удаление"), tr("Вы уверены?")) != QMessageBox::Yes)
        return;

    QSqlQuery query;
    query.prepare("DELETE FROM pkg_opts WHERE id = :id ;");
    query.bindValue(":id", ui->lwOpts->selectedItems()[0]->data(Qt::UserRole).toInt());
    if (query.exec())
        ui->lwOpts->removeItemWidget(ui->lwOpts->selectedItems()[0]);
}

void MainWindow::on_twVersions_customContextMenuRequested(const QPoint &pos)
{
    m_version_menu->actions().at(1)->setEnabled(ui->twVersions->selectedItems().size() != 0);
    m_version_menu->popup(ui->twVersions->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twSources_customContextMenuRequested(const QPoint &pos)
{
    m_source_menu->actions().at(1)->setEnabled(ui->twSources->selectedItems().size() != 0);
    m_source_menu->popup(ui->twSources->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twPrep_customContextMenuRequested(const QPoint &pos)
{
    m_prep_menu->actions().at(1)->setEnabled(ui->twPrep->selectedItems().size() != 0);
    m_prep_menu->popup(ui->twPrep->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twConfig_customContextMenuRequested(const QPoint &pos)
{
    m_config_menu->actions().at(1)->setEnabled(ui->twConfig->selectedItems().size() != 0);
    m_config_menu->popup(ui->twConfig->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twBuild_customContextMenuRequested(const QPoint &pos)
{
    m_build_menu->actions().at(1)->setEnabled(ui->twBuild->selectedItems().size() != 0);
    m_build_menu->popup(ui->twBuild->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twInstall_customContextMenuRequested(const QPoint &pos)
{
    m_inst_menu->actions().at(1)->setEnabled(ui->twInstall->selectedItems().size() != 0);
    m_inst_menu->popup(ui->twInstall->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twPostInst_customContextMenuRequested(const QPoint &pos)
{
    m_postinst_menu->actions().at(1)->setEnabled(ui->twPostInst->selectedItems().size() != 0);
    m_postinst_menu->popup(ui->twPostInst->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twDeps_customContextMenuRequested(const QPoint &pos)
{
    m_deps_menu->actions().at(1)->setEnabled(ui->twDeps->selectedItems().size() != 0);
    m_deps_menu->popup(ui->twDeps->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twSources_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE package_sources SET src_url=:url WHERE id=:id;");
        q.bindValue(":url", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE package_sources SET md5=:md5 WHERE id=:id;");
        q.bindValue(":md5", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 2:
        q.prepare("UPDATE package_sources SET size=:size WHERE id=:id;");
        q.bindValue(":size", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twPrep_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE prepare_cmds SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE prepare_cmds SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twConfig_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE config_cmds SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE config_cmds SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twBuild_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE make_cmds SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE make_cmds SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twInstall_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE install_cmds SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE install_cmds SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twPostInst_itemChanged(QTableWidgetItem *item)
{
    int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE postinstall_cmds SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE postinstall_cmds SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }
}

void MainWindow::on_twDeps_itemChanged(QTableWidgetItem *item)
{
    UNUSED(item);
    /*int id = item->data(Qt::UserRole).toInt();
    int col = item->column();
    QSqlQuery q;
    switch (col)
    {
    case 0:
        q.prepare("UPDATE pkg_deps SET cmd=:cmd WHERE id=:id;");
        q.bindValue(":cmd", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    case 1:
        q.prepare("UPDATE pkg_deps SET dir=:dir WHERE id=:id;");
        q.bindValue(":dir", item->text());
        q.bindValue(":id", id);
        q.exec();
        break;
    }*/
}

void MainWindow::on_twPckgs_customContextMenuRequested(const QPoint &pos)
{
    m_pkgs_menu->actions().at(1)->setEnabled(ui->twPckgs->selectedItems().size() != 0);
    m_pkgs_menu->popup(ui->twPckgs->viewport()->mapToGlobal(pos));
}

void MainWindow::on_twPckgs_itemChanged(QTreeWidgetItem *item, int column)
{
    UNUSED(column);
    if (item->parent() != nullptr)
    {
        QSqlQuery q;
        q.prepare("UPDATE package_meta SET name=:name WHERE id=:id;");
        q.bindValue(":name", item->text(0));
        q.bindValue(":id", item->data(0, Qt::UserRole).toInt());
        q.exec();
    }
}

#define proc_opts_list(tw, col) \
    { \
        UNUSED(previousRow); \
        UNUSED(previousColumn); \
     \
        if (currentColumn == col) \
        { \
            QTableWidgetItem *item = tw->item(currentRow, currentColumn); \
            int opt_id = item->data(Qt::UserRole + 1).toInt(); \
     \
            m_cur_list = tw; \
            m_use_list->clear(); \
            m_use_list->addItem("<none>", QVariant()); \
            QSqlQuery q; \
            q.prepare("SELECT pkg_opts.opt_id, cfg.name AS opt_name" \
                      " FROM pkg_opts" \
                      " INNER JOIN config_opts AS cfg ON cfg.id=pkg_opts.opt_id" \
                      " WHERE pkg_opts.pkg_id=:pkg;"); \
            q.bindValue(":pkg", ui->twPckgs->currentItem()->data(0, Qt::UserRole).toInt()); \
            q.exec(); \
            while (q.next()) \
                m_use_list->addItem(q.value("opt_name").toString(), q.value("opt_id").toInt()); \
     \
            QRect qRect(tw->visualItemRect(item)); \
            QPoint pos = tw->viewport()->mapTo(this, QPoint(qRect.left(), qRect.top())); \
            m_use_list->setGeometry(qRect); \
            m_use_list->move(pos); \
            m_use_list->setCurrentIndex(m_use_list->findData(opt_id, Qt::UserRole)); \
            m_use_list->setVisible(true); \
        } \
        else \
            m_use_list->setVisible(false); \
    }

void MainWindow::on_twPrep_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twPrep, 2);
}

void MainWindow::on_twConfig_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twConfig, 2);
}

void MainWindow::on_twDeps_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twDeps, 1);

    if ((currentColumn == 0) && (currentRow >= 0) && (previousRow >= 0))
    {
        QTableWidgetItem *item = ui->twDeps->item(currentRow, currentColumn);
        int opt_id = item->data(Qt::UserRole + 1).toInt();

        m_pkg_list->clear();
        m_pkg_list->addItem("<none>", QVariant());
        QSqlQuery q;
        q.prepare("SELECT * FROM package_meta;");
        q.exec();
        while (q.next())
            m_pkg_list->addItem(q.value("name").toString(), q.value("id").toInt());

        QRect qRect(ui->twDeps->visualItemRect(item));
        QPoint pos = ui->twDeps->viewport()->mapTo(this, QPoint(qRect.left(), qRect.top()));
        m_pkg_list->setGeometry(qRect);
        m_pkg_list->move(pos);
        m_pkg_list->setCurrentIndex(m_pkg_list->findData(opt_id, Qt::UserRole + 1));
        m_pkg_list->setVisible(true);
    }
    else
        m_pkg_list->setVisible(false);
}

void MainWindow::on_twBuild_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twBuild, 2);
}

void MainWindow::on_twInstall_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twInstall, 2);
}

void MainWindow::on_twPostInst_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn)
{
    proc_opts_list(ui->twPostInst, 2);
}

void MainWindow::on_lwOpts_currentItemChanged(QListWidgetItem *current, QListWidgetItem *previous)
{
    UNUSED(previous);
    if (current == nullptr)
        return;

    int opt_id = current->data(Qt::UserRole).toInt();
    m_cur_list = ui->lwOpts;

    m_use_list->clear();
    m_use_list->addItem("<none>", QVariant());
    QSqlQuery q("SELECT * FROM config_opts;");
    q.exec();
    while (q.next())
        m_use_list->addItem(q.value("name").toString(), q.value("id").toInt());

    QRect qRect(ui->lwOpts->visualItemRect(current));
    QPoint pos = ui->lwOpts->viewport()->mapTo(this, QPoint(qRect.left(), qRect.top()));
    m_use_list->setGeometry(qRect);
    m_use_list->move(pos);
    m_use_list->setCurrentIndex(m_use_list->findData(opt_id, Qt::UserRole));
    m_use_list->setVisible(true);
}

#define update_opt(tw) \
    { \
        int opt = m_use_list->itemData(index, Qt::UserRole).toInt(); \
        QSqlQuery q; \
        q.prepare("UPDATE pkg_opts SET opt_id=:opt WHERE id=:id;"); \
        q.bindValue(":id", tw->currentItem()->data(Qt::UserRole + 2).toInt()); \
        q.bindValue(":opt", opt); \
        q.exec(); \
        ui->lwOpts->currentItem()->setText(m_use_list->currentText()); \
    }

#define update_opt_cmd(tw, sql) \
    { \
        int opt = m_use_list->itemData(index, Qt::UserRole).toInt(); \
        QSqlQuery q; \
        q.prepare(sql); \
        q.bindValue(":id", tw->currentItem()->data(Qt::UserRole).toInt()); \
        q.bindValue(":opt", opt); \
        q.exec(); \
        tw->currentItem()->setData(Qt::UserRole + 1, opt); \
    }

void MainWindow::m_use_list_item_changed(int index)
{
    if (m_cur_list == ui->lwOpts)
        update_opt(ui->lwOpts)
    else if (m_cur_list == ui->twPrep)
        update_opt_cmd(ui->twPrep, "UPDATE prepare_cmds SET dep_by_opt_id=:opt WHERE id=:id;")
    else if (m_cur_list == ui->twConfig)
        update_opt_cmd(ui->twConfig, "UPDATE config_cmds SET dep_by_opt_id=:opt WHERE id=:id;")
    else if (m_cur_list == ui->twDeps)
        update_opt_cmd(ui->twDeps, "UPDATE pkg_deps SET dep_by_opt=:opt WHERE id=:id;")
    else if (m_cur_list == ui->twBuild)
        update_opt_cmd(ui->twBuild, "UPDATE make_cmds SET dep_by_opt_id=:opt WHERE id=:id;")
    else if (m_cur_list == ui->twInstall)
        update_opt_cmd(ui->twInstall, "UPDATE install_cmds SET dep_by_opt_id=:opt WHERE id=:id;")
    else if (m_cur_list == ui->twPostInst)
        {
            int opt = m_use_list->itemData(index, Qt::UserRole).toInt();
            QSqlQuery q;
            q.prepare("UPDATE postinstall_cmds SET dep_by_opt_id=:opt WHERE id=:id;");
            q.bindValue(":id", ui->twPostInst->currentItem()->data(Qt::UserRole).toInt());
            q.bindValue(":opt", opt);
            q.exec();
            ui->twPostInst->currentItem()->setData(Qt::UserRole + 1, opt);
        }
        //update_opt_cmd(ui->twPostInst, "UPDATE postinstall_cmds SET dep_by_opt_id=:opt WHERE id=:id;")
}

void MainWindow::on_lwOpts_customContextMenuRequested(const QPoint &pos)
{
    m_opt_menu->actions().at(1)->setEnabled(ui->lwOpts->selectedItems().size() != 0);
    m_opt_menu->popup(ui->lwOpts->viewport()->mapToGlobal(pos));
}

void MainWindow::m_pkg_list_item_changed(int index)
{
    int pkg = m_pkg_list->itemData(index, Qt::UserRole).toInt();
    QSqlQuery q;
    q.prepare("UPDATE pkg_deps SET dep_by_pkg_id=:pkg WHERE id=:id;");
    q.bindValue(":id", ui->twDeps->currentItem()->data(Qt::UserRole).toInt());
    q.bindValue(":pkg", pkg);
    q.exec();
    ui->twDeps->currentItem()->setText(m_pkg_list->currentText());
}

void MainWindow::on_lw_sets_currentItemChanged(QListWidgetItem *current, QListWidgetItem *previous)
{
    UNUSED(previous);
    ui->lw_set->clear();
    int set_id = current->data(Qt::UserRole).toInt();
    QSqlQuery q;
    q.prepare("select set_pkgs.id, package_meta.name FROM set_pkgs INNER JOIN package ON set_pkgs.pkg_id=package.id "
              "INNER JOIN package_meta ON package.pkg_meta_id=package_meta.id WHERE set_pkgs.set_id=1;");
    q.bindValue(":set", set_id);
    if (q.exec())
        while (q.next())
        {
            QListWidgetItem *item = new QListWidgetItem();
            item->setText(q.value(1).toString());
            item->setData(Qt::UserRole, q.value(0));
            ui->lw_set->addItem(item);
        }
}
