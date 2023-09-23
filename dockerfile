#PDE

FROM archlinux:base-devel
RUN pacman -Syu --noconfirm
RUN pacman -S neovim tmux zsh git --noconfirm

COPY --from=golang:latest /usr/local/go /usr/local/go

WORKDIR /root

COPY ./general/nvim .config/nvim
COPY ./general/tmux.conf .tmux.conf

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
COPY ./pde/zshrc .zshrc

CMD ["zsh"]
