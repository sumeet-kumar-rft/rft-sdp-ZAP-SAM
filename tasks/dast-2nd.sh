#!/bin/bash
if [ "$DISABLED" = true ]; then
    echo "This stage has been disabled"
    exit
fi
echo "Performing DAST scanning"
echo "Targets:"
cat ./pipeline-git/tasks/target-data/target.txt
mkdir -p /zap/wrk
for host in $(cat ./pipeline-git/tasks/target-data/target.txt)
do
    cd /tmp
  # workaround to fix hanging Zap processes that prevents the container from exiting - https://github.com/concourse/concourse/issues/763
  trap 'exit(0)' CHLD
  echo "SCANNING $host"
    zap-baseline.py -t $host -g gen.conf -r "report.html" -J "report.json" 
  # workaround to fix hanging Zap processes that prevents the container from exiting - https://github.com/concourse/concourse/issues/763
  kill `pgrep Xvfb`
  echo "DAST SCANNING COMPLETE"
done