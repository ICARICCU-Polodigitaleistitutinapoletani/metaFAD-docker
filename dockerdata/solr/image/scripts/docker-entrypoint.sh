#!/bin/bash
#
# docker-entrypoint for docker-solr

set -e

if [[ "$VERBOSE" = "yes" ]]; then
    set -x
fi

start-local-solr

for i in $(echo $SOLR_CORE | tr "," "\n")
do
    if [[ $i == *":"* ]]; then
        CORE=$(echo ${i%:*})
        TEMPLATE=$(echo ${i#*:})
        if [ ! -d "/opt/solr/server/solr/mycores/$CORE" ]
        then
            solr create -c $CORE -d /tmp/configsets/$TEMPLATE
            mv /opt/solr/server/solr/$CORE /opt/solr/server/solr/mycores/
        fi
    else
        if [ ! -d "/opt/solr/server/solr/mycores/$i" ]
        then
            solr create -c $i
            mv /opt/solr/server/solr/$i /opt/solr/server/solr/mycores/
        fi
    fi
done

stop-local-solr

# when invoked with e.g.: docker run solr -help
if [ "${1:0:1}" = '-' ]; then
    set -- solr-foreground "$@"
fi

# execute command passed in as arguments.
# The Dockerfile has specified the PATH to include
# /opt/solr/bin (for Solr) and /opt/docker-solr/scripts (for our scripts
# like solr-foreground, solr-create, solr-precreate, solr-demo).
# Note: if you specify "solr", you'll typically want to add -f to run it in
# the foreground.
exec "$@"
