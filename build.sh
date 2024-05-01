#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images

# Add copr repos
curl -Lo /etc/yum.repos.d/_copr_vineelsai-hypr.repo https://copr.fedorainfracloud.org/coprs/vineelsai/hypr/repo/fedora-"${RELEASE}"/vineelsai-hypr-fedora-"${RELEASE}".repo

# this installs a package from fedora repos
rpm-ostree install discord \
	hyprland \
	hyprpicker \
	hyprlock \
	hypridle \
	hyprpaper

# Example for enabling a System Unit File
systemctl enable podman.socket
