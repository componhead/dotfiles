# Per correggere comportamento anomalo di gpg
    chown -R $(whoami) ~/.gnupg/
    chmod 600 ~/.gnupg/*
    chmod 700 ~/.gnupg
    find ~/bin/dotfiles/[os]/.gnupg -type d -exec chmod 700 {} \;
# Quando le chiavi ssh fanno i capricci
    chmod 700 .ssh
    chmod 400 .ssh/*
    chmod 700 .ssh/authorized_keys .ssh/known_hosts .ssh/config
    ssh-add -D
    ssh-add
    ssh -vT git@github.com
    [controllare che il file .ssh/config non vada in conflitto con le chiavi settate nel repository]
