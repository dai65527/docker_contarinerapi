# init counter
COUNT=0

# persistent volume
PV=/pv/save.dat

# get previous count value
if [ -f $PV ]; then
    COUNT=`cat $PV`
    rm -f $PV
fi

# process when receive SIGTERM
save() {
    echo $COUNT > $PV
    exit 0
}
## singal handler definition
## save() will interrupt when receive SIGTERM
trap save TERM

# set interval if env var not defined
if [ -z "$INTERVAL" ];  then
    INTERVAL=3
fi

# main loop
while [ true ];
do
    TM=`date|awk '{print $4}'`
    printf "%s : %d \n" $TM $COUNT
    let COUNT=COUNT+1
    sleep $INTERVAL
done
