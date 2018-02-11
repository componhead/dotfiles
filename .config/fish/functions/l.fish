function l
    switch (uname)
        case "Linux"
            if set -q argv[1]
                ls -lah --color=always $argv[1] | less -R
            else
                ls -lah --color=always | less -R
            end
        case "Darwin"
            if set -q argv[1]
                ls -lah -G $argv[1] | less -R
            else
                ls -lah -G | less -R
            end
    end
end
