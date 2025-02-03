FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}/:"

SRC_URI += " \
    file://0001-Added-VC-MIPI-CSI-2-driver.patch \
    file://isp-mode-select.patch;patchdir=../ \
"

FILES_SOLIBS_VERSIONED += " \
    ${libdir}/libvc-mipi.so \
"
