#!/bin/sh

if [ -e userpoint.sh ]; then
  /bin/sh userpoint.sh
fi

if [ ! -z $NODES]; then
  echo "StrictExitNodes 1" >> /tmp/torrc
  echo "ExitNodes $NODES" >> /tmp/torrc
fi

echo "HashedControlPassword" `/usr/bin/tor --hash-password $PASSWORD` >> /tmp/torrc
cat /tmp/torrc
/usr/bin/tor -f /tmp/torrc