# set allow-preset-passphrase in .gnupg/gpg-agent.conf
function gpg_cache --description "Put gpg key in cache by 1password"
        gpg-connect-agent /bye &> /dev/null
        eval (op signin)
        set -f pass (op read op://Personal/GPG_private/passphrase --no-newline)
        set -f secret_key_keygrip 4D7308EFBACD381315C7EB24EF9D74E444E08F6A
        /usr/local/Cellar/gnupg/2.4.2/libexec/gpg-preset-passphrase --passphrase $pass --preset $secret_key_keygrip
end
