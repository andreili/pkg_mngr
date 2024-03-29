PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE package (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_meta_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, version TEXT, source_name STRING);
INSERT INTO "package" VALUES(1,1,'4.10.1','linux');
INSERT INTO "package" VALUES(2,2,'4.09','man-pages');
INSERT INTO "package" VALUES(3,3,'2.25','glibc');
INSERT INTO "package" VALUES(4,11,'2017a','tzdata');
INSERT INTO "package" VALUES(5,4,'1.2.11','zlib');
INSERT INTO "package" VALUES(6,5,'5.30','file');
INSERT INTO "package" VALUES(7,6,'2.28','binutils');
INSERT INTO "package" VALUES(8,7,'6.1.2','gmp');
INSERT INTO "package" VALUES(9,8,'3.1.5','mpfr');
INSERT INTO "package" VALUES(10,9,'1.0.3','mpc');
INSERT INTO "package" VALUES(11,10,'6.3.0','gcc');
INSERT INTO "package" VALUES(12,13,'1.0.6','bzip2');
INSERT INTO "package" VALUES(13,14,'0.29.1','pkg-config');
INSERT INTO "package" VALUES(14,15,'6.0','ncurses');
INSERT INTO "package" VALUES(15,16,'2.4.47','attr');
INSERT INTO "package" VALUES(16,17,'2.2.52','acl');
INSERT INTO "package" VALUES(17,18,'2.25','libcap');
INSERT INTO "package" VALUES(18,19,'4.4','sed');
INSERT INTO "package" VALUES(19,20,'4.4','shadow');
INSERT INTO "package" VALUES(20,24,'22.21','psmisc');
INSERT INTO "package" VALUES(21,25,'2.30','iana-etc');
INSERT INTO "package" VALUES(22,26,'1.4.18','m4');
INSERT INTO "package" VALUES(23,27,'3.0.4','bison');
INSERT INTO "package" VALUES(24,28,'2.6.3','flex');
INSERT INTO "package" VALUES(25,21,'3.0','grep');
INSERT INTO "package" VALUES(26,29,'7.0','readline');
INSERT INTO "package" VALUES(27,30,'4.4','bash');
INSERT INTO "package" VALUES(28,31,'1.06.95','bc');
INSERT INTO "package" VALUES(29,32,'2.4.6','libtool');
INSERT INTO "package" VALUES(30,33,'1.12','gdbm');
INSERT INTO "package" VALUES(31,34,'3.0.4','gperf');
INSERT INTO "package" VALUES(32,35,'2.2.0','expat');
INSERT INTO "package" VALUES(33,36,'1.9.4','inetutils');
INSERT INTO "package" VALUES(34,37,'5.24.1','perl');
INSERT INTO "package" VALUES(35,38,'2.44','XML-Parser');
INSERT INTO "package" VALUES(36,39,'0.51.0','intltool');
INSERT INTO "package" VALUES(37,40,'2.69','autoconf');
INSERT INTO "package" VALUES(38,41,'1.15','automake');
INSERT INTO "package" VALUES(39,42,'5.2.3','xz');
INSERT INTO "package" VALUES(40,22,'24','kmod');
INSERT INTO "package" VALUES(41,43,'0.19.8.1','gettext');
INSERT INTO "package" VALUES(42,23,'233','systemd');
INSERT INTO "package" VALUES(43,44,'3.3.12','procps-ng');
INSERT INTO "package" VALUES(44,45,'1.43.1','e2fsprogs');
INSERT INTO "package" VALUES(45,46,'8.27','coreutils');
INSERT INTO "package" VALUES(46,47,'3.5','diffutils');
INSERT INTO "package" VALUES(47,48,'4.1.4','gawk');
INSERT INTO "package" VALUES(48,49,'4.6.0','findutils');
INSERT INTO "package" VALUES(49,50,'1.22.3','groff');
INSERT INTO "package" VALUES(50,51,'481','less');
INSERT INTO "package" VALUES(51,54,'1.8','gzip');
INSERT INTO "package" VALUES(52,52,'4.10.0','iproute2');
INSERT INTO "package" VALUES(53,53,'2.0.4','kbd');
INSERT INTO "package" VALUES(54,55,'1.4.1','libpipeline');
INSERT INTO "package" VALUES(55,56,'4.2.1','make');
INSERT INTO "package" VALUES(56,57,'2.7.5','patch');
INSERT INTO "package" VALUES(57,58,'1.10.16','dbus');
INSERT INTO "package" VALUES(58,59,'2.29.2','util-linux');
INSERT INTO "package" VALUES(59,60,'2.7.6.1','man-db');
INSERT INTO "package" VALUES(60,61,'1.29','tar');
INSERT INTO "package" VALUES(61,62,'6.3','texinfo');
INSERT INTO "package" VALUES(62,64,'1.0.2k','openssl');
INSERT INTO "package" VALUES(63,65,'7.53.1','curl');
INSERT INTO "package" VALUES(64,66,'3.17.0','sqlite');
INSERT INTO "package" VALUES(65,67,'2.21','which');
INSERT INTO "package" VALUES(66,68,'CVS_20101030','net-tools');
INSERT INTO "package" VALUES(67,69,'20151218','iputils');
INSERT INTO "package" VALUES(68,70,'1.19.1','wget');
INSERT INTO "package" VALUES(69,71,'7.4p1','openssh');
INSERT INTO "package" VALUES(70,72,'1','baselayout');
INSERT INTO "package" VALUES(71,73,'1.7.5','lz4');
INSERT INTO "package" VALUES(72,74,'2.9.6','cracklib');
INSERT INTO "package" VALUES(73,75,'60','unzip');
INSERT INTO "package" VALUES(74,76,'2.4.6','libtool');
INSERT INTO "package" VALUES(75,77,'1.3.0','Linux-PAM');
INSERT INTO "package" VALUES(76,78,'6.2.23','db');
INSERT INTO "package" VALUES(77,79,'1.0.1','libtirpc');
INSERT INTO "package" VALUES(78,81,'1.6.1','iptables');
INSERT INTO "package" VALUES(79,82,'8.40','pcre');
INSERT INTO "package" VALUES(80,83,'2.23','perl-cleaner');
INSERT INTO "package" VALUES(81,84,'2.3.2','libseccomp');
INSERT INTO "package" VALUES(82,85,'1.2.2','pax-utils');
INSERT INTO "package" VALUES(83,86,'20170119','ca-certificates');
INSERT INTO "package" VALUES(84,87,'20161103','hwids-hwids');
INSERT INTO "package" VALUES(85,88,'1.24','libintl-perl');
INSERT INTO "package" VALUES(86,90,'1.30','Text-Unidecode');
INSERT INTO "package" VALUES(87,89,'1.33','Unicode-EastAsianWidth');
INSERT INTO "package" VALUES(88,91,'20150213','pambase');
INSERT INTO "package" VALUES(89,92,'2.9.4','libxml2');
INSERT INTO "package" VALUES(90,93,'58.2','icu');
INSERT INTO "package" VALUES(91,94,'2.7.5','nano');
INSERT INTO "package" VALUES(92,95,'1.7.6','libgcrypt');
INSERT INTO "package" VALUES(93,96,'1.27','libgpg-error');
INSERT INTO "package" VALUES(94,97,'1.1.29','libxslt');
INSERT INTO "package" VALUES(95,98,'0.0.28','xmlto');
INSERT INTO "package" VALUES(96,99,'1.79.1','docbook-xsl');
INSERT INTO "package" VALUES(97,100,'4.5','docbook-xml');
INSERT INTO "package" VALUES(98,101,'1.21','build-docbook-catalog');
INSERT INTO "package" VALUES(99,102,'3.8.0-rc2','cmake');
INSERT INTO "package" VALUES(100,103,'3.3.1','libarchive');
INSERT INTO "package" VALUES(101,104,'2.10','lzo');
INSERT INTO "package" VALUES(102,80,'8.6.6','tcl');
INSERT INTO "package" VALUES(103,105,'1.1.0','ConsoleKit2');
INSERT INTO "package" VALUES(104,106,'0.16','libidn2');
INSERT INTO "package" VALUES(105,107,'0.9.7','libunistring');
INSERT INTO "package" VALUES(106,108,'2.50.3','glib');
INSERT INTO "package" VALUES(107,109,'3.2.1','libffi');
INSERT INTO "package" VALUES(108,110,'1.3.4','rhash');
CREATE TABLE config_aliases (id INTEGER PRIMARY KEY AUTOINCREMENT, alias TEXT, on_value TEXT, off_value TEXT);
INSERT INTO "config_aliases" VALUES(1,'ENDIS','--enable-${OPT}','--disable-${OPT}');
INSERT INTO "config_aliases" VALUES(2,'WITHIO','--with-${OPT}','--without-${OPT}');
INSERT INTO "config_aliases" VALUES(3,'DISEN','--disable-${OPT}','--enable-${OPT}');
INSERT INTO "config_aliases" VALUES(4,'EXPYN','${OPT}=yes','${OPT}=no');
INSERT INTO "config_aliases" VALUES(5,'EXPNY','${OPT}=no','${OPT}=yes');
INSERT INTO "config_aliases" VALUES(6,'FLAGOFF','','${OPT}');
INSERT INTO "config_aliases" VALUES(7,'FLAGON','${OPT}','');
INSERT INTO "config_aliases" VALUES(8,'EXP_YN','y','n');
INSERT INTO "config_aliases" VALUES(9,'WITH','--with${OPT}','');
INSERT INTO "config_aliases" VALUES(11,'WITHOI','--without-${OPT}','--with-${OPT}');
CREATE TABLE prepare_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id), opt_val_trig INTEGER);
INSERT INTO "prepare_cmds" VALUES(1,1,'make mrproper','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(2,3,'patch -Np1 -i ${PKG_SOURCES}/glibc-2.25-fhs-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(4,12,'patch -Np1 -i ${PKG_SOURCES}/bzip2-1.0.6-install_docs-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(5,12,'sed -i ''s@\(ln -s -f \)$(PREFIX)/bin/@\1@'' Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(6,12,'sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(8,14,'sed -i ''/LIBTOOL_INSTALL/d'' c++/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(9,15,'sed -i -e ''s|/@pkg_name@|&-@pkg_version@|'' include/builddefs.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(10,15,'sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(11,16,'sed -i -e ''s|/@pkg_name@|&-@pkg_version@|'' include/builddefs.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(12,16,'sed -i "s:| sed.*::g" test/{sbits-restore,cp,misc}.test','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(13,16,'sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" libacl/__acl_to_any_text.c','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(14,17,'sed -i ''/install.*STALIBNAME/d'' libcap/Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(15,19,'sed -i ''s/groups$(EXEEXT) //'' src/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(16,19,'find man -name Makefile.in -exec sed -i ''s/groups\.1 / /''   {} \;','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(17,19,'find man -name Makefile.in -exec sed -i ''s/getspnam\.3 / /'' {} \;','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(18,19,'find man -name Makefile.in -exec sed -i ''s/passwd\.5 / /''   {} \;','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(19,19,'sed -i -e ''s@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@'' -e ''s@/var/spool/mail@/var/mail@'' etc/login.defs','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(20,19,'sed -i ''s@DICTPATH.*@DICTPATH\t/lib/cracklib/pw_dict@'' etc/login.defs','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(21,19,'sed -i ''s/1000/999/'' etc/useradd','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(23,26,'sed -i ''/MV.*old/d'' Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(24,26,'sed -i ''/{OLDSUFF}/c:'' support/shlib-install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(25,27,'patch -Np1 -i ${PKG_SOURCES}/bash-4.4-upstream_fixes-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(26,28,'patch -Np1 -i ${PKG_SOURCES}/bc-1.06.95-memory_leak-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(27,36,'sed -i ''s:\\\${:\\\$\\{:'' intltool-update.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(28,38,'sed -i ''s:/\\\${:/\\\$\\{:'' bin/automake.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(30,42,'sed -i -e ''s/GROUP="dialout"/GROUP="uucp"/'' rules/*.rules','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(31,42,'sed -e ''s:test/udev-test.pl ::g'' -e ''s:test-copy$(EXEEXT) ::g'' -i Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(33,44,'sed -i -e ''s:\[\.-\]::'' tests/filter.sed','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(34,45,'patch -Np1 -i ${PKG_SOURCES}/coreutils-8.26-i18n-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(35,45,'patch -Np1 -i ${PKG_SOURCES}/003_all_coreutils-gentoo-uname.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(36,46,'sed -i ''s:= @mkdir_p@:= /bin/mkdir -p:'' po/Makefile.in.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(37,52,'sed -i /ARPD/d Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(38,52,'sed -i ''s/arpd.8//'' man/man8/Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(39,52,'rm -v doc/arpd.sgml','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(40,52,'sed -i ''s/m_ipt.o//'' tc/Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(41,53,'patch -Np1 -i ${PKG_SOURCES}/kbd-2.0.4-backspace-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(42,53,'sed -i ''s/\(RESIZECONS_PROGS=\)yes/\1no/g'' configure','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(43,53,'sed -i ''s/resizecons.8 //'' docs/man/man8/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(44,58,'mkdir -p ${BIN_DIR}/var/lib/hwclock','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(45,19,'echo ''--- src/useradd.c   (old)
+++ src/useradd.c   (new)
@@ -2027,6 +2027,8 @@
        is_shadow_grp = sgr_file_present ();
 #endif
 
+       get_defaults ();
+
        process_flags (argc, argv);
 
 #ifdef ENABLE_SUBIDS
@@ -2036,8 +2038,6 @@
            (!user_id || (user_id <= uid_max && user_id >= uid_min));
 #endif                         /* ENABLE_SUBIDS */
 
-       get_defaults ();
-
 #ifdef ACCT_TOOLS_SETUID
 #ifdef USE_PAM
        {'' | patch -p0 -l','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(46,19,'sed -i -e ''47 d'' -e ''60,65 d'' libmisc/myname.c','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(47,19,'patch -Np1 -i ${PKG_SOURCES}/shadow-4.4-su-snprintf.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(49,66,'patch -Np1 -i ${PKG_SOURCES}/net-tools-CVS_20101030-remove_dups-1.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(50,66,'sed -i ''/#include <netinet\/ip.h>/d''  iptunnel.c','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(51,66,'sed -i -e "/^bool.* I18N /s:[yn]$:${OPT nls EXP_YN nls}:" config.in','${SRC_DIR}/${PS}-${PV}',5,1);
INSERT INTO "prepare_cmds" VALUES(52,66,'sed -i -e "/^bool.* HAVE_AFINET6 /s:[yn]$:${OPT ipv6 EXP_YN ipv6}:" config.in','${SRC_DIR}/${PS}-${PV}',54,1);
INSERT INTO "prepare_cmds" VALUES(53,66,'sed -i -e "/^bool.* HAVE_HWIB /s:[yn]$:y:" config.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(58,99,'sed -i ''/CMAKE_USE_LIBUV 1/s/1/0/'' CMakeLists.txt','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(59,99,'sed -i ''/"lib64"/s/64//'' Modules/GNUInstallDirs.cmake','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(61,73,'sed -i -r -e ''/^CFLAGS/d'' -e ''/CFLAGS/s:-O[0-9]?:${CFLAGS} ${CPPFLAGS}:'' -e ''/^STRIP/s:=.*:=true:'' -e ''s:LF2 = -s:LF2 = :'' -e ''s:LF = :LF = ${LDFLAGS} :'' -e ''s:SL = :SL = ${LDFLAGS} :'' -e ''s:FL = :FL = ${LDFLAGS} :'' -e "/^#L_BZ2/s:^${OPT bzip2 FLAGON .}::" unix/Makefile','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(62,73,'rm -r bzip2','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(64,96,'find \( -name build.xml -o -name build.properties \) -printf "removed %p\n" -delete','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(66,102,'sed -e ''/chmod/s:555:755:g'' -i Makefile.in','${SRC_DIR}/${PS}${PV}/unix',NULL,1);
INSERT INTO "prepare_cmds" VALUES(67,102,'sed -e ''s:-O[2s]\?::g'' -i tcl.m4','${SRC_DIR}/${PS}${PV}/unix',NULL,1);
INSERT INTO "prepare_cmds" VALUES(68,102,'mv configure.{in,ac}','${SRC_DIR}/${PS}${PV}/unix',NULL,1);
INSERT INTO "prepare_cmds" VALUES(69,102,'autoconf','${SRC_DIR}/${PS}${PV}/unix',NULL,1);
INSERT INTO "prepare_cmds" VALUES(70,84,'sed -i -e ''/udevadm hwdb/d'' Makefile','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(71,103,'sed -i -e ''/SystemdService/d'' data/org.freedesktop.ConsoleKit.service.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(72,76,'sed -r -i -e "/^DB_RELEASE_DATE=/s~=.*~=''$(awk ''/^DB_VERSION_STRING=/{ gsub(".*\\(|\\).*","",$0); print $0; }'' dist/configure)''~g" dist/RELEASE','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(73,76,'sed -r -i -e ''/jarfile=.*\.jar$/s,(.jar$),-$(LIBVERSION)\1,g'' dist/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(74,76,'rm -f aclocal/libtool.m4','${SRC_DIR}/${PS}-${PV}/dist',NULL,1);
INSERT INTO "prepare_cmds" VALUES(75,76,'sed -i -e ''/AC_PROG_LIBTOOL$/aLT_OUTPUT'' configure.ac','${SRC_DIR}/${PS}-${PV}/dist',NULL,1);
INSERT INTO "prepare_cmds" VALUES(76,76,'sed -i -e ''/^AC_PATH_TOOL/s/ sh, none/ bash, none/'' aclocal/programs.m4','${SRC_DIR}/${PS}-${PV}/dist',NULL,1);
INSERT INTO "prepare_cmds" VALUES(79,76,'AT_M4DIR="aclocal aclocal_java" autoreconf || echo "autoreconf"','${SRC_DIR}/${PS}-${PV}/dist',NULL,1);
INSERT INTO "prepare_cmds" VALUES(80,27,'sed -i -e ''/LOCAL_LDFLAGS=/s:-rdynamic::'' configure','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(81,27,'export ac_cv_func_dl{close,open,sym}=no ac_cv_lib_dl_dlopen=no ac_cv_header_dlfcn_h=no','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(82,52,'sed -i -e ''/^SUBDIRS=/s:=.*:=lib tc ip:'' Makefile','${SRC_DIR}/${PS}-${PV}',9,1);
INSERT INTO "prepare_cmds" VALUES(85,26,'patch -Np0 -i ${PKG_SOURCES}/readline-5.0-no_rpath.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(86,26,'patch -Np3 -i ${PKG_SOURCES}/readline-6.2-rlfe-tgoto.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(87,26,'patch -Np3 -i ${PKG_SOURCES}/readline-7.0-headers.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(88,26,'patch -Np3 -i ${PKG_SOURCES}/readline-7.0-missing-echo-proto.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(89,26,'sed -i -e ''/objformat/s:if .*; then:if true; then:'' support/shobj-conf','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(90,26,'ln -s ../.. examples/rlfe/readline','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(91,26,'sed -i -e "/^SHLIB_LIBS=/s:=.*:=''-lncurses'':" support/shobj-conf','${SRC_DIR}/${PS}-${PV}',0,1);
INSERT INTO "prepare_cmds" VALUES(95,107,'sed -i -e ''s:@toolexeclibdir@:$(libdir):g'' Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(96,107,'sed -e ''/^includesdir/ s/$(libdir).*$/$(includedir)/'' -i include/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(98,106,'sed -i -e ''s/ tests//'' {.,gio,glib}/Makefile.am','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(99,106,'autoreconf','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(100,81,'sed -i -e ''/_LDFLAGS/s:-static::'' tools/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(101,42,'patch -Np1 -i ${PKG_SOURCES}/233-0001-Avoid-strict-DM-interface-version-dependencies-5519.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(102,42,'sed -i s/size_t/GPERF_LEN_TYPE/ src/resolve/dns_type-from-name.h','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(103,49,'sed -i -e ''s/^[ \t]\+g=g$/g=/'' configure','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(104,27,'sed -i -r ''/^(HS|RL)USER/s:=.*:=:'' doc/Makefile.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(107,3,'mv ../extra/c_stubs ./','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(108,49,'patch -Np1 -i ${PKG_SOURCES}/groff-1.22.3-parallel-mom.patch','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(109,108,'sed -i "s/return 1/exit 1/g" tests/test_rhash.sh','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "prepare_cmds" VALUES(111,26,'sed -i -e "/^[[:space:]]*LIBS=.-lncurses  -ltinfo/s:-lncurses  -ltinfo:-lncurses:" examples/rlfe/configure','${SRC_DIR}/${PS}-${PV}',459,1);
INSERT INTO "prepare_cmds" VALUES(112,26,'sed -i -e "/^SHLIB_LIBS=/s:=.*:=''-lncurses -ltinfo'':" support/shobj-conf','${SRC_DIR}/${PS}-${PV}',459,1);
CREATE TABLE pkg_deps (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id) ON DELETE CASCADE, dep_by_pkg_id INTEGER REFERENCES package_meta (id), dep_by_opt INTEGER, opt_val_trig INTEGER);
INSERT INTO "pkg_deps" VALUES(2,3,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(3,10,7,NULL,1);
INSERT INTO "pkg_deps" VALUES(4,10,8,35,1);
INSERT INTO "pkg_deps" VALUES(5,10,9,0,1);
INSERT INTO "pkg_deps" VALUES(7,8,7,NULL,1);
INSERT INTO "pkg_deps" VALUES(8,9,7,NULL,1);
INSERT INTO "pkg_deps" VALUES(9,9,8,NULL,1);
INSERT INTO "pkg_deps" VALUES(13,61,17,7,1);
INSERT INTO "pkg_deps" VALUES(15,61,16,8,1);
INSERT INTO "pkg_deps" VALUES(16,30,15,NULL,1);
INSERT INTO "pkg_deps" VALUES(19,30,29,10,1);
INSERT INTO "pkg_deps" VALUES(20,61,43,5,1);
INSERT INTO "pkg_deps" VALUES(21,40,26,NULL,1);
INSERT INTO "pkg_deps" VALUES(22,40,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(25,41,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(26,32,40,NULL,1);
INSERT INTO "pkg_deps" VALUES(27,32,41,NULL,1);
INSERT INTO "pkg_deps" VALUES(29,46,17,7,1);
INSERT INTO "pkg_deps" VALUES(30,46,18,14,1);
INSERT INTO "pkg_deps" VALUES(31,46,7,15,1);
INSERT INTO "pkg_deps" VALUES(32,46,16,8,1);
INSERT INTO "pkg_deps" VALUES(33,46,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(35,47,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(36,47,43,5,1);
INSERT INTO "pkg_deps" VALUES(37,5,4,18,1);
INSERT INTO "pkg_deps" VALUES(38,49,43,5,1);
INSERT INTO "pkg_deps" VALUES(39,48,29,10,1);
INSERT INTO "pkg_deps" VALUES(40,48,8,19,1);
INSERT INTO "pkg_deps" VALUES(41,48,43,5,1);
INSERT INTO "pkg_deps" VALUES(42,21,14,0,1);
INSERT INTO "pkg_deps" VALUES(43,21,43,5,1);
INSERT INTO "pkg_deps" VALUES(44,51,15,NULL,1);
INSERT INTO "pkg_deps" VALUES(45,19,17,7,1);
INSERT INTO "pkg_deps" VALUES(46,19,43,5,1);
INSERT INTO "pkg_deps" VALUES(47,6,4,18,1);
INSERT INTO "pkg_deps" VALUES(48,6,43,5,1);
INSERT INTO "pkg_deps" VALUES(49,6,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(50,27,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(51,27,43,5,1);
INSERT INTO "pkg_deps" VALUES(52,28,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(53,28,43,5,1);
INSERT INTO "pkg_deps" VALUES(55,10,6,0,1);
INSERT INTO "pkg_deps" VALUES(56,10,27,NULL,1);
INSERT INTO "pkg_deps" VALUES(57,10,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(58,10,43,5,1);
INSERT INTO "pkg_deps" VALUES(60,43,17,7,1);
INSERT INTO "pkg_deps" VALUES(61,43,35,NULL,1);
INSERT INTO "pkg_deps" VALUES(62,43,15,40,1);
INSERT INTO "pkg_deps" VALUES(63,56,43,5,1);
INSERT INTO "pkg_deps" VALUES(64,57,16,8,1);
INSERT INTO "pkg_deps" VALUES(68,3,6,NULL,1);
INSERT INTO "pkg_deps" VALUES(69,3,10,NULL,1);
INSERT INTO "pkg_deps" VALUES(70,3,11,NULL,1);
INSERT INTO "pkg_deps" VALUES(71,1,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(72,20,17,7,1);
INSERT INTO "pkg_deps" VALUES(73,20,16,8,1);
INSERT INTO "pkg_deps" VALUES(74,20,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(75,20,43,5,1);
INSERT INTO "pkg_deps" VALUES(76,65,64,0,1);
INSERT INTO "pkg_deps" VALUES(77,37,33,47,1);
INSERT INTO "pkg_deps" VALUES(78,37,13,NULL,1);
INSERT INTO "pkg_deps" VALUES(79,37,0,NULL,1);
INSERT INTO "pkg_deps" VALUES(80,7,26,0,1);
INSERT INTO "pkg_deps" VALUES(81,7,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(82,55,14,0,1);
INSERT INTO "pkg_deps" VALUES(83,64,4,18,1);
INSERT INTO "pkg_deps" VALUES(84,64,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(85,38,35,0,1);
INSERT INTO "pkg_deps" VALUES(86,38,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(87,39,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(88,39,38,NULL,1);
INSERT INTO "pkg_deps" VALUES(89,65,64,43,1);
INSERT INTO "pkg_deps" VALUES(90,16,43,5,1);
INSERT INTO "pkg_deps" VALUES(91,16,40,NULL,1);
INSERT INTO "pkg_deps" VALUES(93,22,4,18,1);
INSERT INTO "pkg_deps" VALUES(94,23,59,0,1);
INSERT INTO "pkg_deps" VALUES(95,23,17,7,1);
INSERT INTO "pkg_deps" VALUES(96,23,65,56,1);
INSERT INTO "pkg_deps" VALUES(97,23,22,58,1);
INSERT INTO "pkg_deps" VALUES(98,23,42,59,1);
INSERT INTO "pkg_deps" VALUES(99,52,42,0,1);
INSERT INTO "pkg_deps" VALUES(100,52,27,NULL,1);
INSERT INTO "pkg_deps" VALUES(101,52,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(102,52,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(103,53,54,0,1);
INSERT INTO "pkg_deps" VALUES(104,53,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(106,59,18,14,1);
INSERT INTO "pkg_deps" VALUES(107,59,15,40,1);
INSERT INTO "pkg_deps" VALUES(108,59,43,5,1);
INSERT INTO "pkg_deps" VALUES(109,59,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(110,59,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(111,59,29,10,1);
INSERT INTO "pkg_deps" VALUES(112,60,33,47,1);
INSERT INTO "pkg_deps" VALUES(113,60,50,NULL,1);
INSERT INTO "pkg_deps" VALUES(114,60,4,18,1);
INSERT INTO "pkg_deps" VALUES(115,60,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(116,60,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(117,60,43,5,1);
INSERT INTO "pkg_deps" VALUES(118,62,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(119,62,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(120,62,43,5,1);
INSERT INTO "pkg_deps" VALUES(121,26,42,0,1);
INSERT INTO "pkg_deps" VALUES(122,31,29,10,1);
INSERT INTO "pkg_deps" VALUES(123,31,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(124,32,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(125,41,40,NULL,1);
INSERT INTO "pkg_deps" VALUES(126,41,62,NULL,1);
INSERT INTO "pkg_deps" VALUES(127,45,43,5,1);
INSERT INTO "pkg_deps" VALUES(128,45,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(129,45,62,NULL,1);
INSERT INTO "pkg_deps" VALUES(130,1,37,NULL,1);
INSERT INTO "pkg_deps" VALUES(131,3,18,14,1);
INSERT INTO "pkg_deps" VALUES(132,18,1,0,1);
INSERT INTO "pkg_deps" VALUES(133,29,14,0,1);
INSERT INTO "pkg_deps" VALUES(134,24,32,0,1);
INSERT INTO "pkg_deps" VALUES(135,24,43,5,1);
INSERT INTO "pkg_deps" VALUES(136,24,15,NULL,1);
INSERT INTO "pkg_deps" VALUES(137,44,15,40,1);
INSERT INTO "pkg_deps" VALUES(138,44,23,62,1);
INSERT INTO "pkg_deps" VALUES(139,44,14,40,1);
INSERT INTO "pkg_deps" VALUES(140,44,14,62,1);
INSERT INTO "pkg_deps" VALUES(141,68,42,0,1);
INSERT INTO "pkg_deps" VALUES(142,69,18,14,1);
INSERT INTO "pkg_deps" VALUES(143,69,64,55,1);
INSERT INTO "pkg_deps" VALUES(144,69,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(145,70,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(146,70,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(147,70,43,5,1);
INSERT INTO "pkg_deps" VALUES(148,71,64,55,1);
INSERT INTO "pkg_deps" VALUES(149,71,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(150,71,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(151,71,40,NULL,1);
INSERT INTO "pkg_deps" VALUES(152,71,20,NULL,1);
INSERT INTO "pkg_deps" VALUES(153,23,72,NULL,1);
INSERT INTO "pkg_deps" VALUES(154,23,73,461,1);
INSERT INTO "pkg_deps" VALUES(155,23,34,NULL,1);
INSERT INTO "pkg_deps" VALUES(156,74,4,18,1);
INSERT INTO "pkg_deps" VALUES(157,20,74,NULL,1);
INSERT INTO "pkg_deps" VALUES(158,10,75,NULL,1);
INSERT INTO "pkg_deps" VALUES(159,32,76,NULL,1);
INSERT INTO "pkg_deps" VALUES(160,77,74,41,1);
INSERT INTO "pkg_deps" VALUES(161,77,78,46,1);
INSERT INTO "pkg_deps" VALUES(162,77,79,291,1);
INSERT INTO "pkg_deps" VALUES(163,77,32,NULL,1);
INSERT INTO "pkg_deps" VALUES(164,77,28,NULL,1);
INSERT INTO "pkg_deps" VALUES(165,77,43,5,1);
INSERT INTO "pkg_deps" VALUES(166,77,14,291,1);
INSERT INTO "pkg_deps" VALUES(167,78,6,0,1);
INSERT INTO "pkg_deps" VALUES(168,78,80,396,1);
INSERT INTO "pkg_deps" VALUES(169,79,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(170,79,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(171,71,77,42,1);
INSERT INTO "pkg_deps" VALUES(172,53,77,42,1);
INSERT INTO "pkg_deps" VALUES(173,20,77,42,1);
INSERT INTO "pkg_deps" VALUES(174,23,77,42,1);
INSERT INTO "pkg_deps" VALUES(175,18,77,42,1);
INSERT INTO "pkg_deps" VALUES(176,66,29,10,1);
INSERT INTO "pkg_deps" VALUES(177,52,81,462,1);
INSERT INTO "pkg_deps" VALUES(178,23,81,60,1);
INSERT INTO "pkg_deps" VALUES(179,60,55,NULL,1);
INSERT INTO "pkg_deps" VALUES(180,22,42,59,1);
INSERT INTO "pkg_deps" VALUES(181,81,1,0,1);
INSERT INTO "pkg_deps" VALUES(182,81,14,0,1);
INSERT INTO "pkg_deps" VALUES(184,70,82,20,1);
INSERT INTO "pkg_deps" VALUES(185,21,82,20,1);
INSERT INTO "pkg_deps" VALUES(186,51,82,20,1);
INSERT INTO "pkg_deps" VALUES(187,82,13,99,1);
INSERT INTO "pkg_deps" VALUES(188,82,4,18,1);
INSERT INTO "pkg_deps" VALUES(189,82,29,0,1);
INSERT INTO "pkg_deps" VALUES(190,82,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(194,18,16,NULL,1);
INSERT INTO "pkg_deps" VALUES(195,23,18,NULL,1);
INSERT INTO "pkg_deps" VALUES(196,77,18,154,1);
INSERT INTO "pkg_deps" VALUES(197,23,84,357,1);
INSERT INTO "pkg_deps" VALUES(198,84,1,0,1);
INSERT INTO "pkg_deps" VALUES(199,85,18,14,1);
INSERT INTO "pkg_deps" VALUES(200,85,84,357,1);
INSERT INTO "pkg_deps" VALUES(201,85,14,357,1);
INSERT INTO "pkg_deps" VALUES(202,85,42,NULL,1);
INSERT INTO "pkg_deps" VALUES(203,70,64,55,1);
INSERT INTO "pkg_deps" VALUES(204,64,86,NULL,1);
INSERT INTO "pkg_deps" VALUES(205,23,46,NULL,1);
INSERT INTO "pkg_deps" VALUES(206,23,1,NULL,1);
INSERT INTO "pkg_deps" VALUES(207,23,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(208,87,0,409,1);
INSERT INTO "pkg_deps" VALUES(209,23,87,NULL,1);
INSERT INTO "pkg_deps" VALUES(210,23,39,NULL,1);
INSERT INTO "pkg_deps" VALUES(211,62,88,NULL,1);
INSERT INTO "pkg_deps" VALUES(212,62,89,NULL,1);
INSERT INTO "pkg_deps" VALUES(213,62,90,NULL,1);
INSERT INTO "pkg_deps" VALUES(214,40,62,NULL,1);
INSERT INTO "pkg_deps" VALUES(215,71,91,42,1);
INSERT INTO "pkg_deps" VALUES(216,20,91,NULL,1);
INSERT INTO "pkg_deps" VALUES(217,77,91,NULL,1);
INSERT INTO "pkg_deps" VALUES(218,91,42,0,1);
INSERT INTO "pkg_deps" VALUES(219,91,0,41,1);
INSERT INTO "pkg_deps" VALUES(220,92,14,0,1);
INSERT INTO "pkg_deps" VALUES(221,92,42,59,1);
INSERT INTO "pkg_deps" VALUES(222,92,29,10,1);
INSERT INTO "pkg_deps" VALUES(223,43,92,NULL,1);
INSERT INTO "pkg_deps" VALUES(224,93,14,0,1);
INSERT INTO "pkg_deps" VALUES(225,94,15,0,1);
INSERT INTO "pkg_deps" VALUES(226,94,5,470,1);
INSERT INTO "pkg_deps" VALUES(227,94,43,5,1);
INSERT INTO "pkg_deps" VALUES(228,94,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(229,95,96,0,1);
INSERT INTO "pkg_deps" VALUES(230,96,43,5,1);
INSERT INTO "pkg_deps" VALUES(231,69,95,63,1);
INSERT INTO "pkg_deps" VALUES(232,23,95,63,1);
INSERT INTO "pkg_deps" VALUES(233,97,92,0,1);
INSERT INTO "pkg_deps" VALUES(234,23,97,NULL,1);
INSERT INTO "pkg_deps" VALUES(235,97,95,116,1);
INSERT INTO "pkg_deps" VALUES(236,98,100,0,1);
INSERT INTO "pkg_deps" VALUES(237,98,99,NULL,1);
INSERT INTO "pkg_deps" VALUES(238,98,30,NULL,1);
INSERT INTO "pkg_deps" VALUES(239,98,97,NULL,1);
INSERT INTO "pkg_deps" VALUES(240,98,19,NULL,1);
INSERT INTO "pkg_deps" VALUES(241,98,46,NULL,1);
INSERT INTO "pkg_deps" VALUES(242,98,59,NULL,1);
INSERT INTO "pkg_deps" VALUES(243,98,67,NULL,1);
INSERT INTO "pkg_deps" VALUES(244,58,98,0,1);
INSERT INTO "pkg_deps" VALUES(245,100,75,0,1);
INSERT INTO "pkg_deps" VALUES(246,100,92,NULL,1);
INSERT INTO "pkg_deps" VALUES(247,100,99,NULL,1);
INSERT INTO "pkg_deps" VALUES(248,100,99,NULL,1);
INSERT INTO "pkg_deps" VALUES(249,101,59,NULL,1);
INSERT INTO "pkg_deps" VALUES(250,101,99,NULL,1);
INSERT INTO "pkg_deps" VALUES(251,101,92,NULL,1);
INSERT INTO "pkg_deps" VALUES(252,23,58,NULL,1);
INSERT INTO "pkg_deps" VALUES(253,102,103,NULL,1);
INSERT INTO "pkg_deps" VALUES(254,102,35,NULL,1);
INSERT INTO "pkg_deps" VALUES(255,102,65,NULL,1);
INSERT INTO "pkg_deps" VALUES(256,102,4,NULL,1);
INSERT INTO "pkg_deps" VALUES(257,102,14,NULL,1);
INSERT INTO "pkg_deps" VALUES(258,102,15,40,1);
INSERT INTO "pkg_deps" VALUES(259,103,17,7,1);
INSERT INTO "pkg_deps" VALUES(260,103,13,99,1);
INSERT INTO "pkg_deps" VALUES(261,103,35,148,1);
INSERT INTO "pkg_deps" VALUES(262,103,1,0,1);
INSERT INTO "pkg_deps" VALUES(263,103,73,461,1);
INSERT INTO "pkg_deps" VALUES(264,103,42,0,1);
INSERT INTO "pkg_deps" VALUES(265,103,4,18,1);
INSERT INTO "pkg_deps" VALUES(266,103,64,NULL,1);
INSERT INTO "pkg_deps" VALUES(267,103,104,248,1);
INSERT INTO "pkg_deps" VALUES(268,75,13,99,1);
INSERT INTO "pkg_deps" VALUES(269,81,28,471,1);
INSERT INTO "pkg_deps" VALUES(272,91,105,472,1);
INSERT INTO "pkg_deps" VALUES(273,105,43,NULL,1);
INSERT INTO "pkg_deps" VALUES(274,105,58,NULL,1);
INSERT INTO "pkg_deps" VALUES(275,105,4,NULL,1);
INSERT INTO "pkg_deps" VALUES(276,105,17,7,1);
INSERT INTO "pkg_deps" VALUES(279,105,97,NULL,1);
INSERT INTO "pkg_deps" VALUES(280,105,68,NULL,1);
INSERT INTO "pkg_deps" VALUES(281,106,37,0,1);
INSERT INTO "pkg_deps" VALUES(282,65,106,44,1);
INSERT INTO "pkg_deps" VALUES(283,70,106,44,1);
INSERT INTO "pkg_deps" VALUES(284,106,107,NULL,1);
INSERT INTO "pkg_deps" VALUES(285,108,100,0,1);
INSERT INTO "pkg_deps" VALUES(286,108,97,NULL,1);
INSERT INTO "pkg_deps" VALUES(287,108,43,NULL,1);
INSERT INTO "pkg_deps" VALUES(288,108,82,NULL,1);
INSERT INTO "pkg_deps" VALUES(289,108,4,NULL,1);
INSERT INTO "pkg_deps" VALUES(290,108,109,NULL,1);
INSERT INTO "pkg_deps" VALUES(292,102,110,NULL,1);
INSERT INTO "pkg_deps" VALUES(293,110,43,5,1);
INSERT INTO "pkg_deps" VALUES(294,110,64,55,1);
CREATE TABLE config_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, descr TEXT DEFAULT (NULL), "default" INTEGER DEFAULT (0));
INSERT INTO "config_opts" VALUES(1,'minizip',NULL,0);
INSERT INTO "config_opts" VALUES(2,'static-libs','Build static versions of dynamic libraries as well',0);
INSERT INTO "config_opts" VALUES(4,'pic',NULL,0);
INSERT INTO "config_opts" VALUES(5,'nls','Add Native Language Support (using gettext - GNU locale utilities)',0);
INSERT INTO "config_opts" VALUES(6,'threads','Add threads support for various packages. Usually pthreads',0);
INSERT INTO "config_opts" VALUES(7,'acl','Add support for Access Control Lists',0);
INSERT INTO "config_opts" VALUES(8,'xattr','Add support for extended attributes (filesystem-stored metadata)',0);
INSERT INTO "config_opts" VALUES(9,'minimal','Install a very minimal build (disables, for example, plugins, fonts, most drivers, non-critical features)',0);
INSERT INTO "config_opts" VALUES(10,'readline','Enable support for libreadline, a GNU line-editing library that almost everyone wants',0);
INSERT INTO "config_opts" VALUES(11,'afs','Add OpenAFS support (distributed file system)',0);
INSERT INTO "config_opts" VALUES(12,'net',NULL,0);
INSERT INTO "config_opts" VALUES(13,'mem-scramble',NULL,0);
INSERT INTO "config_opts" VALUES(14,'caps','Use Linux capabilities library to control privilege',0);
INSERT INTO "config_opts" VALUES(15,'gmp','Add support for dev-libs/gmp (GNU MP library)',0);
INSERT INTO "config_opts" VALUES(16,'multicall',NULL,0);
INSERT INTO "config_opts" VALUES(17,'python','Add optional support/bindings for the Python language',0);
INSERT INTO "config_opts" VALUES(18,'zlib','Add support for zlib (de)compression',0);
INSERT INTO "config_opts" VALUES(19,'mpfr',NULL,0);
INSERT INTO "config_opts" VALUES(20,'pcre','Add support for Perl Compatible Regular Expressions',0);
INSERT INTO "config_opts" VALUES(21,'unicode','Add support for Unicode',0);
INSERT INTO "config_opts" VALUES(22,'cxx','Build support for C++ (bindings, extra libraries, code generation, ...)',0);
INSERT INTO "config_opts" VALUES(23,'nopie',NULL,0);
INSERT INTO "config_opts" VALUES(24,'nossp',NULL,0);
INSERT INTO "config_opts" VALUES(25,'awt',NULL,0);
INSERT INTO "config_opts" VALUES(26,'multilib','On 64bit systems, if you want to be able to compile 32bit and 64bit binaries',0);
INSERT INTO "config_opts" VALUES(27,'objc',NULL,0);
INSERT INTO "config_opts" VALUES(28,'libssp',NULL,0);
INSERT INTO "config_opts" VALUES(29,'objc++',NULL,0);
INSERT INTO "config_opts" VALUES(30,'go',NULL,0);
INSERT INTO "config_opts" VALUES(31,'graphite',NULL,0);
INSERT INTO "config_opts" VALUES(32,'cilk',NULL,0);
INSERT INTO "config_opts" VALUES(33,'pie','Build programs as Position Independent Executables (a security hardening technique)',0);
INSERT INTO "config_opts" VALUES(35,'fortran','Add support for fortran',0);
INSERT INTO "config_opts" VALUES(36,'nptl','Enable support for Native POSIX Threads Library, the new threading module (requires linux-2.6 or better usually)',0);
INSERT INTO "config_opts" VALUES(37,'sanitize',NULL,0);
INSERT INTO "config_opts" VALUES(39,'openmp',NULL,0);
INSERT INTO "config_opts" VALUES(40,'ncurses','Add ncurses support (console display library)',0);
INSERT INTO "config_opts" VALUES(41,'cracklib','Support for cracklib strong password checking',0);
INSERT INTO "config_opts" VALUES(42,'pam','Add support for PAM (Pluggable Authentication Modules) - DANGEROUS to arbitrarily flip',0);
INSERT INTO "config_opts" VALUES(43,'ldap','Add LDAP support (Lightweight Directory Access Protocol)',0);
INSERT INTO "config_opts" VALUES(44,'idn','Enable support for Internationalized Domain Names',0);
INSERT INTO "config_opts" VALUES(45,'guile','Add support for the guile Scheme interpreter',0);
INSERT INTO "config_opts" VALUES(46,'berkdb','Add support for sys-libs/db (Berkeley DB for MySQL)',0);
INSERT INTO "config_opts" VALUES(47,'gdbm','Add support for sys-libs/gdbm (GNU database libraries)',0);
INSERT INTO "config_opts" VALUES(48,'http2',NULL,0);
INSERT INTO "config_opts" VALUES(49,'adns','Add support for asynchronous DNS resolution',0);
INSERT INTO "config_opts" VALUES(50,'kerberos','Add kerberos support',0);
INSERT INTO "config_opts" VALUES(51,'metalink',NULL,0);
INSERT INTO "config_opts" VALUES(52,'rtmp',NULL,0);
INSERT INTO "config_opts" VALUES(53,'ssh',NULL,0);
INSERT INTO "config_opts" VALUES(54,'ipv6','Add support for IP version 6',0);
INSERT INTO "config_opts" VALUES(55,'ssl','Add support for Secure Socket Layer connections',0);
INSERT INTO "config_opts" VALUES(56,'curl','Add support for client-side URL transfer library',0);
INSERT INTO "config_opts" VALUES(57,'http',NULL,0);
INSERT INTO "config_opts" VALUES(58,'kmod',NULL,0);
INSERT INTO "config_opts" VALUES(59,'lzma','Support for LZMA (de)compression algorithm',0);
INSERT INTO "config_opts" VALUES(60,'nat',NULL,0);
INSERT INTO "config_opts" VALUES(61,'xkb',NULL,0);
INSERT INTO "config_opts" VALUES(62,'systemd','Enable use of systemd-specific libraries and features like socket activation or session tracking',0);
INSERT INTO "config_opts" VALUES(63,'gcrypt',NULL,0);
INSERT INTO "config_opts" VALUES(64,'3dfx','Enable support for Voodoo chipsets, also called as 3DFX and TDFX',0);
INSERT INTO "config_opts" VALUES(65,'X','Add support for X11',0);
INSERT INTO "config_opts" VALUES(66,'Xaw3d','Add support for the 3d athena widget set',0);
INSERT INTO "config_opts" VALUES(67,'a52','Enable support for decoding ATSC A/52 streams used in DVD',0);
INSERT INTO "config_opts" VALUES(68,'aac','Enable support for MPEG-4 AAC Audio',0);
INSERT INTO "config_opts" VALUES(69,'aalib','Add support for media-libs/aalib (ASCII-Graphics Library)',0);
INSERT INTO "config_opts" VALUES(70,'accessibility','Add support for accessibility (eg ''at-spi'' library)',0);
INSERT INTO "config_opts" VALUES(72,'acpi','Add support for Advanced Configuration and Power Interface',0);
INSERT INTO "config_opts" VALUES(75,'aim','Enable AIM IM protocol support',0);
INSERT INTO "config_opts" VALUES(76,'alsa','Add support for media-libs/alsa-lib (Advanced Linux Sound Architecture)',0);
INSERT INTO "config_opts" VALUES(77,'altivec','Add support for optimizations for G4 and G5/ppc970 processors',0);
INSERT INTO "config_opts" VALUES(78,'ao','Use libao audio output library for sound playback',0);
INSERT INTO "config_opts" VALUES(79,'apache2','Add Apache2 support',0);
INSERT INTO "config_opts" VALUES(80,'apm','Add APM (Advanced Power Management) support',0);
INSERT INTO "config_opts" VALUES(81,'aqua','Include support for the Mac OS X Aqua (Carbon/Cocoa) GUI',0);
INSERT INTO "config_opts" VALUES(82,'atm','Enable Asynchronous Transfer Mode protocol support',0);
INSERT INTO "config_opts" VALUES(83,'audiofile','Add support for libaudiofile where applicable',0);
INSERT INTO "config_opts" VALUES(84,'audit','Enable support for Linux audit subsystem using sys-process/audit',0);
INSERT INTO "config_opts" VALUES(85,'avahi','Add avahi/Zeroconf support',0);
INSERT INTO "config_opts" VALUES(86,'ayatana','Build in support for Ayatana notification using the libindicate or libappindicator plugin',0);
INSERT INTO "config_opts" VALUES(87,'bash-completion','Enable bash-completion support',0);
INSERT INTO "config_opts" VALUES(88,'bcmath','Add support for libbcmath',0);
INSERT INTO "config_opts" VALUES(90,'bidi','Enable bidirectional language support',0);
INSERT INTO "config_opts" VALUES(91,'bindist','Flag to enable or disable options for prebuilt (GRP) packages (eg. due to licensing issues)',0);
INSERT INTO "config_opts" VALUES(92,'blas','Add support for the virtual/blas numerical library',0);
INSERT INTO "config_opts" VALUES(93,'bluetooth','Enable Bluetooth Support',0);
INSERT INTO "config_opts" VALUES(94,'bootstrap','!!internal use only!! DO NOT SET THIS FLAG YOURSELF!, used during original system bootstrapping [make stage2]',0);
INSERT INTO "config_opts" VALUES(95,'boundschecking','Add the bounds checking patch by Haj Ten Brugge, this will DISABLE the hardened PIE+SSP patches',0);
INSERT INTO "config_opts" VALUES(96,'branding','Enable Gentoo specific branding',0);
INSERT INTO "config_opts" VALUES(97,'bsf','Enable support for Apache Bean Scripting Framework (dev-java/bsf)',0);
INSERT INTO "config_opts" VALUES(98,'build','!!internal use only!! DO NOT SET THIS FLAG YOURSELF!, used for creating build images and the first half of bootstrapping [make stage1]',0);
INSERT INTO "config_opts" VALUES(99,'bzip2','Use the bzlib compression library',0);
INSERT INTO "config_opts" VALUES(100,'cairo','Enable support for the cairo graphics library',0);
INSERT INTO "config_opts" VALUES(101,'calendar','Add support for calendars (not using mcal!)',0);
INSERT INTO "config_opts" VALUES(102,'canna','Add support for the Canna kana to kanji conversion engine',0);
INSERT INTO "config_opts" VALUES(104,'cdb','Add support for the CDB database engine from the author of qmail',0);
INSERT INTO "config_opts" VALUES(105,'cdda','Add Compact Disk Digital Audio (Standard Audio CD) support',0);
INSERT INTO "config_opts" VALUES(106,'cddb','Access cddb servers to retrieve and submit information about compact disks',0);
INSERT INTO "config_opts" VALUES(107,'cdinstall','Copy files from the CD rather than asking the user to copy them, mostly used with games',0);
INSERT INTO "config_opts" VALUES(108,'cdparanoia','Enable cdparanoia (audio CD ripper) support',0);
INSERT INTO "config_opts" VALUES(109,'cdr','Add support for CD writer hardware',0);
INSERT INTO "config_opts" VALUES(110,'cgi','Add CGI script support',0);
INSERT INTO "config_opts" VALUES(111,'cjk','Add support for Multi-byte character languages (Chinese, Japanese, Korean)',0);
INSERT INTO "config_opts" VALUES(112,'clamav','Add support for Clam AntiVirus software (usually with a plugin)',0);
INSERT INTO "config_opts" VALUES(113,'connman','Add support for net-misc/connman',0);
INSERT INTO "config_opts" VALUES(114,'coreaudio','Build the CoreAudio driver on Mac OS X systems',0);
INSERT INTO "config_opts" VALUES(116,'crypt','Add support for encryption -- using mcrypt or gpg where applicable',0);
INSERT INTO "config_opts" VALUES(117,'cscope','Enable cscope interface -- in vim for example',0);
INSERT INTO "config_opts" VALUES(118,'css','Enable reading of encrypted DVDs',0);
INSERT INTO "config_opts" VALUES(119,'ctype','Enable ctype functions',0);
INSERT INTO "config_opts" VALUES(120,'cups','Add support for CUPS (Common Unix Printing System)',0);
INSERT INTO "config_opts" VALUES(122,'custom-cflags','Build with user-specified CFLAGS (unsupported)',0);
INSERT INTO "config_opts" VALUES(123,'cvs','Enable CVS (Concurrent Versions System) integration',0);
INSERT INTO "config_opts" VALUES(125,'dbi','Enable dev-db/libdbi (database-independent abstraction layer) support',0);
INSERT INTO "config_opts" VALUES(126,'dbm','Add support for generic DBM databases',0);
INSERT INTO "config_opts" VALUES(127,'dbus','Enable dbus support for anything that needs it (gpsd, gnomemeeting, etc)',0);
INSERT INTO "config_opts" VALUES(128,'debug','Enable extra debug codepaths, like asserts and extra output. If you want to get meaningful backtraces see https://wiki.gentoo.org/wiki/Project:Quality_Assurance/Backtraces',0);
INSERT INTO "config_opts" VALUES(129,'dedicated','Add support for dedicated game servers (some packages do not provide clients and servers at the same time)',0);
INSERT INTO "config_opts" VALUES(130,'dga','Add DGA (Direct Graphic Access) support for X',0);
INSERT INTO "config_opts" VALUES(131,'directfb','Add support for DirectFB layer (library for FB devices)',0);
INSERT INTO "config_opts" VALUES(132,'djvu','Support DjVu, a PDF-like document format esp. suited for scanned documents',0);
INSERT INTO "config_opts" VALUES(133,'doc','Add extra documentation (API, Javadoc, etc). It is recommended to enable per package instead of globally',0);
INSERT INTO "config_opts" VALUES(134,'dri','Enable direct rendering: used for accelerated 3D and some 2D, like DMA',0);
INSERT INTO "config_opts" VALUES(135,'dts','Enable DTS Coherent Acoustics decoder support',0);
INSERT INTO "config_opts" VALUES(136,'dv','Enable support for a codec used by many camcorders',0);
INSERT INTO "config_opts" VALUES(137,'dvb','Add support for DVB (Digital Video Broadcasting)',0);
INSERT INTO "config_opts" VALUES(138,'dvd','Add support for DVDs',0);
INSERT INTO "config_opts" VALUES(139,'dvdr','Add support for DVD writer hardware (e.g. in xcdroast)',0);
INSERT INTO "config_opts" VALUES(140,'eds','Enable support for Evolution-Data-Server (EDS)',0);
INSERT INTO "config_opts" VALUES(141,'emacs','Add support for GNU Emacs',0);
INSERT INTO "config_opts" VALUES(142,'emboss','Add support for the European Molecular Biology Open Software Suite',0);
INSERT INTO "config_opts" VALUES(143,'encode','Add support for encoding of audio or video files',0);
INSERT INTO "config_opts" VALUES(144,'enscript','Add enscript support to colourize code stored in the repository',0);
INSERT INTO "config_opts" VALUES(145,'evo','Add support for mail-client/evolution',0);
INSERT INTO "config_opts" VALUES(146,'examples','Install examples, usually source code',0);
INSERT INTO "config_opts" VALUES(147,'exif','Add support for reading EXIF headers from JPEG and TIFF images',0);
INSERT INTO "config_opts" VALUES(148,'expat','Enable the use of dev-libs/expat for XML parsing',0);
INSERT INTO "config_opts" VALUES(149,'fam','Enable FAM (File Alteration Monitor) support',0);
INSERT INTO "config_opts" VALUES(150,'fastcgi','Add support for the FastCGI interface',0);
INSERT INTO "config_opts" VALUES(151,'fbcon','Add framebuffer support for the console, via the kernel',0);
INSERT INTO "config_opts" VALUES(152,'ffmpeg','Enable ffmpeg/libav-based audio/video codec support',0);
INSERT INTO "config_opts" VALUES(153,'fftw','Use FFTW library for computing Fourier transforms',0);
INSERT INTO "config_opts" VALUES(154,'filecaps','Use Linux file capabilities to control privilege rather than set*id (this is orthogonal to USE=caps which uses capabilities at runtime e.g. libcap)',0);
INSERT INTO "config_opts" VALUES(155,'firebird','Add support for the Firebird relational database',0);
INSERT INTO "config_opts" VALUES(156,'flac','Add support for FLAC: Free Lossless Audio Codec',0);
INSERT INTO "config_opts" VALUES(157,'flatfile','Add dbm support for flat files',0);
INSERT INTO "config_opts" VALUES(158,'fltk','Add support for the Fast Light Toolkit gui interface',0);
INSERT INTO "config_opts" VALUES(159,'fontconfig','Support for configuring and customizing font access via media-libs/fontconfig',0);
INSERT INTO "config_opts" VALUES(160,'foomaticdb','Add support for the foomatic printing driver database',0);
INSERT INTO "config_opts" VALUES(162,'freetds','Add support for the TDS protocol to connect to MSSQL/Sybase databases',0);
INSERT INTO "config_opts" VALUES(163,'freewnn','Add support for FreeWnn kana to kanji conversion engine',0);
INSERT INTO "config_opts" VALUES(164,'ftp','Add FTP (File Transfer Protocol) support',0);
INSERT INTO "config_opts" VALUES(165,'gcj','Enable building with gcj (The GNU Compiler for the Javatm Programming Language)',0);
INSERT INTO "config_opts" VALUES(166,'gd','Add support for media-libs/gd (to generate graphics on the fly)',0);
INSERT INTO "config_opts" VALUES(168,'geoip','Add geoip support for country and city lookup based on IPs',0);
INSERT INTO "config_opts" VALUES(169,'geolocation','Enable physical position determination',0);
INSERT INTO "config_opts" VALUES(170,'ggi','Add support for media-libs/libggi (non-X video api/drivers)',0);
INSERT INTO "config_opts" VALUES(171,'gif','Add GIF image support',0);
INSERT INTO "config_opts" VALUES(172,'gimp','Build a plugin for the GIMP',0);
INSERT INTO "config_opts" VALUES(173,'git','Enable git (version control system) support',0);
INSERT INTO "config_opts" VALUES(174,'glut','Build an OpenGL plugin using the GLUT library',0);
INSERT INTO "config_opts" VALUES(175,'gmp','Add support for dev-libs/gmp (GNU MP library)',0);
INSERT INTO "config_opts" VALUES(176,'gnome','Add GNOME support',0);
INSERT INTO "config_opts" VALUES(177,'gnome-keyring','Enable support for storing passwords via gnome-keyring',0);
INSERT INTO "config_opts" VALUES(178,'gnuplot','Enable support for gnuplot (data and function plotting)',0);
INSERT INTO "config_opts" VALUES(179,'gnutls','Add support for net-libs/gnutls (TLS 1.0 and SSL 3.0 support)',0);
INSERT INTO "config_opts" VALUES(180,'gphoto2','Add digital camera support',0);
INSERT INTO "config_opts" VALUES(182,'gps','Add support for Global Positioning System',0);
INSERT INTO "config_opts" VALUES(183,'graphicsmagick','Build and link against GraphicsMagick instead of ImageMagick (might require USE=imagemagick if optional)',0);
INSERT INTO "config_opts" VALUES(184,'graphviz','Add support for the Graphviz library',0);
INSERT INTO "config_opts" VALUES(185,'gsl','Use the GNU scientific library for calculations',0);
INSERT INTO "config_opts" VALUES(186,'gsm','Add support for the gsm lossy speech compression codec',0);
INSERT INTO "config_opts" VALUES(187,'gstreamer','Add support for media-libs/gstreamer (Streaming media)',0);
INSERT INTO "config_opts" VALUES(188,'gtk','Add support for x11-libs/gtk+ (The GIMP Toolkit)',0);
INSERT INTO "config_opts" VALUES(190,'gzip','Compress files with Lempel-Ziv coding (LZ77)',0);
INSERT INTO "config_opts" VALUES(191,'handbook','Enable handbooks generation for packages by KDE',0);
INSERT INTO "config_opts" VALUES(192,'hardened','Activate default security enhancements for toolchain (gcc, glibc, binutils)',0);
INSERT INTO "config_opts" VALUES(193,'hddtemp','Enable monitoring of hdd temperature (app-admin/hddtemp)',0);
INSERT INTO "config_opts" VALUES(194,'hdf5','Add support for the Hierarchical Data Format v5',0);
INSERT INTO "config_opts" VALUES(195,'hscolour','Include coloured haskell sources to generated documentation (dev-haskell/hscolour)',0);
INSERT INTO "config_opts" VALUES(196,'ibm','Add support for IBM ppc64 specific systems',0);
INSERT INTO "config_opts" VALUES(197,'iconv','Enable support for the iconv character set conversion library',0);
INSERT INTO "config_opts" VALUES(198,'icq','Enable ICQ IM protocol support',0);
INSERT INTO "config_opts" VALUES(199,'icu','Enable ICU (Internationalization Components for Unicode) support, using dev-libs/icu',0);
INSERT INTO "config_opts" VALUES(201,'ieee1394','Enable FireWire/iLink IEEE1394 support (dv, camera, ...)',0);
INSERT INTO "config_opts" VALUES(202,'imagemagick','Enable optional support for the ImageMagick or GraphicsMagick image converter',0);
INSERT INTO "config_opts" VALUES(203,'imap','Add support for IMAP (Internet Mail Application Protocol)',0);
INSERT INTO "config_opts" VALUES(204,'imlib','Add support for imlib, an image loading and rendering library',0);
INSERT INTO "config_opts" VALUES(205,'infiniband','Enable Infiniband RDMA transport support',0);
INSERT INTO "config_opts" VALUES(206,'inifile','Add dbm support for .ini files',0);
INSERT INTO "config_opts" VALUES(207,'inotify','Enable inotify filesystem monitoring support',0);
INSERT INTO "config_opts" VALUES(208,'introspection','Add support for GObject based introspection',0);
INSERT INTO "config_opts" VALUES(209,'iodbc','Add support for iODBC library',0);
INSERT INTO "config_opts" VALUES(210,'ios','Enable support for Apple''s iDevice with iOS operating system (iPad, iPhone, iPod, etc)',0);
INSERT INTO "config_opts" VALUES(211,'ipod','Enable support for iPod device access',0);
INSERT INTO "config_opts" VALUES(213,'iwmmxt','Add support for optimizations for ARM iwMMXt instructions',0);
INSERT INTO "config_opts" VALUES(214,'jack','Add support for the JACK Audio Connection Kit',0);
INSERT INTO "config_opts" VALUES(215,'java','Add support for Java',0);
INSERT INTO "config_opts" VALUES(216,'javascript','Enable javascript support',0);
INSERT INTO "config_opts" VALUES(217,'jbig','Enable jbig-kit support for tiff, Hylafax, ImageMagick, etc',0);
INSERT INTO "config_opts" VALUES(218,'jingle','Enable voice calls for jabber',0);
INSERT INTO "config_opts" VALUES(219,'jit','Enable just-in-time compilation for improved performance. May prevent use of some PaX memory protection features in Gentoo Hardened.',0);
INSERT INTO "config_opts" VALUES(220,'joystick','Add support for joysticks in all packages',0);
INSERT INTO "config_opts" VALUES(221,'jpeg','Add JPEG image support',0);
INSERT INTO "config_opts" VALUES(222,'jpeg2k','Support for JPEG 2000, a wavelet-based image compression format',0);
INSERT INTO "config_opts" VALUES(223,'kde','Add support for KDE (K Desktop Environment)',0);
INSERT INTO "config_opts" VALUES(225,'kolab','Add support for the Kolab groupware server',0);
INSERT INTO "config_opts" VALUES(226,'kontact','Enable support for the KDE personal information manager (kde-apps/kdepim*)',0);
INSERT INTO "config_opts" VALUES(227,'ladspa','Enable the ability to support ladspa plugins',0);
INSERT INTO "config_opts" VALUES(228,'lame','Prefer using LAME libraries for MP3 encoding support',0);
INSERT INTO "config_opts" VALUES(229,'lapack','Add support for the virtual/lapack numerical library',0);
INSERT INTO "config_opts" VALUES(230,'lash','Add LASH Audio Session Handler support',0);
INSERT INTO "config_opts" VALUES(231,'latex','Add support for LaTeX (typesetting package)',0);
INSERT INTO "config_opts" VALUES(232,'lcms','Add lcms support (color management engine)',0);
INSERT INTO "config_opts" VALUES(234,'libass','SRT/SSA/ASS (SubRip / SubStation Alpha) subtitle support',0);
INSERT INTO "config_opts" VALUES(235,'libav','Prefer libav over ffmpeg whenever both are supported',0);
INSERT INTO "config_opts" VALUES(236,'libcaca','Add support for colored ASCII-art graphics',0);
INSERT INTO "config_opts" VALUES(237,'libedit','Use the libedit library (replacement for readline)',0);
INSERT INTO "config_opts" VALUES(238,'libffi','Enable support for Foreign Function Interface library',0);
INSERT INTO "config_opts" VALUES(239,'libnotify','Enable desktop notification support',0);
INSERT INTO "config_opts" VALUES(240,'libressl','Use dev-libs/libressl as SSL provider (might need ssl USE flag), packages should not depend on this USE flag',0);
INSERT INTO "config_opts" VALUES(241,'libsamplerate','Build with support for converting sample rates using libsamplerate',0);
INSERT INTO "config_opts" VALUES(242,'libwww','Add libwww support (General purpose WEB API)',0);
INSERT INTO "config_opts" VALUES(243,'lirc','Add support for lirc (Linux''s Infra-Red Remote Control)',0);
INSERT INTO "config_opts" VALUES(244,'livecd','!!internal use only!! DO NOT SET THIS FLAG YOURSELF!, used during livecd building',0);
INSERT INTO "config_opts" VALUES(245,'lm_sensors','Add linux lm_sensors (hardware sensors) support',0);
INSERT INTO "config_opts" VALUES(246,'lua','Enable Lua scripting support',0);
INSERT INTO "config_opts" VALUES(248,'lzo','Enable support for lzo compression',0);
INSERT INTO "config_opts" VALUES(249,'m17n-lib','Enable m17n-lib support',0);
INSERT INTO "config_opts" VALUES(250,'mad','Add support for mad (high-quality mp3 decoder library and cli frontend)',0);
INSERT INTO "config_opts" VALUES(251,'maildir','Add support for maildir (~/.maildir) style mail spools',0);
INSERT INTO "config_opts" VALUES(252,'matroska','Add support for the matroska container format (extensions .mkv, .mka and .mks)',0);
INSERT INTO "config_opts" VALUES(253,'mbox','Add support for mbox (/var/spool/mail) style mail spools',0);
INSERT INTO "config_opts" VALUES(254,'memcached','Add support for memcached',0);
INSERT INTO "config_opts" VALUES(255,'memlimit','Add memory usage limiting in supporting programs',0);
INSERT INTO "config_opts" VALUES(256,'mhash','Add support for the mhash library',0);
INSERT INTO "config_opts" VALUES(257,'migemo','Enable migemo support for Japanese',0);
INSERT INTO "config_opts" VALUES(258,'mikmod','Add libmikmod support to allow playing of SoundTracker-style music files',0);
INSERT INTO "config_opts" VALUES(259,'milter','Add sendmail mail filter (milter) support',0);
INSERT INTO "config_opts" VALUES(260,'mime','Add MIME support',0);
INSERT INTO "config_opts" VALUES(262,'mmap','Add mmap (memory map) support',0);
INSERT INTO "config_opts" VALUES(263,'mms','Support for Microsoft Media Server (MMS) streams',0);
INSERT INTO "config_opts" VALUES(264,'mng','Add support for libmng (MNG images)',0);
INSERT INTO "config_opts" VALUES(265,'modplug','Add libmodplug support for playing SoundTracker-style music files',0);
INSERT INTO "config_opts" VALUES(266,'modules','Build the kernel modules',0);
INSERT INTO "config_opts" VALUES(267,'mono','Build Mono bindings to support dotnet type stuff',0);
INSERT INTO "config_opts" VALUES(268,'motif','Add support for the Motif toolkit',0);
INSERT INTO "config_opts" VALUES(269,'mozilla','Add support for the Mozilla web-browser',0);
INSERT INTO "config_opts" VALUES(270,'mp3','Add support for reading mp3 files',0);
INSERT INTO "config_opts" VALUES(271,'mp4','Support for MP4 container format',0);
INSERT INTO "config_opts" VALUES(272,'mpeg','Add libmpeg3 support to various packages',0);
INSERT INTO "config_opts" VALUES(273,'mpi','Add MPI (Message Passing Interface) layer to the apps that support it',0);
INSERT INTO "config_opts" VALUES(274,'mplayer','Enable mplayer support for playback or encoding',0);
INSERT INTO "config_opts" VALUES(275,'msn','Enable MSN Messenger IM protocol support',0);
INSERT INTO "config_opts" VALUES(276,'mssql','Add support for Microsoft SQL Server database',0);
INSERT INTO "config_opts" VALUES(277,'mtp','Enable support for Media Transfer Protocol',0);
INSERT INTO "config_opts" VALUES(278,'mule','Add multi-language support to XEmacs',0);
INSERT INTO "config_opts" VALUES(280,'musepack','Enable support for the musepack audio codec',0);
INSERT INTO "config_opts" VALUES(281,'musicbrainz','Lookup audio metadata using MusicBrainz community service (musicbrainz.org)',0);
INSERT INTO "config_opts" VALUES(282,'mysql','Add mySQL Database support',0);
INSERT INTO "config_opts" VALUES(283,'mysqli','Add support for the improved mySQL libraries',0);
INSERT INTO "config_opts" VALUES(284,'nas','Add support for network audio sound',0);
INSERT INTO "config_opts" VALUES(286,'neXt','Enable neXt toolkit',0);
INSERT INTO "config_opts" VALUES(287,'neon','Enable optimization support for ARM NEON processors',0);
INSERT INTO "config_opts" VALUES(288,'netboot','Enable network booting',0);
INSERT INTO "config_opts" VALUES(289,'netcdf','Enable NetCDF data format support',0);
INSERT INTO "config_opts" VALUES(290,'networkmanager','Enable net-misc/networkmanager support',0);
INSERT INTO "config_opts" VALUES(291,'nis','Support for NIS/YP services',0);
INSERT INTO "config_opts" VALUES(293,'nntp','Add support for newsgroups (Network News Transfer Protocol)',0);
INSERT INTO "config_opts" VALUES(294,'nocd','Install all files required to run the application without a CD mounted',0);
INSERT INTO "config_opts" VALUES(296,'nsplugin','Build plugin for browsers supporting the Netscape plugin architecture (that is almost any modern browser)',0);
INSERT INTO "config_opts" VALUES(297,'ocaml','Add support/bindings for the Ocaml language',0);
INSERT INTO "config_opts" VALUES(298,'ocamlopt','Enable ocamlopt support (ocaml native code compiler) -- Produces faster programs (Warning: you have to disable/enable it at a global scale)',0);
INSERT INTO "config_opts" VALUES(299,'oci8','Add Oracle 8 Database Support',0);
INSERT INTO "config_opts" VALUES(300,'oci8-instant-client','Use dev-db/oracle-instantclient-basic as Oracle provider instead of requiring a full Oracle server install',0);
INSERT INTO "config_opts" VALUES(301,'odbc','Add ODBC Support (Open DataBase Connectivity)',0);
INSERT INTO "config_opts" VALUES(302,'offensive','Enable potentially offensive items in packages',0);
INSERT INTO "config_opts" VALUES(303,'ofx','Enable support for importing (and exporting) OFX (Open Financial eXchange) data files',0);
INSERT INTO "config_opts" VALUES(304,'ogg','Add support for the Ogg container format (commonly used by Vorbis, Theora and flac)',0);
INSERT INTO "config_opts" VALUES(305,'openal','Add support for the Open Audio Library',0);
INSERT INTO "config_opts" VALUES(306,'openexr','Support for the OpenEXR graphics file format',0);
INSERT INTO "config_opts" VALUES(307,'opengl','Add support for OpenGL (3D graphics)',0);
INSERT INTO "config_opts" VALUES(308,'openmp','Build support for the OpenMP (support parallel computing), requires >=sys-devel/gcc-4.2 built with USE="openmp"',0);
INSERT INTO "config_opts" VALUES(309,'oracle','Enable Oracle Database support',0);
INSERT INTO "config_opts" VALUES(310,'orc','Use dev-lang/orc for just-in-time optimization of array operations',0);
INSERT INTO "config_opts" VALUES(311,'osc','Enable support for Open Sound Control',0);
INSERT INTO "config_opts" VALUES(312,'oscar','Enable Oscar (AIM/ICQ) IM protocol support',0);
INSERT INTO "config_opts" VALUES(313,'oss','Add support for OSS (Open Sound System)',0);
INSERT INTO "config_opts" VALUES(315,'pch','Enable precompiled header support for faster compilation at the expense of disk space and memory (>=sys-devel/gcc-3.4 only)',0);
INSERT INTO "config_opts" VALUES(316,'pcmcia','Add support for PCMCIA slots/devices found on laptop computers',0);
INSERT INTO "config_opts" VALUES(317,'pcntl','Add support for process creation functions',0);
INSERT INTO "config_opts" VALUES(319,'pda','Add support for portable devices',0);
INSERT INTO "config_opts" VALUES(320,'pdf','Add general support for PDF (Portable Document Format), this replaces the pdflib and cpdflib flags',0);
INSERT INTO "config_opts" VALUES(321,'perl','Add optional support/bindings for the Perl language',0);
INSERT INTO "config_opts" VALUES(322,'php','Include support for the PHP language',0);
INSERT INTO "config_opts" VALUES(324,'plasma','Build optional KDE plasma addons',0);
INSERT INTO "config_opts" VALUES(325,'plotutils','Add support for plotutils (library for 2-D vector graphics)',0);
INSERT INTO "config_opts" VALUES(326,'png','Add support for libpng (PNG images)',0);
INSERT INTO "config_opts" VALUES(327,'policykit','Enable PolicyKit authentication support',0);
INSERT INTO "config_opts" VALUES(328,'portaudio','Add support for the crossplatform portaudio audio API',0);
INSERT INTO "config_opts" VALUES(329,'posix','Add support for POSIX-compatible functions',0);
INSERT INTO "config_opts" VALUES(330,'postgres','Add support for the postgresql database',0);
INSERT INTO "config_opts" VALUES(331,'postscript','Enable support for the PostScript language (often with ghostscript-gpl or libspectre)',0);
INSERT INTO "config_opts" VALUES(332,'ppds','Add support for automatically generated ppd (printing driver) files',0);
INSERT INTO "config_opts" VALUES(333,'prefix','Defines if a Gentoo Prefix offset installation is used',0);
INSERT INTO "config_opts" VALUES(334,'prelude','Add support/bindings for the Prelude Intrusion Detection System',0);
INSERT INTO "config_opts" VALUES(335,'profile','Add support for software performance analysis (will likely vary from ebuild to ebuild)',0);
INSERT INTO "config_opts" VALUES(336,'pulseaudio','Add support for PulseAudio sound server',0);
INSERT INTO "config_opts" VALUES(338,'qdbm','Add support for the qdbm (Quick Database Manager) library',0);
INSERT INTO "config_opts" VALUES(339,'qmail-spp','Add support for qmail SMTP plugins',0);
INSERT INTO "config_opts" VALUES(340,'qt4','Add support for the Qt GUI/Application Toolkit version 4.x',0);
INSERT INTO "config_opts" VALUES(341,'qt5','Add support for the Qt 5 application and UI framework',0);
INSERT INTO "config_opts" VALUES(342,'quicktime','Add support for OpenQuickTime',0);
INSERT INTO "config_opts" VALUES(343,'radius','Add support for RADIUS authentication',0);
INSERT INTO "config_opts" VALUES(344,'raw','Add support for raw image formats',0);
INSERT INTO "config_opts" VALUES(345,'rdp','Enables RDP/Remote Desktop support',0);
INSERT INTO "config_opts" VALUES(347,'recode','Enable support for the GNU recode library',0);
INSERT INTO "config_opts" VALUES(348,'rss','Enable support for RSS feeds',0);
INSERT INTO "config_opts" VALUES(349,'ruby','Add support/bindings for the Ruby language',0);
INSERT INTO "config_opts" VALUES(350,'samba','Add support for SAMBA (Windows File and Printer sharing)',0);
INSERT INTO "config_opts" VALUES(351,'sasl','Add support for the Simple Authentication and Security Layer',0);
INSERT INTO "config_opts" VALUES(352,'savedconfig','Use this to restore your config from /etc/portage/savedconfig ${CATEGORY}/${PN}. Make sure your USE flags allow for appropriate dependencies',0);
INSERT INTO "config_opts" VALUES(353,'scanner','Add support for scanner hardware (e.g. build the sane frontend in kdegraphics)',0);
INSERT INTO "config_opts" VALUES(354,'sctp','Support for Stream Control Transmission Protocol',0);
INSERT INTO "config_opts" VALUES(355,'sdl','Add support for Simple Direct Layer (media library)',0);
INSERT INTO "config_opts" VALUES(356,'seamonkey','Add support for the Seamonkey web-browser',0);
INSERT INTO "config_opts" VALUES(357,'seccomp','Enable seccomp (secure computing mode) to perform system call filtering at runtime to increase security of programs',0);
INSERT INTO "config_opts" VALUES(358,'selinux','!!internal use only!! Security Enhanced Linux support, this must be set by the selinux profile or breakage will occur',0);
INSERT INTO "config_opts" VALUES(359,'semantic-desktop','Cross-KDE support for semantic search and information retrieval',0);
INSERT INTO "config_opts" VALUES(360,'session','Add persistent session support',0);
INSERT INTO "config_opts" VALUES(361,'sharedmem','Add support for shared memory use',0);
INSERT INTO "config_opts" VALUES(362,'shorten','Add support for the shorten audio compressor',0);
INSERT INTO "config_opts" VALUES(363,'simplexml','Support for SimpleXML',0);
INSERT INTO "config_opts" VALUES(364,'skey','Enable S/Key (Single use password) authentication support',0);
INSERT INTO "config_opts" VALUES(365,'slang','Add support for the slang text display library (it''s like ncurses, but different)',0);
INSERT INTO "config_opts" VALUES(366,'slp','Add Service Locator Protocol support',0);
INSERT INTO "config_opts" VALUES(367,'smartcard','Enable smartcard support',0);
INSERT INTO "config_opts" VALUES(368,'smp','Enable support for multiprocessors or multicore systems',0);
INSERT INTO "config_opts" VALUES(369,'sndfile','Add support for libsndfile',0);
INSERT INTO "config_opts" VALUES(370,'snmp','Add support for the Simple Network Management Protocol if available',0);
INSERT INTO "config_opts" VALUES(371,'soap','Add support for SOAP (Simple Object Access Protocol)',0);
INSERT INTO "config_opts" VALUES(372,'sockets','Add support for tcp/ip sockets',0);
INSERT INTO "config_opts" VALUES(373,'socks5','Add support for the socks5 proxy',0);
INSERT INTO "config_opts" VALUES(374,'sound','Enable sound support',0);
INSERT INTO "config_opts" VALUES(375,'source','Zip the sources and install them',0);
INSERT INTO "config_opts" VALUES(376,'sox','Add support for Sound eXchange (SoX)',0);
INSERT INTO "config_opts" VALUES(377,'speex','Add support for the speex audio codec (used for speech)',0);
INSERT INTO "config_opts" VALUES(378,'spell','Add dictionary support',0);
INSERT INTO "config_opts" VALUES(379,'sqlite','Add support for sqlite - embedded sql database',0);
INSERT INTO "config_opts" VALUES(381,'startup-notification','Enable application startup event feedback mechanism',0);
INSERT INTO "config_opts" VALUES(382,'static','!!do not set this during bootstrap!! Causes binaries to be statically linked instead of dynamically',0);
INSERT INTO "config_opts" VALUES(384,'subversion','Enable subversion (version control system) support',0);
INSERT INTO "config_opts" VALUES(385,'suid','Enable setuid root program, with potential security risks',0);
INSERT INTO "config_opts" VALUES(386,'svg','Add support for SVG (Scalable Vector Graphics)',0);
INSERT INTO "config_opts" VALUES(387,'svga','Add support for SVGAlib (graphics library)',0);
INSERT INTO "config_opts" VALUES(388,'sybase','Add support for the Sybase SQL Database Server',0);
INSERT INTO "config_opts" VALUES(389,'sybase-ct','Add support for Sybase-CT',0);
INSERT INTO "config_opts" VALUES(390,'symlink','Force kernel ebuilds to automatically update the /usr/src/linux symlink',0);
INSERT INTO "config_opts" VALUES(391,'syslog','Enable support for syslog',0);
INSERT INTO "config_opts" VALUES(393,'sysvipc','Support for System V-compatible inter-process communication',0);
INSERT INTO "config_opts" VALUES(394,'szip','Use the szip compression library',0);
INSERT INTO "config_opts" VALUES(395,'taglib','Enable tagging support with taglib',0);
INSERT INTO "config_opts" VALUES(396,'tcl','Add support the Tcl language',0);
INSERT INTO "config_opts" VALUES(397,'tcmalloc','Use the dev-util/google-perftools libraries to replace the malloc() implementation with a possibly faster one',0);
INSERT INTO "config_opts" VALUES(398,'tcpd','Add support for TCP wrappers',0);
INSERT INTO "config_opts" VALUES(399,'test','Workaround to pull in packages needed to run with FEATURES=test. Portage-2.1.2 handles this internally, so don''t set it in make.conf/package.use anymore',0);
INSERT INTO "config_opts" VALUES(400,'theora','Add support for the Theora Video Compression Codec',0);
INSERT INTO "config_opts" VALUES(402,'tidy','Add support for HTML Tidy',0);
INSERT INTO "config_opts" VALUES(403,'tiff','Add support for the TIFF image format',0);
INSERT INTO "config_opts" VALUES(404,'timidity','Build with Timidity++ (MIDI sequencer) support',0);
INSERT INTO "config_opts" VALUES(405,'tk','Add support for Tk GUI toolkit',0);
INSERT INTO "config_opts" VALUES(406,'tokenizer','Add support for the PHP file parser',0);
INSERT INTO "config_opts" VALUES(407,'truetype','Add support for FreeType and/or FreeType2 fonts',0);
INSERT INTO "config_opts" VALUES(408,'uclibc','Enable uclibc specific patches and build or link uclibc',0);
INSERT INTO "config_opts" VALUES(409,'udev','Enable virtual/udev integration (device discovery, power and storage device support, etc)',0);
INSERT INTO "config_opts" VALUES(410,'udisks','Enable storage management support (automounting, volume monitoring, etc)',0);
INSERT INTO "config_opts" VALUES(412,'upnp','Enable UPnP port mapping support',0);
INSERT INTO "config_opts" VALUES(413,'upnp-av','Enable UPnP audio/video streaming support',0);
INSERT INTO "config_opts" VALUES(414,'upower','Enable power management support',0);
INSERT INTO "config_opts" VALUES(415,'usb','Add USB support to applications that have optional USB support (e.g. cups)',0);
INSERT INTO "config_opts" VALUES(416,'v4l','Enable support for video4linux (using linux-headers or userspace libv4l libraries)',0);
INSERT INTO "config_opts" VALUES(417,'vaapi','Enable Video Acceleration API for hardware decoding',0);
INSERT INTO "config_opts" VALUES(418,'vala','Enable bindings for dev-lang/vala',0);
INSERT INTO "config_opts" VALUES(419,'vanilla','Do not add extra patches which change default behaviour; DO NOT USE THIS ON A GLOBAL SCALE as the severity of the meaning changes drastically',0);
INSERT INTO "config_opts" VALUES(420,'vcd','Video CD support',0);
INSERT INTO "config_opts" VALUES(421,'vdpau','Enable the Video Decode and Presentation API for Unix acceleration interface',0);
INSERT INTO "config_opts" VALUES(422,'vhosts','Add support for installing web-based applications into a virtual-hosting environment',0);
INSERT INTO "config_opts" VALUES(423,'videos','Install optional video files (used in some games)',0);
INSERT INTO "config_opts" VALUES(424,'vim-syntax','Pulls in related vim syntax scripts',0);
INSERT INTO "config_opts" VALUES(425,'vnc','Enable VNC (remote desktop viewer) support',0);
INSERT INTO "config_opts" VALUES(426,'vorbis','Add support for the OggVorbis audio codec',0);
INSERT INTO "config_opts" VALUES(427,'wayland','Enable dev-libs/wayland backend',0);
INSERT INTO "config_opts" VALUES(428,'wavpack','Add support for wavpack audio compression tools',0);
INSERT INTO "config_opts" VALUES(429,'wddx','Add support for Web Distributed Data eXchange',0);
INSERT INTO "config_opts" VALUES(430,'webkit','Add support for the WebKit HTML rendering/layout engine',0);
INSERT INTO "config_opts" VALUES(431,'webp','Add support for the WebP image format',0);
INSERT INTO "config_opts" VALUES(432,'wifi','Enable wireless network functions',0);
INSERT INTO "config_opts" VALUES(433,'wmf','Add support for the Windows Metafile vector image format',0);
INSERT INTO "config_opts" VALUES(434,'wxwidgets','Add support for wxWidgets/wxGTK GUI toolkit',0);
INSERT INTO "config_opts" VALUES(435,'x264','Enable h264 encoding using x264',0);
INSERT INTO "config_opts" VALUES(436,'xattr','Add support for extended attributes (filesystem-stored metadata)',0);
INSERT INTO "config_opts" VALUES(437,'xcb','Support the X C-language Binding, a replacement for Xlib',0);
INSERT INTO "config_opts" VALUES(438,'xcomposite','Enable support for the Xorg composite extension',0);
INSERT INTO "config_opts" VALUES(439,'xemacs','Add support for XEmacs',0);
INSERT INTO "config_opts" VALUES(440,'xface','Add xface support used to allow a small image of xface format to be included in an email via the header ''X-Face''',0);
INSERT INTO "config_opts" VALUES(441,'xft','Build with support for XFT font renderer (x11-libs/libXft)',0);
INSERT INTO "config_opts" VALUES(442,'xine','Add support for the XINE movie libraries',0);
INSERT INTO "config_opts" VALUES(443,'xinerama','Add support for the xinerama X11 extension, which is mandatory if you work in multiple monitors setup',0);
INSERT INTO "config_opts" VALUES(444,'xinetd','Add support for the xinetd super-server',0);
INSERT INTO "config_opts" VALUES(445,'xml','Add support for XML files',0);
INSERT INTO "config_opts" VALUES(446,'xmlrpc','Support for xml-rpc library',0);
INSERT INTO "config_opts" VALUES(447,'xmp','Enable support for Extensible Metadata Platform (Adobe XMP)',0);
INSERT INTO "config_opts" VALUES(448,'xmpp','Enable support for Extensible Messaging and Presence Protocol (XMPP) formerly known as Jabber',0);
INSERT INTO "config_opts" VALUES(449,'xosd','Sends display using the X On Screen Display library',0);
INSERT INTO "config_opts" VALUES(450,'xpm','Add support for XPM graphics format',0);
INSERT INTO "config_opts" VALUES(451,'xscreensaver','Add support for XScreenSaver extension',0);
INSERT INTO "config_opts" VALUES(452,'xv','Add in optional support for the Xvideo extension (an X API for video playback)',0);
INSERT INTO "config_opts" VALUES(453,'xvid','Add support for xvid.org''s open-source mpeg-4 codec',0);
INSERT INTO "config_opts" VALUES(454,'yahoo','Enable Yahoo Messenger IM protocol support',0);
INSERT INTO "config_opts" VALUES(455,'yaz','Add in optional support for the Z39.50 Protocol for Information Retrieval (YAZ)',0);
INSERT INTO "config_opts" VALUES(456,'zeroconf','Support for DNS Service Discovery (DNS-SD)',0);
INSERT INTO "config_opts" VALUES(458,'zsh-completion','Enable zsh completion support',0);
INSERT INTO "config_opts" VALUES(459,'tinfo',NULL,0);
INSERT INTO "config_opts" VALUES(460,'trace',NULL,0);
INSERT INTO "config_opts" VALUES(461,'lz4',NULL,0);
INSERT INTO "config_opts" VALUES(462,'iptables',NULL,0);
INSERT INTO "config_opts" VALUES(463,'pcre16',NULL,0);
INSERT INTO "config_opts" VALUES(464,'pcre32',NULL,0);
INSERT INTO "config_opts" VALUES(465,'kdbus',NULL,0);
INSERT INTO "config_opts" VALUES(466,'elfutils',NULL,0);
INSERT INTO "config_opts" VALUES(467,'gnuefi',NULL,0);
INSERT INTO "config_opts" VALUES(468,'qrcode',NULL,0);
INSERT INTO "config_opts" VALUES(469,'pci',NULL,0);
INSERT INTO "config_opts" VALUES(470,'magic',NULL,0);
INSERT INTO "config_opts" VALUES(471,'nftables',NULL,0);
INSERT INTO "config_opts" VALUES(472,'consolekit',NULL,0);
INSERT INTO "config_opts" VALUES(473,'nullok',NULL,0);
INSERT INTO "config_opts" VALUES(474,'sha512',NULL,0);
INSERT INTO "config_opts" VALUES(475,'gpm',NULL,0);
INSERT INTO "config_opts" VALUES(476,'rpc',NULL,0);
CREATE TABLE set_pkgs (id INTEGER PRIMARY KEY AUTOINCREMENT, set_id INTEGER REFERENCES sets (id), pkg_id INTEGER REFERENCES package (id));
INSERT INTO "set_pkgs" VALUES(1,1,12);
INSERT INTO "set_pkgs" VALUES(2,1,51);
INSERT INTO "set_pkgs" VALUES(3,1,39);
INSERT INTO "set_pkgs" VALUES(4,1,60);
INSERT INTO "set_pkgs" VALUES(5,1,27);
INSERT INTO "set_pkgs" VALUES(6,1,67);
INSERT INTO "set_pkgs" VALUES(7,1,37);
INSERT INTO "set_pkgs" VALUES(8,1,38);
INSERT INTO "set_pkgs" VALUES(9,1,29);
INSERT INTO "set_pkgs" VALUES(10,1,45);
INSERT INTO "set_pkgs" VALUES(11,1,46);
INSERT INTO "set_pkgs" VALUES(12,1,6);
INSERT INTO "set_pkgs" VALUES(13,1,48);
INSERT INTO "set_pkgs" VALUES(14,1,47);
INSERT INTO "set_pkgs" VALUES(15,1,25);
INSERT INTO "set_pkgs" VALUES(16,1,50);
INSERT INTO "set_pkgs" VALUES(17,1,68);
INSERT INTO "set_pkgs" VALUES(18,1,18);
INSERT INTO "set_pkgs" VALUES(19,1,7);
INSERT INTO "set_pkgs" VALUES(20,1,23);
INSERT INTO "set_pkgs" VALUES(21,1,24);
INSERT INTO "set_pkgs" VALUES(22,1,11);
INSERT INTO "set_pkgs" VALUES(23,1,41);
INSERT INTO "set_pkgs" VALUES(24,1,53);
INSERT INTO "set_pkgs" VALUES(25,1,55);
INSERT INTO "set_pkgs" VALUES(26,1,56);
INSERT INTO "set_pkgs" VALUES(27,1,43);
INSERT INTO "set_pkgs" VALUES(28,1,3);
INSERT INTO "set_pkgs" VALUES(29,1,1);
INSERT INTO "set_pkgs" VALUES(30,1,20);
INSERT INTO "set_pkgs" VALUES(31,1,13);
INSERT INTO "set_pkgs" VALUES(32,1,19);
INSERT INTO "set_pkgs" VALUES(33,1,65);
INSERT INTO "set_pkgs" VALUES(34,1,40);
INSERT INTO "set_pkgs" VALUES(35,1,44);
INSERT INTO "set_pkgs" VALUES(36,1,42);
INSERT INTO "set_pkgs" VALUES(37,1,2);
INSERT INTO "set_pkgs" VALUES(38,1,59);
INSERT INTO "set_pkgs" VALUES(39,1,69);
INSERT INTO "set_pkgs" VALUES(40,1,52);
INSERT INTO "set_pkgs" VALUES(41,1,66);
INSERT INTO "set_pkgs" VALUES(42,1,58);
INSERT INTO "set_pkgs" VALUES(43,1,91);
CREATE TABLE pkg_opts (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id), opt_id INTEGER REFERENCES config_opts (id), "default_value" BOOLEAN DEFAULT (0), opt_alias_id INTEGER REFERENCES config_aliases (id));
INSERT INTO "pkg_opts" VALUES(1,4,1,0,NULL);
INSERT INTO "pkg_opts" VALUES(3,13,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(4,42,5,1,1);
INSERT INTO "pkg_opts" VALUES(5,42,2,0,1);
INSERT INTO "pkg_opts" VALUES(6,42,6,1,1);
INSERT INTO "pkg_opts" VALUES(7,61,7,1,NULL);
INSERT INTO "pkg_opts" VALUES(8,61,5,1,NULL);
INSERT INTO "pkg_opts" VALUES(10,61,8,1,NULL);
INSERT INTO "pkg_opts" VALUES(12,30,5,1,NULL);
INSERT INTO "pkg_opts" VALUES(13,30,10,1,NULL);
INSERT INTO "pkg_opts" VALUES(14,30,11,0,NULL);
INSERT INTO "pkg_opts" VALUES(15,30,13,0,NULL);
INSERT INTO "pkg_opts" VALUES(16,46,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(17,46,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(18,46,15,0,NULL);
INSERT INTO "pkg_opts" VALUES(19,46,8,0,NULL);
INSERT INTO "pkg_opts" VALUES(20,46,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(21,46,16,0,NULL);
INSERT INTO "pkg_opts" VALUES(22,47,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(23,5,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(24,5,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(25,5,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(27,48,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(28,48,10,0,NULL);
INSERT INTO "pkg_opts" VALUES(29,48,19,0,NULL);
INSERT INTO "pkg_opts" VALUES(30,21,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(31,21,20,0,NULL);
INSERT INTO "pkg_opts" VALUES(32,51,20,0,NULL);
INSERT INTO "pkg_opts" VALUES(33,51,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(34,19,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(35,19,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(37,6,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(38,6,22,0,NULL);
INSERT INTO "pkg_opts" VALUES(39,6,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(40,27,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(41,28,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(42,10,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(43,10,22,1,NULL);
INSERT INTO "pkg_opts" VALUES(44,10,23,0,NULL);
INSERT INTO "pkg_opts" VALUES(45,10,24,0,NULL);
INSERT INTO "pkg_opts" VALUES(46,10,25,0,NULL);
INSERT INTO "pkg_opts" VALUES(48,10,27,0,NULL);
INSERT INTO "pkg_opts" VALUES(49,10,28,0,NULL);
INSERT INTO "pkg_opts" VALUES(50,10,29,0,NULL);
INSERT INTO "pkg_opts" VALUES(51,10,30,0,NULL);
INSERT INTO "pkg_opts" VALUES(52,10,31,0,NULL);
INSERT INTO "pkg_opts" VALUES(53,10,32,0,NULL);
INSERT INTO "pkg_opts" VALUES(54,10,33,0,NULL);
INSERT INTO "pkg_opts" VALUES(55,10,35,0,NULL);
INSERT INTO "pkg_opts" VALUES(57,10,37,0,NULL);
INSERT INTO "pkg_opts" VALUES(58,10,39,0,NULL);
INSERT INTO "pkg_opts" VALUES(59,43,7,1,NULL);
INSERT INTO "pkg_opts" VALUES(61,43,40,0,NULL);
INSERT INTO "pkg_opts" VALUES(62,43,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(63,43,39,0,NULL);
INSERT INTO "pkg_opts" VALUES(64,43,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(65,56,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(66,57,8,0,NULL);
INSERT INTO "pkg_opts" VALUES(67,20,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(68,20,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(69,20,41,0,NULL);
INSERT INTO "pkg_opts" VALUES(70,20,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(71,20,8,0,NULL);
INSERT INTO "pkg_opts" VALUES(72,49,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(73,6,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(75,66,10,0,NULL);
INSERT INTO "pkg_opts" VALUES(76,66,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(77,65,43,0,NULL);
INSERT INTO "pkg_opts" VALUES(78,65,44,0,NULL);
INSERT INTO "pkg_opts" VALUES(79,56,45,0,NULL);
INSERT INTO "pkg_opts" VALUES(83,37,46,0,NULL);
INSERT INTO "pkg_opts" VALUES(87,37,47,1,NULL);
INSERT INTO "pkg_opts" VALUES(88,64,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(89,65,48,0,NULL);
INSERT INTO "pkg_opts" VALUES(90,65,49,0,NULL);
INSERT INTO "pkg_opts" VALUES(91,65,50,0,NULL);
INSERT INTO "pkg_opts" VALUES(92,65,51,0,NULL);
INSERT INTO "pkg_opts" VALUES(93,65,52,0,NULL);
INSERT INTO "pkg_opts" VALUES(94,65,53,0,NULL);
INSERT INTO "pkg_opts" VALUES(95,65,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(96,65,6,0,NULL);
INSERT INTO "pkg_opts" VALUES(97,65,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(98,65,55,0,NULL);
INSERT INTO "pkg_opts" VALUES(99,16,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(100,16,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(101,17,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(102,17,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(103,22,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(104,22,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(105,23,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(106,23,56,0,NULL);
INSERT INTO "pkg_opts" VALUES(107,23,57,0,NULL);
INSERT INTO "pkg_opts" VALUES(108,23,44,0,NULL);
INSERT INTO "pkg_opts" VALUES(109,23,58,1,NULL);
INSERT INTO "pkg_opts" VALUES(110,23,59,0,NULL);
INSERT INTO "pkg_opts" VALUES(111,23,60,0,NULL);
INSERT INTO "pkg_opts" VALUES(112,23,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(116,52,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(117,53,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(118,53,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(119,58,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(120,58,62,0,NULL);
INSERT INTO "pkg_opts" VALUES(121,59,40,0,NULL);
INSERT INTO "pkg_opts" VALUES(122,59,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(123,59,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(124,59,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(125,59,10,1,NULL);
INSERT INTO "pkg_opts" VALUES(126,59,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(127,59,62,0,NULL);
INSERT INTO "pkg_opts" VALUES(128,59,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(129,59,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(130,60,46,0,NULL);
INSERT INTO "pkg_opts" VALUES(131,60,47,1,NULL);
INSERT INTO "pkg_opts" VALUES(132,60,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(133,60,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(134,60,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(135,62,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(136,31,10,0,NULL);
INSERT INTO "pkg_opts" VALUES(137,45,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(138,45,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(139,3,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(140,4,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(141,15,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(142,15,6,0,NULL);
INSERT INTO "pkg_opts" VALUES(143,15,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(144,18,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(145,29,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(146,33,46,0,NULL);
INSERT INTO "pkg_opts" VALUES(147,33,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(148,33,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(149,24,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(150,24,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(151,44,40,1,NULL);
INSERT INTO "pkg_opts" VALUES(152,44,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(153,44,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(154,44,62,0,NULL);
INSERT INTO "pkg_opts" VALUES(155,44,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(156,68,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(157,68,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(158,69,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(159,69,63,0,NULL);
INSERT INTO "pkg_opts" VALUES(160,69,44,0,NULL);
INSERT INTO "pkg_opts" VALUES(161,69,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(162,69,55,0,NULL);
INSERT INTO "pkg_opts" VALUES(163,70,44,0,NULL);
INSERT INTO "pkg_opts" VALUES(164,70,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(165,70,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(166,70,55,1,NULL);
INSERT INTO "pkg_opts" VALUES(167,70,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(168,70,20,0,NULL);
INSERT INTO "pkg_opts" VALUES(169,71,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(170,71,55,1,NULL);
INSERT INTO "pkg_opts" VALUES(171,71,43,0,NULL);
INSERT INTO "pkg_opts" VALUES(172,35,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(173,35,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(174,15,22,1,NULL);
INSERT INTO "pkg_opts" VALUES(179,54,4,0,NULL);
INSERT INTO "pkg_opts" VALUES(180,73,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(181,23,461,1,NULL);
INSERT INTO "pkg_opts" VALUES(182,15,459,0,NULL);
INSERT INTO "pkg_opts" VALUES(183,15,460,0,NULL);
INSERT INTO "pkg_opts" VALUES(184,74,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(185,74,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(186,74,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(187,74,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(188,11,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(189,68,291,0,NULL);
INSERT INTO "pkg_opts" VALUES(190,77,46,0,NULL);
INSERT INTO "pkg_opts" VALUES(191,77,41,0,NULL);
INSERT INTO "pkg_opts" VALUES(192,77,154,0,NULL);
INSERT INTO "pkg_opts" VALUES(193,77,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(194,77,33,0,NULL);
INSERT INTO "pkg_opts" VALUES(195,77,291,0,NULL);
INSERT INTO "pkg_opts" VALUES(196,78,22,0,NULL);
INSERT INTO "pkg_opts" VALUES(197,78,396,0,NULL);
INSERT INTO "pkg_opts" VALUES(198,79,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(199,79,50,0,NULL);
INSERT INTO "pkg_opts" VALUES(200,79,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(201,18,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(202,23,60,0,NULL);
INSERT INTO "pkg_opts" VALUES(203,52,462,1,NULL);
INSERT INTO "pkg_opts" VALUES(204,22,59,0,NULL);
INSERT INTO "pkg_opts" VALUES(205,22,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(206,81,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(207,81,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(209,82,99,0,NULL);
INSERT INTO "pkg_opts" VALUES(210,82,22,1,NULL);
INSERT INTO "pkg_opts" VALUES(211,82,463,0,NULL);
INSERT INTO "pkg_opts" VALUES(212,82,10,1,NULL);
INSERT INTO "pkg_opts" VALUES(213,82,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(214,82,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(215,82,18,0,NULL);
INSERT INTO "pkg_opts" VALUES(216,82,464,0,NULL);
INSERT INTO "pkg_opts" VALUES(217,23,357,1,NULL);
INSERT INTO "pkg_opts" VALUES(218,84,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(219,85,357,0,NULL);
INSERT INTO "pkg_opts" VALUES(220,85,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(221,85,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(222,46,15,0,NULL);
INSERT INTO "pkg_opts" VALUES(223,64,15,0,NULL);
INSERT INTO "pkg_opts" VALUES(224,64,215,0,NULL);
INSERT INTO "pkg_opts" VALUES(225,64,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(226,23,465,0,NULL);
INSERT INTO "pkg_opts" VALUES(227,23,56,0,NULL);
INSERT INTO "pkg_opts" VALUES(228,23,466,0,NULL);
INSERT INTO "pkg_opts" VALUES(229,23,63,1,NULL);
INSERT INTO "pkg_opts" VALUES(230,23,467,0,NULL);
INSERT INTO "pkg_opts" VALUES(231,23,327,0,NULL);
INSERT INTO "pkg_opts" VALUES(232,23,468,0,NULL);
INSERT INTO "pkg_opts" VALUES(233,23,55,0,NULL);
INSERT INTO "pkg_opts" VALUES(234,23,61,0,NULL);
INSERT INTO "pkg_opts" VALUES(235,87,12,1,NULL);
INSERT INTO "pkg_opts" VALUES(236,87,409,1,NULL);
INSERT INTO "pkg_opts" VALUES(237,87,415,1,NULL);
INSERT INTO "pkg_opts" VALUES(238,87,469,1,NULL);
INSERT INTO "pkg_opts" VALUES(239,91,41,0,NULL);
INSERT INTO "pkg_opts" VALUES(241,91,9,0,NULL);
INSERT INTO "pkg_opts" VALUES(242,91,62,0,NULL);
INSERT INTO "pkg_opts" VALUES(243,92,54,0,NULL);
INSERT INTO "pkg_opts" VALUES(244,92,10,0,NULL);
INSERT INTO "pkg_opts" VALUES(245,92,199,0,NULL);
INSERT INTO "pkg_opts" VALUES(246,92,59,0,NULL);
INSERT INTO "pkg_opts" VALUES(247,92,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(248,92,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(249,93,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(250,94,9,0,NULL);
INSERT INTO "pkg_opts" VALUES(251,94,40,0,NULL);
INSERT INTO "pkg_opts" VALUES(252,94,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(253,94,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(254,94,470,1,NULL);
INSERT INTO "pkg_opts" VALUES(255,95,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(256,96,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(257,96,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(258,97,116,0,NULL);
INSERT INTO "pkg_opts" VALUES(259,97,17,0,NULL);
INSERT INTO "pkg_opts" VALUES(260,97,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(261,102,40,0,NULL);
INSERT INTO "pkg_opts" VALUES(262,102,341,0,NULL);
INSERT INTO "pkg_opts" VALUES(263,103,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(264,103,99,1,NULL);
INSERT INTO "pkg_opts" VALUES(265,103,148,0,NULL);
INSERT INTO "pkg_opts" VALUES(266,103,197,1,NULL);
INSERT INTO "pkg_opts" VALUES(267,103,240,0,NULL);
INSERT INTO "pkg_opts" VALUES(268,103,461,0,NULL);
INSERT INTO "pkg_opts" VALUES(269,103,59,1,NULL);
INSERT INTO "pkg_opts" VALUES(270,103,248,0,NULL);
INSERT INTO "pkg_opts" VALUES(271,103,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(272,103,6,1,NULL);
INSERT INTO "pkg_opts" VALUES(274,103,18,1,NULL);
INSERT INTO "pkg_opts" VALUES(275,103,8,0,NULL);
INSERT INTO "pkg_opts" VALUES(276,104,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(277,75,99,0,NULL);
INSERT INTO "pkg_opts" VALUES(278,75,21,0,NULL);
INSERT INTO "pkg_opts" VALUES(279,94,378,1,NULL);
INSERT INTO "pkg_opts" VALUES(280,66,199,0,NULL);
INSERT INTO "pkg_opts" VALUES(281,80,6,1,NULL);
INSERT INTO "pkg_opts" VALUES(282,76,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(283,43,22,1,NULL);
INSERT INTO "pkg_opts" VALUES(284,81,471,0,NULL);
INSERT INTO "pkg_opts" VALUES(285,81,14,0,NULL);
INSERT INTO "pkg_opts" VALUES(286,91,472,0,NULL);
INSERT INTO "pkg_opts" VALUES(287,91,473,1,NULL);
INSERT INTO "pkg_opts" VALUES(288,91,474,1,NULL);
INSERT INTO "pkg_opts" VALUES(289,105,7,0,NULL);
INSERT INTO "pkg_opts" VALUES(290,105,42,0,NULL);
INSERT INTO "pkg_opts" VALUES(291,105,327,0,NULL);
INSERT INTO "pkg_opts" VALUES(292,59,385,1,NULL);
INSERT INTO "pkg_opts" VALUES(293,59,409,0,NULL);
INSERT INTO "pkg_opts" VALUES(294,106,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(295,107,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(296,15,475,0,NULL);
INSERT INTO "pkg_opts" VALUES(297,55,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(298,50,65,2,NULL);
INSERT INTO "pkg_opts" VALUES(299,52,9,0,NULL);
INSERT INTO "pkg_opts" VALUES(300,52,46,0,NULL);
INSERT INTO "pkg_opts" VALUES(301,108,127,0,NULL);
INSERT INTO "pkg_opts" VALUES(302,108,260,0,NULL);
INSERT INTO "pkg_opts" VALUES(303,108,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(304,108,8,0,NULL);
INSERT INTO "pkg_opts" VALUES(305,109,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(306,3,166,0,NULL);
INSERT INTO "pkg_opts" VALUES(307,3,335,0,NULL);
INSERT INTO "pkg_opts" VALUES(308,3,385,0,NULL);
INSERT INTO "pkg_opts" VALUES(309,3,476,1,NULL);
INSERT INTO "pkg_opts" VALUES(310,110,5,0,NULL);
INSERT INTO "pkg_opts" VALUES(311,110,55,0,NULL);
INSERT INTO "pkg_opts" VALUES(312,110,2,0,NULL);
INSERT INTO "pkg_opts" VALUES(313,29,459,0,NULL);
INSERT INTO "pkg_opts" VALUES(314,27,2,0,NULL);
CREATE TABLE packages_sys (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id) ON DELETE CASCADE);
CREATE TABLE package_meta (id INTEGER PRIMARY KEY AUTOINCREMENT, cat_id INTEGER REFERENCES category (id) ON DELETE CASCADE, name TEXT);
INSERT INTO "package_meta" VALUES(1,141,'linux-headers');
INSERT INTO "package_meta" VALUES(2,131,'man-pages');
INSERT INTO "package_meta" VALUES(3,142,'glibc');
INSERT INTO "package_meta" VALUES(4,142,'zlib');
INSERT INTO "package_meta" VALUES(5,131,'file');
INSERT INTO "package_meta" VALUES(6,136,'binutils');
INSERT INTO "package_meta" VALUES(7,39,'gmp');
INSERT INTO "package_meta" VALUES(8,39,'mpfr');
INSERT INTO "package_meta" VALUES(9,39,'mpc');
INSERT INTO "package_meta" VALUES(10,136,'gcc');
INSERT INTO "package_meta" VALUES(11,142,'timezone-data');
INSERT INTO "package_meta" VALUES(13,4,'bzip2');
INSERT INTO "package_meta" VALUES(14,48,'pkg-config');
INSERT INTO "package_meta" VALUES(15,142,'ncurses');
INSERT INTO "package_meta" VALUES(16,131,'attr');
INSERT INTO "package_meta" VALUES(17,131,'acl');
INSERT INTO "package_meta" VALUES(18,142,'libcap');
INSERT INTO "package_meta" VALUES(19,131,'sed');
INSERT INTO "package_meta" VALUES(20,131,'shadow');
INSERT INTO "package_meta" VALUES(21,131,'grep');
INSERT INTO "package_meta" VALUES(22,131,'kmod');
INSERT INTO "package_meta" VALUES(23,131,'systemd');
INSERT INTO "package_meta" VALUES(24,144,'psmisc');
INSERT INTO "package_meta" VALUES(25,142,'iana-etc');
INSERT INTO "package_meta" VALUES(26,136,'m4');
INSERT INTO "package_meta" VALUES(27,136,'bison');
INSERT INTO "package_meta" VALUES(28,136,'flex');
INSERT INTO "package_meta" VALUES(29,142,'readline');
INSERT INTO "package_meta" VALUES(30,25,'bash');
INSERT INTO "package_meta" VALUES(31,136,'bc');
INSERT INTO "package_meta" VALUES(32,136,'libtool');
INSERT INTO "package_meta" VALUES(33,142,'gdbm');
INSERT INTO "package_meta" VALUES(34,53,'gperf');
INSERT INTO "package_meta" VALUES(35,39,'expat');
INSERT INTO "package_meta" VALUES(36,108,'inetutils');
INSERT INTO "package_meta" VALUES(37,38,'perl');
INSERT INTO "package_meta" VALUES(38,43,'XML-Parser');
INSERT INTO "package_meta" VALUES(39,53,'intltool');
INSERT INTO "package_meta" VALUES(40,136,'autoconf');
INSERT INTO "package_meta" VALUES(41,136,'automake');
INSERT INTO "package_meta" VALUES(42,4,'xz');
INSERT INTO "package_meta" VALUES(43,136,'gettext');
INSERT INTO "package_meta" VALUES(44,144,'procps');
INSERT INTO "package_meta" VALUES(45,139,'e2fsprogs');
INSERT INTO "package_meta" VALUES(46,131,'coreutils');
INSERT INTO "package_meta" VALUES(47,131,'diffutils');
INSERT INTO "package_meta" VALUES(48,131,'gawk');
INSERT INTO "package_meta" VALUES(49,131,'findutils');
INSERT INTO "package_meta" VALUES(50,131,'groff');
INSERT INTO "package_meta" VALUES(51,131,'less');
INSERT INTO "package_meta" VALUES(52,131,'iproute2');
INSERT INTO "package_meta" VALUES(53,131,'kbd');
INSERT INTO "package_meta" VALUES(54,4,'gzip');
INSERT INTO "package_meta" VALUES(55,39,'libpipeline');
INSERT INTO "package_meta" VALUES(56,136,'make');
INSERT INTO "package_meta" VALUES(57,136,'patch');
INSERT INTO "package_meta" VALUES(58,131,'dbus');
INSERT INTO "package_meta" VALUES(59,131,'util-linux');
INSERT INTO "package_meta" VALUES(60,131,'man-db');
INSERT INTO "package_meta" VALUES(61,4,'tar');
INSERT INTO "package_meta" VALUES(62,131,'texinfo');
INSERT INTO "package_meta" VALUES(64,39,'openssl');
INSERT INTO "package_meta" VALUES(65,108,'curl');
INSERT INTO "package_meta" VALUES(66,31,'sqlite');
INSERT INTO "package_meta" VALUES(67,131,'which');
INSERT INTO "package_meta" VALUES(68,131,'net-tools');
INSERT INTO "package_meta" VALUES(69,108,'iputils');
INSERT INTO "package_meta" VALUES(70,108,'wget');
INSERT INTO "package_meta" VALUES(71,108,'openssh');
INSERT INTO "package_meta" VALUES(72,131,'baselayout');
INSERT INTO "package_meta" VALUES(73,4,'lz4');
INSERT INTO "package_meta" VALUES(74,142,'cracklib');
INSERT INTO "package_meta" VALUES(75,4,'unzip');
INSERT INTO "package_meta" VALUES(76,39,'libltdl');
INSERT INTO "package_meta" VALUES(77,142,'pam');
INSERT INTO "package_meta" VALUES(78,142,'db');
INSERT INTO "package_meta" VALUES(79,106,'libtirpc');
INSERT INTO "package_meta" VALUES(80,38,'tcl');
INSERT INTO "package_meta" VALUES(81,101,'iptables');
INSERT INTO "package_meta" VALUES(82,39,'libpcre');
INSERT INTO "package_meta" VALUES(83,2,'perl-cleaner');
INSERT INTO "package_meta" VALUES(84,142,'libseccomp');
INSERT INTO "package_meta" VALUES(85,19,'pax-utils');
INSERT INTO "package_meta" VALUES(86,19,'ca-certificates');
INSERT INTO "package_meta" VALUES(87,131,'hwids');
INSERT INTO "package_meta" VALUES(88,43,'libintl-perl');
INSERT INTO "package_meta" VALUES(89,43,'Unicode-EastAsianWidth');
INSERT INTO "package_meta" VALUES(90,43,'Text-Unidecode');
INSERT INTO "package_meta" VALUES(91,132,'pambase');
INSERT INTO "package_meta" VALUES(92,39,'libxml2');
INSERT INTO "package_meta" VALUES(93,39,'icu');
INSERT INTO "package_meta" VALUES(94,11,'nano');
INSERT INTO "package_meta" VALUES(95,39,'libgcrypt');
INSERT INTO "package_meta" VALUES(96,39,'libgpg-error');
INSERT INTO "package_meta" VALUES(97,39,'libxslt');
INSERT INTO "package_meta" VALUES(98,26,'xmlto');
INSERT INTO "package_meta" VALUES(99,26,'docbook-xsl-stylesheets');
INSERT INTO "package_meta" VALUES(100,26,'docbook-xml-dtd');
INSERT INTO "package_meta" VALUES(101,26,'build-docbook-catalog');
INSERT INTO "package_meta" VALUES(102,53,'cmake');
INSERT INTO "package_meta" VALUES(103,4,'libarchive');
INSERT INTO "package_meta" VALUES(104,39,'lzo');
INSERT INTO "package_meta" VALUES(105,132,'consolekit');
INSERT INTO "package_meta" VALUES(106,100,'libidn2');
INSERT INTO "package_meta" VALUES(107,39,'libunistring');
INSERT INTO "package_meta" VALUES(108,39,'glib');
INSERT INTO "package_meta" VALUES(109,39,'libffi');
INSERT INTO "package_meta" VALUES(110,8,'rhash');
CREATE TABLE postinstall_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id), opt_val_trig INTEGER);
INSERT INTO "postinstall_cmds" VALUES(1,1,'find ${BIN_DIR}/usr/include \( -name .install -o -name ..install.cmd \) -delete','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(2,3,'cp ${SRC_DIR}/${PS}-${PV}/nscd/nscd.conf ${BIN_DIR}/etc/nscd.conf','${BIN_DIR}/etc',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(3,3,'mkdir -p ${BIN_DIR}/var/cache/nscd',NULL,NULL,1);
INSERT INTO "postinstall_cmds" VALUES(4,3,'install -Dm644 ${SRC_DIR}/${PS}-${PV}/nscd/nscd.tmpfiles ${BIN_DIR}/usr/lib64/tmpfiles.d/nscd.conf',NULL,NULL,1);
INSERT INTO "postinstall_cmds" VALUES(5,3,'install -Dm644 ${SRC_DIR}/${PS}-${PV}/nscd/nscd.service ${BIN_DIR}/lib64/systemd/system/nscd.service',NULL,NULL,1);
INSERT INTO "postinstall_cmds" VALUES(6,3,'cat > ${BIN_DIR}/etc/nsswitch.conf << "EOF"
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
',NULL,NULL,1);
INSERT INTO "postinstall_cmds" VALUES(7,3,'mkdir -p ${BIN_DIR}/usr/lib64/locale','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(11,3,'install -m  774 ${PKG_SOURCES}/locale-gen ${BIN_DIR}/usr/sbin/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(12,3,'install -m  644 ${PKG_SOURCES}/locale.conf ${BIN_DIR}/etc/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(14,5,'mkdir -p ${BIN_DIR}/lib64/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(15,5,'mv ${BIN_DIR}/usr/lib64/libz.so.* ${BIN_DIR}/lib64/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(18,5,'ln -sfv ../../lib64/$(readlink ${BIN_DIR}/lib64/libz.so) ${BIN_DIR}/usr/lib64/libz.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(20,11,'ln -s ../usr/bin/cpp ${BIN_DIR}/lib64/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(21,11,'ln -s gcc ${BIN_DIR}/usr/bin/cc','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(22,11,'install -dm755 ${BIN_DIR}/usr/lib64/bfd-plugins','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(23,11,'ln -sf ../../libexec/gcc/$(gcc -dumpmachine)/${PV}/liblto_plugin.so ${BIN_DIR}/usr/lib64/bfd-plugins/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(24,11,'mkdir -p ${BIN_DIR}/usr/share/gdb/auto-load/usr/lib','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(25,11,'mv ${BIN_DIR}/usr/lib64/*gdb.py ${BIN_DIR}/usr/share/gdb/auto-load/usr/lib','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(26,12,'mkdir -p ${BIN_DIR}/{bin,lib64,usr/lib64,usr/include}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(27,12,'cp bzip2-shared ${BIN_DIR}/bin/bzip2','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(28,12,'cp -a libbz2.so* ${BIN_DIR}/lib64/','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(29,12,'ln -s ../../lib64/libbz2.so.1.0 ${BIN_DIR}/usr/lib64/libbz2.so','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(30,12,'rm ${BIN_DIR}/usr/bin/{bunzip2,bzcat,bzip2}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(31,12,'ln -sf bzip2 ${BIN_DIR}/bin/bunzip2','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(33,12,'ln -sf bzip2 ${BIN_DIR}/bin/bzcat','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(34,14,'mkdir -p ${BIN_DIR}/{lib64,usr/lib64/pkgconfig}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(35,14,'mv -v ${BIN_DIR}/usr/lib64/libncursesw.so.6* ${BIN_DIR}/lib64/','${BIN_DIR}',21,1);
INSERT INTO "postinstall_cmds" VALUES(36,14,'ln -sfv ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libncursesw.so) ${BIN_DIR}/usr/lib64/libncursesw.so','${BIN_DIR}',21,1);
INSERT INTO "postinstall_cmds" VALUES(37,14,'for lib in ncurses form panel menu ; do
    rm -f                    ${BIN_DIR}/usr/lib64/lib${lib}.so
    echo "INPUT(-l${lib}w)" > ${BIN_DIR}/usr/lib/lib${lib}.so
    ln -sf ${lib}w.pc        ${BIN_DIR}/usr/lib64/pkgconfig/${lib}.pc
done','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(38,14,'rm vf  ${BIN_DIR}/usr/lib64/libcursesw.so','${BIN_DIR}',21,1);
INSERT INTO "postinstall_cmds" VALUES(39,14,'echo "INPUT(-lncursesw)" > ${BIN_DIR}/usr/lib64/libcursesw.so','${BIN_DIR}',21,1);
INSERT INTO "postinstall_cmds" VALUES(43,15,'chmod 0755 ${BIN_DIR}/usr/lib64/libattr.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(44,15,'mv ${BIN_DIR}/usr/lib64/libattr.so.* ${BIN_DIR}/lib64/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(45,15,'ln -sfv ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libattr.so) ${BIN_DIR}/usr/lib64/libattr.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(46,16,'chmod 755 ${BIN_DIR}/usr/lib64/libacl.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(47,16,'mv ${BIN_DIR}/usr/lib64/libacl.so.* ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(48,16,'ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libacl.so) ${BIN_DIR}/usr/lib64/libacl.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(49,17,'chmod -v 755 ${BIN_DIR}/usr/lib64/libcap.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(50,17,'mv -v ${BIN_DIR}/usr/lib64/libcap.so.* ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(51,17,'ln -sfv ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libcap.so) ${BIN_DIR}/usr/lib64/libcap.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(52,19,'mv -v ${BIN_DIR}/usr/bin/passwd ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(53,20,'mkdir -p ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(54,20,'mv ${BIN_DIR}/usr/bin/fuser ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(55,20,'mv ${BIN_DIR}/usr/bin/killall ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(56,24,'ln -s flex ${BIN_DIR}/usr/bin/lex','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(57,26,'mv ${BIN_DIR}/usr/lib64/lib{readline,history}.so.* ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(58,26,'ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libreadline.so) ${BIN_DIR}/usr/lib64/libreadline.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(59,26,'ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libhistory.so ) ${BIN_DIR}/usr/lib64/libhistory.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(60,27,'mv -f ${BIN_DIR}/usr/bin/bash ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(61,27,'ln -s bash ${BIN_DIR}/bin/sh','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(62,33,'mkdir -p ${BIN_DIR}/{bin,sbin}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(63,33,'mv ${BIN_DIR}/usr/bin/{hostname,ping,ping6,traceroute} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(64,33,'mv ${BIN_DIR}/usr/bin/ifconfig ${BIN_DIR}/sbin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(65,39,'mkdir -p ${BIN_DIR}/{bin,lib64}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(66,39,'mv ${BIN_DIR}/usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(67,39,'mv ${BIN_DIR}/usr/lib64/liblzma.so.* ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(68,39,'ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/liblzma.so) ${BIN_DIR}/usr/lib64/liblzma.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(69,40,'mkdir -p ${BIN_DIR}/sbin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(70,40,'for target in depmod insmod lsmod modinfo modprobe rmmod; do
  ln -sf ../bin/kmod ${BIN_DIR}/sbin/$target
done','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(71,40,'ln -sf kmod ${BIN_DIR}/bin/lsmod','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(72,41,'chmod 0755 ${BIN_DIR}/usr/lib/preloadable_libintl.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(73,42,'mkdir -p ${BIN_DIR}/sbin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(74,42,'rm -rf ${BIN_DIR}/usr/lib64/rpm','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(75,42,'ln -sf /usr/lib64/systemd/resolv.conf ${BIN_DIR}/etc/resolv.conf','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(76,42,'for tool in runlevel reboot shutdown poweroff halt telinit; do
    ln -sf /usr/bin/systemctl ${BIN_DIR}/sbin/${tool}
done','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(77,42,'ln -sf /usr/lib64/systemd/systemd ${BIN_DIR}/sbin/init','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(78,42,'mkdir -p ${BIN_DIR}/etc/pam.d/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(79,42,'cat >> ${BIN_DIR}/etc/pam.d/system-session << "EOF" &&
# Begin Systemd addition

session   required    pam_loginuid.so
session   optional    pam_systemd.so

# End Systemd addition
EOF
','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(80,42,'cat > ${BIN_DIR}/etc/pam.d/systemd-user << "EOF"
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
','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(85,43,'mkdir ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(86,43,'mv ${BIN_DIR}/usr/lib64/libprocps.so.* ${BIN_DIR}/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(87,43,'ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/libprocps.so) ${BIN_DIR}/usr/lib64/libprocps.so','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(88,44,'chmod -v u+w ${BIN_DIR}/usr/lib/{libcom_err,libe2p,libext2fs,libss}.a','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(89,45,'mkdir -p ${BIN_DIR}/{bin,usr/bin,usr/sbin,usr/share/man/man8}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(90,45,'mv ${BIN_DIR}/usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(91,45,'mv ${BIN_DIR}/usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(92,45,'mv ${BIN_DIR}/usr/bin/{rmdir,stty,sync,true,uname} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(93,45,'mv ${BIN_DIR}/usr/bin/chroot ${BIN_DIR}/usr/sbin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(94,45,'mv ${BIN_DIR}/usr/share/man/man1/chroot.1 ${BIN_DIR}/usr/share/man/man8/chroot.8','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(95,45,'sed -i s/\"1\"/\"8\"/1 ${BIN_DIR}/usr/share/man/man8/chroot.8','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(96,45,'mv  ${BIN_DIR}/usr/bin/{head,sleep,nice,test,[} ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(97,48,'mkdir -p ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(98,48,'mv -v ${BIN_DIR}/usr/bin/find ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(99,48,'sed -i ''s|find:=${BINDIR}|find:=/bin|'' ${BIN_DIR}/usr/bin/updatedb','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(100,51,'mkdir -p ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(101,51,'mv ${BIN_DIR}/usr/bin/gzip ${BIN_DIR}/bin','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(102,59,'sed -i "s:man root:root root:g" ${BIN_DIR}/usr/lib/tmpfiles.d/man-db.conf','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(103,7,'find . -name "*.la" -delete','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(104,12,'cp bzlib.h ${BIN_DIR}/usr/include/','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(106,69,'install -v -m755    contrib/ssh-copy-id ${BIN_DIR}/usr/bin','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(107,69,'sed -i -e "/^#UsePAM /s:.*:UsePAM yes:" -e "/^#PasswordAuthentication /s:.*:PasswordAuthentication no:" -e "/^#PrintMotd /s:.*:PrintMotd no:" -e "/^#PrintLastLog /s:.*:PrintLastLog no:" ${BIN_DIR}/etc/ssh/sshd_config','${BIN_DIR}',42,1);
INSERT INTO "postinstall_cmds" VALUES(109,78,'ln -sfv ../../sbin/xtables-multi $BIN_DIR}/usr/bin/iptables-xml','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(110,78,'for file in ip4tc ip6tc ipq iptc xtables
do
  mv ${BIN_DIR}/usr/lib64/lib${file}.so.* ${BUILD_DIR}/lib64 &&
  ln -sf ../../lib/$(readlink ${BIN_DIR}/usr/lib64/lib${file}.so) ${BIN_DIR}/usr/lib64/lib${file}.so
done','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(111,78,'make DESTDIR=${BIN_DIR} install-iptables','${SRC_DIR}/blfs-systemd-units-20160602',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(112,77,'mkdir -p ${BIN_DIR}/lib','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(114,77,'mv ${BIN_DIR}/usr/lib/libtirpc.so.* ${BIN_DIR}/lib','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(115,77,'ln -sf ../../lib/libtirpc.so.3.0.0 ${BIN_DIR}/usr/lib/libtirpc.so','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(117,84,'udevadm hwdb --update --root=${ROOT}','${BIN_DIR}',409,1);
INSERT INTO "postinstall_cmds" VALUES(118,72,'create-cracklib-dict ${BIN_DIR}/usr/share/dict/*','${BUILD_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(119,3,'mkdir -p ${BIN_DIR}/etc/ld.so.conf.d/','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(120,3,'cat >> ${BIN_DIR}/etc/ld.so.conf << "EOF"
# Add an include directory
/usr/local/lib
/opt/lib
/lib
/usr/lib
include /etc/ld.so.conf.d/*.conf

EOF

','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(121,5,'rm -r lib','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(123,75,'install -m755 -d ${BIN_DIR}/etc/pam.d','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(124,75,'cat > ${BIN_DIR}/etc/pam.d/other << "EOF"
auth     required       pam_deny.so
account  required       pam_deny.so
password required       pam_deny.so
session  required       pam_deny.so
EOF
','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(125,75,'chmod  4755 ${BIN_DIR}/sbin/unix_chkpwd','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(126,75,'for file in pam pam_misc pamc
do
  mv ${BIN_DIR}/usr/lib64/lib${file}.so.* ${BIN_DIR}/lib64 &&
  ln -sf ../../lib64/$(readlink ${BIN_DIR}/usr/lib64/lib${file}.so) ${BIN_DIR}/usr/lib64/lib${file}.so
done','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(127,75,'cat > ${BIN_DIR}/etc/pam.d/system-account << "EOF" &&
# Begin /etc/pam.d/system-account

account   required    pam_unix.so

# End /etc/pam.d/system-account
EOF','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(128,75,'cat > ${BIN_DIR}/etc/pam.d/system-session << "EOF"
# Begin /etc/pam.d/system-session

session   required    pam_unix.so

# End /etc/pam.d/system-session
EOF','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(129,75,'cat > ${BIN_DIR}/etc/pam.d/system-password << "EOF"
# Begin /etc/pam.d/system-password

# use sha512 hash for encryption, use shadow, and try to use any previously
# defined authentication token (chosen password) set by any prior module
password  required    pam_unix.so       sha512 shadow try_first_pass

# End /etc/pam.d/system-password
EOF','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(130,75,'cat > ${BIN_DIR}/etc/pam.d/system-password << "EOF"
# Begin /etc/pam.d/system-password

# check new passwords for strength (man pam_cracklib)
password  required    pam_cracklib.so   type=Linux retry=3 difok=5 \
                                        difignore=23 minlen=9 dcredit=1 \
                                        ucredit=1 lcredit=1 ocredit=1 \
                                        dictpath=/lib/cracklib/pw_dict
# use sha512 hash for encryption, use shadow, and use the
# authentication token (chosen password) set by pam_cracklib
# above (or any previous modules)
password  required    pam_unix.so       sha512 shadow use_authtok

# End /etc/pam.d/system-password
EOF','${BIN_DIR}',41,1);
INSERT INTO "postinstall_cmds" VALUES(131,75,'cat > ${BIN_DIR}/etc/pam.d/other << "EOF"
# Begin /etc/pam.d/other

auth        required        pam_warn.so
auth        required        pam_deny.so
account     required        pam_warn.so
account     required        pam_deny.so
password    required        pam_warn.so
password    required        pam_deny.so
session     required        pam_warn.so
session     required        pam_deny.so

# End /etc/pam.d/other
EOF','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(133,84,'mv lib lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(134,78,'rm -r usr/lib','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(135,57,'mv ${BIN_DIR}var/run ${BIN_DIR}','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(136,78,'mv lib lib64','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(137,19,'for FUNCTION in FAIL_DELAY               \
                FAILLOG_ENAB             \
                LASTLOG_ENAB             \
                MAIL_CHECK_ENAB          \
                OBSCURE_CHECKS_ENAB      \
                PORTTIME_CHECKS_ENAB     \
                QUOTAS_ENAB              \
                CONSOLE MOTD_FILE        \
                FTMP_FILE NOLOGINS_FILE  \
                ENV_HZ PASS_MIN_LEN      \
                SU_WHEEL_ONLY            \
                CRACKLIB_DICTPATH        \
                PASS_CHANGE_TRIES        \
                PASS_ALWAYS_WARN         \
                CHFN_AUTH ENCRYPT_METHOD \
                ENVIRON_FILE
do
    sed -i "s/^${FUNCTION}/# &/" ${BIN_DIR}/etc/login.defs
done','${BIN_DIR}',NULL,1);
INSERT INTO "postinstall_cmds" VALUES(138,14,'ln -sfv $(readlink ${BIN_DIR}/usr/lib64/libncurses.so.6) ${BIN_DIR}/usr/lib64/libncurses.so','${BIN_DIR}',NULL,1);
CREATE TABLE package_sources (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), src_url STRING, md5 STRING, size INTEGER);
INSERT INTO "package_sources" VALUES(1,1,'https://www.kernel.org/pub/linux/kernel/v4.x/linux-${PV}.tar.xz','ed01fa8c30342def9712769762ca55ea',94220800);
INSERT INTO "package_sources" VALUES(2,2,'https://www.kernel.org/pub/linux/docs/man-pages/man-pages-${PV}.tar.xz','91c721409bbf823d8f62bee3a1fe8ae3',1521560);
INSERT INTO "package_sources" VALUES(3,3,'http://www.linuxfromscratch.org/patches/lfs/development/glibc-${PV}-fhs-1.patch','9a5997c3452909b1769918c759eff8a2',2804);
INSERT INTO "package_sources" VALUES(4,3,'http://ftp.gnu.org/gnu/glibc/glibc-${PV}.tar.xz','1496c3bf41adf9db0ebd0af01f202eed',13873900);
INSERT INTO "package_sources" VALUES(5,4,'http://www.iana.org/time-zones/repository/releases/tzdata2017a.tar.gz','cb8274cd175f8a4d9d1b89895df876dc',323983);
INSERT INTO "package_sources" VALUES(6,4,'http://www.iana.org/time-zones/repository/releases/tzcode2017a.tar.gz','eef0bfac7a52dce6989a7d8b40d86fe0',210671);
INSERT INTO "package_sources" VALUES(7,3,'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale-gen','28ca3e9ba0c0b1da38268c114c8228b4',1093);
INSERT INTO "package_sources" VALUES(8,3,'https://raw.githubusercontent.com/baho-utot/LFS-pacman/master/base/glibc/locale.conf','28164621b1a16dfb9e5be7953eac0aad',919);
INSERT INTO "package_sources" VALUES(9,5,'http://zlib.net/zlib-1.2.11.tar.xz','85adef240c5f370b308da8c938951a68',467960);
INSERT INTO "package_sources" VALUES(10,6,'ftp://ftp.astron.com/pub/file/file-${PV}.tar.gz','f35eaf05489ae566eafc4d26bb1dcd90',789345);
INSERT INTO "package_sources" VALUES(11,7,'http://ftp.gnu.org/gnu/binutils/binutils-${PV}.tar.bz2','9e8340c96626b469a603c15c9d843727',26556365);
INSERT INTO "package_sources" VALUES(13,8,'http://ftp.gnu.org/gnu/gmp/${PS}-${PV}.tar.xz','f58fa8001d60c4c77595fbbb62b63c1d',1946336);
INSERT INTO "package_sources" VALUES(14,9,'http://www.mpfr.org/${PS}-${PV}/${PS}-${PV}.tar.xz','c4ac246cf9795a4491e7766002cd528f',1126668);
INSERT INTO "package_sources" VALUES(15,10,'http://www.multiprecision.org/mpc/download/${PS}-${PV}.tar.gz','d6a1d5f8ddea3abd2cc3e98f58352d26',669925);
INSERT INTO "package_sources" VALUES(16,11,'http://ftp.gnu.org/gnu/gcc/gcc-${PV}/gcc-${PV}.tar.bz2','677a7623c7ef6ab99881bc4e048debb6',99903185);
INSERT INTO "package_sources" VALUES(17,12,'http://www.bzip.org/${PV}/${PS}-${PV}.tar.gz','00b516f4704d4a7cb50a1d97e6e8e15b',782025);
INSERT INTO "package_sources" VALUES(18,12,'http://www.linuxfromscratch.org/patches/lfs/development/${PS}-${PV}-install_docs-1.patch','6a5ac7e89b791aae556de0f745916f7f',1684);
INSERT INTO "package_sources" VALUES(19,13,'https://pkg-config.freedesktop.org/releases/${PS}-${PV}.tar.gz','f739a28cae4e0ca291f82d1d41ef107d',2013454);
INSERT INTO "package_sources" VALUES(20,14,'http://ftp.gnu.org/gnu//ncurses/ncurses-6.0.tar.gz','ee13d052e1ead260d7c28071f46eefb1',3131891);
INSERT INTO "package_sources" VALUES(21,15,'http://download.savannah.gnu.org/releases/attr/attr-${PV}.src.tar.gz','84f58dec00b60f2dc8fd1c9709291cc7',343692);
INSERT INTO "package_sources" VALUES(22,16,'http://download.savannah.gnu.org/releases/acl/acl-${PV}.src.tar.gz','a61415312426e9c2212bd7dc7929abda',386604);
INSERT INTO "package_sources" VALUES(23,17,'https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-${PV}.tar.xz','6666b839e5d46c2ad33fc8aa2ceb5f77',63672);
INSERT INTO "package_sources" VALUES(24,18,'http://ftp.gnu.org/gnu/sed/sed-${PV}.tar.xz','e0c583d4c380059abd818cd540fe6938',1181664);
INSERT INTO "package_sources" VALUES(25,19,'https://github.com/shadow-maint/shadow/releases/download/${PV}/shadow-${PV}.tar.xz','c06f8c2571b44899e60662f9ad259dd6',1631120);
INSERT INTO "package_sources" VALUES(26,20,'http://downloads.sourceforge.net/project/psmisc/psmisc/psmisc-22.21.tar.gz','935c0fd6eb208288262b385fa656f1bf',457702);
INSERT INTO "package_sources" VALUES(27,21,'http://anduin.linuxfromscratch.org/LFS/iana-etc-${PV}.tar.bz2','3ba3afb1d1b261383d247f46cb135ee8',205618);
INSERT INTO "package_sources" VALUES(28,22,'http://ftp.gnu.org/gnu/m4/m4-${PV}.tar.xz','730bb15d96fffe47e148d1e09235af82',1207688);
INSERT INTO "package_sources" VALUES(29,23,'http://ftp.gnu.org/gnu/bison/bison-${PV}.tar.xz','c342201de104cc9ce0a21e0ad10d4021',1973796);
INSERT INTO "package_sources" VALUES(30,24,'https://github.com/westes/flex/releases/download/v${PV}/flex-${PV}.tar.gz','a5f65570cd9107ec8a8ec88f17b31bb1',1405560);
INSERT INTO "package_sources" VALUES(31,25,'http://ftp.gnu.org/gnu/grep/grep-${PV}.tar.xz','fa07c1616adeb9c3262be5177d10ad4a',1375156);
INSERT INTO "package_sources" VALUES(32,26,'http://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz','205b03a87fc83dab653b628c59b9fc91',2910016);
INSERT INTO "package_sources" VALUES(34,27,'http://ftp.gnu.org/gnu/bash/${PS}-${PV}.tar.gz','148888a7c95ac23705559b6f477dfe25',9377313);
INSERT INTO "package_sources" VALUES(35,27,'http://www.linuxfromscratch.org/patches/lfs/development/bash-4.4-upstream_fixes-1.patch','e3d5bf23a4e5628680893d46e6ff286e',16659);
INSERT INTO "package_sources" VALUES(36,28,'http://alpha.gnu.org/gnu/bc/bc-${PV}.tar.bz2','5126a721b73f97d715bb72c13c889035',290069);
INSERT INTO "package_sources" VALUES(37,28,'http://www.linuxfromscratch.org/patches/lfs/development/bc-${PV}-memory_leak-1.patch','877e81fba316fe487ec23501059d54b8',1414);
INSERT INTO "package_sources" VALUES(38,29,'http://ftp.gnu.org/gnu/libtool/libtool-${PV}.tar.xz','1bfb9b923f2c1339b4d2ce1807064aa5',973080);
INSERT INTO "package_sources" VALUES(39,30,'http://ftp.gnu.org/gnu/gdbm/gdbm-${PV}.tar.gz','9ce96ff4c99e74295ea19040931c8fb9',841213);
INSERT INTO "package_sources" VALUES(40,31,'http://ftp.gnu.org/gnu/gperf/${PS}-${PV}.tar.gz','c1f1db32fb6598d6a93e6e88796a8632',983500);
INSERT INTO "package_sources" VALUES(41,32,'http://prdownloads.sourceforge.net/expat/${PS}-${PV}.tar.bz2','2f47841c829facb346eb6e3fab5212e2',414352);
INSERT INTO "package_sources" VALUES(42,33,'http://ftp.gnu.org/gnu/inetutils/inetutils-${PV}.tar.xz','87fef1fa3f603aef11c41dcc097af75e',1364408);
INSERT INTO "package_sources" VALUES(43,34,'http://www.cpan.org/src/5.0/${PS}-${PV}.tar.bz2','178ee0e8fa544dbc76d99cf041e2c9f0',14088312);
INSERT INTO "package_sources" VALUES(44,35,'http://cpan.metacpan.org/authors/id/T/TO/TODDR/${PS}-${PV}.tar.gz','af4813fe3952362451201ced6fbce379',237377);
INSERT INTO "package_sources" VALUES(45,36,'http://launchpad.net/intltool/trunk/${PV}/+download/${PS}-${PV}.tar.gz','12e517cac2b57a0121cda351570f1e63',162286);
INSERT INTO "package_sources" VALUES(46,37,'http://ftp.gnu.org/gnu/autoconf/autoconf-${PV}.tar.xz','50f97f4159805e374639a73e2636f22e',1214744);
INSERT INTO "package_sources" VALUES(47,38,'http://ftp.gnu.org/gnu/automake/automake-${PV}.tar.xz','9a1ddb0e053474d9d1105cfe39b0c48d',1496708);
INSERT INTO "package_sources" VALUES(48,39,'http://tukaani.org/xz/${PS}-${PV}.tar.xz','60fb79cab777e3f71ca43d298adacbd5',1032248);
INSERT INTO "package_sources" VALUES(49,40,'https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-${PV}.tar.xz','08297dfb6f2b3f625f928ca3278528af',536864);
INSERT INTO "package_sources" VALUES(50,41,'http://ftp.gnu.org/gnu/gettext/gettext-${PV}.tar.xz','df3f5690eaa30fd228537b00cb7b7590',7209808);
INSERT INTO "package_sources" VALUES(51,42,'http://anduin.linuxfromscratch.org/sources/other/systemd/systemd-${PV}.tar.xz','8d95734fdfcd13855746f143de1e3c86',4043040);
INSERT INTO "package_sources" VALUES(52,43,'http://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.12.tar.xz','957e42e8b193490b2111252e4a2b443c',845484);
INSERT INTO "package_sources" VALUES(53,44,'http://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v${PV}/e2fsprogs-${PV}.tar.gz','1775f3f0eed9dee1c5f39e08d1964a97',7009831);
INSERT INTO "package_sources" VALUES(54,45,'http://ftp.gnu.org/gnu/coreutils/coreutils-${PV}.tar.xz','502795792c212932365e077946d353ae',5285648);
INSERT INTO "package_sources" VALUES(55,45,'http://www.linuxfromscratch.org/patches/lfs/development/coreutils-${PV}-i18n-1.patch','da0199e7b9c064e6c08e1aebefd10e09',4613);
INSERT INTO "package_sources" VALUES(56,45,'https://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo/src/patchsets/coreutils/8.5/003_all_coreutils-gentoo-uname.patch','c4fcca138b6abf6d443d48a6f0cd8833',4577);
INSERT INTO "package_sources" VALUES(57,46,'http://ftp.gnu.org/gnu/diffutils/diffutils-${PV}.tar.xz','569354697ff1cfc9a9de3781361015fa',1360996);
INSERT INTO "package_sources" VALUES(58,47,'http://ftp.gnu.org/gnu/gawk/gawk-${PV}.tar.xz','4e7dbc81163e60fd4f0b52496e7542c9',2367832);
INSERT INTO "package_sources" VALUES(59,48,'http://ftp.gnu.org/gnu/findutils/findutils-${PV}.tar.gz','9936aa8009438ce185bea2694a997fc1',3780154);
INSERT INTO "package_sources" VALUES(60,49,'http://ftp.gnu.org/gnu/groff/groff-${PV}.tar.gz','cc825fa64bc7306a885f2fb2268d3ec5',4188772);
INSERT INTO "package_sources" VALUES(61,50,'http://www.greenwoodsoftware.com/less/less-${PV}.tar.gz','50ef46065c65257141a7340123527767',316622);
INSERT INTO "package_sources" VALUES(62,51,'http://ftp.gnu.org/gnu/${PS}/${PS}-${PV}.tar.xz','f7caabb65cddc1a4165b398009bd05b9',728116);
INSERT INTO "package_sources" VALUES(63,52,'https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-${PV}.tar.xz','b94a2b0edefaeac124dc8f5d006931b9',626944);
INSERT INTO "package_sources" VALUES(64,53,'https://www.kernel.org/pub/linux/utils/kbd/kbd-${PV}.tar.xz','c1635a5a83b63aca7f97a3eab39ebaa6',1031864);
INSERT INTO "package_sources" VALUES(65,53,'http://www.linuxfromscratch.org/patches/lfs/development/kbd-${PV}-backspace-1.patch','f75cca16a38da6caa7d52151f7136895',12640);
INSERT INTO "package_sources" VALUES(66,54,'http://download.savannah.gnu.org/releases/libpipeline/${PS}-${PV}.tar.gz','e54590ec68d6c1239f67b5b44e92022c',805172);
INSERT INTO "package_sources" VALUES(67,55,'http://ftp.gnu.org/gnu/make/make-${PV}.tar.bz2','15b012617e7c44c0ed482721629577ac',1407126);
INSERT INTO "package_sources" VALUES(68,56,'http://ftp.gnu.org/gnu/patch/patch-${PV}.tar.xz','e3da7940431633fb65a01b91d3b7a27a',727704);
INSERT INTO "package_sources" VALUES(69,57,'http://dbus.freedesktop.org/releases/dbus/dbus-${PV}.tar.gz','7f06c43736874c1ff50ae20392955511',1986063);
INSERT INTO "package_sources" VALUES(70,58,'https://www.kernel.org/pub/linux/utils/util-linux/v2.29/util-linux-${PV}.tar.xz','63c40c2068fcbb7e1d5c1d281115d973',4277668);
INSERT INTO "package_sources" VALUES(71,59,'http://download.savannah.gnu.org/releases/man-db/man-db-${PV}.tar.xz','2948d49d0ed7265f60f83aa4a9ac9268',1541316);
INSERT INTO "package_sources" VALUES(72,60,'http://ftp.gnu.org/gnu/tar/${PS}-${PV}.tar.xz','a1802fec550baaeecff6c381629653ef',1996000);
INSERT INTO "package_sources" VALUES(73,61,'http://ftp.gnu.org/gnu/texinfo/texinfo-${PV}.tar.xz','32baefe5c7080dfb512a4eac5ce67b2a',4468048);
INSERT INTO "package_sources" VALUES(74,19,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-apps/shadow/files/shadow-${PV}-su-snprintf.patch','b8f7eee433795eb088526ccbdee8b44b',849);
INSERT INTO "package_sources" VALUES(75,62,'https://openssl.org/source/${PS}-${PV}.tar.gz','f965fc0bf01bf882b31314b61391ae65',5309236);
INSERT INTO "package_sources" VALUES(76,63,'https://curl.haxx.se/download/curl-${PV}.tar.lzma','78fce113c34e7a7941080bcd0d21fecc',2076935);
INSERT INTO "package_sources" VALUES(77,63,'http://www.linuxfromscratch.org/patches/blfs/svn/curl-7.53.1-valgrind_filter-1.patch','0c9b64a14303e9542f7a7346d12194b5',3917);
INSERT INTO "package_sources" VALUES(78,64,'http://sqlite.org/2017/sqlite-autoconf-3170000.tar.gz','450a95a7bde697c9fe4de9ae2fffdcca',2515143);
INSERT INTO "package_sources" VALUES(79,65,'http://ftp.gnu.org/gnu/which/which-${PV}.tar.gz','097ff1a324ae02e0a3b0369f07a7544a',149305);
INSERT INTO "package_sources" VALUES(80,66,'http://anduin.linuxfromscratch.org/BLFS/net-tools/net-tools-${PV}.tar.gz','6be14ed473cacdd68edeaa9605adc469',293269);
INSERT INTO "package_sources" VALUES(81,66,'http://www.linuxfromscratch.org/patches/blfs/svn/net-tools-${PV}-remove_dups-1.patch','01b01721458ee16bef6eb9464a0da175',15556);
INSERT INTO "package_sources" VALUES(82,67,'http://www.skbuff.net/iputils/iputils-s${PV}.tar.bz2','8aaa7395f27dff9f57ae016d4bc753ce',157187);
INSERT INTO "package_sources" VALUES(83,68,'http://ftp.gnu.org/gnu/wget/wget-${PV}.tar.xz','d30d82186b93fcabb4116ff513bfa9bd',2111756);
INSERT INTO "package_sources" VALUES(84,69,'http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.gz','b2db2a83caf66a208bb78d6d287cdaa3',1511780);
INSERT INTO "package_sources" VALUES(85,80,'https://dev.gentoo.org/~dilfridge/distfiles/${PS}-${PV}.tar.bz2','a764c7c7c59d92f9036cc27f6359a9c6',6495);
INSERT INTO "package_sources" VALUES(86,71,'https://github.com/Cyan4973/lz4/archive/v${PV}.tar.gz','c9610c5ce97eb431dddddf0073d919b9',208019);
INSERT INTO "package_sources" VALUES(87,99,'https://cmake.org/files/v3.8/${PS}-${PV}.tar.gz','c364bf3e8d3ba5d7e24caa45b936281e',7504498);
INSERT INTO "package_sources" VALUES(88,83,'http://anduin.linuxfromscratch.org/BLFS/other/make-ca.sh-${PV}','cce9fa4713c4611d9e61f99de612a1e9',18612);
INSERT INTO "package_sources" VALUES(89,83,'http://anduin.linuxfromscratch.org/BLFS/other/certdata.txt','59ea509648826f122f12420afaf0aeff',1619812);
INSERT INTO "package_sources" VALUES(90,100,'http://www.libarchive.org/downloads/${PS}-${PV}.tar.gz','d2af45480aa5b0db5b5f3919cd0ea65e',6219943);
INSERT INTO "package_sources" VALUES(91,101,'http://www.oberhumer.com/opensource/lzo/download/${PS}-${PV}.tar.gz','39d3f3f9c55c87b1e5d6888e1420f4b5',600622);
INSERT INTO "package_sources" VALUES(92,73,'http://downloads.sourceforge.net/infozip/${PS}${PV}.tar.gz','62b490407489521db863b523a7f86375',1376845);
INSERT INTO "package_sources" VALUES(93,91,'https://www.nano-editor.org/dist/v2.7/${PS}-${PV}.tar.xz','002703e368e07882f75e304c8860d83d',1014184);
INSERT INTO "package_sources" VALUES(94,96,'http://downloads.sourceforge.net/docbook/${PS}-${PV}.tar.bz2','b48cbf929a2ad85e6672f710777ca7bc',21967928);
INSERT INTO "package_sources" VALUES(95,97,'http://www.docbook.org/xml/${PV}/${PS}-${PV}.zip','03083e288e87a7e829e437358da7ef9e',98497);
INSERT INTO "package_sources" VALUES(96,98,'','',0);
INSERT INTO "package_sources" VALUES(97,95,'http://anduin.linuxfromscratch.org/BLFS/xmlto/${PS}-${PV}.tar.bz2','93bab48d446c826399d130d959fe676f',127921);
INSERT INTO "package_sources" VALUES(98,0,'','',0);
INSERT INTO "package_sources" VALUES(99,102,'https://superb-sea2.dl.sourceforge.net/project/tcl/Tcl/${PV}/tcl${PV}-src.tar.gz','5193aea8107839a79df8ac709552ecb7',9553805);
INSERT INTO "package_sources" VALUES(100,90,'http://download.icu-project.org/files/icu4c/${PV}/icu4c-58_2-src.tgz','fac212b32b7ec7ab007a12dff1f3aea1',23369902);
INSERT INTO "package_sources" VALUES(101,90,'http://www.linuxfromscratch.org/patches/blfs/svn/icu4c-58.2-fix_enumeration-1.patch','4370af5a6900e2abfbaada9281b15161',2252);
INSERT INTO "package_sources" VALUES(102,92,'ftp://ftp.gnupg.org/gcrypt/libgcrypt/${PS}-${PV}.tar.bz2','54e180679a7ae4d090f8689ca32b654c',2897695);
INSERT INTO "package_sources" VALUES(103,93,'ftp://ftp.gnupg.org/gcrypt/libgpg-error/${PS}-${PV}.tar.bz2','5217ef3e76a7275a2a3b569a12ddc989',813060);
INSERT INTO "package_sources" VALUES(104,74,'http://ftpmirror.gnu.org/libtool/${PS}-${PV}.tar.xz','1bfb9b923f2c1339b4d2ce1807064aa5',973080);
INSERT INTO "package_sources" VALUES(105,79,'ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/${PS}-${PV}.tar.bz2','41a842bf7dcecd6634219336e2167d1d',1560119);
INSERT INTO "package_sources" VALUES(106,89,'http://xmlsoft.org/sources/${PS}-${PV}.tar.gz','ae249165c173b1ff386ee8ad676815f5',5374830);
INSERT INTO "package_sources" VALUES(107,94,'http://xmlsoft.org/sources/${PS}-${PV}.tar.gz','a129d3c44c022de3b9dcf6d6f288d72e',3428524);
INSERT INTO "package_sources" VALUES(108,86,'http://www.cpan.org/authors/id/S/SB/SBURKE/${PS}-${PV}.tar.gz','31cca8505bd74ed9d8036cdc84c808ca',137977);
INSERT INTO "package_sources" VALUES(109,87,'http://www.cpan.org/authors/id/A/AU/AUDREYT/${PS}-${PV}.tar.gz','c33367b020995ff4fdd20e2b3cdae6be',31498);
INSERT INTO "package_sources" VALUES(110,85,'http://cpan.metacpan.org/authors/id/G/GU/GUIDO/${PS}-${PV}.tar.gz','66f989c07541e32325b0557b89aead8f',605626);
INSERT INTO "package_sources" VALUES(111,78,'http://www.netfilter.org/projects/iptables/files/${PS}-${PV}.tar.bz2','ab38a33806b6182c6f53d6afb4619add',620890);
INSERT INTO "package_sources" VALUES(112,78,'http://www.linuxfromscratch.org/blfs/downloads/svn/blfs-systemd-units-20160602.tar.bz2','72bd2a6f5ef1dd359b64e01e16d28e06',8262);
INSERT INTO "package_sources" VALUES(113,77,'http://downloads.sourceforge.net/project/libtirpc/libtirpc/${PV}/libtirpc-${PV}.tar.bz2','36ce1c0ff80863bb0839d54aa0b94014',495125);
INSERT INTO "package_sources" VALUES(114,84,'https://github.com/gentoo/hwids/archive/hwids-${PV}.tar.gz','c5d06379911d2097d53f371f40075fc7',2000437);
INSERT INTO "package_sources" VALUES(115,88,'https://dev.gentoo.org/~vapier/dist/${PN}-${PV}.tar.xz','15c2629b51fdec99bf0adccaa420d723',3480);
INSERT INTO "package_sources" VALUES(116,103,'https://github.com/ConsoleKit2/ConsoleKit2/releases/download/1.1.0/ConsoleKit2-1.1.0.tar.bz2','cfd1b7319663e59a239f5fe2451721da',630178);
INSERT INTO "package_sources" VALUES(117,72,'https://github.com/cracklib/cracklib/releases/download/cracklib-${PV}/cracklib-${PV}.tar.gz','c52f463585d85924b28cdc1e373ae06d',642402);
INSERT INTO "package_sources" VALUES(118,76,'http://download.oracle.com/berkeley-db/db-${PV}.tar.gz','9da126afb937a48171ff1e569ce67cf1',44305964);
INSERT INTO "package_sources" VALUES(119,104,'https://alpha.gnu.org/gnu/libidn/libidn2-${PV}.tar.gz','bc4c2f777016011b613affbd55e2ff83',1494295);
INSERT INTO "package_sources" VALUES(120,105,'https://ftp.gnu.org/gnu/libunistring/libunistring-${PV}.tar.xz','82e0545363d111bfdfec2ddbfe62ffd3',1967300);
INSERT INTO "package_sources" VALUES(121,4,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-libs/timezone-data/files/timezone-data-2016g-makefile.patch','5000a795f9018ee872850015eafc5f7b',2402);
INSERT INTO "package_sources" VALUES(122,26,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-libs/readline/files/readline-5.0-no_rpath.patch','d5f28667389d9681136307274ebc1f28',363);
INSERT INTO "package_sources" VALUES(123,26,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-libs/readline/files/readline-6.2-rlfe-tgoto.patch','d07ad4b03452a60a4f5f3e41c01f8528',379);
INSERT INTO "package_sources" VALUES(124,26,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-libs/readline/files/readline-7.0-headers.patch','234e4036f940293254d289bf9b1b9582',576);
INSERT INTO "package_sources" VALUES(125,26,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-libs/readline/files/readline-7.0-missing-echo-proto.patch','11667fe1542ae5e1670be451a413e40f',492);
INSERT INTO "package_sources" VALUES(126,106,'http://ftp.gnome.org/pub/gnome/sources/glib/2.50/glib-2.50.3.tar.xz','381ab22934f296750d036aa55a397ded',7589284);
INSERT INTO "package_sources" VALUES(127,107,'ftp://sourceware.org/pub/libffi/libffi-${PV}.tar.gz','83b89587607e3eb65c70d361f13bab43',940837);
INSERT INTO "package_sources" VALUES(128,75,'http://linux-pam.org/library/Linux-PAM-1.3.0.tar.bz2','da4b2289b7cfb19583d54e9eaaef1c3a',1302820);
INSERT INTO "package_sources" VALUES(129,70,'https::/andreil.by/lfs/baselayout-1.tar.xz','be63d5ade5755fd7e0c03f8c9cb071dc',20504);
INSERT INTO "package_sources" VALUES(130,81,'https://github.com/seccomp/libseccomp/releases/download/v${PV}/libseccomp-${PV}.tar.gz','e74a626bea0cd607c23229b10b5f93da',559238);
INSERT INTO "package_sources" VALUES(131,42,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-apps/systemd/files/233-0001-Avoid-strict-DM-interface-version-dependencies-5519.patch','1aafdc07e251850b6b0f9787efe5ddd8',14035);
INSERT INTO "package_sources" VALUES(132,3,'http://distfiles.gentoo.org/distfiles/glibc-2.25-patches-2.tar.bz2','719d0389f5e1782dda8775040fd4bcbd',38620);
INSERT INTO "package_sources" VALUES(133,49,'https://gitweb.gentoo.org/repo/gentoo.git/plain/sys-apps/groff/files/groff-1.22.3-parallel-mom.patch','7dccdcba2518954259d0f9bf7ef585b1',378);
INSERT INTO "package_sources" VALUES(134,108,'https://downloads.sourceforge.net/project/rhash/rhash/${PV}/rhash-${PV}-src.tar.gz','0b51010604659e9e99f6307b053ba13b',249357);
CREATE TABLE install_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd STRING, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id), opt_val_trig INTEGER);
INSERT INTO "install_cmds" VALUES(1,1,'make INSTALL_HDR_PATH=${BIN_DIR}/usr headers_install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(3,2,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(4,3,'mkdir -p {usr/,}lib64','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(11,3,'mkdir -p etc','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(15,4,'make DESTDIR=${BIN_DIR} install TOPDIR=/usr REDO=posix_only','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(18,5,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(20,6,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(23,8,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(24,9,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(25,10,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(26,11,'mkdir -p ${BIN_DIR}/{lib64,usr}','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(28,11,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(29,12,'make PREFIX=${BIN_DIR}/usr install','${SRC_DIR}/${PS}-${PV}',2,1);
INSERT INTO "install_cmds" VALUES(36,13,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(37,14,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(38,15,'mkdir -p ${BIN_DIR}/{lib64,usr/lib64/pkgconfig}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(39,15,'make DESTDIR=${BIN_DIR} install install-dev install-lib','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(40,16,'mkdir -p ${BIN_DIR}/{lib64,usr/lib64/pkgconfig}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(41,16,'make DESTDIR=${BIN_DIR} install install-dev install-lib','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(42,17,'mkdir -p ${BIN_DIR}/{lib64,usr/lib64}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(44,17,'make RAISE_SETFCAP=no prefix=/usr DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(45,18,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(46,19,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(47,20,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(48,21,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(49,22,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(50,23,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(51,24,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(52,25,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(53,26,'mkdir -p ${BIN_DIR}/lib64','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(54,26,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(55,27,'mkdir -p ${BIN_DIR}\bin','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(56,27,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(57,28,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(58,29,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(59,30,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(60,31,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(61,32,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(62,33,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(63,34,'BUILD_ZLIB=False BUILD_BZIP2=0 make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(64,35,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(65,36,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(66,37,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(67,38,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(68,39,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(69,40,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(70,41,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(71,42,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(72,43,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(73,44,'make DESTDIR=${BIN_DIR} install install-libs','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(74,45,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(75,46,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(76,47,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(77,48,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(78,49,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(79,50,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(80,51,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(81,52,'make DOCDIR=/usr/share/doc/${PN}-${PV} DESTDIR=${BIN_DIR} LIBDIR=/usr/lib64 SBINDIR=/sbin CONFDIR=/etc/iproute2 MANDIR=/usr/share/man ARPDIR=/var/lib/arpd install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(82,53,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(83,54,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(84,55,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(85,56,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(86,57,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(87,58,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(88,59,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(89,60,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(90,61,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(92,7,'make DESTDIR=${BIN_DIR} tooldir=/usr install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(93,62,'make INSTALL_PREFIX=${BIN_DIR} MANDIR=/usr/share/man MANSUFFIX=ssl install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(94,63,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(95,64,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(96,65,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(97,66,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(98,67,'mkdir -p ${BIN_DIR}/bin','${SRC_DIR}/${PS}-s${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(99,67,'cp ping ${BIN_DIR}/bin','${SRC_DIR}/${PS}-s${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(100,67,'cp ping6 ${BIN_DIR}/bin','${SRC_DIR}/${PS}-s${PV}',54,1);
INSERT INTO "install_cmds" VALUES(104,68,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(105,69,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(106,32,'make installlib DESTDIR=${BIN_DIR} LIBRARY=libexpatu.la','${BUILD_DIR}u',21,1);
INSERT INTO "install_cmds" VALUES(107,32,'make installlib DESTDIR=${BIN_DIR} LIBRARY=libexpatw.la','${BUILD_DIR}w',21,1);
INSERT INTO "install_cmds" VALUES(108,32,'cp expat.pc expatu.pc','${BIN_DIR}/usr/lib64/pkgconfig',21,1);
INSERT INTO "install_cmds" VALUES(109,32,'sed -i -e ''/^Libs/s:-lexpat:&u:'' expatu.pc','${BIN_DIR}/usr/lib64/pkgconfig',21,1);
INSERT INTO "install_cmds" VALUES(110,32,'cp expat.pc expatw.pc','${BIN_DIR}/usr/lib64/pkgconfig',21,1);
INSERT INTO "install_cmds" VALUES(111,32,'sed -i -e ''/^Libs/s:-lexpat:&w:'' expatw.pc','${BIN_DIR}/usr/lib64/pkgconfig',21,1);
INSERT INTO "install_cmds" VALUES(113,80,'','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(114,80,'','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(115,80,'','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(116,100,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(117,101,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(118,99,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(119,71,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(120,73,'mkdir -p ${BIN_DIR}/usr/{bin,share/man}','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(121,73,'cp unzip funzip unzipsfx ${BIN_DIR}/usr/bin','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(122,73,'ln -s unzip zipinfo','${BIN_DIR}/usr/bin',NULL,1);
INSERT INTO "install_cmds" VALUES(123,73,'mkdir -p ${BIN_DIR}/usr/share/man/man1','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(124,73,'cp man/*.1 ${BIN_DIR}/usr/share/man/man1/','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(125,91,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(126,96,'install -v -m755 -d ${BIN_DIR}/usr/share/xml/docbook/xsl-stylesheets-${PV}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(127,96,'cp -R VERSION assembly common eclipse epub epub3 extensions fo highlighting html htmlhelp images javahelp lib manpages params profiling roundtrip slides template tests tools webhelp website xhtml xhtml-1_1 xhtml5 ${BIN_DIR}/usr/share/xml/docbook/xsl-stylesheets-${PV}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(128,96,'ln -s VERSION ${BIN_DIR}/usr/share/xml/docbook/xsl-stylesheets-${PV}/VERSION.xsl','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(129,96,'install -m644 -D README ${BIN_DIR}/usr/share/doc/docbook-xsl-${PV}/README.txt','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(130,96,'install -m644    RELEASE-NOTES* NEWS* ${BIN_DIR}/usr/share/doc/docbook-xsl-${PV}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(131,96,'if [ ! -d ${BIN_DIR}/etc/xml ]; then install -m755 -d ${BIN_DIR}/etc/xml; fi','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(132,96,'if [ ! -f ${BIN_DIR}/etc/xml/catalog ]; then
    xmlcatalog --noout --create ${BIN_DIR}/etc/xml/catalog
fi','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(133,96,'xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/${PV}" \
           "/usr/share/xml/docbook/xsl-stylesheets-${PV}" \
    ${BIN_DIR}/etc/xml/catalog','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(134,96,'xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/${PV}" \
           "/usr/share/xml/docbook/xsl-stylesheets-${PV}" \
    ${BIN_DIR}/etc/xml/catalog','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(135,96,'xmlcatalog --noout --add "rewriteSystem" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-${PV}" \
    ${BIN_DIR}/etc/xml/catalog','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(136,96,'xmlcatalog --noout --add "rewriteURI" \
           "http://docbook.sourceforge.net/release/xsl/current" \
           "/usr/share/xml/docbook/xsl-stylesheets-${PV}" \
    ${BIN_DIR}/etc/xml/catalog','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(137,97,'install -d -m755 ${BIN_DIR}/usr/share/xml/docbook/xml-dtd-${PV}','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(138,97,'install -v -d -m755 ${BIN_DIR}/etc/xml','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(139,97,'cp -af docbook.cat *.dtd ent/ *.mod ${BIN_DIR}/usr/share/xml/docbook/xml-dtd-${PV}','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(140,97,'if [ ! -e ${BIN_DIR}/etc/xml/docbook ]; then
    xmlcatalog --noout --create ${BIN_DIR}/etc/xml/docbook
fi &&
xmlcatalog --noout --add "public" \
    "-//OASIS//DTD DocBook XML V4.5//EN" \
    "http://www.oasis-open.org/docbook/xml/${PV}/docbookx.dtd" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//DTD DocBook XML CALS Table Model V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/calstblx.dtd" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//DTD XML Exchange Table Model 19990315//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/soextblx.dtd" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ELEMENTS DocBook XML Information Pool V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/dbpoolx.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ELEMENTS DocBook XML Document Hierarchy V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/dbhierx.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ELEMENTS DocBook XML HTML Tables V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/htmltblx.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Notations V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/dbnotnx.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Character Entities V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/dbcentx.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "public" \
    "-//OASIS//ENTITIES DocBook XML Additional General Entities V4.5//EN" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}/dbgenent.mod" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteSystem" \
    "http://www.oasis-open.org/docbook/xml/${PV}" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}" \
    ${BIN_DIR}/etc/xml/docbook &&
xmlcatalog --noout --add "rewriteURI" \
    "http://www.oasis-open.org/docbook/xml/${PV}" \
    "file:///usr/share/xml/docbook/xml-dtd-${PV}" \
   ${BIN_DIR}/etc/xml/docbook','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(141,97,'if [ ! -e  ${BIN_DIR}/etc/xml/catalog ]; then
    xmlcatalog --noout --create  ${BIN_DIR}/etc/xml/catalog
fi &&
xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//ENTITIES DocBook XML" \
    "file:///etc/xml/docbook" \
     ${BIN_DIR}/etc/xml/catalog &&
xmlcatalog --noout --add "delegatePublic" \
    "-//OASIS//DTD DocBook XML" \
    "file:///etc/xml/docbook" \
     ${BIN_DIR}/etc/xml/catalog &&
xmlcatalog --noout --add "delegateSystem" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" \
     ${BIN_DIR}/etc/xml/catalog &&
xmlcatalog --noout --add "delegateURI" \
    "http://www.oasis-open.org/docbook/" \
    "file:///etc/xml/docbook" \
     ${BIN_DIR}/etc/xml/catalog','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(142,97,'for DTDVERSION in 4.1.2 4.2 4.3 4.4
do
  xmlcatalog --noout --add "public" \
    "-//OASIS//DTD DocBook XML V$DTDVERSION//EN" \
    "http://www.oasis-open.org/docbook/xml/$DTDVERSION/docbookx.dtd" \
    ${BIN_DIR}/etc/xml/docbook
  xmlcatalog --noout --add "rewriteSystem" \
    "http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
    "file:///usr/share/xml/docbook/xml-dtd-4.5" \
    ${BIN_DIR}/etc/xml/docbook
  xmlcatalog --noout --add "rewriteURI" \
    "http://www.oasis-open.org/docbook/xml/$DTDVERSION" \
    "file:///usr/share/xml/docbook/xml-dtd-4.5" \
    ${BIN_DIR}/etc/xml/docbook
  xmlcatalog --noout --add "delegateSystem" \
    "http://www.oasis-open.org/docbook/xml/$DTDVERSION/" \
    "file:///etc/xml/docbook" \
    ${BIN_DIR}/etc/xml/catalog
  xmlcatalog --noout --add "delegateURI" \
    "http://www.oasis-open.org/docbook/xml/$DTDVERSION/" \
    "file:///etc/xml/docbook" \
    ${BIN_DIR}/etc/xml/catalog
done','${SRC_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(143,95,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(144,102,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(145,102,'make DESTDIR=${BIN_DIR} install-private-headers','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(146,102,'ln -sf tclsh8.6 ${BIN_DIR}/usr/bin/tclsh','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(147,102,'chmod 755 ${BIN_DIR}/usr/lib/libtcl8.6.so','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(148,90,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(149,92,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(150,93,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(151,74,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(152,79,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(153,89,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(154,94,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(155,86,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(157,87,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(158,85,'make DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(159,78,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(160,77,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(161,84,'make ${OPT net EXPYN NET} ${OPT pci EXPYN PCI} ${OPT udev EXPYN UDEV} ${OPT usb EXPYN USB} DESTDIR=${BIN_DIR} install DOCDIR=/usr/share/doc/${PN} MISCDIR=/usr/share/misc HWDBDIR=/lib/udev/hwdb.d','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(162,88,'make GIT=true DESTDIR=${BIN_DIR} install','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(163,103,'make DESTDIR=${BIN_DIR} htmldocdir=/usr/share/doc/${PN}/html install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(165,72,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(167,76,'make DESTDIR=${BIN_DIR} docdir=/usr/share/doc/db-${PV} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(168,104,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(169,105,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(171,14,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}/t_unicode',21,1);
INSERT INTO "install_cmds" VALUES(173,27,'rm -rf ${BIN_DIR}/usr/lib64/bash','',NULL,1);
INSERT INTO "install_cmds" VALUES(174,34,'mv usr/lib usr/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(175,7,'mv usr/lib/ldscripts usr/lib64/ && rm -r usr/lib','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(178,3,'touch ${BIN_DIR}/etc/ld.so.conf','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(179,3,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(181,85,'mv usr/lib usr/lib64 || echo "moved"','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(183,87,'mv usr/lib usr/lib64 || echo "moved"','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(184,35,'mv usr/lib usr/lib64','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(185,107,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(186,106,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(187,75,'make DESTDIR=${BIN_DIR} install sepermitlockdir=/run/sepermit','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(188,70,'mkdir -p ${BIN_DIR}','${SRC_DIR}/',NULL,1);
INSERT INTO "install_cmds" VALUES(189,70,'mv * ${BIN_DIR}','${SRC_DIR}/',NULL,1);
INSERT INTO "install_cmds" VALUES(190,81,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(191,71,'mv usr/lib usr/lib64 || echo "moved"','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(192,42,'mv usr/lib/* usr/lib64/','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(193,42,'rm -r usr/lib','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(195,108,'make DESTDIR=${BIN_DIR} PREFIX=/usr LIBDIR=/usr/lib64 -C librhash install-lib-shared install-so-link','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(196,108,'make DESTDIR=${BIN_DIR} PREFIX=/usr LIBDIR=/usr/lib64 install-shared','${SRC_DIR}/${PS}-${PV}',0,1);
INSERT INTO "install_cmds" VALUES(197,108,'make DESTDIR=${BIN_DIR} PREFIX=/usr LIBDIR=/usr/lib64 install-lib-static','${SRC_DIR}/${PS}-${PV}',2,1);
INSERT INTO "install_cmds" VALUES(198,108,'make DESTDIR=${BIN_DIR} PREFIX=/usr LIBDIR=/usr/lib64 -C librhash install-headers','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "install_cmds" VALUES(199,108,'make DESTDIR=${BIN_DIR} PREFIX=/usr LIBDIR=/usr/lib64 install-gmo','${SRC_DIR}/${PS}-${PV}',5,1);
INSERT INTO "install_cmds" VALUES(200,86,'mv usr/lib usr/lib64 || echo "moved"','${BIN_DIR}',NULL,1);
INSERT INTO "install_cmds" VALUES(201,14,'find ./usr/ -name ''*.a'' -delete','${BIN_DIR}',2,2);
INSERT INTO "install_cmds" VALUES(202,5,'find ./usr/ -name ''*.a'' -delete','${BIN_DIR}',2,2);
INSERT INTO "install_cmds" VALUES(203,62,'find ./usr/ -name ''*.a'' -delete','${BIN_DIR}',2,2);
INSERT INTO "install_cmds" VALUES(204,23,'find ./usr/ -name ''*.a'' -delete','${BIN_DIR}',2,2);
CREATE TABLE config_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id), opt_val_trig INTEGER);
INSERT INTO "config_cmds" VALUES(1,3,'libc_cv_rootsbindir=/sbin libc_cv_slibdir=/lib64 ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-stackguard-randomization --enable-kernel=2.6.32 --enable-add-ons=c_stubs,libidn --without-selinux --without-cvs --disable-werror --enable-bind-now ${OPT profile ENDIS profile} ${OPT gd WITHIO gd} --with-headers=/usr/include ${OPT rpc ENDIS obsolete-rpc} --disable-systemtap --disable-nscd --disable-timezone-tools --libexecdir=/usr/lib64/misc/glibc','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(2,5,'${SRC_DIR}/${PS}-${PV}/configure --shared --prefix=/usr --libdir=/usr/lib64 --sharedlibdir=/lib64','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(4,6,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static} ${OPT zlib ENDIS zlib}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(6,7,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --host=$(gcc -dumpmachine) --build=$(gcc -dumpmachine) --target=$(gcc -dumpmachine) --enable-shared --disable-werror ${OPT cxx ENDIS gold} ${OPT cxx ENDIS plugins} ${OPT nls WITHIO included-gettext} ${OPT nls DISEN nls} ${OPT zlib WITHIO zlib} --enable-obsolete --enable-threads --enable-install-libiberty ${OPT static-libs ENDIS static} --disable-{gdb,libdecnumber,readline,sim} --without-stage1-ldflags','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(7,8,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-cxx --disable-static --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(8,9,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-static --enable-thread-safe --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(9,10,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-static --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(10,11,'ac_cv_have_x=''have_x=yes ac_x_includes= ac_x_libraries='' ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --host=$(gcc -dumpmachine) --build=$(gcc -dumpmachine) --target=$(gcc -dumpmachine) ${CONFIG_DEF} --disable-multilib --with-system-zlib --includedir=/usr/include --enable-languages=c${OPT cxx FLAGON ,c++}${OPT go FLAGON ,go}${OPT objc FLAGON ,objc}${OPT objc++ FLAGON ,obj-c++}${OPT fortran FLAGON ,fortran} --enable-obsolete --enable-secureplt --disable-werror ${OPT nls ENDIS nls} ${OPT nls WITHIO included-gettext} --disable-libunwind-exceptions ${OPT cxx ENDIS libstdcxx-time} ${OPT cxx ENDIS build-with-cxx} ${OPT cxx ENDIS build-poststage1-with-cxx} --enable-shared --enable-threads=posix --disable-libgcj ${OPT openmp ENDIS libgomp} ${OPT libssp ENDIS libssp} ${OPT cilk ENDIS libcilkrts} ${OPT fortran FLAGOFF --disable-libquadmath} --enable-lto ${OPT graphite ENDIS isl} ${OPT graphite FLAGON --disable-isl-version-check} ${OPT sanitize ENDIS libsanitizer} ${OPT pie ENDIS default-pie} ','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(13,13,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --with-internal-glib --disable-compile-warnings --disable-host-tool --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(14,14,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-pc-files --with-shared --without-hashed-db ${OPT cxx WITHIO cxx} ${OPT cxx WITHIO cxx-binding} --with-cxx-shared ${OPT gpm WITHIO gpm} --disable-termcap --enable-symlinks --with-rcs-ids --with-manpage-format=normal --enable-const --enable-colorfgbg --enable-hard-tabs --enable-echo --enable-warnings ${OPT tinfo WITHIO termlib} --disable-widec ${OPT threads WITHIO pthread} ${OPT threads WITHIO reentrant} --enable-overwrite','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(15,15,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(16,16,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --libexecdir=/usr/lib64 ${OPT static-libs ENDIS static}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(17,18,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --bindir=/bin --htmldir=/usr/share/doc/${PN}-${PV} ${OPT acl ENDIS acl} ${OPT nls ENDIS nls}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(18,19,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --without-group-name-max-length --without-tcb --enable-shared=no --enable-static=yes ${OPT acl WITHIO acl} ${OPT cracklib WITHIO libcrack} ${OPT pam WITHIO libpam} ${OPT nls ENDIS nls} ${OPT xattr WITHIO attr}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(19,20,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-harden-flags ${OPT ipv6 ENDIS ipv6} ${OPT nls ENDIS nls}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(20,22,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(21,23,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(22,24,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} --disable-shared ${OPT nls ENDIS nls}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(23,25,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --bindir=/bin ${OPT nls ENDIS nls} ${OPT pcre ENDIS perl-regexp}','${BUILD_DIR}',0,1);
INSERT INTO "config_cmds" VALUES(24,26,'bash_cv_termcap_lib=ncurses CPPFLAGS="${CPPFLAGS} -D_GNU_SOURCE -Dxrealloc=_rl_realloc -Dxmalloc=_rl_malloc -Dxfree=_rl_free" LDFLAGS="${LDFLAGS} -L." ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static} --docdir=/usr/share/doc/${PN}-${PV} --with-curses','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(25,27,'CPPFLAGS="${CPPFLAGS} -DDEFAULT_PATH_VALUE=''\"/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin\"'' -DSTANDARD_UTILS_PATH=''\"/bin:/usr/bin:/sbin:/usr/sbin\"'' -DSYS_BASHRC=''\"/etc/bash/bashrc\"'' -DSYS_BASH_LOGOUT=''\"/etc/bash/bash_logout\"'' -DNON_INTERACTIVE_LOGIN_SHELLS -DSSH_SOURCE_BASHRC" ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} --without-bash-malloc --with-installed-readline=. ${OPT nls ENDIS nls} --with-curses ${OPT afs WITHIO afs} --disable-profiling ${OPT mem-scramble ENDIS mem-scramble} ${OPT mem-scramble ENDIS bash-malloc} ${OPT readline ENDIS readline} ${OPT readline ENDIS history} ${OPT readline ENDIS bang-history}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(26,28,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --with-readline --mandir=/usr/share/man --infodir=/usr/share/info','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(27,29,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(28,30,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --includedir=/usr/include/gdbm ${OPT berkdb ENDIS libgdbm-compat} ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(29,31,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(30,32,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(31,33,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --localstatedir=/var --disable-logger --disable-whois --disable-rcp --disable-rexec --disable-rlogin --disable-rsh --disable-servers','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(32,34,'BUILD_ZLIB=False BUILD_BZIP2=0 sh Configure -Ui_ndbm ${OPT berkdb FLAGON -Di_ndbm} -${OPT gdbm FLAGOFF U}${OPT gdbm FLAGON D}i_gdbm -Ui_db ${OPT berkdb FLAGON -Di_db} -Dusethreads -DDEBUGGING=none ''-Dlibpth=/usr/lib64 /lib64 /lib/*-linux-gnu /usr/lib/*-linux-gnu /lib64 /lib/64 /usr/lib64 /usr/lib/64 /lib32 /usr/lib32 /lib /usr/lib'' -Dnoextensions=1 -Duseshrplib -Dprefix=/usr -Dsiteprefix=''/usr/local'' -Dvendorprefix=''/usr'' -Dscriptdir=''/usr/bin'' -Dman1ext=''1'' -Dman3ext=''3pm'' -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3 -Dlocincpth=''/usr/include '' -Duselargefiles -Dd_semctl_semun -Dcf_by=''LFS'' -Dmyhostname=''localhost'' -Dperladmin=''root@localhost'' -Ud_csh -Dsh=/bin/sh -Dtargetsh=/bin/sh -Uusenm -des -Dinstallprefix=''/usr''','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(33,35,'perl Makefile.PL PREFIX=/usr INSTALLMAN3DIR=''none'' INSTALLDIRS=vendor','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(34,36,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(35,37,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(36,38,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(37,39,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static} ${OPT threads ENDIS threads}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(38,40,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-shared --bindir=/bin --with-rootlibdir=/lib64 ${OPT static-libs ENDIS static} ${OPT lzma WITHIO xz} ${OPT zlib WITHIO zlib} --with-bashcompletiondir=/usr/share/bash-completion/completions -disable-python','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(39,41,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/{$PN}-${PV} --without-emacs --without-lispdir --with-included-glib --with-included-libcroco --with-included-libunistring --without-included-gettext ${OPT acl ENDIS acl} ${OPT cxx ENDIS c++} ${OPT cxx ENDIS libasprintf} ${OPT ncurses ENDIS curses} ${OPT nls ENDIS nls} ${OPT openmp ENDIS openmp} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(40,42,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} cc_cv_CFLAGS__flto=no cc_cv_LDFLAGS__Wl__fuse_ld_gold=no cc_cv_CFLAGS__Werror_shadow=no --enable-dependency-tracking --disable-maintainer-mode --localstatedir=/var --with-pamlibdir=/lib64/security --with-bashcompletiondir=/usr/share/bash-completion/completions --enable-split-usr --with-rootprefix=/usr --with-rootlibdir=/usr/lib64 --with-sysvinit-path= --with-sysvrcnd-path= --enable-efi --enable-ima ${OPT acl ENDIS acl} ${OPT curl ENDIS libcurl} ${OPT elfutils ENDIS elfutils} ${OPT gcrypt ENDIS gcrypt} ${OPT gnuefi ENDIS gnuefi} --with-efi-libdir=/usr/lib64 ${OPT http ENDIS microhttpd} ${OPT idn ENDIS libidn} ${OPT kmod ENDIS kmod} ${OPT lz4 ENDIS lz4} ${OPT lzma ENDIS xz} ${OPT nat ENDIS libiptc} ${OPT pam ENDIS pam} ${OPT policykit ENDIS polkit} ${OPT qrcode ENDIS qrencode} ${OPT seccomp ENDIS seccomp} ${OPT xkb ENDIS xkbcommon} --without-python --with-dbuspolicydir=/etc/dbus-1/system.d --with-dbussessionservicedir=/usr/share/dbus-1/services --with-dbussystemservicedir=/usr/share/dbus-1/system-services --with-ntp-servers="0.gentoo.pool.ntp.org 1.gentoo.pool.ntp.org 2.gentoo.pool.ntp.org 3.gentoo.pool.ntp.org" --without-kill-user-processes --disable-manpages','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(41,43,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --exec-prefix= --docdir=/usr/share/doc/procps-ng-${PV} ${OPT static-libs ENDIS static} --disable-kill ${OPT ncurses WITHIO ncurses} ${OPT nls ENDIS nls} ${OPT systemd WITHIO systemd} ${OPT unicode ENDIS watch8bit}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(42,44,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-symlink-install --enable-elf-shlibs --without-included-gettext ${OPT nls ENDIS nls} --disable-libblkid --disable-libuuid --disable-fsck --disable-uuidd','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(43,45,'FORCE_UNSAFE_CONFIGURE=1 ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-no-install-program=kill,uptime --enable-largefile ${OPT caps ENDIS libcap} ${OPT nls ENDIS nls} ${OPT acl ENDIS acl} ${OPT multicall ENDIS single-binary} ${OPT xattr ENDIS xattr} ${OPT gmp WITHIO gmp}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(44,46,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT nls ENDIS nls}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(45,47,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-depedency-tracking --disable-silent-rules --libexec=/usr/lib64/misc ${OPT mpfr WITHIO mpfr} ${OPT nls ENDIS nls} ${OPT readline WITHIO readline}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(46,48,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --localstatedir=/var/lib/locate --libexecdir=/usr/lib64 ${OPT nls ENDIS nls}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(47,49,'PAGE=A4 ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --with-appresdir=/usr/share/X11/app-defaults --docdir=/usr/share/doc/${PN} ${OPT X WITHIO x}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(49,51,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --bindir=/bin','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(50,53,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-vlock','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(51,54,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(52,55,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT nls ENDIS nls} ${OPT guile WITHIO guile}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(53,56,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT xattr ENDIS xattr}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(54,57,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --localstatedir=/var ${OPT static-libs ENDIS static} --disable-doxygen-docs --disable-xml-docs --docdir=/usr/share/doc/${PN}-${PV} --with-console-auth-dir=/run/console --with-systemdsystemunitdir=/usr/lib64/systemd/system --with-systemduserunitdir=/usr/lib64/systemd/user','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(55,58,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-fs-paths-extra="/usr/sbin:/bin:/usr/bin" --docdir=/usr/share/doc/${PN} ${OPT nls ENDIS nls} --enable-agetty --with-bashcompletiondir=/usr/share/bash-completion/completions --enable-bash-completion ${OPT caps ENDIS setpriv} --disable-chfn-chsh ${OPT unicode WITHIO ncursesw} ${OPT unicode ENDIS widechar} --disable-login --disable-nologin --enable-partx ${OPT python WITHIO python} --enable-raw ${OPT readline WITHIO readline} --enable-rename --disable-reset --enable-schedutils --disable-su ${OPT suid ENDIS makeinstall-chown} ${OPT suid ENDIS makeinstall-setuid} ${OPT static-libs ENDIS static} ${OPT systemd WITHIO systemd} --with-systemdsystemunitdir=no ${OPT udev WITHIO udev}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(56,59,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} --with-systemdtmpfilesdir=/usr/lib64/tmpfiles.d --enable-setuid --enable-cache-owner=man --with-sections="1 1p 8 2 3 3p 4 5 6 7 9 0p tcl n l p o 1x 2x 3x 4x 5x 6x 7x 8x" ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static} --with-db=gdbm ${OPT gdbm WITH -db=gdbm} ${OPT berkdb WITH -db=db}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(57,60,'FORCE_UNSAFE_CONFIGURE=1 ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --bindir=/bin ${OPT acl WITHIO posix-acls} ${OPT nls ENDIS nls} ${OPT xattr WITHIO xattrs}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(58,61,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-static','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(59,5,'minizip_opt','test_dir',1,1);
INSERT INTO "config_cmds" VALUES(61,50,'${OPT unicode EXPNY ac_cv_lib_ncurses_initscr} ${OPT unicode EXPYN ac_cv_lib_ncursesw_initscr} ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(62,62,'${SRC_DIR}/${PS}-${PV}/Configure linux-x86_64 --prefix=/usr --libdir=lib64 --openssldir=/etc/ssl shared zlib-dynamic threads enable-camellia enable-idea enable-mdc2 enable-rc5 enable-tlsext','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(63,63,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-static --enable-threaded-resolver --with-ca-path=/etc/ssl/certs ${OPT ldap ENDIS ldap} ${OPT ldap ENDIS ldaps} ${OPT idn ENDIS libidn2}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(64,64,'${SRC_DIR}/${PS}-autoconf-3170000/configure ${CONFIG_DEF} --enable-threadsafe CFLAGS="${CFLAGS} -g -O2 -DSQLITE_ENABLE_FTS3=1 -DSQLITE_ENABLE_COLUMN_METADATA=1 -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 -DSQLITE_SECURE_DELETE=1 -DSQLITE_ENABLE_DBSTAT_VTAB=1 -DSQLITE_ENABLE_API_ARMOR -DSQLITE_ENABLE_EXPLAIN_COMMENTS -DSQLITE_ENABLE_FTS3_PARENTHESIS -DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_HIDDEN_COLUMNS -DSQLITE_ENABLE_JSON1 -DSQLITE_ENABLE_MEMSYS5 -DSQLITE_ENABLE_RBU -DSQLITE_ENABLE_RTREE -DSQLITE_ENABLE_STMT_SCANSTATUS -DSQLITE_ENABLE_UNKNOWN_SQL_FUNCTION -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_SOUNDEX ${OPT icu FLAGON -DSQLITE_ENABLE_ICU}" --enable-fts5 --enable-session --disable-editline ${OPT readline ENDIS readline} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(65,65,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(66,66,'yes "" | ./configure.sh config.in','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(67,68,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --disable-assert --disable-rpath ${OPT idn ENDIS iri} ${OPT ipv6 ENDIS ipv6} ${OPT nls ENDIS nls} ${OPT pcre ENDIS pcre} ${OPT ssl ENDIS digest} ${OPT ssl ENDIS opie} ${OPT idn WITHIO libidn} ${OPT ssl WITH -ssl=openssl} ${OPT zlib WITHIO zlib}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(68,69,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --with-ldflags="${LDFLAGS}" --disable-strip --with-pid-dir=/run --sysconfdir=/etc/ssh --libexecdir=/usr/lib64/misc --datadir=/usr/share/openssh --with-privsep-path=/var/empty --with-privsep-user=sshd ${OPT ldap WITHIO ldap} ${OPT pam WITHIO pam} ${OPT ssl WITHIO openssl} ${OPT ssl WITHIO md5-passwords} ${OPT ssl WITHIO ssl-engine}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(69,32,'CPPFLAGS="${CPPFLAGS} -DXML_UNICODE" ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}u',21,1);
INSERT INTO "config_cmds" VALUES(70,32,'CPPFLAGS="${CPPFLAGS} -DXML_UNICODE_WCHAR_T" ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}w',21,1);
INSERT INTO "config_cmds" VALUES(71,71,'cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=/usr ${OPT static-libs EXPNY -DBUILD_STATIC_LIBS} -DCMAKE_BUILD_TYPE=LFS   ${SRC_DIR}/${PS}-${PV}/contrib/cmake_unofficial','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(73,99,'cmake ${SRC_DIR}/${PS}-${PV} -DCMAKE_USE_SYSTEM_LIBRARIES=ON -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=no -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_DOC_DIR=/share/doc/${PN} -DCMAKE_MAN_DIR=/share/man -DCMAKE_DATA_DIR=/share/${PN} -DSPHINX_MAN=no -DSPHINX_HTML=no ${OPT ncurses EXPYN -DBUILD_CursesDialog} ${OPT qt5 FLAGON -DBUILD_QtDialog=ON}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(74,83,'mkdir -p ${BIN_DIR}/usr/sbin','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(75,83,'install -vm755 ${PKG_SOURCES}/make-ca.sh-20170119 ${BIN_DIR}/usr/sbin/make-ca.sh','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(76,100,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT acl ENDIS acl} ${OPT static-libs ENDIS static} ${OPT xattr ENDIS xattr} ${OPT bzip2 WITHIO bz2lib} ${OPT expat WITHIO expat} ${OPT iconv WITHIO iconv} ${OPT lz4 WITHIO lz4} ${OPT lzma WITHIO lzma} ${OPT lzo WITHIO lzo2} ${OPT zlib WITHIO zlib}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(77,101,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-shared ${OPT static-libs ENDIS static} --docdir=/usr/share/doc/${PN}-${PV}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(78,91,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN}-${PV} ${OPT minimal DISEN color} ${OPT minimal DISEN multibuffer} ${OPT minimal DISEN nanorc} --disable-wrapping-as-root ${OPT magic ENDIS libmagic} ${OPT spell ENDIS speller} ${OPT nls ENDIS nls} ${OPT unicode ENDIS utf8} ${OPT minimal ENDIS tiny}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(79,95,'LINKS="/usr/bin/links" ${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(80,102,'${SRC_DIR}/${PS}${PV}/unix/configure ${CONFIG_DEF} $([ $(uname -m) = x86_64 ] && echo --enable-64bit)','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(81,90,'${SRC_DIR}/${PS}/source/configure ${CONFIG_DEF} --disable-renaming --disable-samples --disable-layoutex ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(82,92,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(83,93,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-threads ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(84,74,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-ltdl-install ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(85,79,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/pcre-${PV} ${OPT cxx ENDIS cpp} ${OPT pcre16 ENDIS pcre16} ${OPT pcre32 ENDIS pcre32} ${OPT static-libs ENDIS static} ${OPT readline ENDIS pcretest-libreadline} ${OPT unicode ENDIS utf} ${OPT unicode ENDIS unicode-properties} ${OPT zlib ENDIS pcregrep-libz} ${OPT bzip2 ENDIS pcregrep-libbz2} --enable-pcre8 --enable-shared --htmldir=/usr/share/doc/${PN}/html --docdir=/usr/share/doc/${PN}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(86,89,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT icu WITHIO icu} ${OPT lzma WITHIO lzma} ${OPT ipv6 ENDIS ipv6} ${OPT static-libs ENDIS static} ${OPT readline WITHIO readline} ${OPT readline WITHIO history}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(87,94,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN} --with-html-subdir=html ${OPT crypt WITHIO crypto} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(88,86,'perl Makefile.PL PREFIX=/usr INSTALLMAN3DIR=''none'' INSTALLDIRS=vendor','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(89,87,'perl Makefile.PL PREFIX=/usr INSTALLMAN3DIR=''none'' INSTALLDIRS=vendor','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(90,85,'perl Makefile.PL PREFIX=/usr INSTALLMAN3DIR=''none'' INSTALLDIRS=vendor','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "config_cmds" VALUES(91,78,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-devel --enable-shared ${OPT nftables ENDIS nftables} ${OPT caps ENDIS bpf-compiler} ${OPT caps ENDIS nfsynproxy} ${OPT static-libs ENDIS static} ${OPT ipv6 ENDIS ipv6}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(92,77,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT ipv6 ENDIS ipv6} ${OPT kerberos ENDIS gssapi} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(93,103,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --libexecdir=/usr/lib/ConsoleKit --localstatedir=/usr ${OPT pam ENDIS pam-module} ${OPT policykit ENDIS polkit} ${OPT acl ENDIS udev-acl} --with-dbus-services=/usr/share/dbus-1/services --with-pam-module-dir=/lib/sequrity --with-xinitrc-dir=/etc/X11/xinit/xinitrc.d --without-systemdsystemunitdir','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(94,72,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --with-default-dict=''/usr/lib/cracklib_dict'' --without-python ${OPT nls ENDIS nls} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(96,76,'STRIP="true" ${SRC_DIR}/${PS}-${PV}/dist/configure ${CONFIG_DEF} ${OPT tcl ENDIS tcl} --enable-compat185 --enable-dbm --enable-o_direct --without-uniquename --enable-sql --enable-sql_codegen --disable-sql_compat --with-mutex=x86/gcc-assembly ${OPT cxx ENDIS cxx} ${OPT cxx ENDIS stl}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(97,104,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(98,105,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(99,14,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --enable-pc-files --with-shared --without-hashed-db ${OPT cxx WITHIO cxx} ${OPT cxx WITHIO cxx-binding} --with-cxx-shared ${OPT gpm WITHIO gpm} --disable-termcap --enable-symlinks --with-rcs-ids --with-manpage-format=normal --enable-const --enable-colorfgbg --enable-hard-tabs --enable-echo --enable-warnings ${OPT tinfo WITHIO termlib} --enable-widec ${OPT threads WITHIO pthread} ${OPT threads WITHIO reentrant}  --includedir=/usr/include/ncursesw','${BUILD_DIR}/t_unicode',21,1);
INSERT INTO "config_cmds" VALUES(102,106,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT xattr ENDIS xattr} ${OPT static-libs ENDIS static} --disable-compile-warnings --enable-man --with-pcre=system --with-xml-catalog=/etc/xml/catalog --with-threads=posix --disable-gtk-doc --disable-man','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(103,107,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static}','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(104,75,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} --docdir=/usr/share/doc/${PN} --htmldir=/usr/share/doc/${PN}/html --enable-securedir=/lib64/security --enable-isadir=''.'' ${OPT nls ENDIS nls} ${OPT cracklib ENDIS cracklib} ${OPT berkdb ENDIS db} ${OPT nis ENDIS nis} ${OPT pie ENDIS pie} --disable-prelude --disable-regenerate-docu','${BUILD_DIR}',NULL,1);
INSERT INTO "config_cmds" VALUES(105,81,'${SRC_DIR}/${PS}-${PV}/configure ${CONFIG_DEF} ${OPT static-libs ENDIS static} --disable-python','${BUILD_DIR}',NULL,1);
CREATE TABLE postinst_msg (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package_meta (id), msg STRING);
INSERT INTO "postinst_msg" VALUES(1,11,'Please, update you "/etc/localtime"!');
CREATE TABLE sets (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);
INSERT INTO "sets" VALUES(1,'system');
INSERT INTO "sets" VALUES(2,'world');
CREATE TABLE make_cmds (id INTEGER PRIMARY KEY AUTOINCREMENT, pkg_id INTEGER REFERENCES package (id), cmd TEXT, dir STRING, dep_by_opt_id INTEGER REFERENCES config_opts (id), opt_val_trig INTEGER);
INSERT INTO "make_cmds" VALUES(1,3,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(2,4,'make ${MAKEOPTS} TOPDIR=/usr REDO=posix_only','${SRC_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(3,5,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(5,6,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(6,7,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(7,8,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(8,9,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(9,10,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(10,11,'make ''LDFLAGS=-Wl,-O1 -Wl,--as-needed'' ''LIBPATH=/usr/lib64/gcc/$(gcc -dumpmachine)/${PV}'' ''BOOT_CFLAGS=-m64 -O2 -pipe'' bootstrap-lean ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(11,12,'make -f Makefile-libbz2_so','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(12,13,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(13,14,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(14,15,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(15,16,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(16,17,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(17,18,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(18,19,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(19,20,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(20,21,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(21,22,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(22,23,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(23,24,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(24,25,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(25,26,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(26,27,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(27,28,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(28,29,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(29,30,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(30,31,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(31,32,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(32,33,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(33,34,'BUILD_ZLIB=False BUILD_BZIP2=0 make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(34,35,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(35,36,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(36,37,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(37,38,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(38,39,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(39,40,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(40,41,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(41,42,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(42,43,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(43,44,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(44,45,'FORCE_UNSAFE_CONFIGURE=1 make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(45,46,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(46,47,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(47,48,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(48,49,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(49,50,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(50,51,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(51,52,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(52,53,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(53,54,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(54,55,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(55,56,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(56,57,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(57,58,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(58,59,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(59,60,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(60,61,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(61,12,'make clean','${SRC_DIR}/${PS}-${PV}',2,1);
INSERT INTO "make_cmds" VALUES(62,12,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',2,1);
INSERT INTO "make_cmds" VALUES(63,62,'make ${MAKEOPTS} depend','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(64,62,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(65,63,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(66,64,'make ${MAKEOPTS}','${BUILD_DIR}',0,1);
INSERT INTO "make_cmds" VALUES(67,65,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(68,66,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(69,67,'make ${MAKEOPTS} ${OPT caps EXPYN USE_CAP} ${OPT idn EXPYN USE_IDN} ${OPT gcrypt EXPYN USE_GCRYPT} ${OPT ssl EXPYN USE_CRYPTO} IPV4_TARGETS=ping ${OPT ipv6 FLAGON IPV6_TARGETS=ping6}','${SRC_DIR}/${PS}-s${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(70,68,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(71,69,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(72,32,'make ${MAKEOPTS} buildlib LIBRARY=libexpatu.la','${BUILD_DIR}u',21,1);
INSERT INTO "make_cmds" VALUES(73,32,'make ${MAKEOPTS} buildlib LIBRARY=libexpatw.la','${BUILD_DIR}w',21,1);
INSERT INTO "make_cmds" VALUES(74,82,'','',NULL,1);
INSERT INTO "make_cmds" VALUES(76,98,'','',NULL,1);
INSERT INTO "make_cmds" VALUES(77,90,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(78,92,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(79,93,'make DESTDIR=${BIN_DIR} install','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(80,74,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(81,79,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(82,89,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(83,94,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(84,86,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(85,87,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(86,85,'make ${MAKEOPTS}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(87,78,'make ${MAKEOPTS} -C iptables xtables-config-parser.h','${BUILD_DIR}',471,1);
INSERT INTO "make_cmds" VALUES(88,77,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(90,84,'make ${MAKEOPTS} ${OPT net EXPYN NET} ${OPT pci EXPYN PCI} ${OPT udev EXPYN UDEV} ${OPT usb EXPYN USB}','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(91,88,'make ${MAKEOPTS} ${OPT cracklib EXPNY CRACKLIB} ${OPT consolekit EXPNY CONSOLEKIT} ${OPT systemd EXPNY SYSTEMD} ${OPT nullok EXPNY NULLOK} ${OPT sha512 EXPNY SHA512} ${OPT minimal EXPNY MINIMAL} IMPLEMENTATION=linux-pam LINUX_PAM_VERSION=$(printf "0x%02x%02x%02x" $(echo "1.3.0" | sed -e ''s/\./ /g''))','${SRC_DIR}/${PS}-${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(92,72,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(93,81,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(94,75,'make ${MAKEOPTS} sepermitlockdir=/run/sepermit','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(96,83,'cp ${PKG_SOURCES}/certdata.txt ./','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(97,83,'${BIN_DIR}/usr/sbin/make-ca.sh --destdir ${BIN_DIR}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(98,100,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(99,101,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(100,99,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(101,71,'make ${MAKEOPT}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(102,73,'CPPFLAGS="${CPPFLAGS} ${OPT bzip2 FLAGON -DUSE_BZIP2} ${OPT unicode FLAGON -DUNICODE_SUPPORT} ${OPT unicode FLAGON -DUNICODE_WCHAR} ${OPT unicode FLAGON -DUTF8_MAYBE_NATIVE} -DLARGE_FILE_SUPPORT}" make -f unix/Makefile ${MAKEOPTS} generic','${SRC_DIR}/${PS}${PV}',NULL,1);
INSERT INTO "make_cmds" VALUES(103,91,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(104,95,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(105,102,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(106,78,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(107,103,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(109,76,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(110,104,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(111,105,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(112,14,'make ${MAKEOPTS}','${BUILD_DIR}/t_unicode',21,1);
INSERT INTO "make_cmds" VALUES(113,4,'patch -Np1 -i ${PKG_SOURCES}timezone-data-2016g-makefile.patch','${SRC_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(114,106,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(115,107,'make ${MAKEOPTS}','${BUILD_DIR}',NULL,1);
INSERT INTO "make_cmds" VALUES(116,108,'make ${MAKEOPTS} ADDCFLAGS="${OPT nls FLAGON -DUSE_GETTEXT} ${OPT ssl FLAGON -DOPENSSL_RUNTIME} ${OPT ssl FLAGON -rdynamic}" ADDLDFLAGS="${OPT ssl FLAGON -ldl}" build-shared ${OPT static-libs FLAGON lib-static}','${SRC_DIR}/${PS}-${PV}',NULL,1);
CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT);
INSERT INTO "category" VALUES(1,'app-accessibility');
INSERT INTO "category" VALUES(2,'app-admin');
INSERT INTO "category" VALUES(3,'app-antivirus');
INSERT INTO "category" VALUES(4,'app-arch');
INSERT INTO "category" VALUES(5,'app-backup');
INSERT INTO "category" VALUES(6,'app-benchmarks');
INSERT INTO "category" VALUES(7,'app-cdr');
INSERT INTO "category" VALUES(8,'app-crypt');
INSERT INTO "category" VALUES(9,'app-dicts');
INSERT INTO "category" VALUES(10,'app-doc');
INSERT INTO "category" VALUES(11,'app-editors');
INSERT INTO "category" VALUES(12,'app-emacs');
INSERT INTO "category" VALUES(13,'app-emulation');
INSERT INTO "category" VALUES(14,'app-eselect');
INSERT INTO "category" VALUES(15,'app-forensics');
INSERT INTO "category" VALUES(16,'app-i18n');
INSERT INTO "category" VALUES(17,'app-laptop');
INSERT INTO "category" VALUES(18,'app-leechcraft');
INSERT INTO "category" VALUES(19,'app-misc');
INSERT INTO "category" VALUES(20,'app-mobilephone');
INSERT INTO "category" VALUES(21,'app-office');
INSERT INTO "category" VALUES(22,'app-officeext');
INSERT INTO "category" VALUES(23,'app-pda');
INSERT INTO "category" VALUES(24,'app-portage');
INSERT INTO "category" VALUES(25,'app-shells');
INSERT INTO "category" VALUES(26,'app-text');
INSERT INTO "category" VALUES(27,'app-vim');
INSERT INTO "category" VALUES(28,'app-xemacs');
INSERT INTO "category" VALUES(29,'dev-ada');
INSERT INTO "category" VALUES(30,'dev-cpp');
INSERT INTO "category" VALUES(31,'dev-db');
INSERT INTO "category" VALUES(32,'dev-dotnet');
INSERT INTO "category" VALUES(33,'dev-embedded');
INSERT INTO "category" VALUES(34,'dev-games');
INSERT INTO "category" VALUES(35,'dev-go');
INSERT INTO "category" VALUES(36,'dev-haskell');
INSERT INTO "category" VALUES(37,'dev-java');
INSERT INTO "category" VALUES(38,'dev-lang');
INSERT INTO "category" VALUES(39,'dev-libs');
INSERT INTO "category" VALUES(40,'dev-lisp');
INSERT INTO "category" VALUES(41,'dev-lua');
INSERT INTO "category" VALUES(42,'dev-ml');
INSERT INTO "category" VALUES(43,'dev-perl');
INSERT INTO "category" VALUES(44,'dev-php');
INSERT INTO "category" VALUES(45,'dev-python');
INSERT INTO "category" VALUES(46,'dev-qt');
INSERT INTO "category" VALUES(47,'dev-ros');
INSERT INTO "category" VALUES(48,'dev-ruby');
INSERT INTO "category" VALUES(49,'dev-scheme');
INSERT INTO "category" VALUES(50,'dev-tcltk');
INSERT INTO "category" VALUES(51,'dev-tex');
INSERT INTO "category" VALUES(52,'dev-texlive');
INSERT INTO "category" VALUES(53,'dev-util');
INSERT INTO "category" VALUES(54,'dev-vcs');
INSERT INTO "category" VALUES(55,'games-action');
INSERT INTO "category" VALUES(56,'games-arcade');
INSERT INTO "category" VALUES(57,'games-board');
INSERT INTO "category" VALUES(58,'games-emulation');
INSERT INTO "category" VALUES(59,'games-engines');
INSERT INTO "category" VALUES(60,'games-fps');
INSERT INTO "category" VALUES(61,'games-kids');
INSERT INTO "category" VALUES(62,'games-misc');
INSERT INTO "category" VALUES(63,'games-mud');
INSERT INTO "category" VALUES(64,'games-puzzle');
INSERT INTO "category" VALUES(65,'games-roguelike');
INSERT INTO "category" VALUES(66,'games-rpg');
INSERT INTO "category" VALUES(67,'games-server');
INSERT INTO "category" VALUES(68,'games-simulation');
INSERT INTO "category" VALUES(69,'games-sports');
INSERT INTO "category" VALUES(70,'games-strategy');
INSERT INTO "category" VALUES(71,'games-util');
INSERT INTO "category" VALUES(72,'gnome-base');
INSERT INTO "category" VALUES(73,'gnome-extra');
INSERT INTO "category" VALUES(74,'gnustep-apps');
INSERT INTO "category" VALUES(75,'gnustep-base');
INSERT INTO "category" VALUES(76,'gnustep-libs');
INSERT INTO "category" VALUES(77,'java-virtuals');
INSERT INTO "category" VALUES(78,'kde-apps');
INSERT INTO "category" VALUES(79,'kde-base');
INSERT INTO "category" VALUES(80,'kde-frameworks');
INSERT INTO "category" VALUES(81,'kde-misc');
INSERT INTO "category" VALUES(82,'kde-plasma');
INSERT INTO "category" VALUES(83,'lxde-base');
INSERT INTO "category" VALUES(84,'lxqt-base');
INSERT INTO "category" VALUES(85,'mail-client');
INSERT INTO "category" VALUES(86,'mail-filter');
INSERT INTO "category" VALUES(87,'mail-mta');
INSERT INTO "category" VALUES(88,'mate-base');
INSERT INTO "category" VALUES(89,'mate-extra');
INSERT INTO "category" VALUES(90,'media-fonts');
INSERT INTO "category" VALUES(91,'media-gfx');
INSERT INTO "category" VALUES(92,'media-libs');
INSERT INTO "category" VALUES(93,'media-plugins');
INSERT INTO "category" VALUES(94,'media-radio');
INSERT INTO "category" VALUES(95,'media-sound');
INSERT INTO "category" VALUES(96,'media-tv');
INSERT INTO "category" VALUES(97,'media-video');
INSERT INTO "category" VALUES(98,'net-analyzer');
INSERT INTO "category" VALUES(99,'net-dialup');
INSERT INTO "category" VALUES(100,'net-dns');
INSERT INTO "category" VALUES(101,'net-firewall');
INSERT INTO "category" VALUES(102,'net-fs');
INSERT INTO "category" VALUES(103,'net-ftp');
INSERT INTO "category" VALUES(104,'net-im');
INSERT INTO "category" VALUES(105,'net-irc');
INSERT INTO "category" VALUES(106,'net-libs');
INSERT INTO "category" VALUES(107,'net-mail');
INSERT INTO "category" VALUES(108,'net-misc');
INSERT INTO "category" VALUES(109,'net-nds');
INSERT INTO "category" VALUES(110,'net-news');
INSERT INTO "category" VALUES(111,'net-nntp');
INSERT INTO "category" VALUES(112,'net-p2p');
INSERT INTO "category" VALUES(113,'net-print');
INSERT INTO "category" VALUES(114,'net-proxy');
INSERT INTO "category" VALUES(115,'net-voip');
INSERT INTO "category" VALUES(116,'net-wireless');
INSERT INTO "category" VALUES(117,'perl-core');
INSERT INTO "category" VALUES(118,'ros-meta');
INSERT INTO "category" VALUES(119,'sci-astronomy');
INSERT INTO "category" VALUES(120,'sci-biology');
INSERT INTO "category" VALUES(121,'sci-calculators');
INSERT INTO "category" VALUES(122,'sci-chemistry');
INSERT INTO "category" VALUES(123,'sci-electronics');
INSERT INTO "category" VALUES(124,'sci-geosciences');
INSERT INTO "category" VALUES(125,'sci-libs');
INSERT INTO "category" VALUES(126,'sci-mathematics');
INSERT INTO "category" VALUES(127,'sci-misc');
INSERT INTO "category" VALUES(128,'sci-physics');
INSERT INTO "category" VALUES(129,'sci-visualization');
INSERT INTO "category" VALUES(130,'sec-policy');
INSERT INTO "category" VALUES(131,'sys-apps');
INSERT INTO "category" VALUES(132,'sys-auth');
INSERT INTO "category" VALUES(133,'sys-block');
INSERT INTO "category" VALUES(134,'sys-boot');
INSERT INTO "category" VALUES(135,'sys-cluster');
INSERT INTO "category" VALUES(136,'sys-devel');
INSERT INTO "category" VALUES(137,'sys-firmware');
INSERT INTO "category" VALUES(138,'sys-freebsd');
INSERT INTO "category" VALUES(139,'sys-fs');
INSERT INTO "category" VALUES(140,'sys-infiniband');
INSERT INTO "category" VALUES(141,'sys-kernel');
INSERT INTO "category" VALUES(142,'sys-libs');
INSERT INTO "category" VALUES(143,'sys-power');
INSERT INTO "category" VALUES(144,'sys-process');
INSERT INTO "category" VALUES(145,'www-apache');
INSERT INTO "category" VALUES(146,'www-apps');
INSERT INTO "category" VALUES(147,'www-client');
INSERT INTO "category" VALUES(148,'www-misc');
INSERT INTO "category" VALUES(149,'www-plugins');
INSERT INTO "category" VALUES(150,'www-servers');
INSERT INTO "category" VALUES(151,'x11-apps');
INSERT INTO "category" VALUES(152,'x11-base');
INSERT INTO "category" VALUES(153,'x11-drivers');
INSERT INTO "category" VALUES(154,'x11-libs');
INSERT INTO "category" VALUES(155,'x11-misc');
INSERT INTO "category" VALUES(156,'x11-plugins');
INSERT INTO "category" VALUES(157,'x11-proto');
INSERT INTO "category" VALUES(158,'x11-terms');
INSERT INTO "category" VALUES(159,'x11-themes');
INSERT INTO "category" VALUES(160,'x11-wm');
INSERT INTO "category" VALUES(161,'xfce-base');
INSERT INTO "category" VALUES(162,'xfce-extra');
DELETE FROM sqlite_sequence;
INSERT INTO "sqlite_sequence" VALUES('package',108);
INSERT INTO "sqlite_sequence" VALUES('config_aliases',7);
INSERT INTO "sqlite_sequence" VALUES('prepare_cmds',112);
INSERT INTO "sqlite_sequence" VALUES('pkg_deps',294);
INSERT INTO "sqlite_sequence" VALUES('config_opts',460);
INSERT INTO "sqlite_sequence" VALUES('set_pkgs',34);
INSERT INTO "sqlite_sequence" VALUES('pkg_opts',314);
INSERT INTO "sqlite_sequence" VALUES('package_meta',110);
INSERT INTO "sqlite_sequence" VALUES('postinstall_cmds',138);
INSERT INTO "sqlite_sequence" VALUES('package_sources',134);
INSERT INTO "sqlite_sequence" VALUES('install_cmds',204);
INSERT INTO "sqlite_sequence" VALUES('config_cmds',106);
INSERT INTO "sqlite_sequence" VALUES('postinst_msg',1);
INSERT INTO "sqlite_sequence" VALUES('sets',2);
INSERT INTO "sqlite_sequence" VALUES('make_cmds',117);
INSERT INTO "sqlite_sequence" VALUES('category',162);
INSERT INTO "sqlite_sequence" VALUES('installed_pkg_files',314482);
INSERT INTO "sqlite_sequence" VALUES('installed_pkgs',313);
INSERT INTO "sqlite_sequence" VALUES('installed_pkg_opts',789);
COMMIT;
