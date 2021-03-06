#!/usr/bin/env bash
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: 2016-04-29 16:49:24 +0100 (Fri, 29 Apr 2016)
#
#  https://github.com/harisekhon/Dockerfiles/cassandra-dev
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback
#
#  https://www.linkedin.com/in/harisekhon
#

set -euo pipefail
[ -n "${DEBUG:-}" ] && set -x

# recent versions 3.5+ refuse to run as root
#cassandra
su cassandra $(which cassandra)
count=0
while true; do
    logfile="/cassandra/logs/system.log"
    [ -f "/var/log/cassandra/system.log" ] &&
        logfile="/var/log/cassandra/system.log"
    grep 'Starting listening for CQL clients' "$logfile" && break
    let count+=1
    if [ $count -gt 20 ]; then
        echo
        echo
        echo "Didn't find CQL startup in cassandra system.log, trying CQL anyway"
        break
    fi
    echo -n .
    sleep 1
done
echo
echo
# bug workaround
# https://issues.apache.org/jira/browse/CASSANDRA-11850
export CQLSH_NO_BUNDLED=TRUE
#cqlsh
if [ -t 0 ]; then
    su cassandra $(which cqlsh) $(hostname -f)
    echo -e "\n\nCQL shell exited"
else
    echo "
Running non-interactively, will not open CQL shell

For CQL shell start this image with 'docker run -t -i' switches

"
fi
echo -e "\n\nWill tail logs now to keep this container alive until killed...\n\n"
sleep 30
tail -f /cassandra/logs/* &
wait || :
