FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += " \
    file://vc_mipi_dewarp_template.json \
    file://vc_mipi_tuning_template_bw.xml \
    file://vc_mipi_tuning_template_col.xml \
"

do_install:append() {
    install -m 0644 ${WORKDIR}/vc_mipi_dewarp_template.json ${D}/opt/imx8-isp/bin/
    install -m 0644 ${WORKDIR}/vc_mipi_tuning_template_bw.xml ${D}/opt/imx8-isp/bin/
    install -m 0644 ${WORKDIR}/vc_mipi_tuning_template_col.xml ${D}/opt/imx8-isp/bin/
}
