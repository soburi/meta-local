PARALLEL_MAKEINST = "-j1"

do_install:append() {
    rm -f ${D}${bindir}/ssh ${D}${bindir}/ssh-add ${D}${bindir}/ssh-agent ${D}${bindir}/ssh-keygen ${D}${bindir}/ssh-keyscan
    rm -f ${D}${sbindir}/sshd ${D}${libexecdir}/sshd-session ${D}${libexecdir}/sshd-auth
    cp ${B}/ssh ${D}${bindir}/ssh
    cp ${B}/ssh-add ${D}${bindir}/ssh-add
    cp ${B}/ssh-agent ${D}${bindir}/ssh-agent
    cp ${B}/ssh-keygen ${D}${bindir}/ssh-keygen
    cp ${B}/ssh-keyscan ${D}${bindir}/ssh-keyscan
    cp ${B}/sshd ${D}${sbindir}/sshd
    cp ${B}/sshd-session ${D}${libexecdir}/sshd-session
    cp ${B}/sshd-auth ${D}${libexecdir}/sshd-auth
    chmod 0755 ${D}${bindir}/ssh ${D}${bindir}/ssh-add ${D}${bindir}/ssh-agent ${D}${bindir}/ssh-keygen ${D}${bindir}/ssh-keyscan
    chmod 0755 ${D}${sbindir}/sshd ${D}${libexecdir}/sshd-session ${D}${libexecdir}/sshd-auth
}
