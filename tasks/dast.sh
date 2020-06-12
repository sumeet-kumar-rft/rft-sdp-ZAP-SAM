#!/bin/bash
if [ "$DISABLED" = true ]; then
	echo "This stage has been disabled"
	exit
fi

echo "Performing DAST scanning"
echo "Targets:"
echo "http://demo.testfire.net" > ./target-data/targets
cat ./target-data/targets

# workaround to fix hanging Zap processes that prevents the container from exiting - https://github.com/concourse/concourse/issues/763
Xvfb :1 -screen 0 1024x768x16 -ac &
XVFB_PID=$!

mkdir -p /zap/wrk
for host in $(cat ./target-data/targets)
do
	cd /tmp
	zap-baseline.py -t $host -g gen.conf -r "report.html" -J "report.json" 
done

# workaround to fix hanging Zap processes that prevents the container from exiting - https://github.com/concourse/concourse/issues/763
kill $XVFB_PID
echo "DAST SCANNING COMPLETE"

