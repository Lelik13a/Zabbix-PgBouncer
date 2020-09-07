#!/bin/sh

PGBOUNCER_HOST=$(head -n 1 ~zabbix/.pgpass |cut -d: -f1)
PGBOUNCER_PORT=$(head -n 1 ~zabbix/.pgpass |cut -d: -f2)
MON_USER=$(head -n 1 ~zabbix/.pgpass |cut -d: -f4)

COMMAND=$1
#USER=$3
#DB=$2

if [ "x$COMMAND" = "xdiscover" ]
then
        # discovery bases and users
    psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show pools;' \
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
    psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show totals;'

elif [ "x$COMMAND" = "xlists" ]
then
        # get internal information
    psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show lists;'

elif [ "x$COMMAND" = "xpools" ]
then
        # get pools statistic
    psql -h $PGBOUNCER_HOST -p $PGBOUNCER_PORT -U $MON_USER pgbouncer -t -c 'show pools;'

fi
