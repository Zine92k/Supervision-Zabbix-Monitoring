#!/bin/bash
# Installation Agent Zabbix - Zine92k
ZABBIX_SERVER="192.168.1.100" # IP de mon serveur Zabbix
# Vérification root
if [ "$EUID" -ne 0 ]; then 
  echo "Lancer en sudo !"
  exit 1
fi
# Test de ping rapide vers le serveur pour pas installer pour rien
ping -c 1 $ZABBIX_SERVER > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Attention : Serveur Zabbix non joignable à l'adresse $ZABBIX_SERVER"
    # On continue quand même l'install, mais on prévient
fi
echo "Installation des dépôts Zabbix..."
wget https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4%2Bdebian12_all.deb
dpkg -i zabbix-release_6.0-4+debian12_all.deb
apt update && apt install zabbix-agent -y

# Configuration de l'agent
echo "Configuration de l'agent..."
sed -i "s/Server=127.0.0.1/Server=$ZABBIX_SERVER/" /etc/zabbix/zabbix_agentd.conf
sed -i "s/ServerActive=127.0.0.1/ServerActive=$ZABBIX_SERVER/" /etc/zabbix/zabbix_agentd.conf

systemctl restart zabbix-agent
systemctl enable zabbix-agent

echo "Agent installé et configuré pour le serveur $ZABBIX_SERVER"
