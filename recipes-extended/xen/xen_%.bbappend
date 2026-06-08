FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://zephyr-domd.cfg \
            "
#SRC_URI += "file://defconfig \
#do_configure:prepend() {
#    cp "${UNPACKDIR}/defconfig" "${S}"
#}
