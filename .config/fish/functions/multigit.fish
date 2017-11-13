function multigit
    set -l basedir $PWD
    if set -q argv[1]
        switch $argv[1]
            case push pull fetch
		for gitdir in (find . -maxdepth 2 -type d -name .git)
			set -l i (echo $gitdir | sed s/\\.git// | sed s/^\\.\\///)
			set -l dir (string join "/" $basedir $i)
			cd $dir ; git $argv[1]
			echo "  * I'm operating" $argv[1] "on" $dir
		end
		cd $basedir
	    case '*'
		echo "Comando git sconosciuto o non supportato"
	end
   else
	multigit pull
   end
end
