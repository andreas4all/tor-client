#!/bin/sh
echo "HashedControlPassword" `/usr/bin/tor --hash-password $PASSWORD` >> /tmp/torrc
cat /tmp/torrc
/usr/bin/tor -f /tmp/torrc