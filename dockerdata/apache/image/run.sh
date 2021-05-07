#!/bin/bash
set -e

# Generate project_env.sh
printenv | sed 's/^\(.*\)$/export \1/g' > /project_env.sh
sed -i '/%s/d' /project_env.sh
chmod +x /project_env.sh

# Start cron for logrotate
cron

# apply crontab if present
if [ -f /crontab ]
then
	crontab -u www-data /crontab
fi

if [ -f /runJob.sh ]
then
	chmod 777 /runJob.sh
fi
sed -i '$ a . /project_env.sh' /etc/apache2/envvars
source /etc/apache2/envvars

echo "Starting supervisord for APACHE and PHP-FPM..."
exec supervisord -n -c /etc/supervisor/supervisord.conf
