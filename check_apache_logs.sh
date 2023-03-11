#!/bin/bash

logfile=/var/log/apache2/access.log   # for Ubuntu/Debian
# logfile=/var/log/httpd/access_log    # for CentOS/RHEL

if [ -f "$logfile" ]; then
  errors=$(awk '{if($9>=400) print $9}' $logfile)
  if [ -n "$errors" ]; then
    echo "Found errors in the log file:"
    echo "$errors"
  else
    echo "No errors found in the log file"
  fi
else
  echo "Log file not found"
fi


/var/lib/jenkins/workspace/softserve_check_apache_log/check_apache_logs.sh