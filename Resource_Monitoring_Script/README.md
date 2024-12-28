# System Resource Monitoring Script

This script monitors system resources such as RAM and disk space, providing warnings when thresholds are exceeded. It's written in Bash and is designed to help ensure sufficient resources are available on your system.

---

## Features
- Monitors available RAM and alerts if it is below a specified threshold.
- Checks disk space usage for a specific partition (e.g., `/dev/sda1`) and alerts if usage exceeds a defined percentage.
- Provides a summary of the current state of resources.

---

## Prerequisites
- A Unix-like operating system (e.g., Linux).
- Bash shell installed.
- Access to the `free`, `grep`, `awk`, and `df` commands.

---

## Script Logic

### 1. **RAM Monitoring**
- The script uses the `free` command to check total available memory (in MB).
- Compares the available memory against a predefined threshold (`500 MB`).
- If available memory is below the threshold, a warning message is displayed.

### 2. **Disk Space Monitoring**
- The script uses the `df` command to check disk usage for the `/dev/sda1` partition.
- Retrieves the percentage of disk space used and compares it against a threshold (`80%`).
- If disk usage exceeds the threshold, a warning message is displayed.

---

## How to Use
1. Copy the script to a file, e.g., `resource_monitor.sh`.
2. Make the script executable:
   ```bash
   chmod +x resource_monitor.sh
   ```
3. Run the script:
   ```bash
   ./resource_monitor.sh
   ```

---

## Example Output
### Sufficient Resources
```
Ram is sufficient - 1024 M is free
Disk space is sufficient - 70% is free
```

### Low Resources
```
WARNING! RAM is running low
WARNING! Disk space is low
```

---

## Customization
- **RAM Threshold**: Modify the `TH` variable to set a different RAM threshold (in MB).
- **Disk Space Partition**: Replace `sda1` in the `grep` command with the appropriate partition name for your system.
- **Disk Space Threshold**: Change the `80` value in the `if` condition for a different disk usage threshold.

---

## Notes
- This script is for monitoring purposes only and does not take corrective actions.
- Ensure the `awk` and `grep` commands work with your system's output format.

---

## Code Explanation

### 1. RAM Monitoring
```bash
FREE_SPACE=$(free -mt | grep "Total" | awk '{print $4}')
TH=500

if [[ $FREE_SPACE -lt $TH ]]
then 
     echo "WARNING! RAM is running low"
else 
     echo "Ram is sufficient - $FREE_SPACE  M is free"
fi
```
- **`free -mt`**: Displays memory usage in MB.
- **`grep "Total"`**: Filters the line containing the total memory information.
- **`awk '{print $4}'`**: Extracts the fourth column, which represents free memory.
- **Comparison (`-lt`)**: Checks if the free memory is less than the threshold (`500 MB`).
- **Output**: Prints a warning or a sufficient message based on the comparison.

### 2. Disk Space Monitoring
```bash
FILE_UTILISATION=$(df -h | grep "sda1" | awk '{print $5}' | tr -d %)

if [[ $FILE_UTILISATION -ge 80 ]]
then 
     echo "WARNING! Disk space is low"
else 
    echo "Disk space is sufficient -$((100 - FILE_UTILISATION))% is free"
fi
```
- **`df -h`**: Displays disk usage in human-readable format.
- **`grep "sda1"`**: Filters the line corresponding to the `/dev/sda1` partition.
- **`awk '{print $5}'`**: Extracts the fifth column, which represents disk usage percentage.
- **`tr -d %`**: Removes the `%` symbol for numeric comparison.
- **Comparison (`-ge`)**: Checks if the disk usage is greater than or equal to `80%`.
- **Output**: Prints a warning or a sufficient message based on the comparison.
