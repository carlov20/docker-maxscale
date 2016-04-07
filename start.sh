#!/bin/sh

addServer() {
	if ! grep -q $2 /etc/maxscale.cnf ; then
	echo "[$1]" >> /etc/maxscale.cnf
	echo "type=server" >> /etc/maxscale.cnf
	echo "address=$2" >> /etc/maxscale.cnf
	echo "port=3306" >> /etc/maxscale.cnf
	echo "protocol=MySQLBackend" >> /etc/maxscale.cnf
	echo "" >> /etc/maxscale.cnf
	fi
}

addServer server1 $DATA1_PORT_3306_TCP_ADDR
addServer server2 $DATA2_PORT_3306_TCP_ADDR
addServer server3 $DATA3_PORT_3306_TCP_ADDR

maxscale start --nodaemon