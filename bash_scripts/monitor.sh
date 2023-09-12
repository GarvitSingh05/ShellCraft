 #!/usr/bin/bash

# This bash script is used to run system performance checks on CPU, Memory, Disk etc. It alerts you if threshold limit has been crossed. Can be scheduled to run in regular intervals by crontab. You can also write the results in a text file as well and store the performance check data for many regular checks, and it should include the date and time as well so that it becomes easy to know when the performance checks were done.





# Setting the safe threshold values.

# 90% CPU usage safe threshold
  cpu_threshold=90

# 80% memory usage safe threshold
  memory_threshold=80

# 85% disk space usage safe threshold
  disk_threshold=85






# Function to Monitor CPU usage
check_cpu_usage() {
  local cpu_usage=$(top -bn1 | grep "%Cpu(s)" | awk '{print $2}' | cut -d "." -f1)

# Check if CPU usage is greater than the safe CPU threshold.

  if [ "$cpu_usage" -gt "$cpu_threshold" ]; then

# Warning message when CPU usage is greater than the threshold.

    echo -e "WARNING: CPU usage is above $cpu_threshold%: $cpu_usage%"

  else

# Message when CPU usage is less than the threshold.

    echo -e "\nCPU Check : CPU Usage is below the safe threshold of $cpu_threshold%.\n"

  fi
}







# Function to Monitor memory usage
check_memory_usage() {
  local memory_usage=$(free | awk '/Mem:/ {print int($3/$2 * 100)}')

# Check if Memory usage is greater than the safe Memory usage threshold.

  if [ "$memory_usage" -gt "$memory_threshold" ]; then

# Warning message when Memory usage is greater than the threshold.

    echo "WARNING: Memory usage is above $memory_threshold%: $memory_usage%"

  else

# Message when CPU usage is less than the threshold.

    echo -e "\nMemory Check : Memory Usage is below the safe threshold of $memory_threshold%.\n"

  fi
}








# Function to Monitor disk space
check_disk_usage() {
  local disk_usage=$(df -h / | awk '/\// {print $5}' | tr -d '%')

# Check if Disk usage is greater than the safe Disk usage threshold.

  if [ "$disk_usage" -gt "$disk_threshold" ]; then

# Warning message when Disk usage is greater than the threshold.

    echo "WARNING: Disk space usage is above $disk_threshold%: $disk_usage%"

  else

# Message when Disk usage is less than the threshold.

    echo -e "\nDisk Check : Disk Space usage is below the safe threshold of $disk_threshold%.\n"

  fi
}


# Main function to run the monitoring script
main() {
  echo -e "\nMonitoring system resources...\n"

    check_cpu_usage
    check_memory_usage
    check_disk_usage

  echo -e "\nResource monitoring complete!\n"
}

# Run the main function
  main
