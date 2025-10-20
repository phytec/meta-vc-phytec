SUMMARY = "Kernel module driver for Vision Components cameras"
DESCRIPTION = "${SUMMARY}"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

VC_NXP_GIT = "github.com/VC-MIPI-modules/vc_mipi_nxp.git"
VC_CORE_GIT = "github.com/VC-MIPI-modules/vc_mipi_core.git"

SRC_URI = " \
    git://${VC_NXP_GIT};protocol=https;branch=develop;destsuffix=git/nxp;name=vc_mipi_nxp \
    git://${VC_CORE_GIT};protocol=https;branch=nxp/develop;destsuffix=git/core;name=vc_mipi_core \
    file://Makefile;subdir=git \
"

#SRCREV = "edccb8f17e21e0a79a6b7381ff46053ee710cdac"
#SRCREV = "7eac950a79071373a826229bd5c05e1cace12656"
SRCREV_vc_mipi_nxp = "${AUTOREV}"
SRCREV_vc_mipi_core = "${AUTOREV}"
SRCREV_FORMAT = "vc_mipi_nxp_vc_mipi_core"

S = "${WORKDIR}/git"

unpack_driver() {
    install -m 0644 ${S}/nxp/src/vc_mipi_camera.c ${S}
    install -m 0644 ${S}/core/vc_mipi_core.c ${S}
    install -m 0644 ${S}/core/vc_mipi_core.h ${S}
    install -m 0644 ${S}/core/vc_mipi_modules.c ${S}
    install -m 0644 ${S}/core/vc_mipi_modules.h ${S}
}

do_unpack:append() {
    bb.build.exec_func('unpack_driver', d)
}

RPROVIDES:${PN} += "kernel-module-vc-mipi"

COMPATIBLE_MACHINE = "(mx8mp-nxp-bsp)"
