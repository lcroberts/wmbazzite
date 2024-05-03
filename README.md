# Hyprbazzite

[![build-hyprbazzite](https://github.com/lcroberts/hyprbazzite/actions/workflows/build.yml/badge.svg)](https://github.com/lcroberts/hyprbazzite/actions/workflows/build.yml)

# Purpose

This repository is intended to be a personal derivative of [Bazzite](https://bazzite.gg/#) and is built from the template found [here](https://github.com/ublue-os/image-template). It has added hyprland as well as some window manager tooling on top of the existing Bazzite image to make it fit my workflow out of the box. It also includes some other features that I need such as Japanese input and some theming utilities.

# How to Use

## Installing

This repository does not generate installer ISOs so the first step is to download an ISO from the [Bazzite](https://bazzite.gg/#) home page.

After you go through the installation process you can the run the following commands:

```bash
rpm-ostree reset
rpm-ostree rebase ostree-unverified-registry:ghcr.io/lcroberts/hyprbazzite:latest
```

It is recommended to avoid going through the post install getting started app before rebasing, so you can close that out and rerun it after the rebase.

If you are rebasing from an unrelated image such as kinoite you can also run the following command after the rebase to get the flatpaks included in the bazzite installer.
```bash
ujust _install-system-flatpaks
```

## Containerfile

This file defines the operations used to customize the selected image. It contains examples of possible modifications, including how to:

- change the upstream from which the custom image is derived
- add additional RPM packages
- add binaries as a layer from other images
