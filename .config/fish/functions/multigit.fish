function multigit
    set -l basedir $PWD
    if set -q argv[1]
        for gitdir in (find . -type d -name .git)
	    set -l i (echo $gitdir | sed s/\\.git// | sed s/^\\.\\///)
	    set -l dir (string join "/" $basedir $i)
            switch $argv[1]
                case pull
	            echo "  * I'm operating" $argv[1] "on" $dir
	            cd $dir ; git $argv[1] --all --quiet
                case push fetch
	            echo "  * I'm operating" $argv[1] "on" $dir
	            cd $dir ; git $argv[1]
	        case '*'
	            echo "Comando git sconosciuto o non supportato"
            end
        end
        cd $basedir
    else
        multigit pull
    end
end
