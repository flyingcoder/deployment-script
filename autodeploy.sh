#!/bin/bash -e

function cleanup {
      echo "Error occoured"
      curl -X POST -H 'Content-type: application/json' --data "{
              \"text\": \"Error occoured while building app with changes from ${pusher_name}\",
              \"username\": \"deploybot\",
              \"icon_url\": \"https://i.imgur.com/EUVHzdY.jpg\"
      }" your_slack_webhook_url
}
trap cleanup ERR

pusher_name=$2 # pusher.name

curl -X POST -H 'Content-type: application/json' --data "{
        \"text\": \"Started building app with changes from ${pusher_name}\",
        \"username\": \"deploybot\",
        \"icon_url\": \"https://i.imgur.com/EUVHzdY.jpg\"
}" your_slack_webhook_url

cd /path/to/server/files
git pull origin master

curl -X POST -H 'Content-type: application/json' --data "{
        \"text\": \"Build and deploy finished with changes from ${pusher_name}\",
        \"username\": \"deploybot\",
        \"icon_url\": \"https://i.imgur.com/EUVHzdY.jpg\"
}" your_slack_webhook_url