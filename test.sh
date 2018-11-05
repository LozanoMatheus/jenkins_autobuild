PING_URL="/metrics/L_O1sN7KtKIC2C1ZV9BiJX7RDTc_f8Iky4pG_Al8PlT7A3EC1zr7oEfU53S6jTPa/ping"
sleep 5s
if curl jenkins$PING_URL | grep -q 'pong'; then
  echo "Tests passed!"
  exit 0
else
  echo "Tests failed!"
  exit 1
fi
