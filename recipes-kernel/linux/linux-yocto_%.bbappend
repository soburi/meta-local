
# このディレクトリ以下の files/ を検索パスに追加
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRC_URI += "file://defconfig \
           file://0001-PATCH-virtio_log.patch \
"
