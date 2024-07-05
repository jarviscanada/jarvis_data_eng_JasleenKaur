#!/bin/bash


psql_host=$1
psql_port=$2
db_name=$3
psql_user=$4
psql_password=$5


if [ "$#" -ne 5 ]; then 
	echo "Illegal number of parameters" 
	exit 1 
fi 

hostname=$(hostname -f)
cpu_number=$(nproc)
cpu_architecture=$(lscpu | grep 'Architecture' | awk '{print $2}')
cpu_model=$(lscpu | grep 'Model name' | sed -r 's/Model name:\s+//')
# cpu_mhz=$(lscpu | grep 'CPU MHz' | awk '{print $3}')
cpu_mhz=$(grep 'cpu MHz' /proc/cpuinfo | awk '{print $4}' | head -1)
l2_cache=$(lscpu | grep 'L2 cache' | awk '{print $3}' | sed 's/K//')
total_mem=$(vmstat --unit M | tail -1 | awk '{print $4}')
timestamp=$(date +"%Y-%m-%d %H:%M:%S")


#timestamp=$(vmstat -t | awk '{print $18, $19}'| tail -1 | xargs )


#echo $cpu_number
#echo $cpu_architecture
#echo $cpu_model
echo $cpu_mhz
echo $l2_cache
echo $total_mem
echo $timestamp 

insert_stmt="INSERT INTO host_info (hostname, cpu_number, cpu_architecture, cpu_model, cpu_mhz, l2_cache ,timestamp , total_mem)
VALUES ('$hostname', '$cpu_number', '$cpu_architecture','$cpu_model', '$cpu_mhz', '$l2_cache','$timestamp' , '$total_mem')"

export PGPASSWORD=$psql_password 

psql -h $psql_host -p $psql_port -d $db_name -U $psql_user -c "$insert_stmt"


exit $?
