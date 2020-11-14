# init counter
COUNT=0

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
