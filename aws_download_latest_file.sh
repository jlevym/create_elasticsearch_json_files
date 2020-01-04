#!/bin/sh


#PROFILE=your_profile
#BUCKET=your_bucket

PROFILE=lergo
BUCKET=lergo-backups

OBJECT="$(aws s3 ls --profile $PROFILE $BUCKET --recursive | sort | tail -n 1 | awk '{print $4}')"
aws s3 cp s3://$BUCKET/$OBJECT dump.tar.gz --profile $PROFILE

sleep 60 &
wait $!

echo ""
echo  latest mongodb dump  downloaded
echo ""

