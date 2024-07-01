#!/bin/bash 

#Setup arguments 
psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5

# Validation 
if [ "$#" -ne 5 ]; then
    echo "Illegal number of parameters"
    exit 1
fi

# Parse server CPU and memory usage data using bash scripts
vmstat_mb=$(vmstat --unit M)
hostname=$(hostname -f)


memory_free=$(vmstat --unit M | tail -1 | awk '{print $4}')
cpu_idle=$(vmstat | tail -1 | awk '{print $15}')
cpu_kernel=$(vmstat | tail -1 | awk '{print $14}')
disk_io=$(vmstat -d | tail -1 | awk '{print $10}')
disk_available=$(df -BM / | tail -1 | awk '{print $4}' | sed 's/M//')
timestamp=$(date +"%Y-%m-%d %H:%M:%S")


#Retrieve host id from host_info table based on host name
host_id=$(psql -h "$psql_host" -p "$psql_port" -d "$db_name" -U "$psql_user" -t -c "SELECT id FROM host_info WHERE hostname = '$hostname';")

# Check if host_id is null
if [ -z "$host_id" ]; then
    echo "Failed to retrieve host_id for hostname: $hostname"
    exit 1
fi

# Construct the INSERT statement with the correct host_id value
insert_stmt="INSERT INTO host_usage (timestamp, host_id, cpu_idle, cpu_kernel, disk_io, disk_available) VALUES ('$timestamp', $host_id, $cpu_idle, $cpu_kernel, $disk_io, $disk_available);"

# Set up env var for pql cmd
xport PGPASSWORD="$psql_password"

# Insert data into a database 
psql -h "$psql_host" -p "$psql_port" -d "$db_name" -U "$psql_user" -c "$insert_stmt"


exit $?
