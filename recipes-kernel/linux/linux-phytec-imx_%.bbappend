FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://0001-arm64-dts-phyboard-pollux-Add-Overlays-for-vision-co.patch \
"
