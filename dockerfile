#PDE

FROM archlinux
RUN pacman -Syu --noconfirm
RUN pacman -S neovim tmux zsh git gcc --noconfirm

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

WORKDIR /root

COPY ./general/nvim .config/nvim
COPY ./general/tmux.conf .tmux.conf

RUN nvim --headless -c 'source /root/.config/nvim/lua/plug.lua' -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["zsh"]
