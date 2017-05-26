# MACGUIDE
### Per installare aggirando i problemi di 'pip'
    python -m pip install --user <program>

### Per mettere un ritardo di 30 secondi perché si mostri il dock
    defaults write com.apple.Dock autohide-delay -float 30 && killall Dock

### Per ritornare ai valori default
    defaults delete com.apple.Dock autohide-delay && killall Dock

### Per visualizzare un messaggio durante il primo login
    sudo defaults write /Library/Preferences/com.apple.loginwindow LoginwindowText "Your login window message text goes here"

### Per visualizzare un banner all'avvio del computer
    [inserire un file rtf o txt in /Library/Security con il messaggio]
    sudo chmod o+a [file]

### Per generare il codice a2f con oath
    oathtool --totp -b ay3ki6k2kzzgijl4mpgqqh5emqhyo53w
