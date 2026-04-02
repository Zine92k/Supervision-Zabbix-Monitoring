#!/bin/bash
# zabbix_alert_sms.sh — Déclenché par Zabbix Action
TO="$1" ; SUBJECT="$2" ; MESSAGE="$3"
BODY="[ZABBIX] ${SUBJECT} — ${MESSAGE} ($(date '+%d/%m %H:%M'))"
curl -s -X POST "https://api.sms-provider.com/send" \
  -H "Authorization: Bearer ${SMS_API_KEY}" \
  -d "to=${TO}&message=${BODY}"
logger -t zabbix "SMS sent to ${TO}: ${SUBJECT}"
