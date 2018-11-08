#!/bin/bash

set -ex

JENKINS_URL="http://jenkins:8080"
PING_PONG_URL="metrics/SdQQ16tu23EA94AtNqp_zmMyq0GyO2V85N1TkH4a2BTqeWIFXRZaUq9CqrCrPSqk/ping"

date
sleep 240s

if curl -s $JENKINS_URL/$PING_PONG_URL | grep -i 'pong' ; then
  echo "Tests passed!"
  date
  exit 0
else
  echo "Tests failed!"
  date
  exit 1
fi
