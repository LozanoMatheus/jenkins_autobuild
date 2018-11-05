PING_URL="/metrics/SdQQ16tu23EA94AtNqp_zmMyq0GyO2V85N1TkH4a2BTqeWIFXRZaUq9CqrCrPSqk/ping"
sleep 60s
if curl jenkins$PING_URL | grep -q 'pong'; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi
