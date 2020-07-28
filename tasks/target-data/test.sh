trap 'exit(0)' CHLD
for host in $(cat target.txt)
do
	echo "Running ZAP scan on $host"
	ping -c 1 $host
done
