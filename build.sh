#!/bin/bash

set -ouex pipefail

RELEASE="$(rpm -E %fedora)"

### Install packages
# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# Add copr repos
curl -Lo /etc/yum.repos.d/_copr_solopasha-hypr.repo https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-"${RELEASE}"/solopasha-hyprland-fedora-"${RELEASE}".repo

# this installs a package from fedora repos
rpm-ostree --idempotent install \
    adobe-source-han-sans-jp-fonts \
    adobe-source-han-serif-jp-fonts \
    mozilla-fira-mono-fonts \
    powerline-fonts \
    jetbrains-mono-fonts-all \
    google-droid-sans-mono-fonts \
    kvantum \
    kvantum-qt5 \
    qt6ct \
    qt5ct \
    onedrive \
    zathura \
    imv \
    zathura-plugins-all \
    fcitx5 \
    fcitx5-configtool \
    fcitx5-gtk \
    fcitx5-qt5 \
    fcitx5-mozc \
    neovim \
    eza \
    ripgrep \
    zoxide \
    trash-cli \
    tmux \
    iotop \
    tokei \
    podmansh \
    stow \
    podman-tui \
    podman-compose \
    podman-docker \
    piper

# Hyprland Stuff
rpm-ostree --idempotent install \
    fish \
    hyprland \
    hyprland-contrib \
    hyprpicker \
    hyprlock \
    hypridle \
    rofi-wayland \
    swww \
    aylurs-gtk-shell \
    fd-find \
    polkit-gnome \
    network-manager-applet \
    wl-clipboard \
    brightnessctl \
    playerctl \
    kanshi \
    pavucontrol \
    blueman \
    kitty

# Cosmic
# curl -Lo /etc/yum.repos.d/_copr_ryanabx-cosmic.repo https://copr.fedorainfracloud.org/coprs/ryanabx/cosmic-epoch/repo/fedora-"${RELEASE}"/ryanabx-cosmic-epoch-fedora-"${RELEASE}".repo
# rpm-ostree --idempotent install cosmic-desktop

# Proton vpn
wget "https://repo.protonvpn.com/fedora-$RELEASE-stable/protonvpn-stable-release/protonvpn-stable-release-1.0.1-2.noarch.rpm"
rpm-ostree install ./protonvpn-stable*.rpm
rpm-ostree install proton-vpn-gnome-desktop

# Example for enabling a System Unit File
systemctl enable podman.socket
systemctl disable tailscaled.service
systemctl disable btrfs-dedup@var-home.timer

curl -Lo /usr/bin/kmonad https://github.com/kmonad/kmonad/releases/latest/download/kmonad
chmod +x /usr/bin/kmonad
curl -Lo /usr/share/ublue-os/just/60-custom.just https://raw.githubusercontent.com/lcroberts/wmbazzite/main/custom.just
curl -Lo /usr/share/ublue-os/just/65-bluefin-tools.just https://raw.githubusercontent.com/lcroberts/wmbazzite/main/bluefin-tools.just

update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 50
update-alternatives --set x-terminal-emulator /usr/bin/kitty
