#!/bin/sh

/usr/bin/flock -n /tmp/job_metadam.lock /usr/bin/php -f /opt/app/dam/runJobManager.php