set -x

cp /home/crs/dom0x/poky/build/tmp/deploy/images/qemuarm64/xen-image-minimal-qemuarm64.rootfs.qemuboot.dtb /tmp/xen.dtb
fdtput -t s -p /tmp/xen.dtb /chosen xen,xen-bootargs "xsm=flask flask=permissive loglvl=all guest_loglvl=all"

#
/home/crs/dom0x/poky/build/tmp/sysroots-components/x86_64/qemu-system-native/usr/bin/qemu-system-aarch64 \
  -machine virt,virtualization=true,gic-version=3 \
  -cpu cortex-a57 \
  -smp 4 -m 1024 \
  -nographic \
  -serial mon:stdio \
  -netdev user,id=net0,hostfwd=tcp:127.0.0.1:2222-10.0.2.15:22 \
  -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:56 \
  -kernel /home/crs/dom0x/poky/build/tmp/deploy/images/qemuarm64/xen-qemuarm64 \
  -dtb /tmp/xen.dtb \
  -device guest-loader,addr=0x45000000,kernel=/home/crs/dom0x/poky/build/tmp/deploy/images/qemuarm64/Image,bootargs="console=hvc0 earlyprintk=xen dom0_mem=512M dom0_max_vcpus=2 loglvl=all guest_loglvl=all loglvl_xen=all" \
  -drive file=/home/crs/dom0x/poky/build/tmp/deploy/images/qemuarm64/xen-image-minimal-qemuarm64.rootfs.ext4,if=virtio,format=raw
