#!/bin/bash
source /etc/profile.d/aws-apitools-common.sh

ZONEID=ZFCGYZ1BBZMF2
NSHOST=ns.seed.tapyrus.dev.haw.biz
HOST=seed.tapyrus.dev.haw.biz
EMAIL=nakajo@chaintope.com

TTL=60
NEWIP=`/usr/bin/curl -s "http://169.254.169.254/2008-02-01/meta-data/public-ipv4"`

# update route53
/usr/bin/route53 change_record ${ZONEID} ${NSHOST}. A ${NEWIP} ${TTL}

# screen up
screen -S seeder -X quit
screen -dmS seeder
sleep 3s

# launch seeder
screen -S seeder -X -p 0 exec sudo dnsseed -h ${HOST} -n ${HOST} -m ${EMAIL} --testnet
