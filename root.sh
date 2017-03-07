#!/bin/sh
mkdir -pv ${ROOT}/{dev,proc,sys,run}
mknod -m 600 ${ROOT}/dev/console c 5 1
mknod -m 666 ${ROOT}/dev/null c 1 3
mkdir -pv ${ROOT}/{bin,boot,etc/{opt,sysconfig},home,lib/firmware,mnt,opt}
mkdir -pv ${ROOT}/{media/{floppy,cdrom},sbin,srv,var}
install -dv -m 0750 ${ROOT}/root
install -dv -m 1777 ${ROOT}/tmp ${ROOT}/var/tmp
mkdir -pv ${ROOT}/usr/{,local/}{bin,include,lib,sbin,src}
mkdir -pv ${ROOT}/usr/{,local/}share/{color,dict,doc,info,locale,man}
mkdir -v  ${ROOT}/usr/{,local/}share/{misc,terminfo,zoneinfo}
mkdir -v  ${ROOT}/usr/libexec
mkdir -pv ${ROOT}/usr/{,local/}share/man/man{1..8}

case $(uname -m) in
 x86_64) mkdir -pv ${ROOT}/lib64 
         mkdir -pv ${ROOT}/usr/lib64 
    ;;
esac

mkdir -v ${ROOT}/var/{log,mail,spool}
ln -sv /run ${ROOT}/var/run
ln -sv /run/lock ${ROOT}/var/lock
mkdir -pv ${ROOT}/var/{opt,cache,lib/{color,misc,locate},local}
