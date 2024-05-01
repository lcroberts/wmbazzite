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
	hyprpaper \
	waybar \
	wl-clipboard \
	grimshot \
	brightnessctl \
	playerctl \
	kanshi \
	rofi-wayland \
	kvantum \
	qt6ct \
	onedrive \
	neovim \
	eza \
	zoxide \
	tmux \
	zathura \
	zathura-pdf-mupdf \
	zathura-djvu \
	zathura-ps \
	zathura-cb \
	fcitx5 \
	fcitx5-configtool \
	fcitx5-gtk \
	fcitx5-qt5 \
	fcitx5-mozc \
	adobe-source-han-sans-jp-fonts \
	adobe-source-han-serif-jp-fonts \
	virt-manager \
	qemu \
	qemu-kvm \
	swtpm

# Example for enabling a System Unit File
systemctl enable podman.socket
systemctl enable libvirtd
