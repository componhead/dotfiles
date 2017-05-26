## VIMGUIDE
### Per cambiare il path al buffer in cui si è
    :lcd %:p:h

### Per ccancellare il pattern fino blablabla
### INFO  [main] 2017-05-25 10:47:15,137 blablabla bla bla bla
    :%s/^.\{-}]\s\d\{4}-\d\{2}-\d\{2}\s\d\{2}:\d\{2}:\d\{2}:\d\{2},\d\{3} //g

### Per effettuare una sostituzione in ogni file '.txt' della directory corrente
    :args **/*.txt          # prima popolo 'args'
    :set hidden             # non devo confermare ogni sostituzione
    :argdo %s/pat/str/ge    # sostituisco 'str' ai match di 'pat'

### Due modi per sostituire la stringa "pat" con la stringa "str"
    #:[range]s[ubstitute]/{pattern}/{string}/[flags]
    :%s/pat/str/g
    :g/pat/s//str/g

### Sostiuisce ai match dell'ultima ricerca (//) il contenuto nel register 0 (\=@0) definito programmaticamente (non appare in history)
    :let @0='something'
    :%s//\=@0/g
    
### Esegui la stessa sostituzione, con gli stessi flags (&) e la stessa stringa (~) ma per tutto il file (%)
    :%s//~/&
    #oppure
    g&

### Sottrae 1 a ogni precedente single digit match
    :%s//\=submatch(0)-1/g

### Conta i match del pattern
    :%s/pattern//gn

### Sostituisce la parola "man" con la parola "dog" e la parola "dog" con la parola "man" contemporaneamente
    /\v(<man>|<dog>)
     :%s//\={"dog":"man","man":"dog"}[submatch(1)]/g

### Per filtrare, separando con "=" e con un contex di 5 righe, ogni occorrenza del pattern
    :g/pattern/z#.5|echo "=========="

### Per cancellare ("d") ogni riga che non (":g!" oppure ":v") matcha il pattern
    :g!/pattern/d
    :v/pattern/d

### Per cercare più parole
    :g/(primaparola)|(secondaparola)

### Per cancellare ogni riga bianca
    :g/^\s*$/d

### Per pulire il register a
    qaq
    
### Per copiare in append ("A") tutti i risultati del pattern
    :g/pattern/y A

### Per ordinare alfabeticamente ciò che è nel range tra una '{' ( .+1) e il range fino a '}' (/}/-1) senza scrivere in messages (sil)
    #:g/{start}/ .,{finish} [cmd]
    :g/{/sil .+1,/}/-1 sort

### Per eseguire una shell da dentro vi ('exit' per ritornare a vim)
    :terminal

### Per eseguire un comando arbitrario in vi (ls)
    :!ls

### Per eseguire un comando (ls) dentro vi e incollarne il contenuto nel file aperto
    :read !ls

### Per eseguire un comando (rm) prendendo come input un dato range
    :.,$write!rm  #range dalla riga corrente a fine file
    :3,5write!rm  #range dalla terza alla quarta riga

### Per ordinare una lista separata da virgole (-t',') per il suo secondo campo (-k2) a partire dalla seconda riga
    :2,$!sort -t',' -k2

### Per editare un file da vi dalla directory corrente
    :e %:h<Tab>

### Per riaprire il buffer del file dopo aver aperto il file explorer 
    <C-^>

### Per creare il file pippo.txt da directory inesistenti
    :e not/existent/directories/pippo.txt
    :!mkdir -p %:h
    :w

### Per scrivere un file di root dopo avere aperto il file
    :w !sudo tee % > /dev/null

### Ricerca e sostituzione del carattere '#' a inizio riga in qualsiasi punto (^\s*) con stringa vuota (//) in tutto il file (%)
    :%s/^\s*#//

### Mostra tabella dei digraph
    :h digraph-table


## INSERT MODE
    <C-h> #Delete back one character (backspace)
    <C-w> #Delete back one word
    <C-u> #Delete back to start of line
    <C-o> #Insert Normal Mode: fa eseguire un comando in modalità normal per poi tornare in insert
    <C-r>n #Incolla il registro n
    <C-r><C-p>n #Incolla il registro n letteralmente e senza considerare identazioni o altro 
    <C-r>= #Effettua dei calcoli 

### digraph
    <C-v>126 #Insert character (~) by decimal code 
    <C-v>u007e #Insert character (~) by hexadecimal
    <C-v>~ #Insert nondigit literally 
    <C-k>'? #Insert character (~) represented by {char1}{char2} digraph 


## VISUAL MODE
    v       #Enable character-wise Visual mode
    V       #Enable line-wise Visual mode
    <C-v>   #Enable block-wise Visual mode
    gv      #Reselect the last visual selection
    o       #Torna con il cursore al punto di inizio selezione (mantenendo la selezione attiva) 

## RANGES 
    1 #First line of the file
    $ #Last line of the file
    0 #Virtual line above first line of the file
    . #Line where the cursor is placed
    'm #Line containing mark m
    '< #Last start of visual selection
    '> #Last end of visual selection
    % #The entire file (shorthand for :1,$)'
    :/<html>/+1,/<\/html>/-1p #Paste in the range between html tags without tag rows
    :6t. #Copy line 6 to just below the current line
    :t6 #Copy the current line to just below line 6
    :t. #Duplicate the current line (similar to Normal mode yyp)
    :t$ #Copy the current line to the end of the file
    :'<,'>t0 #Copy the visually selected lines to the start of the file

## REGISTERS
### Immette la selezione nel register 'a'
    "ay

### Cancella la riga, senza che occupi un register (viene messo nel register speciale _ che è un register "blackhole")
    "_dd

### Mostra tutti i registers
    :di

### Ripeti l'ultima ricerca per l'intero file
    g& #Equivalente a:
    :%s//~/&  

### Ricerca e sostituzione
    :let @/='pippo' #Definisce la ricerca predefinita con la stringa data
    :let @a='pluto' #Definisce il register 'a' con la stringa data
    :%s//\=@a/g  #Ricerca nel file la stringa predefinita (pippo) e la sostituisce con quella del register 'a' (pluto)


## JUMPS
### Per saltare indietro di cinque salti nella jumplist (:jumps)
    5<C-o>
    
### Per saltare avanti di cinque salti nella jumplist (:jumps)
    5<C-i>

### Per saltare alla terza posizione precedente di modifica nella lista delle modifiche (:changes)
    3g;

### Per saltare alla terza posizione successiva di modifica nella lista delle modifiche (:changes)
    3g,

### Link followup nella guida
    <C-]>


## FOLDS
### Apre un fold
    zo

### Apre tutti i fold
    zO

### Chiude un fold
    zc

### Chiude tutti i fold
    zC

### Toggle un fold
    za

### Toggle su tutti i fold
    zA

### Apre un livello ulteriore di fold annidato
    zr

### Apre tutti i fold annidati
    zR

### Chiude il primo fold annidato aperto
    zm

### Chiude tutti i fold annidati aperti dalla riga corrente
    zM

### Fold le prossime tre righe sotto la riga corrente in normal mode
    zf3j

### Fold dalla riga corrente al mark 'a' (sotto)
    zf'a
    
### Fold il blocco tra graffe (around) contenente la riga corrente
    va}zf

### Per cancellare un fold
    zd


## REDIRECT COMMANDS
    :redir > myoutput.txt | version | redir END

### Spell checking commands shortcut 'z='
    :set spelllang=en,it
    :set spell
    :set spellsuggest=10
