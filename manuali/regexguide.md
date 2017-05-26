# REGEXGUIDE
## VIM
### Searches for all strings starting with 'some', then matching 'thing' changes 'thing' into 'one'. End result: something becomes someone
    :%s/\(some\)\@<=thing/one/g

### Searches for all strings not starting with 'some', then matching 'thing' changes 'thing' into 'one'. End result: something is not changed, but everything changes to everyone
    :%s/\(some\)\@<!thing/one/g

### Searches for all strings ending with 'thing', then matching 'some' changes 'some' into 'every'. End result: something becomes everything
    :%s/some\(thing\)\@=/every/g

### Searches for all strings not ending with 'thing', then matching 'some' changes 'some' into 'every'. End result: something is not changed, but someone becomes everyone
    :%s/some\(thing\)\@!/every/g

### Cancella la prima parola della riga fino al ';'
    :%s/^.*;//g

### Trova la settima parola in una riga contenente la parola 'FOO'
    /^(?=.*\bFOO\b)(?:\S+ ){6}(\S+)

### Trova il pattern ripetuto con uno o più spazi nel mezzo
    /\v<(\w+)\_s+\1>

### Per trovare due numeri 00 (\zs marca il carattere di start e \ze marca il carattere di end) nella stringa `2015-07-31 00:00:43,418 WARN  [RegisterProcessor] -------------- End of debug information --------------`
    /\v:\zs\d{2}\ze:

### Per cancellare i dati relativi a data e ora da tutte le righe che iniziano per data e ora come nella riga seguente `2015-07-31 00:00:43,418 WARN  [RegisterProcessor] Raw update: [RawUpdate - group=0x4530000, key=0x14, len=3, offset=143, term=false, dynamic=true, seqnum=4633940408:60]`
    :%s/^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3} //g

