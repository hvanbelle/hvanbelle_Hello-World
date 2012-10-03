#!/bin/sh
 
if [ -z $1 ];then
    export START_DIR=`pwd` # no input so decide ourself
else     
    export START_DIR="$1"  # this should be the starting place for the script
fi 
 
LOGMAIL="someuser@somecompany.com"
LOGFILE=$START_DIR/logfile_p2
 
# Start putting the date in the logfile
date > $LOGFILE
echo $HOSTNAME >> $LOGFILE
 
#############################
# Check the tomcat-processes
#############################
# Get the tomcat processes
PIDS=`ps ax | grep java | grep tomcat | awk '{print $1}' `
# Kill if tomcat is still active (a brute kill !!!)
for PID in $PIDS
do
        echo "tomcat - kill this $PID ..." >> $LOGFILE
        /bin/kill -9 $PID
done
 
###########################################
# Next ..... start everything up again....
 
# Now do a clean start
/etc/init.d/tomcat start >> $LOGFILE
 
# And let us now do some reporting
PIDS=`ps ax | grep java | grep java | grep tomcat | awk '{print $1}' `
echo "After restart these pids for tomcat: $PIDS " >> $LOGFILE
mail -s "$HOSTNAME - P2 - These pid are in use for tomcat: $PIDS" $LOGMAIL < $LOGFILE
