#!/bin/bash

VERSION="v0.1.0"

# show_help function to display the help message
function show_help() {
    echo "================================================================================"
    echo "                               sysopctl - $VERSION"
    echo " sysopctl is command-line tool designed for managing system resources and tasks."
    echo " "
    echo "================================================================================"
    echo ""
    echo "              Usage: sysopctl <command> [options]                      "
    echo ""
    echo "================================ Commands ======================================"
    echo ""
    echo "    service list                List all service unit files (enabled/disabled)"
    echo "    system load                 Show system load averages"
    echo "    service start <name>        Start a specific service"
    echo "    service stop <name>         Stop a specific service"
    echo "    disk usage                  Show disk usage statistics"
    echo "    process monitor             Show real-time process activity"
    echo "    logs analyze                Show summary of recent critical logs"
    echo "    backup <path>               Backup files at the given path"
    echo ""
    echo "================================ Options ======================================="
    echo ""
    echo "    --help                      Show this help message"
    echo "    --version                   Show version information"
    echo ""
    echo "================================ Examples ======================================"
    echo ""
    echo "    sysopctl service list"
    echo "    sysopctl service start apache2"
    echo "    sysopctl process monitor"
    echo ""
    echo "================================================================================"
}

# Function to display version information
function show_version() {
    echo "sysopctl version $VERSION"
}

# Check if no arguments are provided
if [ $# -eq 0 ]; then
    echo "Error: No command provided. Please provide a command."
    echo "Use 'sysopctl --help' to see available commands and options."
    exit 1
fi

# Check for --help or --version options
case "$1" in
    --help)
        show_help
        exit 0
        ;;
    --version)
        show_version
        exit 0
        ;;
esac

# Get the main command
MAIN_COMMAND=$1
shift # Shift to handle subcommands

# Check for the main command and execute the appropriate subcommand
case $MAIN_COMMAND in
    # Part 1 | Level Easy
    service)
        if [ "$1" == "list" ]; then
            echo "Listing all service unit files... (enabled/disabled)"
            service --status-all  # Corrected to use 'service' instead of 'systemctl'
        elif [ "$1" == "start" ]; then
            if [ -z "$2" ]; then
                echo "Error: Please specify a service to start."
                exit 1
            fi
            echo "Starting service: $2"
            sudo service "$2" start  # Corrected to use 'service' command
        elif [ "$1" == "stop" ]; then
            if [ -z "$2" ]; then
                echo "Error: Please specify a service to stop."
                exit 1
            fi
            echo "Stopping service: $2"
            sudo service "$2" stop  # Corrected to use 'service' command
        else
            echo "Error: Unknown service subcommand."
            show_help
            exit 1
        fi
        ;;

    system)
        if [ "$1" == "load" ]; then
            echo "Current system load averages:"
            uptime
        else
            echo "Error: Unknown system subcommand."
            show_help
            exit 1
        fi
        ;;

    # Part 2 | Level Intermediate
    disk)
        if [ "$1" == "usage" ]; then
            echo "Disk usage statistics by partition:"
            df -h
        else
            echo "Error: Unknown disk subcommand."
            show_help
            exit 1
        fi
        ;;

    # Part 3 | Advanced Level
    process)
        if [ "$1" == "monitor" ]; then
            echo "Monitoring system processes (press q to quit):"
            top
        else
            echo "Error: Unknown process subcommand."
            show_help
            exit 1
        fi
        ;;

    logs)
    if [ "$1" == "analyze" ]; then
        echo "Analyzing recent critical logs:"
        if journalctl -p 3 -b | tail -n 20 > /dev/null 2>&1; then
            sudo journalctl -p 3 -b | tail -n 20
        else
            echo "No journal logs found, showing dmesg output instead."
            sudo dmesg | tail -n 20
        fi
    else
        echo "Error: Unknown logs subcommand."
        show_help
        exit 1
    fi
    ;;

    backup)
        if [ -z "$1" ]; then
            echo "Error: Please specify a path to backup."
            exit 1
        fi
        echo "Starting backup for path: $1"
        rsync -av --progress "$1" /rsync_backup/  # Adjust destination as needed
        echo "Backup completed."
        ;;

    *)
        echo "Error: Unknown command."
        show_help
        exit 1
        ;;
esac

