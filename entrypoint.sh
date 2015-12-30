#!/bin/sh

CONFIGURED=$(grep HashedControlPassword /tmp/torrc -c)

if [ -e userpoint.sh ]; then
  /bin/sh userpoint.sh
fi

if [ $CONFIGURED -eq "0" ]; then
  if [ ! -z "$EXIT_NODES" ]; then
    echo "StrictExitNodes 1" >> /tmp/torrc
    echo "ExitNodes $EXIT_NODES" >> /tmp/torrc
  fi

  echo "HashedControlPassword" `/usr/bin/tor --hash-password $PASSWORD` >> /tmp/torrc

fi

cat /tmp/torrc
/usr/bin/tor -f /tmp/torrc