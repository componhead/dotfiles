# KALI_TYPE values
#    kali-linux
#    kali-linux-all
#    kali-linux-forensic
#    kali-linux-full
#
#    kali-linux-gpu
#    kali-linux-pwtools
#    kali-linux-rfid
#    kali-linux-sdr
#
#    kali-linux-top10
#    kali-linux-voip
#    kali-linux-web
#    kali-linux-wireless
sudo docker build --build-arg kali_type_arg=$1 .
