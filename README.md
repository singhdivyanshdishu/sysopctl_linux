## SYSOPCTL
`sysopctl` is a custom CLI tool designed to streamline system administration tasks like managing services, monitoring system load, checking disk usage, and more. It offers user-friendly commands that serve as aliases for common system operations, such as `systemctl`. This Bash script automates tasks like managing services (list, start, stop), checking system load and disk usage, monitoring processes, analyzing logs, and backing up files. It also features a help menu and displays version information for easy navigation.

## Features
**Service Management  :** Start, stop, and list active services.</br>
**System Monitoring :** View system load and monitor processes.</br>
**Disk Usage :** Check the disk usage across filesystems.</br>
**File Backup :** Easily backup system files or directories.</br>
**Help Menu :**  Display available options and usage information.</br>
**Log Analysis :** Analyze system logs for critical errors.</br>


## Table of Contents

1.  [Installation](#installation)
2.  [Usage](#usage)
3.  [Commands](#commands)
4.  [Options](#options)

   ---

## Installation

To install `sysopctl` for system-wide use, follow these steps:

### 1\. Clone or Download the Script

Download the `sysopctl.sh` script and make it executable:

```bash
chmod +x sysopctl.sh
```

### 2\. Move the Script to a Directory in Your `$PATH`

To make the script accessible from anywhere in the system, copy it to `/usr/local/bin`:

```bash
sudo cp sysopctl.sh /usr/local/bin/
```

### 3\. Verify Installation

After copying the script, you can verify that it's installed correctly by running:
```bash
sysopctl --help
```
![image](https://github.com/user-attachments/assets/f9f54f90-a95d-45d3-bdb3-957bfafa3cdd)

## Usage

The `sysopctl` tool provides easy-to-remember commands to manage and monitor various aspects of the system.

Basic usage:

```bash
sysopctl <command> [options]
```

---

## Commands

### Part 1 | Easy Level

#### 1\. List Running Services

```bash
sysopctl service list
```

Displays a list of all `enabled`/`disabled` services, similar to `systemctl list-units --type=service --state=running`.
![image](https://github.com/user-attachments/assets/95c70ef4-5c4a-4816-ac9f-da4800c4ed0f)

#### 2\. View System Load

```bash
sysopctl system load
```
Shows the current system load averages, similar to the `uptime` command.
![image](https://github.com/user-attachments/assets/72a225da-56b1-4c0a-bb67-a45806c7412b)

---

### Part 2 | Intermediate Level

#### 3\. Start a Service

```bash
sysopctl service start [service-name]
```

Starts a system service, similar to `systemctl start <service-name>`.
![image](https://github.com/user-attachments/assets/5e39a856-bd7b-4b32-859c-eccf1e05aafa)

#### 4\. Stop a Service

```bash
sysopctl service stop [service-name]
```

Stops a system service, similar to `systemctl stop <service-name>`.
![image](https://github.com/user-attachments/assets/13a10af2-41b0-4212-a776-bb963f458272)

#### 5\. Check Disk Usage

```bash
sysopctl disk usage
```

Displays disk usage statistics by partition, similar to the `df -h` command.
![image](https://github.com/user-attachments/assets/b5e0a68f-3f4d-4832-b98e-3fe738447335)

---

### Part 3 | Advanced Level

#### 6\. Monitor System Processes

```bash
sysopctl process monitor
```

Monitors real-time process activity, similar to `top`.
![image](https://github.com/user-attachments/assets/2f733da0-0e47-4873-af75-1f6784d5545f)

#### 7\. Analyze System Logs

```bash
sysopctl logs analyze
```

Summarizes recent critical log entries using `journalctl -p 3 -b`.

#### 8\. Backup System Files

```bash
sysopctl backup [path]
```

Backs up files from the specified `<path>` to a destination, typically using `rsync`.
![image](https://github.com/user-attachments/assets/1522e9f5-2559-430b-a564-dd329db1a3c2)

---

## Options

### 1\. Display Help

```bash
sysopctl --help
```

Shows the help message, listing all available commands, options, and usage examples.
![image](https://github.com/user-attachments/assets/8902fd92-1029-4ef2-92a0-0c13214c3315)

### 2\. Display Version

```bash
sysopctl --version
```

Displays the current version of `sysopctl`. The current version is `v0.1.0`.
![image](https://github.com/user-attachments/assets/acdcf60e-3668-4fd3-9631-548baeec71cc)

