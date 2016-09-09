--
-- Файл сгенерирован с помощью SQLiteStudio v3.0.7 в Пт сен 9 16:04:31 2016
--
-- Использованная кодировка текста: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

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
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 16, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (16, 17, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (17, 18, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (18, 19, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (19, 20, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (20, 21, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (21, 22, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (22, 23, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (23, 24, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (24, 25, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (25, 26, 'make SHLIB_LIBS=-lncurses ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (26, 27, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (27, 28, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (28, 29, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (29, 30, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (30, 31, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (31, 32, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (32, 33, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (33, 34, 'BUILD_ZLIB=False BUILD_BZIP2=0 make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (34, 35, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (35, 36, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (36, 37, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (37, 38, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (38, 39, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (39, 40, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (40, 41, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (41, 42, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (42, 43, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (43, 44, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (44, 45, 'FORCE_UNSAFE_CONFIGURE=1 make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (45, 46, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (46, 47, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (47, 48, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (48, 49, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (49, 50, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (50, 51, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (51, 52, 'make ${MAKEOPTS}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (52, 53, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (53, 54, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (54, 55, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (55, 56, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (56, 57, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (57, 58, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (58, 59, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (59, 60, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);
INSERT INTO make_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (60, 61, 'make ${MAKEOPTS}', '${BUILD_DIR}', NULL);

-- Таблица: installed_pkg_opts
CREATE TABLE installed_pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id) ON DELETE CASCADE, selected BOOLEAN);

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
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (46, 16, 'chmod 755 ${BIN_DIR}/usr/lib/libacl.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (47, 16, 'mv ${BIN_DIR}/usr/lib/libacl.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (48, 16, 'ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib/libacl.so) ${BIN_DIR}/usr/lib/libacl.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (49, 17, 'chmod -v 755 ${BIN_DIR}/usr/lib/libcap.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (50, 17, 'mv -v ${BIN_DIR}/usr/lib/libcap.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (51, 17, 'ln -sfv ../../lib/$(readlink ${BIN_DIR}/usr/lib/libcap.so) ${BIN_DIR}/usr/lib/libcap.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (52, 19, 'mv -v ${BIN_DIR}/usr/bin/passwd ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (53, 20, 'mkdir -p ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (54, 20, 'mv ${BIN_DIR}/usr/bin/fuser ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (55, 20, 'mv ${BIN_DIR}/usr/bin/killall ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (56, 24, 'ln -s flex ${BIN_DIR}/usr/bin/lex', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (57, 26, 'mv ${BIN_DIR}/usr/lib/lib{readline,history}.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (58, 26, 'ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib/libreadline.so) ${BIN_DIR}/usr/lib/libreadline.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (59, 26, 'ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib/libhistory.so ) ${BIN_DIR}/usr/lib/libhistory.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (60, 27, 'mv -f ${BIN_DIR}/usr/bin/bash ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (61, 27, 'ln -s bash ${BIN_DIR}/bin/sh', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (62, 33, 'mkdir -p ${BIN_DIR}/{bin,sbin}', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (63, 33, 'mv ${BIN_DIR}/usr/bin/{hostname,ping,ping6,traceroute} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (64, 33, 'mv ${BIN_DIR}/usr/bin/ifconfig ${BIN_DIR}/sbin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (65, 39, 'mkdir -p ${BIN_DIR}/{bin,lib}', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (66, 39, 'mv ${BIN_DIR}/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (67, 39, 'mv ${BIN_DIR}/usr/lib/liblzma.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (68, 39, 'ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib/liblzma.so) ${BIN_DIR}/usr/lib/liblzma.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (69, 40, 'mkdir -p ${BIN_DIR}/sbin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (70, 40, 'for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sf ../bin/kmod ${BIN_DIR}/sbin/$target
done', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (71, 40, 'ln -sf kmod ${BIN_DIR}/bin/lsmod', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (72, 41, 'chmod 0755 ${BIN_DIR}/usr/lib/preloadable_libintl.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (73, 42, 'mkdir -p ${BIN_DIR}/sbin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (74, 42, 'rm -rf ${BIN_DIR}/usr/lib/rpm', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (75, 42, 'ln -sf /usr/lib/systemd/resolv.conf ${BIN_DIR}/etc/resolv.conf', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (76, 42, 'for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -sf /usr/bin/systemctl ${BIN_DIR}/sbin/${tool}
done', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (77, 42, 'ln -sf /usr/lib/systemd/systemd ${BIN_DIR}/sbin/init', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (78, 42, 'mkdir -p ${BIN_DIR}/etc/pam.d/', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (79, 42, 'cat >> ${BIN_DIR}/etc/pam.d/system-session << "EOF" &&
# Begin Systemd addition

session   required    pam_loginuid.so
session   optional    pam_systemd.so

# End Systemd addition
EOF
', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (80, 42, 'cat > ${BIN_DIR}/etc/pam.d/systemd-user << "EOF"
# Begin /etc/pam.d/systemd-user

account  required pam_access.so
account  include  system-account

session  required pam_env.so
session  required pam_limits.so
session  include  system-session

auth     required pam_deny.so
password required pam_deny.so

# End /etc/pam.d/systemd-user
EOF
', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (85, 43, 'mkdir ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (86, 43, 'mv ${BIN_DIR}/usr/lib/libprocps.so.* ${BIN_DIR}/lib', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (87, 43, 'ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib/libprocps.so) ${BIN_DIR}/usr/lib/libprocps.so', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (88, 44, 'chmod -v u+w ${BIN_DIR}/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (89, 45, 'mkdir -p ${BIN_DIR}/{bin,usr/bin,usr/sbin,usr/share/man/man8}', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (90, 45, 'mv ${BIN_DIR}/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (91, 45, 'mv ${BIN_DIR}/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (92, 45, 'mv ${BIN_DIR}/usr/bin/{rmdir,stty,sync,true,uname} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (93, 45, 'mv ${BIN_DIR}/usr/bin/chroot ${BIN_DIR}/usr/sbin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (94, 45, 'mv ${BIN_DIR}/usr/share/man/man1/chroot.1 ${BIN_DIR}/usr/share/man/man8/chroot.8', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (95, 45, 'sed -i s/\"1\"/\"8\"/1 ${BIN_DIR}/usr/share/man/man8/chroot.8', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (96, 45, 'mv  ${BIN_DIR}/usr/bin/{head,sleep,nice,test,[} ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (97, 48, 'mkdir -p ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (98, 48, 'mv -v ${BIN_DIR}/usr/bin/find ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (99, 48, 'sed -i ''s|find:=${BINDIR}|find:=/bin|'' ${BIN_DIR}/usr/bin/updatedb', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (100, 51, 'mkdir -p ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (101, 51, 'mv ${BIN_DIR}/usr/bin/gzip ${BIN_DIR}/bin', '${BIN_DIR}', NULL);
INSERT INTO postinstall_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (102, 59, 'sed -i "s:man root:root root:g" ${BIN_DIR}/usr/lib/tmpfiles.d/man-db.conf', '${BIN_DIR}', NULL);

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
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (16, 17, '2.2.52', 'acl');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (17, 18, '2.25', 'libcap');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (18, 19, '4.2.2', 'sed');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (19, 20, '4.2.1', 'shadow');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (20, 24, '22.21', 'psmisc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (21, 25, '2.30', 'iana-etc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (22, 26, '1.4.17', 'm4');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (23, 27, '3.0.4', 'bison');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (24, 28, '2.6.1', 'flex');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (25, 21, '2.25', 'grep');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (26, 29, '6.3', 'readline');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (27, 30, '4.3.30', 'bash');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (28, 31, '1.06.95', 'bc');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (29, 32, '2.4.6', 'libtool');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (30, 33, '1.12', 'gdbm');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (31, 34, '3.0.4', 'gperf');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (32, 35, '2.2.0', 'expat');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (33, 36, '1.9.4', 'inetutils');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (34, 37, '5.24.0', 'perl');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (35, 38, '2.44', 'XML-Parser');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (36, 39, '0.51.0', 'intltool');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (37, 40, '2.69', 'autoconf');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (38, 41, '1.15', 'automake');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (39, 42, '5.2.2', 'xz');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (40, 22, '23', 'kmod');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (41, 43, '0.19.8.1', 'gettext');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (42, 23, '231', 'systemd');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (43, 44, '3.3.12', 'procps-ng');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (44, 45, '1.43.1', 'e2fsprogs');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (45, 46, '8.25', 'coreutils');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (46, 47, '3.5', 'diffutils');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (47, 48, '4.1.3', 'gawk');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (48, 49, '4.6.0', 'findutils');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (49, 50, '1.22.3', 'groff');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (50, 51, '481', 'less');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (51, 54, '1.8', 'gzip');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (52, 52, '4.7.0', 'iproute2');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (53, 53, '2.0.3', 'kbd');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (54, 55, '1.4.1', 'libpipeline');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (55, 56, '4.2.1', 'make');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (56, 57, '2.7.5', 'patch');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (57, 58, '1.10.10', 'dbus');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (58, 59, '2.28.1', 'util-linux');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (59, 60, '2.7.5', 'man-db');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (60, 61, '1.29', 'tar');
INSERT INTO package (id, pkg_meta_id, version, source_name) VALUES (61, 62, '6.1', 'texinfo');

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
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (40, 16, 'mkdir -p ${BIN_DIR}/{lib,usr/lib/pkgconfig}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (41, 16, 'make DESTDIR=${BIN_DIR} install install-dev install-lib', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (42, 17, 'mkdir -p ${BIN_DIR}/{lib,usr/lib}', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (43, 17, 'ln -sf lib ${BIN_DIR}/usr/lib64', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (44, 17, 'make RAISE_SETFCAP=no prefix=/usr DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (45, 18, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (46, 19, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (47, 20, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (48, 21, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (49, 22, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (50, 23, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (51, 24, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (52, 25, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (53, 26, 'mkdir -p ${BIN_DIR}/lib', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (54, 26, 'make SHLIB_LIBS=-lncurses DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (55, 27, 'mkdir -p ${BIN_DIR}\bin', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (56, 27, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (57, 28, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (58, 29, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (59, 30, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (60, 31, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (61, 32, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (62, 33, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (63, 34, 'BUILD_ZLIB=False BUILD_BZIP2=0 make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (64, 35, 'make DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (65, 36, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (66, 37, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (67, 38, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (68, 39, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (69, 40, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (70, 41, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (71, 42, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (72, 43, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (73, 44, 'make DESTDIR=${BIN_DIR} install install-libs', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (74, 45, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (75, 46, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (76, 47, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (77, 48, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (78, 49, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (79, 50, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (80, 51, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (81, 52, 'make DOCDIR=/usr/share/doc/${PN}-${PV} DESTDIR=${BIN_DIR} install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (82, 53, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (83, 54, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (84, 55, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (85, 56, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (86, 57, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (87, 58, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (88, 59, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (89, 60, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);
INSERT INTO install_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (90, 61, 'make DESTDIR=${BIN_DIR} install', '${BUILD_DIR}', NULL);

-- Таблица: installed_pkgs
CREATE TABLE installed_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id));

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
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (22, 16, 'http://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz', 'a61415312426e9c2212bd7dc7929abda', 386604);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (23, 17, 'https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.25.tar.xz', '6666b839e5d46c2ad33fc8aa2ceb5f77', 63672);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (24, 18, 'http://ftp.gnu.org/gnu/sed/sed-4.2.2.tar.bz2', '7ffe1c7cdc3233e1e0c4b502df253974', 1059414);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (25, 19, 'http://pkg-shadow.alioth.debian.org/releases/shadow-4.2.1.tar.xz', '2bfafe7d4962682d31b5eba65dba4fc8', 1594536);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (26, 20, 'http://downloads.sourceforge.net/project/psmisc/psmisc/psmisc-22.21.tar.gz', '935c0fd6eb208288262b385fa656f1bf', 457702);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (27, 21, 'http://anduin.linuxfromscratch.org/LFS/iana-etc-2.30.tar.bz2', '3ba3afb1d1b261383d247f46cb135ee8', 205618);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (28, 22, 'http://ftp.gnu.org/gnu/m4/m4-1.4.17.tar.xz', '12a3c829301a4fd6586a57d3fcf196dc', 1149088);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (29, 23, 'http://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz', 'c342201de104cc9ce0a21e0ad10d4021', 1973796);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (30, 24, 'https://github.com/westes/flex/releases/download/v2.6.1/flex-2.6.1.tar.xz', 'cd3c86290fc2676a641aefafeb10848a', 835048);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (31, 25, 'http://ftp.gnu.org/gnu/grep/grep-2.25.tar.xz', '04e96b0e6f0fe6a180ae62c88fcd0af6', 1327856);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (32, 26, 'http://ftp.gnu.org/gnu/readline/readline-6.3.tar.gz', '33c8fb279e981274f485fd91da77e94a', 2468560);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (33, 26, 'http://www.linuxfromscratch.org/patches/lfs/development/readline-6.3-upstream_fixes-3.patch', '6b0d9f4e79319d56a7fee9b35e5cfd1b', 5282);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (34, 27, 'http://ftp.gnu.org/gnu/bash/bash-4.3.30.tar.gz', 'a27b3ee9be83bd3ba448c0ff52b28447', 7977214);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (35, 27, 'http://www.linuxfromscratch.org/patches/lfs/development/bash-4.3.30-upstream_fixes-3.patch', 'e183ab08f0a51a7c5a2e974eb1ecbc46', 15036);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (36, 28, 'http://alpha.gnu.org/gnu/bc/bc-1.06.95.tar.bz2', '5126a721b73f97d715bb72c13c889035', 290069);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (37, 28, 'http://www.linuxfromscratch.org/patches/lfs/development/bc-1.06.95-memory_leak-1.patch', '877e81fba316fe487ec23501059d54b8', 1414);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (38, 29, 'http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz', '1bfb9b923f2c1339b4d2ce1807064aa5', 973080);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (39, 30, 'http://ftp.gnu.org/gnu/gdbm/gdbm-1.12.tar.gz', '9ce96ff4c99e74295ea19040931c8fb9', 841213);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (40, 31, 'http://ftp.gnu.org/gnu/gperf/gperf-3.0.4.tar.gz', 'c1f1db32fb6598d6a93e6e88796a8632', 983500);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (41, 32, 'http://prdownloads.sourceforge.net/expat/expat-2.2.0.tar.bz2', '2f47841c829facb346eb6e3fab5212e2', 414352);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (42, 33, 'http://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz', '87fef1fa3f603aef11c41dcc097af75e', 1364408);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (43, 34, 'http://www.cpan.org/src/5.0/perl-5.24.0.tar.bz2', '99f39abe614b50719d9915431e54fc1e', 14155784);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (44, 35, 'http://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.44.tar.gz', 'af4813fe3952362451201ced6fbce379', 237377);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (45, 36, 'http://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz', '12e517cac2b57a0121cda351570f1e63', 162286);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (46, 37, 'http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz', '50f97f4159805e374639a73e2636f22e', 1214744);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (47, 38, 'http://ftp.gnu.org/gnu/automake/automake-1.15.tar.xz', '9a1ddb0e053474d9d1105cfe39b0c48d', 1496708);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (48, 39, 'http://tukaani.org/xz/xz-5.2.2.tar.xz', 'e26772b69940085c0632589ab1d52e64', 1016404);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (49, 40, 'https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-23.tar.xz', '3cf469f40ec2ed51f56ba45ea03793e7', 450376);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (50, 41, 'http://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz', 'df3f5690eaa30fd228537b00cb7b7590', 7209808);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (51, 42, 'http://anduin.linuxfromscratch.org/sources/other/systemd/systemd-231.tar.xz', '2647855c8f9cdf824953f1091db2d2b2', 3928272);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (52, 43, 'http://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.12.tar.xz', '957e42e8b193490b2111252e4a2b443c', 845484);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (53, 44, 'http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.1/e2fsprogs-1.43.1.tar.gz', '1775f3f0eed9dee1c5f39e08d1964a97', 7009831);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (54, 45, 'http://ftp.gnu.org/gnu/coreutils/coreutils-8.25.tar.xz', '070e43ba7f618d747414ef56ab248a48', 5725008);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (55, 45, 'http://www.linuxfromscratch.org/patches/lfs/development/coreutils-8.25-i18n-2.patch', 'c6334ed5b03062ef7e9649e8ceb2cfc1', 148812);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (56, 45, 'https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/coreutils/8.5/003_all_coreutils-gentoo-uname.patch', 'c4fcca138b6abf6d443d48a6f0cd8833', 4577);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (57, 46, 'http://ftp.gnu.org/gnu/diffutils/diffutils-3.5.tar.xz', '569354697ff1cfc9a9de3781361015fa', 1360996);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (58, 47, 'http://ftp.gnu.org/gnu/gawk/gawk-4.1.3.tar.xz', '97f8f44149ea9b9e94be97f68988be87', 2311268);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (59, 48, 'http://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz', '9936aa8009438ce185bea2694a997fc1', 3780154);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (60, 49, 'http://ftp.gnu.org/gnu/groff/groff-1.22.3.tar.gz', 'cc825fa64bc7306a885f2fb2268d3ec5', 4188772);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (61, 50, 'http://www.greenwoodsoftware.com/less/less-481.tar.gz', '50ef46065c65257141a7340123527767', 316622);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (62, 51, 'http://ftp.gnu.org/gnu/gzip/gzip-1.8.tar.xz', 'f7caabb65cddc1a4165b398009bd05b9', 728116);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (63, 52, 'https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.7.0.tar.xz', 'd4b205830cdc2702f8a0cbd6232129cd', 589928);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (64, 53, 'https://www.kernel.org/pub/linux/utils/kbd/kbd-2.0.3.tar.xz', '231b46e7142eb41ea3ae06d2ded3c208', 1037036);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (65, 53, 'http://www.linuxfromscratch.org/patches/lfs/development/kbd-2.0.3-backspace-1.patch', 'f75cca16a38da6caa7d52151f7136895', 12640);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (66, 54, 'http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.4.1.tar.gz', 'e54590ec68d6c1239f67b5b44e92022c', 805172);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (67, 55, 'http://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2', '15b012617e7c44c0ed482721629577ac', 1407126);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (68, 56, 'http://ftp.gnu.org/gnu/patch/patch-2.7.5.tar.xz', 'e3da7940431633fb65a01b91d3b7a27a', 727704);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (69, 57, 'http://dbus.freedesktop.org/releases/dbus/dbus-1.10.10.tar.gz', '495676d240eb982921b3ad1343526849', 1984077);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (70, 58, 'https://www.kernel.org/pub/linux/utils/util-linux/v2.28/util-linux-2.28.1.tar.xz', 'e2d863efaf4fd330a42c5efe9f1b02b4', 4157892);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (71, 59, 'http://download.savannah.gnu.org/releases/man-db/man-db-2.7.5.tar.xz', '37da0bb0400cc7b640f33c26f6052202', 1505428);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (72, 60, 'http://ftp.gnu.org/gnu/tar/tar-1.29.tar.xz', 'a1802fec550baaeecff6c381629653ef', 1996000);
INSERT INTO package_sources (id, pkg_id, src_url, md5, size) VALUES (73, 61, 'http://ftp.gnu.org/gnu/texinfo/texinfo-6.1.tar.xz', '1d7ec1888fae00730693597852b00cde', 4520376);

-- Таблица: config_opts
CREATE TABLE config_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descr TEXT, opt TEXT, alias_id INTEGER REFERENCES config_aliases (id));
INSERT INTO config_opts (id, name, descr, opt, alias_id) VALUES (1, 'minizip', NULL, 'minizip', NULL);

-- Таблица: config_aliases
CREATE TABLE config_aliases (id INTEGER PRIMARY KEY AUTOINCREMENT, alias TEXT, on_value TEXT, off_value TEXT);

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
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (11, 16, 'sed -i -e ''s|/@pkg_name@|&-@pkg_version@|'' include/builddefs.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (12, 16, 'sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (13, 16, 'sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" libacl/__acl_to_any_text.c', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (14, 17, 'sed -i ''/install.*STALIBNAME/d'' libcap/Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (15, 19, 'sed -i ''s/groups$(EXEEXT) //'' src/Makefile.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (16, 19, 'find man -name Makefile.in -exec sed -i ''s/groups\.1 / /''   {} \;', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (17, 19, 'find man -name Makefile.in -exec sed -i ''s/getspnam\.3 / /'' {} \;', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (18, 19, 'find man -name Makefile.in -exec sed -i ''s/passwd\.5 / /''   {} \;', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (19, 19, 'sed -i -e ''s@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@'' -e ''s@/var/spool/mail@/var/mail@'' etc/login.defs', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (20, 19, 'sed -i ''s@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@'' etc/login.defs', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (21, 19, 'sed -i ''s/1000/999/'' etc/useradd', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (22, 26, 'patch -Np1 -i ${PKG_SOURCES}/readline-6.3-upstream_fixes-3.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (23, 26, 'sed -i ''/MV.*old/d'' Makefile.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (24, 26, 'sed -i ''/{OLDSUFF}/c:'' support/shlib-install', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (25, 27, 'patch -Np1 -i ${PKG_SOURCES}/bash-4.3.30-upstream_fixes-3.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (26, 28, 'patch -Np1 -i ${PKG_SOURCES}/bc-1.06.95-memory_leak-1.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (27, 36, 'sed -i ''s:\\\${:\\\$\\{:'' intltool-update.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (28, 38, 'sed -i ''s:/\\\${:/\\\$\\{:'' bin/automake.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (29, 39, 'sed -e ''/mf\.buffer = NULL/a next->coder->mf.size = 0;'' -i src/liblzma/lz/lz_encoder.c', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (30, 42, 'sed -i "s:blkid/::" $(grep -rl "blkid/blkid.h")', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (31, 42, 'sed -e ''s:test/udev-test.pl ::g'' -e ''s:test-copy$(EXEEXT) ::g'' -i Makefile.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (33, 44, 'sed -i -e ''s:\[\.-\]::'' tests/filter.sed', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (34, 45, 'patch -Np1 -i ${PKG_SOURCES}/coreutils-8.25-i18n-2.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (35, 45, 'patch -Np1 -i ${PKG_SOURCES}/003_all_coreutils-gentoo-uname.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (36, 46, 'sed -i ''s:= @mkdir_p@:= /bin/mkdir -p:'' po/Makefile.in.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (37, 52, 'sed -i /ARPD/d Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (38, 52, 'sed -i ''s/arpd.8//'' man/man8/Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (39, 52, 'rm -v doc/arpd.sgml', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (40, 52, 'sed -i ''s/m_ipt.o//'' tc/Makefile', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (41, 53, 'patch -Np1 -i ${PKG_SOURCES}/kbd-2.0.3-backspace-1.patch', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (42, 53, 'sed -i ''s/\(RESIZECONS_PROGS=\)yes/\1no/g'' configure', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (43, 53, 'sed -i ''s/resizecons.8 //'' docs/man/man8/Makefile.in', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO prepare_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (44, 58, 'mkdir -p /var/lib/hwclock', '${SRC_DIR}/${PS}-${PV}', NULL);

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
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (16, 16, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --libexecdir=/usr/lib', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (17, 18, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin --htmldir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (18, 19, '${SRC_DIR}/${PS}-${PV}/configure --sysconfdir=/etc --with-group-name-max-length=32', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (19, 20, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (20, 22, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (21, 23, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (22, 24, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (23, 25, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (24, 26, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (25, 27, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV} --without-bash-malloc --with-installed-readline', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (26, 28, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --with-readline --mandir=/usr/share/man --infodir=/usr/share/info', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (27, 29, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (28, 30, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --enable-libgdbm-compat', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (29, 31, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (30, 32, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (31, 33, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --localstatedir=/var --disable-logger --disable-whois --disable-rcp --disable-rexec --disable-rlogin --disable-rsh --disable-servers', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (32, 34, 'BUILD_ZLIB=False BUILD_BZIP2=0 sh Configure -des -Dprefix=/usr -Dvendorprefix=/usr -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3 Dpager="/usr/bin/less -isR" -Duseshrplib', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (33, 35, 'perl Makefile.PL', '${SRC_DIR}/${PS}-${PV}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (34, 36, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (35, 37, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (36, 38, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (37, 39, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (38, 40, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin --sysconfdir=/etc --with-rootlibdir=/lib --with-xz --with-zlib', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (39, 41, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static --docdir=/usr/share/doc/{$PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (40, 42, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --config-cache --with-rootprefix=/usr --with-rootlibdir=/usr/lib --with-sysvinit-path= --with-sysvrcnd-path= --enable-efi --enable-ema --enable-split-usr --disable-sysusers --without-python --disable-tests --disable-manpages  --with-dbuspolicydir=/etc/dbus-1/system.d --with-dbussessionservicedir=/usr/share/dbus-1/services --with-dbussystemservicedir=/usr/share/dbus-1/system-service --with-pamlibdir=/lib/security  --docdir=/usr/share/doc/${PN}-${PV}', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (41, 43, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --exec-prefix= --libdir=/usr/lib --docdir=/usr/share/doc/procps-ng-3.3.12 --disable-static --disable-kill --with-systemd', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (42, 44, 'LIBS=-L/tools/lib CFLAGS=-I/tools/include PKG_CONFIG_PATH=/tools/lib/pkgconfig ${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin --with-root-prefix="" --enable-elf-shlibs --disable-libblkid --disable-libuuid --disable-uuidd --disable-fsck', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (43, 45, 'FORCE_UNSAFE_CONFIGURE=1 ${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --enable-no-install-program=kill,uptime', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (44, 46, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (45, 47, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (46, 48, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --localstatedir=/var/lib/locate', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (47, 49, 'PAGE=A4 ${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (48, 50, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --sysconfdir=/etc', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (49, 51, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (50, 53, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-vlock', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (51, 54, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (52, 55, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (53, 56, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (54, 57, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --disable-static --disable-doxygen-docs --disable-xml-docs --docdir=/usr/share/doc/${PN}-${PV} --with-console-auth-dir=/run/console', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (55, 58, '${SRC_DIR}/${PS}-${PV}/configure ADJTIME_PATH=/var/lib/hwclock/adjtime --docdir=/usr/share/doc/${PN}-${PV} --disable-chfn-chsh --disable-login --disable-nologin --disable-su --disable-setpriv --disable-runuser --disable-pylibmount --disable-static --without-python --enable-libmount-force-mountinfo', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (56, 59, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --docdir=/usr/share/doc/${PN}-${PV} --sysconfdir=/etc --disable-setuid --with-browser=/usr/bin/lynx --with-vgrind=/usr/bin/vgrind --with-grap=/usr/bin/grap', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (57, 60, 'FORCE_UNSAFE_CONFIGURE=1 ${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --bindir=/bin', '${BUILD_DIR}', NULL);
INSERT INTO config_cmds (id, pkg_id, cmd, dir, dep_by_opt_id) VALUES (58, 61, '${SRC_DIR}/${PS}-${PV}/configure --prefix=/usr --disable-static', '${BUILD_DIR}', NULL);

-- Таблица: postinst_msg
CREATE TABLE postinst_msg (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id), msg STRING);
INSERT INTO postinst_msg (id, pkg_id, msg) VALUES (1, 11, 'Please, update you "/etc/localtime"!');

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
INSERT INTO package_meta (id, cat_id, name) VALUES (17, 131, 'acl');
INSERT INTO package_meta (id, cat_id, name) VALUES (18, 142, 'libcap');
INSERT INTO package_meta (id, cat_id, name) VALUES (19, 131, 'sed');
INSERT INTO package_meta (id, cat_id, name) VALUES (20, 131, 'shadow');
INSERT INTO package_meta (id, cat_id, name) VALUES (21, 131, 'grep');
INSERT INTO package_meta (id, cat_id, name) VALUES (22, 131, 'kmod');
INSERT INTO package_meta (id, cat_id, name) VALUES (23, 131, 'systemd');
INSERT INTO package_meta (id, cat_id, name) VALUES (24, 144, 'psmisc');
INSERT INTO package_meta (id, cat_id, name) VALUES (25, 142, 'iana-etc');
INSERT INTO package_meta (id, cat_id, name) VALUES (26, 136, 'm4');
INSERT INTO package_meta (id, cat_id, name) VALUES (27, 136, 'bison');
INSERT INTO package_meta (id, cat_id, name) VALUES (28, 136, 'flex');
INSERT INTO package_meta (id, cat_id, name) VALUES (29, 142, 'readline');
INSERT INTO package_meta (id, cat_id, name) VALUES (30, 25, 'bash');
INSERT INTO package_meta (id, cat_id, name) VALUES (31, 136, 'bc');
INSERT INTO package_meta (id, cat_id, name) VALUES (32, 136, 'libtool');
INSERT INTO package_meta (id, cat_id, name) VALUES (33, 142, 'gdbm');
INSERT INTO package_meta (id, cat_id, name) VALUES (34, 53, 'gperf');
INSERT INTO package_meta (id, cat_id, name) VALUES (35, 39, 'expat');
INSERT INTO package_meta (id, cat_id, name) VALUES (36, 108, 'inetutils');
INSERT INTO package_meta (id, cat_id, name) VALUES (37, 38, 'perl');
INSERT INTO package_meta (id, cat_id, name) VALUES (38, 43, 'XML-Parser');
INSERT INTO package_meta (id, cat_id, name) VALUES (39, 53, 'intltool');
INSERT INTO package_meta (id, cat_id, name) VALUES (40, 136, 'autoconf');
INSERT INTO package_meta (id, cat_id, name) VALUES (41, 136, 'automake');
INSERT INTO package_meta (id, cat_id, name) VALUES (42, 4, 'xz');
INSERT INTO package_meta (id, cat_id, name) VALUES (43, 136, 'gettext');
INSERT INTO package_meta (id, cat_id, name) VALUES (44, 144, 'procps');
INSERT INTO package_meta (id, cat_id, name) VALUES (45, 139, 'e2fsprogs');
INSERT INTO package_meta (id, cat_id, name) VALUES (46, 131, 'coreutils');
INSERT INTO package_meta (id, cat_id, name) VALUES (47, 131, 'diffutils');
INSERT INTO package_meta (id, cat_id, name) VALUES (48, 131, 'gawk');
INSERT INTO package_meta (id, cat_id, name) VALUES (49, 131, 'findutils');
INSERT INTO package_meta (id, cat_id, name) VALUES (50, 131, 'groff');
INSERT INTO package_meta (id, cat_id, name) VALUES (51, 131, 'less');
INSERT INTO package_meta (id, cat_id, name) VALUES (52, 131, 'iproute2');
INSERT INTO package_meta (id, cat_id, name) VALUES (53, 131, 'kbd');
INSERT INTO package_meta (id, cat_id, name) VALUES (54, 4, 'gzip');
INSERT INTO package_meta (id, cat_id, name) VALUES (55, 39, 'libpipeline');
INSERT INTO package_meta (id, cat_id, name) VALUES (56, 136, 'make');
INSERT INTO package_meta (id, cat_id, name) VALUES (57, 136, 'patch');
INSERT INTO package_meta (id, cat_id, name) VALUES (58, 131, 'dbus');
INSERT INTO package_meta (id, cat_id, name) VALUES (59, 131, 'util-linux');
INSERT INTO package_meta (id, cat_id, name) VALUES (60, 131, 'man-db');
INSERT INTO package_meta (id, cat_id, name) VALUES (61, 4, 'tar');
INSERT INTO package_meta (id, cat_id, name) VALUES (62, 131, 'texinfo');

-- Таблица: installed_pkg_files
CREATE TABLE installed_pkg_files (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE, name TEXT);

-- Таблица: pkg_opts
CREATE TABLE pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), opt_id INTEGER REFERENCES config_opts (id), "default" BOOLEAN DEFAULT (0));
INSERT INTO pkg_opts (id, pkg_id, opt_id, "default") VALUES (1, 5, 1, 0);

COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
