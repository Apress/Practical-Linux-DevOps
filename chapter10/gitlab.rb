gitlab_rails['smtp_enable'] = true
gitlab_rails['smtp_address'] = "mail.devops.lab"
gitlab_rails['smtp_port'] = 25
gitlab_rails['smtp_domain'] = "devops.lab"
gitlab_rails['smtp_enable_starttls_auto'] = false
gitlab_rails['smtp_openssl_verify_mode'] = 'none'
gitlab_rails['smtp_tls'] = false
gitlab_rails['smtp_ssl'] = false
gitlab_rails['smtp_force_ssl'] = false
gitlab_rails['service_desk_email_host'] = "mail.devops.lab"
gitlab_rails['service_desk_email_port'] = 993
gitlab_rails['service_desk_email_ssl'] = false
gitlab_rails['service_desk_email_start_tls'] = true

# If your SMTP server does not like the default 
# 'From: gitlab@devops.lab' you can change the 
# 'From' with this setting.
gitlab_rails['gitlab_email_from'] = 'gitlab@devops.lab'
gitlab_rails['gitlab_email_reply_to'] = 'noreply@devops.lab'

