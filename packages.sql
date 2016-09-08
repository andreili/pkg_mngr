--
-- Файл сгенерирован с помощью SQLiteStudio v3.0.7 в Чт сен 8 21:55:56 2016
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Таблица: prepare_cmds
CREATE TABLE prepare_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 1, 'make mrproper', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 3, 'patch -Np1 -i ${PKG_SOURCES}/glibc-2.24-fhs-1.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 4, 'patch -Np1 -i ${PKG_SOURCES}/timezone-data-2016a-makefile.patch', '${SRC_DIR}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 12, 'patch -Np1 -i ${PKG_SOURCES}/bzip2-1.0.6-install_docs-1.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (5, 12, 'sed -i ''s@\(ln -s -f \)$(PREFIX)/bin/@\1@'' Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (6, 12, 'sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (8, 14, 'sed -i ''/LIBTOOL_INSTALL/d'' c++/Makefile.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (9, 15, 'sed -i -e ''s|/@pkg_name@|&-@pkg_version@|'' include/builddefs.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (10, 15, 'sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);

-- Таблица: postinst_msg
CREATE TABLE postinst_msg (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id), msg STRING);
INSERT INTO postinst_msg (id, pkg_id, msg) VALUES (1, 11, 'Please, update you "/etc/localtime"!');

-- Таблица: installed_pkg_files
CREATE TABLE installed_pkg_files (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE, name TEXT);

