# set allow-preset-passphrase in .gnupg/gpg-agent.conf
function gpg-cache --description "Put gpg key in cache by 1password"
        gpg-connect-agent /bye &> /dev/null
        eval (op signin)
        set -f pass (op read op://Personal/GPG_private/passphrase --no-newline)
        gpg --list-secret-keys --with-keygrip --local-user emiliano.anichini@gmail.com | awk '/Keygrip/ { print $3 }' | head -n 1 | read -f secret_key_keygrip
        $GPG_PRESET_PASSPHRASE_DIR/gpg-preset-passphrase --passphrase $pass --preset $secret_key_keygrip &> /dev/null
end
