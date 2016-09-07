--
-- Файл сгенерирован с помощью SQLiteStudio v3.0.7 в Ср сен 7 21:15:54 2016
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: config_opts
CREATE TABLE config_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descr TEXT, opt TEXT, alias_id INTEGER REFERENCES config_aliases (id));
INSERT INTO config_opts (id, name, descr, opt, alias_id) VALUES (1, 'minizip', NULL, 'minizip', NULL);

-- Таблица: install_cmds
CREATE TABLE install_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 1, 'make INSTALL_HDR_PATH=${BIN_DIR}/usr headers_install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 2, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 3, 'mkdir lib', '${BIN_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (5, 3, 'mkdir -p usr/lib', '${BIN_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (6, 3, 'ln -s lib lib64', '${BIN_DIR}/usr', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (7, 3, 'ln -s lib lib64', '${BIN_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (11, 3, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 4, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (18, 5, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (19, 5, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}/contrib/minizip', 1);

-- Таблица: config_aliases
CREATE TABLE config_aliases (id INTEGER PRIMARY KEY AUTOINCREMENT, alias TEXT, on_value TEXT, off_value TEXT);

-- Таблица: installed_pkgs
CREATE TABLE installed_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id));

-- Таблица: package
CREATE TABLE package (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_meta_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, version TEXT, source_name STRING);
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (1, 1, '4.5', 'linux');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (2, 2, '4.05', 'man-pages');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (3, 3, '2.23', 'glibc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (4, 11, '2016c', 'tzdata');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (5, 4, '1.2.8', 'zlib');

-- Таблица: postinstall_cmds
CREATE TABLE postinstall_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 1, 'find ${BIN_DIR}/usr/include \( -name .install -o -name ..install.cmd \) -delete', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 3, 'cp ${SRC_DIR}/${PS}-${PV}/nscd/nscd.conf ${BIN_DIR}/etc/nscd.conf', '${BIN_DIR}/etc', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 3, 'mkdir -p ${BIN_DIR}/var/cache/nscd', NULL, NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 3, 'install -Dm644 ${SRC_DIR}/${PS}-${PV}/nscd/nscd.tmpfiles ${BIN_DIR}/usr/lib/tmpfiles.d/nscd.conf', NULL, NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (5, 3, 'install -Dm644 ${SRC_DIR}/${PS}-${PV}/nscd/nscd.service ${BIN_DIR}/lib/systemd/system/nscd.service', NULL, NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (6, 3, 'cat > ${BIN_DIR}/etc/nsswitch.conf << "EOF"
# Begin /etc/nsswitch.conf

passwd: files
group: files
shadow: files

hosts: files dns myhostname
networks: files

protocols: files
services: files
ethers: files
rpc: files

# End /etc/nsswitch.conf
EOF
', NULL, NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (7, 3, 'mkdir -p ${BIN_DIR}/usr/lib/locale', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (11, 3, 'install -m  774 ${PKG_SOURCES}/locale-gen ${BIN_DIR}/usr/sbin/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (12, 3, 'install -m  644 ${PKG_SOURCES}/locale.conf ${BIN_DIR}/etc/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (14, 5, 'mv ${BIN_DIR}/usr/lib/libz.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 5, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libz.so) ${BIN_DIR}/usr/lib/libz.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (16, 5, 'mv ${BIN_DIR}/usr/lib/libminizip.so.* ${BIN_DIR}/lib', '${BIN_DIR}', 1);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (17, 5, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libminizip.so) ${BIN_DIR}/usr/lib/libminizip.so', '${BIN_DIR}', 1);

-- Таблица: installed_pkg_opts
CREATE TABLE installed_pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id) ON DELETE CASCADE, selected BOOLEAN);

-- Таблица: package_sources
CREATE TABLE package_sources (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), src_url STRING, md5 STRING, size INTEGER);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (1, 1, 'https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.5.tar.xz', 'a60d48eee08ec0536d5efb17ca819aef', 88375040);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (2, 2, 'https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.05.tar.xz', '9c32c8487d753f5894f6fba425b12add', 1452936);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (3, 3, 'http://www.linuxfromscratch.org/patches/lfs/development/glibc-2.23-fhs-1.patch', '9a5997c3452909b1769918c759eff8a2', 2804);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (4, 3, 'http://ftp.gnu.org/gnu/glibc/glibc-2.23.tar.xz', '456995968f3acadbed39f5eba31678df', 13455260);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (5, 4, 'http://www.iana.org/time-zones/repository/releases/tzdata2016c.tar.gz', '0330ccd16140d3b6438a18dae9b34b93', 308625);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (6, 4, 'http://www.iana.org/time-zones/repository/releases/tzcode2016c.tar.gz', 'ffb82ab0b588138759902b4627a6a80d', 192354);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (7, 3, 'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale-gen', '28ca3e9ba0c0b1da38268c114c8228b4', 1093);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (8, 3, 'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale.conf', '28164621b1a16dfb9e5be7953eac0aad', 919);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (9, 5, 'http://www.zlib.net/zlib-1.2.8.tar.xz', '28f1205d8dd2001f26fec1e8c2cebe37', 450776);

-- Таблица: prepare_cmds
CREATE TABLE prepare_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 1, 'make mrproper', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 3, 'patch -Np1 -i ${PKG_SOURCES}/glibc-2.23-fhs-1.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 4, 'patch -Np1 -i ${PKG_SOURCES}/timezone-data-2016a-makefile.patch', '${SRC_DIR}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 5, 'autoreconf -vi', '${SRC_DIR}/${PS}-${PV}/contrib/minizip', 1);

-- Таблица: make_cmds
CREATE TABLE make_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 3, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 4, 'make ${MAKEOPTS}', '${SRC_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 5, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 5, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}/contrib/minizip', 1);

-- Таблица: packages_sys
CREATE TABLE packages_sys (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE);

-- Таблица: pkg_opts
CREATE TABLE pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id), "default" BOOLEAN DEFAULT (0));
INSERT INTO pkg_opts (id, pkg_id, opt_id, "default") VALUES (1, 5, 1, 0);

