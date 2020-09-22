inherit core-image

IMAGE_AUTOLOGIN ?= "1"

AUTOLOGIN = "${@ 'autologin' if d.getVar('IMAGE_AUTOLOGIN') == '1' else '' }"

inherit ${AUTOLOGIN}

COMMON_FEATURES = " \
    ssh-server-dropbear \
    hwcodecs \
    "
IMAGE_FEATURES += "${COMMON_FEATURES}"

COMMON_INSTALL = " \
    openssh-sftp-server \
    tcf-agent \
    mtd-utils \
    bridge-utils \
    canutils \
    pciutils \
    kernel-modules \
    "

IMAGE_INSTALL = " \
    packagegroup-core-boot \
    ${COMMON_INSTALL} \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

COMMON_INSTALL_append_zynqmp = " hellopm haveged"
COMMON_INSTALL_append_zynq = " haveged"
COMMON_INSTALL_append_versal = " haveged"


IMAGE_LINGUAS = " "

FEATURE_PACKAGES_petalinux-base ?= "packagegroup-petalinux"
FEATURE_PACKAGES_petalinux-x11 ?= "packagegroup-petalinux-x11"
FEATURE_PACKAGES_petalinux-x11[optional] ?= "1"
FEATURE_PACKAGES_petalinux-matchbox ?= "packagegroup-petalinux-matchbox"
FEATURE_PACKAGES_petalinux-matchbox[optional] ?= "1"
FEATURE_PACKAGES_petalinux-weston ?= "packagegroup-petalinux-weston"
FEATURE_PACKAGES_petalinux-weston[optional] ?= "1"
FEATURE_PACKAGES_petalinux-self-hosted ?= "packagegroup-petalinux-self-hosted"
FEATURE_PACKAGES_petalinux-self-hosted[optional] ?= "1"
FEATURE_PACKAGES_petalinux-qt ?= "packagegroup-petalinux-qt"
FEATURE_PACKAGES_petalinux-qt[optional] ?= "1"
FEATURE_PACKAGES_petalinux-opencv ?= "packagegroup-petalinux-opencv"
FEATURE_PACKAGES_petalinux-opencv[optional] ?= "1"
FEATURE_PACKAGES_petalinux-benchmarks ?= "packagegroup-petalinux-benchmarks"
FEATURE_PACKAGES_petalinux-benchmarks[optional] ?= "1"
FEATURE_PACKAGES_petalinux-gstreamer ?= "packagegroup-petalinux-gstreamer"
FEATURE_PACKAGES_petalinux-gstreamer[optional] ?= "1"
FEATURE_PACKAGES_petalinux-audio ?= "packagegroup-petalinux-audio"
FEATURE_PACKAGES_petalinux-audio[optional] ?= "1"
FEATURE_PACKAGES_petalinux-xen ?= "packagegroup-petalinux-xen"
FEATURE_PACKAGES_petalinux-xen[optional] ?= "1"
FEATURE_PACKAGES_petalinux-openamp ?= "packagegroup-petalinux-openamp"
FEATURE_PACKAGES_petalinux-openamp[optional] ?= "1"
FEATURE_PACKAGES_petalinux-mraa ?= "packagegroup-petalinux-mraa"
FEATURE_PACKAGES_petalinux-mraa[optional] ?= "1"
FEATURE_PACKAGES_petalinux-display-debug ?= "packagegroup-petalinux-display-debug"
FEATURE_PACKAGES_petalinux-display-debug[optional] ?= "1"
FEATURE_PACKAGES_petalinux-multimedia ?= "packagegroup-petalinux-multimedia"
FEATURE_PACKAGES_petalinux-multimedia[optional] ?= "1"
FEATURE_PACKAGES_petalinux-networking-debug ?= "packagegroup-petalinux-networking-debug"
FEATURE_PACKAGES_petalinux-networking-debug[optional] ?= "1"
FEATURE_PACKAGES_petalinux-networking-stack ?= "packagegroup-petalinux-networking-stack"
FEATURE_PACKAGES_petalinux-networking-stack[optional] ?= "1"
FEATURE_PACKAGES_petalinux-python-modules ?= "packagegroup-petalinux-python-modules"
FEATURE_PACKAGES_petalinux-python-modules[optional] ?= "1"
FEATURE_PACKAGES_petalinux-qt-extended ?= "packagegroup-petalinux-qt-extended"
FEATURE_PACKAGES_petalinux-qt-extended[optional] ?= "1"
FEATURE_PACKAGES_petalinux-utils ?= "packagegroup-petalinux-utils"
FEATURE_PACKAGES_petalinux-utils[optional] ?= "1"
FEATURE_PACKAGES_petalinux-v4lutils ?= "packagegroup-petalinux-v4lutils"
FEATURE_PACKAGES_petalinux-v4lutils[optional] ?= "1"
FEATURE_PACKAGES_petalinux-lmsensors ?= "packagegroup-petalinux-lmsensors"
FEATURE_PACKAGES_petalinux-lmsensors[optional] ?= "1"
FEATURE_PACKAGES_fpga-manager ?= "fpga-manager-script fpga-manager-util"
FEATURE_PACKAGES_fpga-manager[optional] ?= "1"