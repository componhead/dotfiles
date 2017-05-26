# GITGUIDE
## Istruzioni:
## Le informazioni fra parentesi quadre [] sono interattive
    #esempi di [ref] => HEAD, ORIG_HEAD, origin/master, master, tagname (sono tutti quelli in .git/refs)
    #esempi di [branch] => origin/master, master (tutti quelli in .git/refs/heads e .git/refs/remotes)
    #esempi di [remote] => origin (tutti quelli in .git/refs/remotes)
    #esempi di [pat] => espressione regolare
    #esempi di [file] => src/my/file.sh

### Per usare il netrc criptato, con i comandi git
    git config --local credential.helper "netrc -f ~/.netrc.gpg -v"

## REVISION INFO
### Informazioni sull'hash del ref (HEAD default)
    git rev-parse --verify [ref]
    git rev-parse --short [ref]   #hash in formato short
    git rev-parse --short=4 [ref] #primi 4 caratteri
    git describe [ref] #fancy styled: l'hash ha una 'g' davanti che non fa parte dell'hash (ma del programma di versionamento g-it)

## CHECKOUT
### Checkout per sostituire un file in workspace con quello nell'index
    git checkout -- [file]
### Checkout che sostituisce il file in workspace con quello in un commit (dietro di due commits) nel branch locale
    git checkout [branch]~2 [file]
### Checkout che crea un tracking branch sul branch remoto
    git checkout -b [branch] --track [remote]/[remotebranch]
### Creazione di un branch se inesistente, altrimenti resettato al commit corrente
    git checkout -B [branch]
### Mette in stato DETACH al top del branch
    git checkout --detach [branch]
### Fa il checkout al branch precedente a quello in HEAD
    git checkout -
### Fa il checkout all'ennesimo  branch precedente a quello in HEAD
    git checkout @{-n}
### Fa il checkout al ref in cui si era ieri
    git checkout [ref]@{yesterday}
### Resetta il branch corrente a un numero 'n' di commit precedenti al ref
    git reset --hard [ref]@{n}
### Resetta il branch corrente a un dato hash
    git reset --hard [hash]
### Resetta il branch al ref (utile in caso di precedente push force)
    git fetch --all
    git reset --hard [ref]

## BRANCH
### Setup di un tracking-branch del branch corrente
    git push -u [remote] [branch]

## COMMIT
### Commit di tutti i files modificati o rimossi, NON di quelli nuovi
    git commit -a
### Commit [versione semplice] che aggiunge il file al commit precedente (quindi lo riscrive)
    git add [file] && git commit --amend
### Commit [versione estesa] che aggiunge il file al commit precedente (quindi lo riscrive)
    git reset --soft HEAD^ && git add [file] && git commit -c ORIG_HEAD

## PUSH: git push <remote> <localref>:<remoteref>
### Push branches corrispondenti in remote
    git push [remote] :
### Push branch corrente in quello corrispondente in remote
    git push [remote] HEAD
### Push il branch locale in un sottobranch di remote (la parte a destra dei due punti : è sempre remote)
    git push [remote] [branch]:[branch]/[subbranch]
### Push che cancella il branch su remote
    git push [remote] :[branch]

## ADD
### Add di modifiche (hunk) da scegliere interattivamente
    git add -p
### Add di files altrimenti ignorati
    git add -f [file]
### Add di files solo rimossi o modificati NON di quelli nuovi
    git add -u

## DIFF
### Diff (mostra) files modificated (M) renamed (R) copied (C) aggiunti (A) cancellati (D)
    git diff --diff-filter=MRCAD [ref1] [ref2]
### Diff (mostra) il nome dei files e la loro natura  
    git diff --name-status [ref1] [ref2]
### Diff di un file tra i ref
    git diff [ref1] [ref2] -- [file]
### Diffing cambiamenti locali e ultimo commit
    git difftool -d

## CONFIG
### Authentication with a temporary cached password with a delay of 3600 minutes
    git config --global credential.helper "cache --timeout=3600"

## TAGS
### Tag in locale (lightweight tag)
    git tag [tag]
### Tag mytag annotato, in locale con description
    git tag -a [tag] -m [description]
### Tag mytag cancellato in locale
    git tag -d [tag]
### Tag pushato in remote (pusha solo il tag)
    git push [remote] [tag]
### Tag mytag cancellato in remote
    git push [remote] :refs/tags/[tag]

## ASSUME-UNCHANGED
### Assume unchanged myfile.txt
    git update-index --assume-unchanged [file]
    git update-index --no-assume-unchanged [file]
### Lista i file in assume-unchanged
    git ls-files -v | grep "^[^H]" | cut -c 3-
### Come assume-unchanged (vedi http://git-scm.com/docs/git-update-index)
    git update-index --skip-worktree -- [file]
    git update-index --no-skip-worktree -- [file]

## MERGE
    git merge -m [msg] [commit]...
### Merging di file prendendo quello locale o remoto
    git checkout --ours -- [file]
    git checkout --theirs -- [file]
