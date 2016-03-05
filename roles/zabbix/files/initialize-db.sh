#!/bin/sh

if (psql -c \\dt zabbix | grep -q No\ relations\ found) ; then
  /bin/zcat /usr/share/doc/zabbix-server-pgsql/create.sql.gz > /tmp/initialized-zabbix.sql && \
  psql -U zabbix zabbix < /tmp/initialized-zabbix.sql && \
  rm -v /tmp/initialized-zabbix.sql
fi
