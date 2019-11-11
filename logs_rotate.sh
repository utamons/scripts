#!/bin/sh

# Simple logs rotation script for scheduled run.

MAX_LOGFILES=10
BACKUP_LOGS_PATH=/var/app/log_backup
CURRENT_LOG_PATH=/var/app
LOGNAME_HEAD=app
LOGNAME_EXT=log

CURRENT_LOG=$CURRENT_LOG_PATH/$LOGNAME_HEAD.$LOGNAME_EXT

if [ "`ls $BACKUP_LOGS_PATH | wc -w`" -gt "$MAX_LOGFILES" ]; then
 rm $BACKUP_LOGS_PATH/`ls -t -1 $BACKUP_LOGS_PATH | tail -1`
fi

current_date=$(date "+%Y%m%d-%H%M%S")
backup_fname="$BACKUP_LOGS_PATH/$LOGNAME_HEAD-$current_date.$LOGNAME_EXT"

cp $CURRENT_LOG $backup_fname
echo > $CURRENT_LOG
