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
   ![image](https://github.com/user-attachments/assets/07ecedb5-b4d3-4269-9e8d-d1866b7489b3)


2.**Prepare the quotes.txt File:**
   Create a quotes.txt file containing your favorite quotes, each on a new line:
   nano quotes.txt
   ![image](https://github.com/user-attachments/assets/5341e336-a2f8-4b73-8487-4f736a72e2a8)

  
3. **Make it Executable**
    chmod +x welcome_script.sh

4.**Modify Shell Configuration:**
   Append the following line to your bashrc file by using command `nano ~/.bashrc` file to run the script every time a new terminal session starts:
    /home/kali/welcome_script.sh
![image](https://github.com/user-attachments/assets/fd5ea9ce-1fdc-44f8-b5b9-1041a355a8ba)
   
5.**Source the .bashrc:**
   source ~/.bashrc
![image](https://github.com/user-attachments/assets/469de50e-c8dd-418c-89de-9197299ffd7b)




###Sample Output
![image](https://github.com/user-attachments/assets/ef7848b3-7bfe-43ea-8faf-6dfe465c1c6e)
![image](https://github.com/user-attachments/assets/a09e367f-9c2f-4bfe-95e7-190e925c6d07)
![image](https://github.com/user-attachments/assets/86ab9a28-e59b-4071-8bc1-6ac47ce15091)



