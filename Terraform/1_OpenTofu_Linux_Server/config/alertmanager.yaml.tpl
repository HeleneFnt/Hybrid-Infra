global:
  resolve_timeout: 1m

route:
  group_by: ['alertname']
  group_wait: 30s
  group_interval: 5m
  repeat_interval: 12h
  receiver: "${receiver_name}"

receivers:
- name: "${receiver_name}"
  email_configs:
  - to: "${email_to}"
    from: "${email_from}"
    smarthost: "${smtp_host}:${smtp_port}"
    auth_username: "${auth_username}"
    auth_identity: "${auth_identity}"
    auth_password: "${alertmanager_email_password}"
    send_resolved: true
