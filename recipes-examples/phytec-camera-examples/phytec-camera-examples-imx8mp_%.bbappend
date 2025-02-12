FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = "\
    file://0001-gstreamer-examples-Fix-pipeline-echo-for-save-jpeg-g.patch \
    file://0002-gstreamer-examples-Abort-gstreamer-pipelines-if-GST_.patch \
    file://0003-gstreamer-examples-Support-vision-components-sensors.patch \
    file://0004-opencv-examples-Support-vision-components-sensors.patch \
"
