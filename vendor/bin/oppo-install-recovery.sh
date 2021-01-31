#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7f1e3524c2c59e2930d4f3799d79f99ab2409cb6; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:29969825ea21314d01f54f3563a46fbe1ea5ebc9 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:7f1e3524c2c59e2930d4f3799d79f99ab2409cb6 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
