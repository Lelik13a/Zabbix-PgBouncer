#!/bin/sh

MON_USER=postgres
MON_PASSWORD=postgres
PGBOUNCER_PORT=6432
PGBOUNCER_HOST="127.0.0.1"

COMMAND=$1
#USER=$3
#DB=$2

if [ "x$COMMAND" = "xdiscover" ]
then
        # discovery bases and users
    env PGPASSWORD=$MON_PASSWORD psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show pools;' \
      | awk -F'|' 'BEGIN { printf "{\"data\":["; n=0; }
                   /\|/ { if (n != 0)
                            printf ",";
                          gsub(" ", "", $1);
                          gsub(" ", "", $2);
                          printf "{\"{#PGBOUNCER_DATABASE}\": \"" $1 "\", \"{#PGBOUNCER_USER}\": \"" $2 "\"}";
                          n++; }
                   END { printf "]}"; }'
elif [ "x$COMMAND" = "xtotals" ]
then
        # get total statistic
  env PGPASSWORD=$MON_PASSWORD psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show totals;'

elif [ "x$COMMAND" = "xlists" ]
then
        # get internal information
  env PGPASSWORD=$MON_PASSWORD psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show lists;'

elif [ "x$COMMAND" = "xpools" ]
then
        # get pools statistic
  env PGPASSWORD=$MON_PASSWORD psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show pools;'

fi
