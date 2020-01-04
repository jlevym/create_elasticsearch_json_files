#!/bin/bash

set -c


./aws_download_latest_file.sh
sleep 60 &
wait $!

./decypher_dump.sh
sleep 60 &
wait $!

.mongoexport_from_local.sh
sleep 60 &
wait $!

echo ""
echo users.json, questions.json, lessons.json and reports.json are ready!

