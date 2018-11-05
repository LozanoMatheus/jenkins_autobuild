PING_URL="/metrics/SdQQ16tu23EA94AtNqp_zmMyq0GyO2V85N1TkH4a2BTqeWIFXRZaUq9CqrCrPSqk/ping"
sleep 60s
docker ps
if curl -s http://localhost:80$PING_URL | grep -q 'pong'; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  curl -v http://localhost:80$PING_URL
  echo "Tests failed!"
  echo "Tests failed!"
  echo "Tests failed!"
  curl -v http://localhost:80/metrics/SdQQ16tu23EA94AtNqp_zmMyq0GyO2V85N1TkH4a2BTqeWIFXRZaUq9CqrCrPSqk/ping
  exit 1
fi
