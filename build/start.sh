#!/bin/bash

echo "#################################################"
echo "# starting container boot up script (start.sh)  #"
echo "#################################################"

list=$(ls -1 /boot.d/*)
for i in $list ; do
  echo "execute : <$i>"
  $i
done

echo "#################################################"
echo "# start supervisord"
echo "#"

trap 'kill -TERM $PID; wait $PID' TERM
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
PID=$!
wait $PID


