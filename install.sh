#!/usr/bin/env bash
# Should work on unix-ish systems
INSTALL_DIR="$HOME/.config/nvim/"

if [ $# != 0 ]
then
	INSTALL_DIR=$1
fi

echo "Cloning to $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR"
git clone https://github.com/SiddharthShyniben/nv "$INSTALL_DIR"
echo 'Done.'
echo ''

echo 'Installing packer.nvim...'
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
echo 'Done.'

echo 'Installing plugins.'
nvim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
echo 'Done.'
