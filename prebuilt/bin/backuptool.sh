#!/sbin/sh
#
# Backup and restore addon /system files
#

export C=/tmp/backupdir
export sysdev=$2

export ADDOND_VERSION=1

# Scripts in /system/addon.d expect to find backuptool.functions in /tmp
cp -f /tmp/install/bin/backuptool.functions /tmp

# Preserve /system/addon.d in /tmp/addon.d
preserve_addon_d() {
  if [ -d $S/addon.d/ ]; then
    mkdir -p /tmp/addon.d/
    cp -a $S/addon.d/* /tmp/addon.d/

    # Discard any scripts that aren't at least our version level
    for f in /postinstall/tmp/addon.d/*sh; do
      SCRIPT_VERSION=$(grep "^# ADDOND_VERSION=" $f | cut -d= -f2)
      if [ -z "$SCRIPT_VERSION" ]; then
        SCRIPT_VERSION=1
      fi
      if [ $SCRIPT_VERSION -lt $ADDOND_VERSION ]; then
        rm $f
      fi
    done

    chmod 755 /tmp/addon.d/*.sh
  fi
}

# Restore /system/addon.d from /tmp/addon.d
restore_addon_d() {
  if [ -d /tmp/addon.d/ ]; then
    mkdir -p $S/addon.d/
    cp -a /tmp/addon.d/* $S/addon.d/
    rm -rf /tmp/addon.d/
  fi
}

# Execute /system/addon.d/*.sh scripts with $1 parameter
run_stage() {
if [ -d /tmp/addon.d/ ]; then
  for script in $(find /tmp/addon.d/ -name '*.sh' |sort -n); do
    $script $1
  done
fi
}

system() {
  if [[ ! -z $(mount | grep system) ]]; then
    umount $(mount | grep system | sed "s|.*on ||;s| .*||")
  fi

  if [ -d /mnt/system ]; then
    sysmount="/mnt/system"
  elif [ -d /system_root ]; then
    sysmount="/system_root"
  else
    sysmount="/system"
  fi

  export S=$sysmount/system
}

mountsys() {
  mount -t ext4 $sysdev $sysmount -o rw,discard
}

umountsys() {
  umount $sysmount
}

system

case "$1" in
  backup)
    mountsys
    mkdir -p $C
    preserve_addon_d
    run_stage pre-backup
    run_stage backup
    run_stage post-backup
    umountsys
  ;;
  restore)
    mountsys
    run_stage pre-restore
    run_stage restore
    run_stage post-restore
    restore_addon_d
    rm -rf $C
    sync
    umountsys
  ;;
  *)
    echo "Usage: $0 {backup|restore}"
    exit 1
esac

exit 0
