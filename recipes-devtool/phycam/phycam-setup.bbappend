FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://91-phycam-vc.rules \
    file://setup-pipeline.patch;patchdir=../ \
"

do_install:append() {
    install -m 0644 ${WORKDIR}/91-phycam-vc.rules \
                    ${D}${nonarch_base_libdir}/udev/rules.d/
}
