#!/bin/bash

# change those 3 values
apikey="airly_apikey"
lat=54.507419
lng=18.540195

get_caqi_dot () {
    if [ "$1" -le 25 ]; then
        echo "● | color=#6BC926"
    elif [ "$1" -le 50 ]; then
        echo "● | color=#D1CF1E"
    elif [ "$1" -le 75 ]; then
        echo "● | color=#EFBB0F"
    elif [ "$1" -le 87 ]; then
        echo "● | color=#EF7120"
    elif [ "$1" -le 100 ]; then
        echo "● | color=#EF2A36"
    elif [ "$1" -le 125 ]; then
        echo "● | color=#B00057"
    else
        echo "● | color=#770078"
    fi
}

fetch_caqi_value () {
    url="https://airapi.airly.eu/v2/measurements/nearest?lat=$1&lng=$2&maxDistanceKM=10.0"
    airly_caqi=$(curl -s --header 'Accept: application/json' --header "apikey: $apikey" $url | grep -E -o '{"name":"AIRLY_CAQI","value":[0-9.]+,' | head -1 | grep -E -o '[0-9]+' | head -1)
    echo $airly_caqi
}

caqi=$(fetch_caqi_value $lat $lng)
dot=$(get_caqi_dot $caqi)

echo "$caqi $dot"
