function cdd
    cd $argv[1] \| ls -lah --color=always \| less -R
end
