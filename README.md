
# **Log File Processing with AWK**

This repository contains tools and outputs for processing web application log files using `AWK` and shell scripts. The project demonstrates the extraction and analysis of information from a sample log file (`user_activity.log`).

---

## **Project Contents**

### **Files**
- **`user_activity.log`**: Sample log file containing user activity data.
- **`process_logs.sh`**: A script that automates log file processing using `AWK` commands.
- **`unique_ips.txt`**: Output of extracting unique IP addresses from the log file.
- **`usernames.txt`**: Output of extracting usernames from the log file.
- **`http_status_counts.txt`**: Output of counting HTTP status codes from the log file.
- **`failed_logins.txt`**: Entries with failed login attempts (status code 403).
- **`script_output.txt`**: Combined output of running `process_logs.sh`.

---

## **Command Descriptions**

### 1. **Extract Unique IP Addresses**
Extract all unique IP addresses from the log file, regardless of their position:
```bash
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$/) print $i }' user_activity.log | sort -u > unique_ips.txt
```

### 2. **Extract Usernames**
Extract usernames appearing in the log file:
```bash
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /user=/) print $i }' user_activity.log | awk -F= '{print $2}' | sort -u > usernames.txt
```

### 3. **Count HTTP Status Codes**
Count the occurrences of each HTTP status code:
```bash
awk '{ for (i = 1; i <= NF; i++) if ($i ~ /status=[0-9]{3}/) print $i }' user_activity.log | awk -F= '{print $2}' | sort | uniq -c | sort -n > http_status_counts.txt
```

### 4. **Identify Failed Login Attempts**
Extract entries with status code `403`, including timestamps:
```bash
awk '$0 ~ /403/ { print $0 }' user_activity.log > failed_logins.txt
```

---

## **Script Usage**

The `process_logs.sh` script automates the above commands and generates outputs in the same directory.

### **Run the Script**
```bash
bash process_logs.sh
```

### **Output**
- Unique IPs: `unique_ips.txt`
- Usernames: `usernames.txt`
- HTTP Status Counts: `http_status_counts.txt`
- Failed Login Attempts: `failed_logins.txt`
- Script Output: `script_output.txt`

---

