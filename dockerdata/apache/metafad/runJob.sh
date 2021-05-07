#!/bin/sh

/usr/bin/flock -n /tmp/job_metafad.lock /usr/bin/php -f /opt/app/metafad/runJobManager.php
