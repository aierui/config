
[root@fusiondev ~]# lsof -i:20000
COMMAND   PID USER   FD   TYPE    DEVICE SIZE/OFF NODE NAME
r2      37363 root   26u  IPv4 824533162      0t0  TCP *:dnp (LISTEN)
-r--r--r--  1 root root 0 Mar 19 05:11 wchan
[root@fusiondev ~]# ll -lh /proc/37363/maps
-r--r--r-- 1 root root 0 Mar 19 05:11 /proc/37363/maps
[root@fusiondev ~]# cat /proc/37363/maps
00400000-0134f000 r-xp 00000000 fd:1d 218158095                          /home/bigdata/xxx.5/cmake-build-debug-remote-163/r2
0154f000-01573000 r--p 00f4f000 fd:1d 218158095                          /home/bigdata/xxx.5/cmake-build-debug-remote-163/r2
01573000-01579000 rw-p 00f73000 fd:1d 218158095                          /home/bigdata/xxx.5/cmake-build-debug-remote-163/r2
01579000-01c50000 rw-p 00000000 00:00 0
0385d000-042ea000 rw-p 00000000 00:00 0                                  [heap]
7fb554000000-7fb554021000 rw-p 00000000 00:00 0
7fb554021000-7fb558000000 ---p 00000000 00:00 0
7fb558000000-7fb558021000 rw-p 00000000 00:00 0
[root@fusiondev ~]# gdb attch 37363
Loaded symbols for /lib64/libgcc_s.so.1
0x00007fb64dff8fd3 in epoll_wait () from /lib64/libc.so.6
Missing separate debuginfos, use: debuginfo-install glibc-2.17-324.el7_9.x86_64 keyutils-libs-1.5.8-3.el7.x86_64 krb5-libs-1.13.2-10.el7.x86_64 libcom_err-1.42.9-7.el7.x86_64 libgcc-4.8.5-16.el7_4.2.x86_64 libselinux-2.5-11.el7.x86_64 openssl-libs-1.0.2k-22.el7_9.x86_64 pcre-8.32-17.el7.x86_64 zlib-1.2.7-19.el7_9.x86_64
(gdb) dump memory /tmp/r2.20000.mem  0x01579000 0x01c50000
(gdb) quit
[root@fusiondev ~]# ll -lh /tmp/r2*
-rw-r--r-- 1 root root 6.9M Mar 19 14:21 /tmp/r2.20000.mem
-rw-r--r-- 1 root root  11M Mar 19 14:23 /tmp/r2.20000.mem.heap


strings -10 sshd.dump   #查看sshd.dump内存中至少大于10字符的字符


[root@fusiondev ~]# hexdump -C /tmp/r2.20000.mem.heap

