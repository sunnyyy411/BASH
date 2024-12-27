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
![image](https://github.com/user-attachments/assets/8580b352-78bf-46a7-93b5-f7ed32a050b7)


### 2. Configure SSH Key-Based Authentication
#### On the Local Machine:
1. Generate an SSH key:
   ```bash
   ssh-keygen
   ```
   (Press `Enter` to accept the default options.)
   ![image](https://github.com/user-attachments/assets/36fa1d90-959b-4179-88f0-cec5560b6cd4)


3. Verify the key pair is created:
   ```bash
   ls -al ~/.ssh
   ```
   ![image](https://github.com/user-attachments/assets/2d7c07c2-861a-467e-aa90-755c9e7682ac)


4. Copy the public key to the remote machine:
   ```bash
   ssh-copy-id -i ~/.ssh/id_rsa.pub lubuntu@192.168.29.136
   ```
   (Enter the password for the remote machine when prompted.)
![image](https://github.com/user-attachments/assets/23a372f8-400c-45e0-87f1-13927f69e385)


#### On the Remote Machine:
1. Verify the `.ssh` directory exists and contains the copied key:
   ```bash
   ls -al ~/.ssh
   cat ~/.ssh/authorized_keys
   ```
   ![image](https://github.com/user-attachments/assets/8b09d54d-d687-4b2d-97cd-bd3da91c78d9)


### 3. Test the Script Manually
1. Run the script manually on the local machine:
   ```bash
   bash /Documents/Bash/backup.sh
   ```
   ![image](https://github.com/user-attachments/assets/89ca6437-a0ae-4ea9-bfe7-2320d5ce09ac)

2. Verify the backup file is present on the remote server:
   ```bash
   ls -al ~/Documents/kali_backup
   ```
   ![image](https://github.com/user-attachments/assets/2b7f748c-3767-4fcb-a1f9-4f03e59491e1)

3. Check the contents of the backup file:
   ```bash
   tar -tf {backupfilename}
   ```
   ![image](https://github.com/user-attachments/assets/8b40b4d5-46ba-4561-a2bc-0d7d54487398)


### 4. Schedule the Backup Using Cron
1. Open the `crontab` editor:
   ```bash
   crontab -e
   ```

2. Add the following line to schedule the script to run every 2 minutes:
   ```
   */2 * * * * /home/kali/Documents/Bash/backup.sh
   ```
   ![image](https://github.com/user-attachments/assets/ccdc7bc6-b2d2-403e-9375-c30d5209dc7d)


3. Save and exit the editor.

### 5. Verify Scheduled Execution
After every 2 minutes, a new backup file will be uploaded to the remote server automatically. Check the remote directory for new backup files periodically.
![image](https://github.com/user-attachments/assets/78d89d78-1a93-4672-983e-c5d6fd1cd453)




---

## Notes
- Ensure the remote server is reachable over the network.
- Make sure `cron` is running on the local machine.
- Adjust file paths and usernames as necessary for your setup.
