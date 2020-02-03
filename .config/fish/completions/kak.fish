complete -c kak -s c -x -a '(command kak -l)' -d 'connect to given session'
complete -c kak -s e -x -d 'execute argument on client initialisation'
complete -c kak -s E -x -d 'execute argument on server initialisation'
complete -c kak -s n -d 'do not source kakrc files on startup'
complete -c kak -s s -x -d 'set session name'
complete -c kak -s d -d 'run as a headless session (requires -s)'
complete -c kak -s p -x -d 'just send stdin as commands to the given session'
complete -c kak -s f -x -d 'filter: for each file, select the entire buffer and execute the given keys'
complete -c kak -s i -x -d 'backup the files o nwhich a filter is applied using the given suffix'
complete -c kak -s q -d 'in filter mode be quiet about errors applying keys'
complete -c kak -o ui -x -a 'ncurses dummy json' -d 'set the type of user interface to use'
complete -c kak -s l -d 'list existing sessions'
complete -c kak -o clear -d 'clear dead sessions'
complete -c kak -o debug -x -d 'initial debug option value'
complete -c kak -o version -d 'display kakoune version and exit'
complete -c kak -o ro -d 'readonly mode'
complete -c kak -o help -d 'display a help message and quit'
