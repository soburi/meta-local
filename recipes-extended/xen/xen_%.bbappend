# このディレクトリ以下の files/ を検索パスに追加
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# ビルドツリーに defconfig をコピー
SRC_URI += "file://defconfig \
            file://0001-debug-printk.patch \
            "

#EXTRA_OECONF:remove = "\
#    --disable-stubdom \
#    --disable-ioemu-stubdom \
#    --disable-xenstore-stubdom \
#"

# stubdom を有効化
#EXTRA_OECONF:append = " \
#    --enable-stubdom \
#    --enable-ioemu-stubdom \
#    --enable-xenstore-stubdom \
#    --enable-qemu-traditional \
#"

#    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH};name=xen 


#SRC_URI:remove = " \
#    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
#"

#SRC_URI:append = " \
#    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH};name=xen;destsuffix=git/xen \
#    git://xenbits.xen.org/mini-os.git;protocol=git;branch=xen-${XEN_BRANCH};name=mini-os;destsuffix=git/xen/extras/mini-os-remote \
#    git://xenbits.xen.org/seabios.git;protocol=git;name=seabios;tag=rel-1.16.3;nobranch=1;destsuffix=git/xen/tools/firmware/seabios-dir-remote \
#    git://xenbits.xen.org/qemu-xen-traditional.git;name=qemu;tag=xen-4.19.0;nobranch=1;destsuffix=git/xen/tools/qemu-xen-traditional-dir \
#    file://0001-PATCH-tools-Makefile-fix-qemu-xen-traditional-direct.patch;striplevel=1 \
#"

# （オプション）mini-OS を特定のコミットに固定したい場合
# xen-RELEASE-4.19.1 タグのコミットハッシュ
#SRCREV_xen =     "8dd897e69119492989aaa034967f3a887f590197"
#SRCREV_mini-os = "a400dd51706867565ed1382b23d3475bb30668c2"
#SRCREV_seabios = "a6ed6b701f0a57db0569ab98b0661c12a6ec3ff8"
#SRCREV_qemu = "3d273dd05e51e5a1ffba3d98c7437ee84e8f8764"

#SRCREV_FORMAT    = "xen_mini-os_seabios-qemu"

#S = "${WORKDIR}/git/xen"

# xen_%.bbappend

# ビルドホスト側に zlib を用意
#DEPENDS:append = " zlib-native"

# （もし Xen がランタイムで zlib を使うなら）
#RDEPENDS_${PN}:append = " zlib"

EXTRA_OEMAKE:append = " debug=y"


do_configure:prepend() {
    cp "${WORKDIR}/sources-unpack/defconfig" "${WORKDIR}/defconfig"
}

#do_configure:prepend() {
#    cd ${S}/tools/qemu-xen-traditional-dir
#    ./configure ${EXTRA_OECONF}
#}

#do_install:append() {
#    # DESTDIR を指定して、Yocto のインストールパスに合わせてインストール
#    oe_runmake install-stubdom DESTDIR=${D}${prefix}
#}
