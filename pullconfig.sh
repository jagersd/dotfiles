#!/usr/bin/zsh
mkdir -p .config;

echo "Pulling ZSH items";
cp $HOME/.zshrc .;
mkdir -p .oh-my-zsh;
cp -r $HOME/.oh-my-zsh/custom/aliases.zsh ./.oh-my-zsh;

echo "Pulling VIM configs";
cp $HOME/.vimrc .;

echo "Pulling Regolith config files";
cp -r $HOME/.config/regolith ./.config;

echo "Pulling Polybar config";
cp -r $HOME/.config/polybar ./.config;

echo "Pulling Alacritty config";
cp -r $HOME/.config/alacritty ./.config;