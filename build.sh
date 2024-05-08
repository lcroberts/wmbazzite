#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# Add copr repos
curl -Lo /etc/yum.repos.d/_copr_vineelsai-hypr.repo https://copr.fedorainfracloud.org/coprs/vineelsai/hypr/repo/fedora-"${RELEASE}"/vineelsai-hypr-fedora-"${RELEASE}".repo
curl -Lo /etc/yum.repos.d/_copr_wezfurlong-wezterm.repo https://copr.fedorainfracloud.org/coprs/wezfurlong/wezterm-nightly/repo/fedora-"${RELEASE}"/wezfurlong-wezterm-nightly-fedora-"${RELEASE}".repo

# this installs a package from fedora repos
rpm-ostree install \
	adobe-source-han-sans-jp-fonts \
	adobe-source-han-serif-jp-fonts \
	mozilla-fira-mono-fonts \
	powerline-fonts \
	jetbrains-mono-fonts-all \
	google-droid-sans-mono-fonts \
	rofi-wayland \
	kvantum \
	kvantum-qt5 \
	qt6ct \
	qt5ct \
	onedrive \
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
	neovim \
	eza \
	ripgrep \
	zoxide \
	tmux \
	iotop \
	podman-docker \
	podman-tui \
	podman-compose \
	podmansh \
	wezterm \
	stow

# Hyprland Stuff
rpm-ostree install \
	hyprland \
	hyprpicker \
	hyprlock \
	hypridle \
	hyprpaper \
	slurp \
	grim \
	jq
# Get grimblast
curl -Lo /usr/bin/grimblast https://raw.githubusercontent.com/hyprwm/contrib/main/grimblast/grimblast
chmod +x /usr/bin/grimblast

# Sway Stuff
# rpm-ostree uninstall gamescope gamescope-shaders # Conflicting wlroots
# rpm-ostree install \
# 	sway \
# 	swaybg \
# 	swayidle \
# 	grimshot \
# 	hyprlock \
# 	python3-i3ipc # For autotiling script
#
# read -d '\n' sway_run <<EOF
# #!/usr/bin/env sh
# export XDG_CURRENT_DESKTOP="sway"
# export XDG_SESSION_DESKTOP="sway"
# export XDG_SESSION_TYPE="wayland"
# export QT_QPA_PLATFORM="wayland"
# export QT_QPA_PLATFORMTHEME="qt6ct"
# sway
# EOF
#
# echo "$sway_run" >/usr/share/wayland-sessions/sway_run
# chmod +x /usr/share/wayland-sessions/sway_run
#
# read -d '\n' sway_session_file <<EOF
# [Desktop Entry]
# Name=Sway (Themed)
# Comment=An i3-compatible Wayland compositor
# Exec=./sway_run
# Type=Application
# EOF
#
# echo "$sway_session_file" >/usr/share/wayland-sessions/sway_themed.desktop

# General Wayland WM Stuff
rpm-ostree install \
	waybar \
	polkit-gnome \
	network-manager-applet \
	wl-clipboard \
	brightnessctl \
	playerctl \
	kanshi

# Example for enabling a System Unit File
systemctl enable podman.socket
sudo systemctl disable tailscaled.service
