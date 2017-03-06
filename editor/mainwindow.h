#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QSqlDatabase>
#include <QTreeWidgetItem>
#include <QTableWidgetItem>
#include <QComboBox>
#include <QListWidgetItem>

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private slots:
    void on_aOpenDB_triggered();

    void on_twPckgs_itemExpanded(QTreeWidgetItem *item);

    void on_twPckgs_currentItemChanged(QTreeWidgetItem *current, QTreeWidgetItem *previous);

    void on_twVersions_itemChanged(QTableWidgetItem *item);

    void on_twVersions_currentItemChanged(QTableWidgetItem *current, QTableWidgetItem *previous);

    void on_pkgs_add();
    void on_pkgs_del();
    void on_version_add();
    void on_version_del();
    void on_source_add();
    void on_source_del();
    void on_prep_add();
    void on_prep_del();
    void on_config_add();
    void on_config_del();
    void on_build_add();
    void on_build_del();
    void on_inst_add();
    void on_inst_del();
    void on_postinst_add();
    void on_postinst_del();
    void on_deps_add();
    void on_deps_del();
    void on_opt_add();
    void on_opt_del();

    void on_twVersions_customContextMenuRequested(const QPoint &pos);

    void on_twSources_customContextMenuRequested(const QPoint &pos);

    void on_twPrep_customContextMenuRequested(const QPoint &pos);

    void on_twConfig_customContextMenuRequested(const QPoint &pos);

    void on_twBuild_customContextMenuRequested(const QPoint &pos);

    void on_twInstall_customContextMenuRequested(const QPoint &pos);

    void on_twPostInst_customContextMenuRequested(const QPoint &pos);

    void on_twDeps_customContextMenuRequested(const QPoint &pos);

    void on_twSources_itemChanged(QTableWidgetItem *item);

    void on_twPrep_itemChanged(QTableWidgetItem *item);

    void on_twConfig_itemChanged(QTableWidgetItem *item);

    void on_twBuild_itemChanged(QTableWidgetItem *item);

    void on_twInstall_itemChanged(QTableWidgetItem *item);

    void on_twPostInst_itemChanged(QTableWidgetItem *item);

    void on_twDeps_itemChanged(QTableWidgetItem *item);

    void on_twPckgs_customContextMenuRequested(const QPoint &pos);

    void on_twPckgs_itemChanged(QTreeWidgetItem *item, int column);

    void on_twPrep_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_twConfig_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_twDeps_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_twBuild_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_twInstall_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_twPostInst_currentCellChanged(int currentRow, int currentColumn, int previousRow, int previousColumn);

    void on_lwOpts_currentItemChanged(QListWidgetItem *current, QListWidgetItem *previous);

    void m_use_list_item_changed(int index);

    void on_lwOpts_customContextMenuRequested(const QPoint &pos);

    void m_pkg_list_item_changed(int index);

    void on_lw_sets_currentItemChanged(QListWidgetItem *current, QListWidgetItem *previous);

private:
    Ui::MainWindow *ui;

    QSqlDatabase    m_db;
    QMenu           *m_pkgs_menu;
    QMenu           *m_version_menu;
    QMenu           *m_source_menu;
    QMenu           *m_prep_menu;
    QMenu           *m_config_menu;
    QMenu           *m_build_menu;
    QMenu           *m_inst_menu;
    QMenu           *m_postinst_menu;
    QMenu           *m_deps_menu;
    QMenu           *m_opt_menu;

    QComboBox       *m_use_list;
    QComboBox       *m_pkg_list;
    QWidget         *m_cur_list;

    void fill_cats();
    void fill_sets();
};

#endif // MAINWINDOW_H
