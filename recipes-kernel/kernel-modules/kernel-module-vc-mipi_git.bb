SUMMARY = "Kernel module driver for Vision Components cameras"
DESCRIPTION = "${SUMMARY}"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0-only;md5=801f80980d171dd6425610833a22dbe6"

inherit module

VC_GIT = "github.com/VC-MIPI-modules/vc_mipi_nxp.git"
VC_SUBPATH = "src/"

SRC_URI = " \
    git://${VC_GIT};protocol=https;branch=develop;subpath=${VC_SUBPATH};subdir=git/ \
    file://Makefile;subdir=git \
    file://0001-Fix-build-with-linux-6.6.patch \
"

#SRCREV = "edccb8f17e21e0a79a6b7381ff46053ee710cdac"
SRCREV = "7eac950a79071373a826229bd5c05e1cace12656"

S = "${WORKDIR}/git"

RPROVIDES:${PN} += "kernel-module-vc-mipi"

COMPATIBLE_MACHINE = "(mx8mp-nxp-bsp)"
