function jtrans
  if set -q argv[2]
    if set -q argv[3]
      grep -o -m1 '{"request":.*"service":.*"id":$2.*}]}}}' $3 | sed -r "s/(\"time\":)[0-9]*/\1\$(date +%s)/g" | xclip
    end
  else
    echo "Errore! Devi indicare il serviceid e il log da cui estrarre il json di trasporto"
  end
end
