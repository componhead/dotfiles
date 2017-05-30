FROM kalilinux/kali-linux-docker:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ARG KALI_TYPE=$kali_type_arg

RUN apt-get update -y && apt-get clean all && \
    apt-get install -y software-properties-common && apt-get update -y && apt-get clean all && \
    apt-get install -y git colordiff colortail unzip vim tmux xterm zsh curl && apt-get clean all && \
    apt-get install -y $KALI_TYPE && apt-get clean all && \
    git clone https://github.com/componhead/dotfiles.git /dotfiles && \
    /dotfiles/lnx/install-shell.sh && \
    su -s /bin/zsh -c '. ~/.zshrc' root

CMD ["/bin/zsh"]
