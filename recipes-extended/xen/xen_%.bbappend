FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig \
            "
do_configure:prepend() {
    cp "${WORKDIR}/sources-unpack/defconfig" "${WORKDIR}/defconfig"
}
