FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

SRC_URI += " \
    file://0001-Added-VC-MIPI-CSI-2-driver.patch \
    file://isp-mode-select.patch;patchdir=../ \
    file://vc-mipi-setup.sh \
"

do_install:append() {
    install -m 0755 ${WORKDIR}/vc-mipi-setup.sh ${D}/opt/imx8-isp/bin/
}

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libvc-mipi.so \
"
