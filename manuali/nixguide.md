# LINUXGUIDE
## UTILITY
### Per mandare una richiesta in formato json con curl
```bash
curl -i -X PUT example.com/put -H Content-Type:application/json -d '{"key":"value"}'
```
### Per vedere l'ip della macchina
```bash
ifconfig en0 | grep inet | awk '$1=="inet" {print $2}'
```
### Per vedere quanti file sono aperti nel sistema
```bash
lsof | wc -l
```
### Per individuare lo spazio libero su disco
```bash
df -h
```
### Per fare la lista di tutti i files nella directory corrente e nelle subdirectory con path assoluto
```bash
ls -d -1 $PWD/**/*
```
### Per aggiungere solo i files di tipo link a git
```bash
git add -f `find . -type l -maxdepth 1`
```
### Per espandere un archivio .tgz
```bash
tar -xvzf [file].tgz
```
### Per cercare il processo per stringa
``bash
pgrep -fa stringa
```    
### Spoofing: Cambiare l'indirizzo MAC
```bash
openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' # generazione casuale di un indirizzo MAC
sudo ifconfig en0 ether xx:xx:xx:xx:xx:xx # assegnare un mac addressa
ifconfig en0 | grep ether # verifica cambiamento mac address
sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
```
### Collegamento ssh con chiave pubblica (deve essere registrata con `cat ~/id_rsa.pub >> ~/.ssh/authorized_keys` nel server)
```bash
ssh -o PreferredAuthentications=publickey server.to.connect
```
### Per utilizzare le chiavi ssh senza dover ridigitare la password
```bash
# Verificare le configurazioni in .ssh/config e sull'utente web di github/gitbucket/ecc...
ssh-add [privatekey]
```
## NETWORK
### Per trovare chi occupa la porta 9000
```bash
sudo lsof -i -P | grep "9000"
```
### Per ricercare una stringa nei files .sh o .bat, escludendo i files che finiscono con .bak.sh o .bak.bat ricorsivamente (-r) con numero di riga nel file (-n) con la parola precisa (-w) 
```bash
grep --include=\*.{sh,bat} --exclude=\*.{bak.sh,bak.bat} -rnw 'directory' -e "pattern"
```
### Per vedere quali porte sono occupate
``bash
sudo lsof -i
sudo netstat -tulpn
```
### Per vedere quali porte sono aperte e da chi
```bash
sudo netstat -tupan
```
### Per cambiare versione java nel sistema
```bash
sudo update-alternatives --config java
```
### Per creare directories con un solo comando
```bash
mkdir -p src/{scala,java} # crea src/scala e src/java
```

## WIFI
### Per vedere tutte le interfacce di rete
```bash
ip link
```
### Per vedere le informazioni di connessione per l'interfaccia wlp0s11f1u8
```bash
iw dev wlp0s11f1u8 link
```
### Per vedere le statistiche di connessione per l'interfaccia wlp0s11f1u8
```bash
iw dev wlp0s11f1u8 station dump
```
### Per tirare su la scheda di rete wlp0s11f1u8
```bash
ip link set wlp0s11f1u8 up
```
### Scanning reti
```bash
iw dev wlp0s11f1u8 scan
```
### Connessione wpa-supplicant per l'interfaccia wlp0s11f1u8
```bash
wpa_supplicant -i wlp0s11f1u8 -c <(wpa_passphrase your_SSID your_key)
```
### Percorso profili di connessione wpa
```bash
/etc/netctl/
```

## FILES
### Per rinominare i files 2300000.txt in 1500000.txt
```bash
for file in ./23?????.*; do mv $file ${file/23/15}; done
```
### Per rinominare con un count
```bash
find -name 'access.log.*.gz' | sort -Vr | rename 's/(\d+)/$1+1/ge'
```
### Conteggio ricorsivo di righe di files scala
```bash
find . -name "*.scala" -print0 | xargs -0 wc -l
```
