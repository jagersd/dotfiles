#!/usr/bin/bash

#home directories
echo "Pulling ZSH items";
cp $HOME/.zshrc ../;
mkdir -p ../.oh-my-zsh;
cp -r $HOME/.oh-my-zsh/custom/aliases.zsh ../.oh-my-zsh;

echo "Pulling VIM configs";
cp $HOME/.vimrc ../;

#config directories
mkdir -p ../.config;

CONFIGDIRS=("regolith" "polybar" "alacritty");

for dir in ${CONFIGDIRS[@]}; do
    echo "Syncing ${dir}";
    rsync -ah --exclude={*.swp} $HOME/.config/$dir ../.config --delete;
done

echo "dotfile sync complete"
