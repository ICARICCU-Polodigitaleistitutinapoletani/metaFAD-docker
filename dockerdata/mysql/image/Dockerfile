FROM mysql:5.7.18

RUN sed -i '$ a sql_mode="NO_ENGINE_SUBSTITUTION"' /etc/mysql/conf.d/docker.cnf && apt-get update && apt-get install -y cron --no-install-recommends && rm -rf /var/lib/apt/lists/*
COPY docker-entrypoint.sh /usr/local/bin/
