#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:97d2ea67725d1300f8606a4c3345bb43c98aa168; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:82cf25abe77a46afe929e319e69131a8806701c7 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:97d2ea67725d1300f8606a4c3345bb43c98aa168 && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
