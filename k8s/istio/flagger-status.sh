ADDR=$1

PROGRESSING=false

EXIT_CODE=0

while true; do 

    curl -H "Host: go-demo-7.acme.com" "$ADDR"

    STATUS=$(kubectl --namespace go-demo-7 \
        get canary go-demo-7 \
        --output jsonpath="{.status.phase}")

    echo "Status: $STATUS"

    if [[ "$PROGRESSING" == "false" && "$STATUS" == 'Progressing' ]]; then
        PROGRESSING=true
    elif [[ "$PROGRESSING" == "true" && "$STATUS" == 'Succeeded' ]]; then
        echo "Canary deployment succeeded"
        break
    elif [[ "$PROGRESSING" == "true" && "$STATUS" == 'Failed' ]]; then
        echo "Canary deployment failed"
        EXIT_CODE=1
        break
    fi

    sleep 1

done

exit $EXIT_CODE