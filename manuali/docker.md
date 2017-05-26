# DOCKER
## Per riagganciare un container attivo
```bash
$ sudo docker exec -ti [container-id] bash
```

## Per buildare una immagine con un dockerfile specifico
```bash
$ sudo docker build -t [name]:[tag] --force-rm -f [dockerfile] /[building]/[ path]
```

## Per fare il push su dockerhub
```bash
$ sudo docker tag [local-image] [account]/[repo]:[tag]
$ sudo docker push [account]/[repo]:[tag]
```

### Per avviare un'istanza di una immagine docker detached (-d) esponendo la containerport allo host (-p)
```bash
$ sudo docker run -d -p [interfaceIP]:[hostport]:[containerport] --name [containername] [image] [CMD]
```

### Per avviare vnc verso docker
```bash
$ sudo vncviewer `sudo docker port [container-id|container-name] [hostport]`
```

### (MAC) Per spostare la destinazione delle immagini in un disco esterno
```bash
$ mv /Users/[username]/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2 /<path-of-your-choice>/
$ ln -s /[path-of-your-choice]/Docker.qcow2 /Users/[username]/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/Docker.qcow2
```

