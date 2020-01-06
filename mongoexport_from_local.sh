#!/bin/bash

set -e

sudo service mongodb start

mongorestore --drop -d lergo-test dump/lergo-production

sleep 10 &
wait $!
echo ""
echo mongorestore completed
echo ""

echo ""
echo start updating lessons with username.. this may take some take a bit
echo ""
sleep 10 &
wait $!
mongo localhost:27017/lergo-test add_username_to_lessons.js
echo ""
echo lessons update completed
echo""

echo ""
echo start updating questions with username.. this may take some take a bit
echo ""
sleep 10 &
wait $!
mongo localhost:27017/lergo-test add_username_to_questions.js
echo ""
echo database update completed
echo""




for collection in users questions lessons reports
do
          mongoexport -d lergo-test -c $collection -o $collection.json
          echo ""
          echo finished exporting $collection
          echo ""
          echo sleep  30 secs
          sleep 30
done

echo ""
echo "sleep 30 secconds and then we are done"
sleep 30 &
wait $!

echo ""
echo "all exported collections are now available in this folder"
echo ""

echo ""
echo "to now add these files to elasticsearch, run ~/dev_serverless/docker-elk/logstash$ time ./all_install_json.sh "
echo ""
