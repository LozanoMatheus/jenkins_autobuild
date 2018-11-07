#!/bin/bash

PING_URL="/metrics/SdQQ16tu23EA94AtNqp_zmMyq0GyO2V85N1TkH4a2BTqeWIFXRZaUq9CqrCrPSqk/ping"
ss -tuan
docker ps || true
docker-compose ps || true
sleep 60s
if curl -v http://jenkins:8080$PING_URL | grep -i "pong" ; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi
