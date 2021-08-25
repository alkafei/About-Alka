#!/bin/bash

#################################
## Begin of user-editable part ##
#################################

POOL=ethash.unmineable.com:3333
WALLET=SHIB:0x3A0232133919da9aF4d29E9010D2081122C55E20.eue

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
while [ $? -eq 42 ]; do
    sleep 10s
    ./lolMiner --algo ETHASH --pool $POOL --user $WALLET $@
done
