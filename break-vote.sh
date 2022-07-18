#!/bin/bash

for (( ; ; ))
do
    csrf_token=`curl -c cookies.txt https://xoyondo.com/ap/fqlWhr5Xxpq8uf0 | grep 'data-csrftoken="' | cut -d"\"" -f2`

    echo $csrf_token

    sessionid=`awk -F 'PHPSESSID' '{print $2}' cookies.txt | xargs `
    echo $sessionid

    curl 'https://xoyondo.com/pc/poll-apoll' \
    -H 'accept: application/json' \
    -H 'content-type: application/x-www-form-urlencoded; charset=UTF-8' \
    -H 'cookie: PHPSESSID='$sessionid'; lang=en-us;'\
    -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36' \
    --data-raw 'operation=vote&pollid=496291&ID=fqlWhr5Xxpq8uf0&csrf_token='$csrf_token'&checkeddata=%5B2770024%5D' \
    --compressed >> dump.txt
done
