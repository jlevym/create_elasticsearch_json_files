#!/bin/bash

sudo service mongodb start

mongorestore --drop -d lergo-test dump/lergo-production

for collection in users questions lessons reports
do
          mongoexport -d lergo-test -c $collection -o $collection.json
          echo exported $collection
          echo ""
          sleep 120
done
sleep 60 &
wait $!

echo ""
echo all collections inserted into elasticsearch
echo ""
