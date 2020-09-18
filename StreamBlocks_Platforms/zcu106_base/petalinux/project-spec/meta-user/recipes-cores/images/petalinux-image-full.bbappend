DESCRIPTION = "An image containing the full set of packages in the Petalinux distro."
LICENSE = "MIT"

require petalinux-image-common.inc

TRACING_PROFILE_FEATURES = "\
    tools-debug \
    tools-profile \
    tools-testapps \
    "

ZYNQ_FEATURES = " \
    petalinux-benchmarks \
    dev-pkgs \
    package-management \
    ptest-pkgs \
    splash \
    tools-sdk \
    petalinux-base \
    petalinux-qt \
    petalinux-opencv \
    petalinux-display-debug \
    petalinux-networking-debug \
    petalinux-networking-stack \
    petalinux-python-modules \
    petalinux-qt-extended \
    petalinux-utils \
    petalinux-v4lutils \
    petalinux-lmsensors \
    ${TRACING_PROFILE_FEATURES} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'petalinux-self-hosted', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'petalinux-x11', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'petalinux-matchbox', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'openamp', 'petalinux-openamp', '', d)} \
    "

IMAGE_FEATURES_append_zynq = " ${ZYNQ_FEATURES}"

ZYNQMP_FEATURES = " \
    petalinux-benchmarks \
    petalinux-gstreamer \
    petalinux-audio \
    petalinux-mraa \
    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'petalinux-multimedia', '', d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'petalinux-weston', '', d)} \
    "
IMAGE_FEATURES_append_zynqmp = " ${ZYNQ_FEATURES} ${ZYNQMP_FEATURES}"

IMAGE_FEATURES_append_versal = " ${ZYNQ_FEATURES} ${ZYNQMP_FEATURES}"

IMAGE_FEATURES_append_microblaze = " ${TRACING_PROFILE_FEATURES}"

IMAGE_FSTYPES_remove = "cpio.gz cpio cpio.gz.u-boot cpio.bz2"

IMAGE_INSTALL_append = " haveged"
#Note: Mention Each package in individual line
#      cascaded representation with line breaks are not valid in this file.
IMAGE_INSTALL_append = " peekpoke"
IMAGE_INSTALL_append = " gpio-demo"
IMAGE_INSTALL_append = " packagegroup-base-extended"
IMAGE_INSTALL_append = " cmake"
IMAGE_INSTALL_append = " lmsensors-sensorsdetect"
IMAGE_INSTALL_append = " python-pyserial"
IMAGE_INSTALL_append = " libftdi"
IMAGE_INSTALL_append = " python3-pip"
IMAGE_INSTALL_append = " iperf3"
IMAGE_INSTALL_append = " packagegroup-petalinux-v4lutils"
IMAGE_INSTALL_append = " packagegroup-petalinux-96boards-sensors"
IMAGE_INSTALL_append = " packagegroup-petalinux-x11"
IMAGE_INSTALL_append = " packagegroup-petalinux-matchbox"
IMAGE_INSTALL_append = " nano"

IMAGE_INSTALL_append = " iperf3"
IMAGE_INSTALL_append = " bonnie++"



# Bluetooth stack
IMAGE_INSTALL_append = " bluez5"


# StreamBlocks
IMAGE_INSTALL_append = " libsdl2"
IMAGE_INSTALL_append = " htop"