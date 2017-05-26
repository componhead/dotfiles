# HACKING (KALI)

### Per cambiare dns
Cambiare `prepend-domain-servers` con opendns o dns opportuno
```shell
vi /etc/dhcp/dhcpclient.conf
service network-manager restart
cat /etc/resolv.conf
```

### Per usare proxychains con tor
`vi /etc/proxychains.conf`
Nel file, abilitando `dynamic_chain` e disabilitando `strict_chain` aggiungendo la riga in fondo al file `socks5  127.0.0.1  9050` avviando tor con `service tor start` si utilizzerà automaticamente la rete tor come proxychain.

### Per utilizzare proxychain nei programmi senza tor
È necessario aggiungere le informazioni specifiche alla fine del file e chiamare il comando p.e. `proxychains firefox www.dnsleaktest.com`

### Per usare openvpn
Settare in `about:config` del browser a `false` la proprietà `media.peerconnection.enabled`, collegarsi a `http://www.vpnbook.com/freevpn` e, dopo fatto il download e scoppattato il file eseguire il file `ovpn` opportuno `openvpn chosen-file.ovpn`

### MAC (or HWaddr) changing
Il MAC address è costituito da due set di dati alfanumerici, xx:xx:xx:yy:yy:yy  Il primo set di dati alfanumerici (x) fa riferimento al costruttore hardware della scheda di rete mentre il secondo fa riferimento alla singola scheda specifica. Il MAC address **non esce mai dalla rete interna** ed è perciò invisibile dall'esterno. Lo strumento per cambiare il MAC è `macchanger`.
