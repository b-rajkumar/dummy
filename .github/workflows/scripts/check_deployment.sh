#! /bin/bash

FORCED_DEPLOYMENT_TO_PROD_AND_SC=$1
PAUSE_DAY_OF_THE_WEEK=$2
DAY_END_TIME="17:30"
DAY_START_TIME="09:30"
CURRENT_WEEK_DAY=$(TZ="Asia/Kolkata" date +%u)
CURRENT_TIME=$(TZ="Asia/Kolkata" date +"%H:%M")

if [ $FORCED_DEPLOYMENT_TO_PROD_AND_SC == "true" ]; then
  exit
fi

if [ $CURRENT_WEEK_DAY -ge $PAUSE_DAY_OF_THE_WEEK ]; then
  echo "Cannot deploy on $(TZ="Asia/Kolkata" date +%A)"
  exit 1
fi

if [[ $CURRENT_TIME < $DAY_START_TIME || $CURRENT_TIME > $DAY_END_TIME ]]; then
  echo "Deployment only happens between $DAY_START_TIME to $DAY_END_TIME"
  exit 2
fi