### Merge del branch corrente con target jumper, mettendo tutti i files dei commit nell'index e facendo revisionare tutti i files coinvolti.
    git merge --no-commit --no-ff jumper
### Merge che ignora il ref qualora si sovrapponga alla base e viceversa
    git merge -X ours [ref]
    git merge -X theirs [ref]
### Merge che non crea il commit per, successivamente fare il diff e controllare TUTTE le differenze
    git merge --no-ff --no-commit [ref] && git difftool HEAD

## CHERRY-PICK
### Cherry-pick interactively hunks of commit
    git cherry-pick -n [hash]   # get your patch, but don't commit (-n = --no-commit)
    git reset                   # unstage the changes from the cherry-picked commit
    git add -p                  # make all your choices (add the changes you do want)
    git commit                  # make the commit!
### Cherry-pick a commit that overwrites current changes
    git cherry-pick --strategy=recursive -X theirs [hash]
### Cherry-pick a file from the remote branch in the current branch 
    git checkout [remote]/[branch] [file]

## STASH
### Apply stash@{1} on HEAD and delete from stashes
    git stash pop stash@{1}
### Create branch 'temp' from stash@{1}
    git branch temp stash@{1}
### Create a stash named with specific hunks
    git stash save -p "[name]"

## VARIE
### Smette di versionare il file anche se precedentemente committato e versionato ma non cancella il file
    git rm -r --cached [file]
### Rimuove tutti i files/directories untracked e in ignore (se solo quelli in ignore 'X' invece di 'x')
    git clean -fdx
### Fornisce un template per le policy di formattazione dei commenti
    git config --global commit.template [file]
### Restituisce l'hash del file
    git hash-object -w [file]
### Restituisce il file in base a un suo hash
    git cat-file -p [hash] > [file]

## PULL
### Fa il pull ma solo per i files che aggiungono testo
    git pull --ff-only

## SHOW
### Mostra l'url push del remote corrispondente
    git remote get-url --push [remote]
### Mostra tutte le configurazioni del remote specificato
    git remote show [remote]
### Mostra tutte le differenze tra un commit e il suo parent
    git show [hash]
### Mostra un file in un determinato ref
    git show [ref]:[file]

## LOG
### Trova il pattern tra i commit message e ritorna tutti i matches
    git log --grep=[regex]
### Trova il pattern tra i commit messages e ritorna il git log fino a quel punto
    git log '[ref]^{/[regex]}'
### Trova il pattern se aggiunto o rimosso nei contenuti dei commits. accetta solo stringhe
    git log -S[regex]
### Più evoluto: trova il pattern presente in ogni chunk di modifica (che sia stato aggiunto/tolto o meno)
    git log -G[regex]
### Mostra la history dei cambiamenti al file
    git log -p -- [file]
### Mostra tutti i log dei commit di ref2 non raggiungibili da ref1
    git log [ref1]..[ref2]
    git log [ref2] ^[ref1]
    git log [ref2] --not [ref1]
### Mostra il log dell'ultimo commit
    git log [ref]^!
    git log [ref]^..[ref]
    git log [ref] --not [ref]^@ # ^@ rappresenta tutti i parent
### Mostra il log dei commit raggiungibili da ref1 o ref2 ma non da entrambi (in un merge sono i due tronconi)
    git log [ref1]...[ref2]
    git log [ref1] [ref2] --not $(git merge-base --all [ref1] [ref2])
### Come sopra ma l'output segnalerà a quale troncone [ref] appartiene; ref1 <  e ref2 >
    git log --oneline --left-right [ref1]...[ref2]
### Mostra gli ultimi n commit
    git log -[n]
    git log --max-count=[n]
### Mostra tutti i commit fino adesso tranne gli ultimi n
    git log --skip=[n]
### Mostra tutti i commit in ordine temporale
    git log [--since|--until|--before|--after]=[n].[hours|days|weeks|months...] [ref]
    git log [--since|--until|--before|--after]=[yyyy-mm-ddThh:mm:ss] [ref]
### Mostra tutti i commit che aggiungono o rimuovono (non che modificano) un pattern rispetto al loro parent
    git log -S[pat] --pickaxe-regex [ref]
### Mostra tutti i commit che modificano, nell'hunk, il pattern 
    git log -G[pat] [ref]
### Mostra tutti i committer con il loro numero di commit in un lasso temporale
    git shortlog -s -n [--since|--until|--before|--after]=[n].[hours|days|weeks|months...].ago

### Per trovare tutti gli hash irraggiungibili (a causa di amend sbagliati ecc...). Influenzato dalla cache di reflog (default 60gg)
    git fsck --unreachable

### Per fare il push di un subfolder dal progetto principale (vedi gestion heroku-cli)
    git subtree push --prefix [subfolder] [remote] [branch]

## BISECT
### Workflow comandi
    git bisect start
    git bisect bad [rev]
    git bisect good [rev]
    git bisect [bad|good]
    git bisect reset