-- Таблица: postinst_msg
CREATE TABLE postinst_msg (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id), msg STRING);
INSERT INTO postinst_msg (id, pkg_id, msg) VALUES (1, 11, 'Please, update you "/etc/localtime"!');

-- Таблица: pkg_deps
CREATE TABLE pkg_deps (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, dep_py_pkg_id INTEGER REFERENCES package_meta (id), dep_by_opt INTEGER);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (1, 3, 11, -1);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (2, 3, 1, -1);

-- Таблица: package_meta
CREATE TABLE package_meta (id INTEGER PRIMARY KEY AUTOINCREMENT, cat_id INTEGER REFERENCES category (id) ON DELETE CASCADE, name TEXT);
INSERT INTO package_meta (id, cat_id, name) VALUES (1, 141, 'linux-headers');
INSERT INTO package_meta (id, cat_id, name) VALUES (2, 131, 'man-pages');
INSERT INTO package_meta (id, cat_id, name) VALUES (3, 142, 'glibc');
INSERT INTO package_meta (id, cat_id, name) VALUES (4, 142, 'zlib');
INSERT INTO package_meta (id, cat_id, name) VALUES (5, 131, 'file');
INSERT INTO package_meta (id, cat_id, name) VALUES (6, 136, 'binutils');
INSERT INTO package_meta (id, cat_id, name) VALUES (7, 39, 'gmp');
INSERT INTO package_meta (id, cat_id, name) VALUES (8, 39, 'mpfr');
INSERT INTO package_meta (id, cat_id, name) VALUES (9, 39, 'mpc');
INSERT INTO package_meta (id, cat_id, name) VALUES (10, 136, 'gcc');
INSERT INTO package_meta (id, cat_id, name) VALUES (11, 142, 'timezone-data');

