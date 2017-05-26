FROM kalilinux/kali-linux-docker:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color

RUN apt-get update -y && apt-get clean all && \
    apt-get install -y software-properties-common && apt-get update -y && apt-get clean all && \
    apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl && apt-get clean all && \
    apt-get install -y kali-linux-full && apt-get clean all && \
    git clone https://github.com/jasonchaffee/dotfiles.git /.dotfiles && \
    /.dotfiles/config install && \
    chsh -s $(which zsh) && \
    rm -f ${HOME}/.profile && \
    su -s /bin/zsh -c '. ~/.zshrc' root

CMD ["/bin/zsh"]