-- Таблица: packages_sys
CREATE TABLE packages_sys (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE);

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
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (14, 5, 'mkdir -p ${BIN_DIR}/lib/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 5, 'mv ${BIN_DIR}/usr/lib/libz.so.* ${BIN_DIR}/lib/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (18, 5, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libz.so) ${BIN_DIR}/usr/lib/libz.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (20, 11, 'ln -s ../usr/bin/cpp ${BIN_DIR}/lib/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (21, 11, 'ln -s gcc ${BIN_DIR}/usr/bin/cc', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (22, 11, 'install -dm755 ${BIN_DIR}/usr/lib/bfd-plugins', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (23, 11, 'ln -sf ../../libexec/gcc/$(gcc -dumpmachine)/${PV}/liblto_plugin.so ${BIN_DIR}/usr/lib/bfd-plugins/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (24, 11, 'mkdir -p ${BIN_DIR}/usr/share/gdb/auto-load/usr/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (25, 11, 'mv ${BIN_DIR}/usr/lib/*gdb.py ${BIN_DIR}/usr/share/gdb/auto-load/usr/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (26, 12, 'mkdir -p ${BIN_DIR}/{bin,lib,usr}', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (27, 12, 'cp bzip2-shared ${BIN_DIR}/bin/bzip2', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (28, 12, 'cp -a libbz2.so* ${BIN_DIR}/lib/', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (29, 12, 'ln -s ../../lib/libbz2.so.1.0 ${BIN_DIR}/usr/lib/libbz2.so', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (30, 12, 'rm ${BIN_DIR}/usr/lib/{bunzip2,bzcat,bzip2}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (31, 12, 'ln -sf bzip2 ${BIN_DIR}/bin/bunzip2', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (33, 12, 'ln -sf bzip2 ${BIN_DIR}/bin/bzcat', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (34, 14, 'mkdir -p ${BIN_DIR}/{lib,usr/lib/pkgconfig}', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (35, 14, 'mv -v ${BIN_DIR}/usr/lib/libncursesw.so.6* ${BIN_DIR}/lib/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (36, 14, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libncursesw.so) ${BIN_DIR}/usr/lib/libncursesw.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (37, 14, 'for lib in ncurses form panel menu ; do
    rm -f                    ${BIN_DIR}/usr/lib/lib${lib}.so
    echo "INPUT(-l${lib}w)" > ${BIN_DIR}/usr/lib/lib${lib}.so
    ln -sf ${lib}w.pc        ${BIN_DIR}/usr/lib/pkgconfig/${lib}.pc
done', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (38, 14, 'rm vf  ${BIN_DIR}/usr/lib/libcursesw.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (39, 14, 'echo "INPUT(-lncursesw)" > ${BIN_DIR}/usr/lib/libcursesw.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (40, 14, 'ln -sf libncurses.so ${BIN_DIR}/usr/lib/libcurses.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (43, 15, 'chmod 0755 ${BIN_DIR}/usr/lib/libattr.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (44, 15, 'mv ${BIN_DIR}/usr/lib/libattr.so.* ${BIN_DIR}/lib/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (45, 15, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libattr.so) ${BIN_DIR}/usr/lib/libattr.so', '${BIN_DIR}', NULL);

-- Таблица: make_cmds
CREATE TABLE make_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 3, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 4, 'make ${MAKEOPTS}', '${SRC_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (3, 5, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (5, 6, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (6, 7, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (7, 8, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (8, 9, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (9, 10, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (10, 11, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (11, 12, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (12, 13, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (13, 14, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (14, 15, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);

-- Таблица: installed_pkgs
CREATE TABLE installed_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id));

-- Таблица: package
CREATE TABLE package (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_meta_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, version TEXT, source_name STRING);
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (1, 1, '4.7.2', 'linux');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (2, 2, '4.07', 'man-pages');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (3, 3, '2.24', 'glibc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (4, 11, '2016c', 'tzdata');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (5, 4, '1.2.8', 'zlib');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (6, 5, '5.28', 'file');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (7, 6, '2.27', 'binutils');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (8, 7, '6.1.1', 'gmp');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (9, 8, '3.1.4', 'mpfr');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (10, 9, '1.0.3', 'mpc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (11, 10, '6.2.0', 'gcc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (12, 13, '1.0.6', 'bzip2');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (13, 14, '0.29.1', 'pkg-config');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (14, 15, '6.0', 'ncurses');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (15, 16, '2.4.47', 'attr');

-- Таблица: package_sources
CREATE TABLE package_sources (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), src_url STRING, md5 STRING, size INTEGER);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (1, 1, 'https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.7.2.tar.xz', 'ae493473d074185205a54bc8ad49c3b4', 90408888);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (2, 2, 'https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.07.tar.xz', '6d6c59b83431852ba44930785def30d4', 1479536);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (3, 3, 'http://www.linuxfromscratch.org/patches/lfs/development/glibc-2.24-fhs-1.patch', '9a5997c3452909b1769918c759eff8a2', 2804);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (4, 3, 'http://ftp.gnu.org/gnu/glibc/glibc-2.24.tar.xz', '97dc5517f92016f3d70d83e3162ad318', 13554048);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (5, 4, 'http://www.iana.org/time-zones/repository/releases/tzdata2016c.tar.gz', '0330ccd16140d3b6438a18dae9b34b93', 308625);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (6, 4, 'http://www.iana.org/time-zones/repository/releases/tzcode2016c.tar.gz', 'ffb82ab0b588138759902b4627a6a80d', 192354);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (7, 3, 'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale-gen', '28ca3e9ba0c0b1da38268c114c8228b4', 1093);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (8, 3, 'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale.conf', '28164621b1a16dfb9e5be7953eac0aad', 919);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (9, 5, 'http://www.zlib.net/zlib-1.2.8.tar.xz', '28f1205d8dd2001f26fec1e8c2cebe37', 450776);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (10, 6, 'ftp://ftp.astron.com/pub/file/file-5.28.tar.gz', '3f7771424aa855f32094b49571e19b33', 777859);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (11, 7, 'http://ftp.gnu.org/gnu/binutils/binutils-2.27.tar.bz2', '2869c9bf3e60ee97c74ac2a6bf4e9d68', 26099568);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (13, 8, 'http://ftp.gnu.org/gnu/gmp/gmp-6.1.1.tar.xz', 'e70e183609244a332d80529e7e155a35', 1943164);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (14, 9, 'http://www.mpfr.org/mpfr-3.1.4/mpfr-3.1.4.tar.xz', '064b2c18185038e404a401b830d59be8', 1122152);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (15, 10, 'http://www.multiprecision.org/mpc/download/mpc-1.0.3.tar.gz', 'd6a1d5f8ddea3abd2cc3e98f58352d26', 669925);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (16, 11, 'http://ftp.gnu.org/gnu/gcc/gcc-6.2.0/gcc-6.2.0.tar.bz2', '9768625159663b300ae4de2f4745fcc4', 99778648);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (17, 12, 'http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz', '00b516f4704d4a7cb50a1d97e6e8e15b', 782025);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (18, 12, 'http://www.linuxfromscratch.org/patches/lfs/development/bzip2-1.0.6-install_docs-1.patch', '6a5ac7e89b791aae556de0f745916f7f', 1684);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (19, 13, 'https://pkg-config.freedesktop.org/releases/pkg-config-0.29.1.tar.gz', 'f739a28cae4e0ca291f82d1d41ef107d', 2013454);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (20, 14, 'http://ftp.gnu.org/gnu//ncurses/ncurses-6.0.tar.gz', 'ee13d052e1ead260d7c28071f46eefb1', 3131891);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (21, 15, 'http://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz', '84f58dec00b60f2dc8fd1c9709291cc7', 343692);

-- Таблица: pkg_deps
CREATE TABLE pkg_deps (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, dep_py_pkg_id INTEGER REFERENCES package_meta (id), dep_by_opt INTEGER);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (1, 3, 11, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (2, 3, 1, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (3, 10, 7, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (4, 10, 8, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (5, 10, 9, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (7, 8, 7, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (8, 9, 7, NULL);
INSERT INTO pkg_deps (id, pkg_id, dep_py_pkg_id, dep_by_opt) VALUES (9, 9, 8, NULL);

-- Таблица: config_aliases
CREATE TABLE config_aliases (id INTEGER PRIMARY KEY AUTOINCREMENT, alias TEXT, on_value TEXT, off_value TEXT);

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
INSERT INTO package_meta (id, cat_id, name) VALUES (13, 4, 'bzip2');
INSERT INTO package_meta (id, cat_id, name) VALUES (14, 48, 'pkg-config');
INSERT INTO package_meta (id, cat_id, name) VALUES (15, 142, 'ncurses');
INSERT INTO package_meta (id, cat_id, name) VALUES (16, 131, 'attr');

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
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (20, 6, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (22, 7, 'make DESTDIR=${BIN_DIR} tooldir=/usr install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (23, 8, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (24, 9, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (25, 10, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (26, 11, 'mkdir -p ${BIN_DIR}/{lib,usr}', '${BIN_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (27, 11, 'ln -sf lib lib64', '${BIN_DIR}/usr', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (28, 11, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (29, 12, 'make PREFIX=${BIN_DIR}/usr install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (36, 13, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (37, 14, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (38, 15, 'mkdir -p ${BIN_DIR}/{lib,usr/lib/pkgconfig}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (39, 15, 'make DESTDIR=${BIN_DIR} install install-dev install-lib', '${SRC_DIR}/${PS}-${PV}', NULL);

-- Таблица: pkg_opts
CREATE TABLE pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id), "default" BOOLEAN DEFAULT (0));
INSERT INTO pkg_opts (id, pkg_id, opt_id, "default") VALUES (1, 5, 1, 0);

-- Таблица: config_cmds
CREATE TABLE config_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id));
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (1, 3, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --enable-kernel=2.6.32 --enable-obsolete-rpc', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (2, 5, '${SRC_DIR}/${PS}-${PV}/configure --shared --prefix=/usr', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (4, 6, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (6, 7, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --enable-shared --disable-werror', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (7, 8, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --enable-cxx --disable-static --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (8, 9, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --enable-thread-safe --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (9, 10, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (10, 11, '${SRC_DIR}/${PS}-${PV}/configure --host=$(gcc -dumpmachine) --build=$(gcc -dumpmachine) --target=$(gcc -dumpmachine) --prefix=/usr --enable-languages=c,c++ --disable-multilib --disable-bootstrap --with-system-zlib', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (11, 12, 'make -f Makefile-libbz2_so', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (12, 12, 'make clean', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (13, 13, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --with-internal-glib --disable-host-tool --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (14, 14, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --mandir=/usr/share/man --with-shared --without-normal --enable-pc-files --enable-widec', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 15, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static', '${SRC_DIR}/${PS}-${PV}', NULL);

-- Таблица: installed_pkg_opts
CREATE TABLE installed_pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id) ON DELETE CASCADE, selected BOOLEAN);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
