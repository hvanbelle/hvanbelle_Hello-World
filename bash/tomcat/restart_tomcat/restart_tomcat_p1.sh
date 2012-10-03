#!/bin/sh
 
if [ -z $1 ];then
    export START_DIR=`pwd` # no input so decide ourself
else     
    export START_DIR="$1"  # this should be the starting place for the script
fi 
 
LOGEMAIL="someuser@somecompany.com"
LOGFILE=$START_DIR/logfile_p1
 
# Start putting the date in the logfile
date > $LOGFILE
echo $HOSTNAME >> $LOGFILE
 
# First ..... stop ....
 
# Try a clean shutdown of Tomcat
/etc/init.d/tomcat stop >> $LOGFILE
 
# And let us now something
PIDS=`ps ax | grep java | grep java | grep tomcat | awk '{print $1}' `
echo "After shutdown these pids for tomcat: $PIDS " >> $LOGFILE
mail -s "$HOSTNAME - P1 - These pid are in use for tomcat: $PIDS" $LOGEMAIL < $LOGFILE

