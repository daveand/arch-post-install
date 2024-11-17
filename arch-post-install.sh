#!/usr/bin/bash

BLUE='\033[0;34m'
NC='\033[0m'

echo "Running arch post install script..."

read -p "Update system and install packages? y/n: " continue

if [ $continue == "y" ]
	then
	echo -e "${BLUE}\n- Updating system through pacman:${NC}"
	update=`sudo pacman -Syu --noconfirm`
	echo $update
	
	echo -e "${BLUE}\n- Installing packets from pacman repository:${NC}"
	packets=`sudo pacman -S --noconfirm --needed neovim kitty `
	echo $packets
fi


read -p "Install yay? y/n: " yayConfirm

if [ $yayConfirm == "y" ]
  then
  echo -e "${BLUE}\n- Installing yay from git repository:${NC}"
	yayPrepare=`sudo pacman -S --noconfirm --needed git base-devel`
  echo $yayPrepare

	yayInstall=`git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si`
	echo $yayInstall
fi


read -p "Install neovim config? y/n: " vimConfigConfirm
	
if [ $vimConfigConfirm == "y" ]
  then
  echo -e "${BLUE}\n- Installing neovim config and dependencies:${NC}"
  nvChad=`git clone -b v2.0 https://github.com/NvChad/NvChad ~/.config/nvim --depth 1`
	echo $nvChad

  copyConfig=`git clone https://github.com/daveand/neovim-config.git ~/.config/nvim`
  echo $copyConfig
fi

echo -e "${BLUE}\n- Arch post installation done!${NC}"
