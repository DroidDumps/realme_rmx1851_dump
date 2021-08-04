#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:62e5763c33879a20939c00cf220372ff0b2db12c; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:db76b6312737ba064f8d550173050e38ab79a5f5 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:62e5763c33879a20939c00cf220372ff0b2db12c && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
