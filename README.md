# Description
Check PgBouncer status and LLD pools.  
Check pools metrics. 

![pgbouncer](https://user-images.githubusercontent.com/12905969/84354505-2da9fa00-abeb-11ea-8a54-92a6aaf2ea3a.png)


# Dependencies
psql, bash, zabbix-agent.

Installation
============
0. configure pgbouncer monitoring user (https://www.pgbouncer.org/usage.html)

1. copy pgbouncer.sh to /etc/zabbix/
2. copy zabbix_agentd.d/pgbouncer.conf to /etc/zabbix/zabbix_agentd.d/
3. chmod 755 /etc/zabbix/pgbouncer.sh
4. change in pgbouncer.sh **MON_USER** and **MON_PASSWORD** variables.
4. if needed, change in pgbouncer.sh **PGBOUNCER_PORT** and **PGBOUNCER_HOST**.
5. restart zabbix-agent daemon.
6. import "zbx_templates/Template App PgBouncer.xml" into your templates.
7. apply template "Template App PgBouncer" to pgbouncer node.
9. enjoy.


PS
===========
You can easily change the settings for monitoring a remote pgbouncer node.

