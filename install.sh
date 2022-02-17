#!/usr/bin/env bash
# Should work on unix-ish systems
INSTALL_DIR="$HOME/.config/nvim/"

if [ $# != 0 ]
then
	INSTALL_DIR=$1
fi

mkdir -p "$INSTALL_DIR"
git clone https://github.com/SiddharthShyniben/nv "$INSTALL_DIR"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
