#!/bin/bash
reponse=$(curl 'https://tibletech.com/es/mi-ip' -x http://47.242.84.173:3128 -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.0.0 Safari/537.36')
echo $reponse | egrep -o --color=auto '[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}<'