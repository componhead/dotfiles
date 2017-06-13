FROM kalilinux/kali-linux-docker:latest

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm-256color
ARG KALI_TYPE=$kali_type_arg

RUN apt-get update -y && apt-get clean all && \
    apt-get install -y software-properties-common && apt-get update -y && apt-get clean all && \
    git clone https://github.com/componhead/dotfiles.git /root/dotfiles && \
    apt-get install -y $KALI_TYPE && apt-get clean all && \
    /root/dotfiles/lnx/install-shell.sh && \
    su -s /bin/zsh -c '. ~/.zshrc' root

CMD ["/bin/zsh"]
