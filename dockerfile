#PDE

FROM archlinux:base-devel
RUN pacman -Syu --noconfirm
RUN pacman -S neovim tmux zsh git --noconfirm

COPY --from=golang:latest /usr/local/go /usr/local/go

RUN useradd -Ng wheel --create-home --no-log-init pdeuser && \
    echo 'pdeuser ALL=(ALL) NOPASSWD: ALL' >> /etc/sudoers

USER pdeuser
WORKDIR /home/pdeuser

COPY ./general/nvim .config/nvim
COPY ./general/tmux.conf .tmux.conf
COPY ./pde/zshrc .zshrc
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

CMD ["zsh"]
