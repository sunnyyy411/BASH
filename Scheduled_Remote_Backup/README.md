# Scheduled_Remote_Backup_Bash

This project demonstrates a Bash script that automates the process of creating a backup and uploading it to a remote server using SSH. The backup process is scheduled to run every two minutes using `cron`.

## Steps to Set Up the Backup

### 1. Write the Bash Script
Create a Bash script at `/Documents/Bash/backup.sh` with the following content:

```bash
#! /bin/bash
filename="backup`date +%d%m%Y%H%M%S`.tar"
tar -cvf /home/kali/Documents/backup/${filename} /home/kali/Documents/Bash/
scp /home/kali/Documents/backup/${filename} lubuntu@192.168.29.136:~/Documents/kali_backup
```
![image](https://github.com/user-attachments/assets/975cd1b4-1a69-40b1-b80d-0b88c958a8d3)


### 2. Configure SSH Key-Based Authentication
#### On the Local Machine:
1. Generate an SSH key:
   ```bash
   ssh-keygen
   ```
   (Press `Enter` to accept the default options.)
 ![image](https://github.com/user-attachments/assets/0664bc7e-fe53-4a6e-815f-4754960cec8f)
  

3. Verify the key pair is created:
   ```bash
   ls -al 
   ```
 ![image](https://github.com/user-attachments/assets/c3050913-cbf1-452d-8943-325b1bbd8ae3)
   you can see pair of keys
   ![image](https://github.com/user-attachments/assets/55a95a96-142a-42ab-8b97-b848bbedcfac)



4. Copy the public key to the remote machine:
   ```bash
   ssh-copy-id -i id_ed25519.pub lubuntu@192.168.29.136
   ```
   (Enter the password for the remote machine when prompted.)
  ![image](https://github.com/user-attachments/assets/7c589199-390f-437d-b338-fbd18e9001db)


#### On the Remote Machine:
1. Verify the `.ssh` directory exists and contains the copied key:
   ```bash
   ls -al
   cd .ssh
   cat authorized_keys
   ```
  ![image](https://github.com/user-attachments/assets/bf2d1e92-eba7-427f-a66a-6ee9ff9be41d)


### 3. Test the Script Manually
1. Run the script manually on the local machine:
   ```bash
   bash /Documents/Bash/backup.sh
   ```
![image](https://github.com/user-attachments/assets/109b95c4-7391-4869-bfd4-92fb9ef1d865)

2. Verify the backup file is present on the remote server:
   ```bash
   ls /Documents/kali_backup
   ```
  ![image](https://github.com/user-attachments/assets/5ceacc15-653b-492d-829d-10e039d391a5)


3. Check the contents of the backup file:
   ```bash
   tar -tf {backupfilename}
   ```
![image](https://github.com/user-attachments/assets/3b2ad84d-ac3c-4545-b72f-21b5fc9b7f74)


### 4. Schedule the Backup Using Cron
1. Open the `crontab` editor:
   ```bash
   crontab -e
   ```

2. Add the following line to schedule the script to run every 2 minutes:
   ```
   */2 * * * * /home/kali/Documents/Bash/backup.sh
   ```
![image](https://github.com/user-attachments/assets/ec4c25e2-8b60-46a2-a1a2-6f74a4933bbb)


3. Save and exit the editor.

### 5. Verify Scheduled Execution
After every 2 minutes, a new backup file will be uploaded to the remote server automatically. Check the remote directory for new backup files periodically.
![image](https://github.com/user-attachments/assets/9524b8b9-1acd-4f88-8d36-4b2e02067506)




---

## Notes
- Ensure the remote server is reachable over the network.
- Make sure `cron` is running on the local machine.
- Adjust file paths and usernames as necessary for your setup.
