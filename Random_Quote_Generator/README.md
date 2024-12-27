# Random-Quote-Generator-Bash

## Welcome Script for Linux Terminal

This script customizes your Linux terminal startup by displaying a warm welcome message and a random motivational quote from a predefined list. It's perfect for adding a touch of personalization to your terminal experience!

---

### Features
- **Random Quote Display:** The script reads quotes from a text file (`quotes.txt`) and randomly selects one to display each time the terminal is opened.
- **Personalized Greeting:** It greets the user by dynamically fetching their username using the `whoami` command.
- **Colorful Output:** Makes use of ANSI escape codes to create an engaging and colorful terminal output.

---

### How It Works
1. The script reads all lines from a text file (`quotes.txt`) located in the `/home/kali/` directory.
2. It stores the quotes in an array and randomly selects one using the `$RANDOM` variable.
3. The welcome message, complete with colors and the selected quote, is displayed every time the terminal starts.

---

### Setup Instructions
To use this script and ensure it runs automatically when you open a new terminal:

1. **Save the Script:**
   Save the script as `welcome_script.sh` (or any name you prefer) in your home directory:
   nano ~/welcome_script.sh
   ![image](https://github.com/user-attachments/assets/2813c4a0-7f67-4260-81d0-7c615dba2d79)

2.**Prepare the quotes.txt File:**
   Create a quotes.txt file containing your favorite quotes, each on a new line:
   nano quotes.txt
   ![image](https://github.com/user-attachments/assets/2601f177-8bb2-44ec-9242-e628c3609ceb)
  
3. **Make it Executable**
    chmod +x ~/welcome_script.sh

4.**Modify Shell Configuration:**
   Append the following line to your .bashrc file to run the script every time a new terminal session starts:
    /home/kali/welcome_script.sh
   ![image](https://github.com/user-attachments/assets/112218f1-300c-4237-9b56-dd5d79caba1d)
   
5.**Source the .bashrc:**
   source ~/.bashrc
   ![image](https://github.com/user-attachments/assets/94a23d53-0487-434e-967d-ff309d3bc3bc)




###Sample Output
![image](https://github.com/user-attachments/assets/873ce75f-5ee5-4e0d-8e76-841e6a17d77a)
![image](https://github.com/user-attachments/assets/e98f3174-03af-4aa4-95d1-8151f0b5e80e)
![image](https://github.com/user-attachments/assets/2ab3b9b8-319c-415c-9266-1e864c5b6e7e)

