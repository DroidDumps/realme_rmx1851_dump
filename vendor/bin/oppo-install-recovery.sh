#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a13715a23cf090a4e3a6eecb4c2fcd7e0dc6fdaa; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:67108864:197e722bdaf94dd5f2eace928e44aa2034ae1498 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:67108864:a13715a23cf090a4e3a6eecb4c2fcd7e0dc6fdaa && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
