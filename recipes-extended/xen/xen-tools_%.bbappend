# このディレクトリ以下の files/ を検索パスに追加
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# ビルドツリーに defconfig をコピー
SRC_URI += "file://0001-debug-printk.patch \
"

IMAGE_INSTALL:append = " xen-tools-xcutils"

INSANE_SKIP:pn-xen-tools:append = "buildpaths"
INSANE_SKIP:pn-xen-tools-dbg:append = "buildpaths"
INSANE_SKIP:pn-xen-tools-staticdev:append = "buildpaths"

EXTRA_OECONF:remove = "--disable-xcutils"
EXTRA_OECONF:append = " --enable-xcutils"
