NOTIFY=
for CURRENCY in $@
do
	VALUE=`curl "http://api.chbtc.com/data/v1/ticker?currency=$CURRENCY" 2>/dev/null | jq '.ticker.last' -r`
	NOTIFY=`echo "$NOTIFY$CURRENCY:\t$VALUE\n"`
done
echo -e "$NOTIFY" | trayballoon --timeout 10000
