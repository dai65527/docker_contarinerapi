# init counter
COUNT=0

# get previous count value
if [ -f save.dat ]; then
    COUNT=`cat save.dat`
    rm -f save.dat
fi

# procces when receive SIGTERM
save() {
    echo $COUNT > save.dat
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
