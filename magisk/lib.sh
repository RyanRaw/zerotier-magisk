# variables

ZTROOT=/data/adb/zerotier
APPROOT=/data/data/com.eventlowop.zerotier_magisk_app/app_flutter

ZT_LOG=$ZTROOT/run/zerotier.log
DAEMON_LOG=$ZTROOT/run/daemon.log

PIPE_CLI=$ZTROOT/run/pipe
PIPE_APP=$APPROOT/run/pipe

# LD_LIBRARY_PATH for NDK
export LD_LIBRARY_PATH=/system/lib64:/data/adb/zerotier/lib

__start() {
  # add main route table to lookup rules
  ip rule add from all lookup main pref 1
  ip -6 rule add from all lookup main pref 1

  # start zerotier daemon
  nohup $ZTROOT/zerotier-one -d >> $ZT_LOG 2>&1 &
}