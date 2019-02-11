function stripdate --description 'Clean logs from information on date and time and create STRIP- files'
    for arg in $argv
        set file (echo $arg | sed "s/^\/*.\+\///g")
        set path (echo $arg | sed "s/[^\/]\+\$//g")
        set strip "STRIP-"
        set newfilename $path$strip$file
        sed "s/^\([[:digit:]]\{4\}-[[:digit:]]\{2\}-[[:digit:]]\{2\} \)\?[[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\},[[:digit:]]\{3\}\s//g" $arg > $newfilename
    end
end
