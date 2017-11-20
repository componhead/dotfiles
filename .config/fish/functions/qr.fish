function qr
    echo "$argv" | curl -F-=\<- qrenco.de
end
