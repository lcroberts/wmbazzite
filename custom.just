# vim: set ft=make :

kmonad-setup:
	#!/usr/bin/env bash
	sudo groupadd uniput
	sudo usermod -aG input,uinput $USER
	echo 'KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"' | sudo tee /etc/udev/rules.d/90-kmonad.rules
