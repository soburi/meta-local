#FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

#SRC_URI += "file://defconfig \
#"

KERNEL_FEATURES:append:qemuarm64 = " cfg/virtio.scc"

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
SRC_URI += "file://virtio_extra.cfg \
"
KERNEL_CONFIG_FRAGMENTS:append = " file://virtio_extra.cfg"