-- Таблица: category
CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);
INSERT INTO category (id, name) VALUES (1, 'app-accessibility');
INSERT INTO category (id, name) VALUES (2, 'app-admin');
INSERT INTO category (id, name) VALUES (3, 'app-antivirus');
INSERT INTO category (id, name) VALUES (4, 'app-arch');
INSERT INTO category (id, name) VALUES (5, 'app-backup');
INSERT INTO category (id, name) VALUES (6, 'app-benchmarks');
INSERT INTO category (id, name) VALUES (7, 'app-cdr');
INSERT INTO category (id, name) VALUES (8, 'app-crypt');
INSERT INTO category (id, name) VALUES (9, 'app-dicts');
INSERT INTO category (id, name) VALUES (10, 'app-doc');
INSERT INTO category (id, name) VALUES (11, 'app-editors');
INSERT INTO category (id, name) VALUES (12, 'app-emacs');
INSERT INTO category (id, name) VALUES (13, 'app-emulation');
INSERT INTO category (id, name) VALUES (14, 'app-eselect');
INSERT INTO category (id, name) VALUES (15, 'app-forensics');
INSERT INTO category (id, name) VALUES (16, 'app-i18n');
INSERT INTO category (id, name) VALUES (17, 'app-laptop');
INSERT INTO category (id, name) VALUES (18, 'app-leechcraft');
INSERT INTO category (id, name) VALUES (19, 'app-misc');
INSERT INTO category (id, name) VALUES (20, 'app-mobilephone');
INSERT INTO category (id, name) VALUES (21, 'app-office');
INSERT INTO category (id, name) VALUES (22, 'app-officeext');
INSERT INTO category (id, name) VALUES (23, 'app-pda');
INSERT INTO category (id, name) VALUES (24, 'app-portage');
INSERT INTO category (id, name) VALUES (25, 'app-shells');
INSERT INTO category (id, name) VALUES (26, 'app-text');
INSERT INTO category (id, name) VALUES (27, 'app-vim');
INSERT INTO category (id, name) VALUES (28, 'app-xemacs');
INSERT INTO category (id, name) VALUES (29, 'dev-ada');
INSERT INTO category (id, name) VALUES (30, 'dev-cpp');
INSERT INTO category (id, name) VALUES (31, 'dev-db');
INSERT INTO category (id, name) VALUES (32, 'dev-dotnet');
INSERT INTO category (id, name) VALUES (33, 'dev-embedded');
INSERT INTO category (id, name) VALUES (34, 'dev-games');
INSERT INTO category (id, name) VALUES (35, 'dev-go');
INSERT INTO category (id, name) VALUES (36, 'dev-haskell');
INSERT INTO category (id, name) VALUES (37, 'dev-java');
INSERT INTO category (id, name) VALUES (38, 'dev-lang');
INSERT INTO category (id, name) VALUES (39, 'dev-libs');
INSERT INTO category (id, name) VALUES (40, 'dev-lisp');
INSERT INTO category (id, name) VALUES (41, 'dev-lua');
INSERT INTO category (id, name) VALUES (42, 'dev-ml');
INSERT INTO category (id, name) VALUES (43, 'dev-perl');
INSERT INTO category (id, name) VALUES (44, 'dev-php');
INSERT INTO category (id, name) VALUES (45, 'dev-python');
INSERT INTO category (id, name) VALUES (46, 'dev-qt');
INSERT INTO category (id, name) VALUES (47, 'dev-ros');
INSERT INTO category (id, name) VALUES (48, 'dev-ruby');
INSERT INTO category (id, name) VALUES (49, 'dev-scheme');
INSERT INTO category (id, name) VALUES (50, 'dev-tcltk');
INSERT INTO category (id, name) VALUES (51, 'dev-tex');
INSERT INTO category (id, name) VALUES (52, 'dev-texlive');
INSERT INTO category (id, name) VALUES (53, 'dev-util');
INSERT INTO category (id, name) VALUES (54, 'dev-vcs');
INSERT INTO category (id, name) VALUES (55, 'games-action');
INSERT INTO category (id, name) VALUES (56, 'games-arcade');
INSERT INTO category (id, name) VALUES (57, 'games-board');
INSERT INTO category (id, name) VALUES (58, 'games-emulation');
INSERT INTO category (id, name) VALUES (59, 'games-engines');
INSERT INTO category (id, name) VALUES (60, 'games-fps');
INSERT INTO category (id, name) VALUES (61, 'games-kids');
INSERT INTO category (id, name) VALUES (62, 'games-misc');
INSERT INTO category (id, name) VALUES (63, 'games-mud');
INSERT INTO category (id, name) VALUES (64, 'games-puzzle');
INSERT INTO category (id, name) VALUES (65, 'games-roguelike');
INSERT INTO category (id, name) VALUES (66, 'games-rpg');
INSERT INTO category (id, name) VALUES (67, 'games-server');
INSERT INTO category (id, name) VALUES (68, 'games-simulation');
INSERT INTO category (id, name) VALUES (69, 'games-sports');
INSERT INTO category (id, name) VALUES (70, 'games-strategy');
INSERT INTO category (id, name) VALUES (71, 'games-util');
INSERT INTO category (id, name) VALUES (72, 'gnome-base');
INSERT INTO category (id, name) VALUES (73, 'gnome-extra');
INSERT INTO category (id, name) VALUES (74, 'gnustep-apps');
INSERT INTO category (id, name) VALUES (75, 'gnustep-base');
INSERT INTO category (id, name) VALUES (76, 'gnustep-libs');
INSERT INTO category (id, name) VALUES (77, 'java-virtuals');
INSERT INTO category (id, name) VALUES (78, 'kde-apps');
INSERT INTO category (id, name) VALUES (79, 'kde-base');
INSERT INTO category (id, name) VALUES (80, 'kde-frameworks');
INSERT INTO category (id, name) VALUES (81, 'kde-misc');
INSERT INTO category (id, name) VALUES (82, 'kde-plasma');
INSERT INTO category (id, name) VALUES (83, 'lxde-base');
INSERT INTO category (id, name) VALUES (84, 'lxqt-base');
INSERT INTO category (id, name) VALUES (85, 'mail-client');
INSERT INTO category (id, name) VALUES (86, 'mail-filter');
INSERT INTO category (id, name) VALUES (87, 'mail-mta');
INSERT INTO category (id, name) VALUES (88, 'mate-base');
INSERT INTO category (id, name) VALUES (89, 'mate-extra');
INSERT INTO category (id, name) VALUES (90, 'media-fonts');
INSERT INTO category (id, name) VALUES (91, 'media-gfx');
INSERT INTO category (id, name) VALUES (92, 'media-libs');
INSERT INTO category (id, name) VALUES (93, 'media-plugins');
INSERT INTO category (id, name) VALUES (94, 'media-radio');
INSERT INTO category (id, name) VALUES (95, 'media-sound');
INSERT INTO category (id, name) VALUES (96, 'media-tv');
INSERT INTO category (id, name) VALUES (97, 'media-video');
INSERT INTO category (id, name) VALUES (98, 'net-analyzer');
INSERT INTO category (id, name) VALUES (99, 'net-dialup');
INSERT INTO category (id, name) VALUES (100, 'net-dns');
INSERT INTO category (id, name) VALUES (101, 'net-firewall');
INSERT INTO category (id, name) VALUES (102, 'net-fs');
INSERT INTO category (id, name) VALUES (103, 'net-ftp');
INSERT INTO category (id, name) VALUES (104, 'net-im');
INSERT INTO category (id, name) VALUES (105, 'net-irc');
INSERT INTO category (id, name) VALUES (106, 'net-libs');
INSERT INTO category (id, name) VALUES (107, 'net-mail');
INSERT INTO category (id, name) VALUES (108, 'net-misc');
INSERT INTO category (id, name) VALUES (109, 'net-nds');
INSERT INTO category (id, name) VALUES (110, 'net-news');
INSERT INTO category (id, name) VALUES (111, 'net-nntp');
INSERT INTO category (id, name) VALUES (112, 'net-p2p');
INSERT INTO category (id, name) VALUES (113, 'net-print');
INSERT INTO category (id, name) VALUES (114, 'net-proxy');
INSERT INTO category (id, name) VALUES (115, 'net-voip');
INSERT INTO category (id, name) VALUES (116, 'net-wireless');
INSERT INTO category (id, name) VALUES (117, 'perl-core');
INSERT INTO category (id, name) VALUES (118, 'ros-meta');
INSERT INTO category (id, name) VALUES (119, 'sci-astronomy');
INSERT INTO category (id, name) VALUES (120, 'sci-biology');
INSERT INTO category (id, name) VALUES (121, 'sci-calculators');
INSERT INTO category (id, name) VALUES (122, 'sci-chemistry');
INSERT INTO category (id, name) VALUES (123, 'sci-electronics');
INSERT INTO category (id, name) VALUES (124, 'sci-geosciences');
INSERT INTO category (id, name) VALUES (125, 'sci-libs');
INSERT INTO category (id, name) VALUES (126, 'sci-mathematics');
INSERT INTO category (id, name) VALUES (127, 'sci-misc');
INSERT INTO category (id, name) VALUES (128, 'sci-physics');
INSERT INTO category (id, name) VALUES (129, 'sci-visualization');
INSERT INTO category (id, name) VALUES (130, 'sec-policy');
INSERT INTO category (id, name) VALUES (131, 'sys-apps');
INSERT INTO category (id, name) VALUES (132, 'sys-auth');
INSERT INTO category (id, name) VALUES (133, 'sys-block');
INSERT INTO category (id, name) VALUES (134, 'sys-boot');
INSERT INTO category (id, name) VALUES (135, 'sys-cluster');
INSERT INTO category (id, name) VALUES (136, 'sys-devel');
INSERT INTO category (id, name) VALUES (137, 'sys-firmware');
INSERT INTO category (id, name) VALUES (138, 'sys-freebsd');
INSERT INTO category (id, name) VALUES (139, 'sys-fs');
INSERT INTO category (id, name) VALUES (140, 'sys-infiniband');
INSERT INTO category (id, name) VALUES (141, 'sys-kernel');
INSERT INTO category (id, name) VALUES (142, 'sys-libs');
INSERT INTO category (id, name) VALUES (143, 'sys-power');
INSERT INTO category (id, name) VALUES (144, 'sys-process');
INSERT INTO category (id, name) VALUES (145, 'www-apache');
INSERT INTO category (id, name) VALUES (146, 'www-apps');
INSERT INTO category (id, name) VALUES (147, 'www-client');
INSERT INTO category (id, name) VALUES (148, 'www-misc');
INSERT INTO category (id, name) VALUES (149, 'www-plugins');
INSERT INTO category (id, name) VALUES (150, 'www-servers');
INSERT INTO category (id, name) VALUES (151, 'x11-apps');
INSERT INTO category (id, name) VALUES (152, 'x11-base');
INSERT INTO category (id, name) VALUES (153, 'x11-drivers');
INSERT INTO category (id, name) VALUES (154, 'x11-libs');
INSERT INTO category (id, name) VALUES (155, 'x11-misc');
INSERT INTO category (id, name) VALUES (156, 'x11-plugins');
INSERT INTO category (id, name) VALUES (157, 'x11-proto');
INSERT INTO category (id, name) VALUES (158, 'x11-terms');
INSERT INTO category (id, name) VALUES (159, 'x11-themes');
INSERT INTO category (id, name) VALUES (160, 'x11-wm');
INSERT INTO category (id, name) VALUES (161, 'xfce-base');
INSERT INTO category (id, name) VALUES (162, 'xfce-extra');

-- Таблица: config_cmds
CREATE TABLE config_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 3, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --enable-kernel=2.6.32 --enable-obsolete-rpc', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 5, '${SRC_DIR}/${PS}-${PV}/configure --shared --prefix=/usr', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 5, '${SRC_DIR}/${PS}-${PV}/contrib/minizip/configure --prefix=/usr', '${SRC_DIR}/${PS}-${PV}/contrib/minizip', 1);

-- Таблица: installed_pkg_files
CREATE TABLE installed_pkg_files (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE, name TEXT);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
