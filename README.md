# Description
Check PgBouncer status and LLD pools.  
Check pools metrics. 

![pgbouncer](https://user-images.githubusercontent.com/12905969/84354505-2da9fa00-abeb-11ea-8a54-92a6aaf2ea3a.png)


# Dependencies
psql, bash, zabbix-agent.

Installation
============
0. configure pgbouncer monitoring user (https://www.pgbouncer.org/usage.html)

1. create directory and copy pgbouncer.sh to /var/lib/zabbix/externalscripts/
   change homedir for zabbix user usermod -d /var/lib/zabbix zabbix
2. copy zabbix_agentd.d/pgbouncer.conf to /etc/zabbix/zabbix_agentd.d/
3. chmod 755 /var/lib/zabbix/externalscripts/pgbouncer.sh and chown zabbix.zabbix /var/lib/zabbix/externalscripts/pgbouncer.sh
4. copy file .pgpass.j2 to ~zabbix/.pgpass and edit monitoring user and password, if needed, port too.
5. chmod 0600 ~zabbix/.pgpass and chown zabbix.zabbix ~zabbix/.pgpass
6. restart zabbix-agent daemon.
7. import "zbx_templates/Template App PgBouncer.xml" into your templates.
8. apply template "Template App PgBouncer" to pgbouncer node.
9. enjoy.


PS
===========
You can easily change the settings for monitoring a remote pgbouncer node.

