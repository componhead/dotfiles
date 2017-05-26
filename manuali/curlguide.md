# CURLGUIDE
## UTILITY
### Invio file jpeg
    curl -i -X POST host:port/post-file -H "Content-Type: image/jpeg" --data-binary
    "@path/to/file"

### Invio json in post
    curl -X POST -d @filename.txt http://example.com/path/to/resource --header
    "Content-Type:application/json"

### Invio dati in PUT
    curl -X POST --data "param1=value1&param2=value2" http://example.com/path/to/resource

### Invio form con allegato in put
    curl --form "fileupload=@filename.txt" http://example.com/resource.cgi


## SIMPLE USAGE
### Get the main page from Netscape's web-server:
    curl http://www.netscape.com/
 
### Get the README file the user's home directory at funet's ftp-server:
    curl ftp://ftp.funet.fi/README
 
### Get a web page from a server using port 8000:
    curl http://www.weirdserver.com:8000/
 
### Get a directory listing of an FTP site:
    curl ftp://cool.haxx.se/
 
### Get the definition of curl from a dictionary:
    curl dict://dict.org/m:curl
 
### Fetch two documents at once:
    curl ftp://cool.haxx.se/ http://www.weirdserver.com:8000/
 
### Get a file off an FTPS server:
    curl ftps://files.are.secure.com/secrets.txt
    #or use the more appropriate FTPS way to get the same file:
    curl --ftp-ssl ftp://files.are.secure.com/secrets.txt
 
### Get a file from an SSH server using SFTP:
    curl -u username sftp://example.com/etc/issue
 
### Get a file from an SSH server using SCP using a private key (not password-protected) to authenticate:
    curl -u username: --key ~/.ssh/id_rsa scp://example.com/~/file.txt
 
### Get a file from an SSH server using SCP using a private key (password-protected) to authenticate:
    curl -u username: --key ~/.ssh/id_rsa --pass private_key_passwor scp://example.com/~/file.txt
 
### Get a file from an SMB server:
    curl -u "domain\username:passwd" smb://server.example.com/share/file.txt
 
 
## DOWNLOAD TO A FILE
 
### Get a web page and store in a local file with a specific name:
    curl -o thatpage.html http://www.netscape.com/
 
### Get a web page and store in a local file, make the local file get the name of the remote document (if no file name part is specified in the URL, this will fail):
    curl -O http://www.netscape.com/index.html
 
### Fetch two files and store them with their remote names:
    curl -O www.haxx.se/index.html -O curl.haxx.se/download.html
 

## FTP
 
### To ftp files using name+passwd, include them in the URL like:
    curl ftp://name:passwd@machine.domain:port/full/path/to/file
    #or specify them with the -u flag like
    curl -u name:passwd ftp://machine.domain:port/full/path/to/file
 
