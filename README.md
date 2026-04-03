# Supervision Zabbix - Installation Agent

Script d'automatisation pour déployer l'agent Zabbix sur des serveurs Debian 12.

## Fonctionnement du script
* Ajout du dépôt officiel Zabbix 6.0.
* Installation du paquet `zabbix-agent`.
* Configuration automatique de l'IP du serveur de supervision.
* Activation du service au démarrage (systemctl).

## Utilisation
1. Éditer le script pour modifier la variable `ZABBIX_SERVER`.
2. `chmod +x install_zabbix_agent.sh`
3. `sudo ./install_zabbix_agent.sh`

## Notes
Utilisé en environnement de test pour remonter les métriques CPU/RAM/Disque vers une instance Zabbix centralisée.
