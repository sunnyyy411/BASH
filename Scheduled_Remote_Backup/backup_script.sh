#! /bin/bash
filename="backup`date +%d%m%Y%H%M%S`.tar"
tar -cvf /home/kali/Documents/backup/${filename} /home/kali/Documents/Bash/
scp /home/kali/Documents/backup/${filename} lubuntu@192.168.29.136:~/Documents/kali_backup
