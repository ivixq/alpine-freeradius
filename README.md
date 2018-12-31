# hub.docker.com/ivixq/alpine-s6-freeradius

```bash
docker pull hub.docker.com/docker pull ivixq/alpine-s6-freeradius
```

# Configuration

### Data-Volumes

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| `/userpass` | User Passworkd File Directory |
| `/scripts` | Other script file Directory |



### Environment Variables

SQL_DRIVER=${SQL_DRIVER:-"rlm_sql_mysql"}      
DIALECT=${DIALECT:-"sqlite"}   
MYSQL_HOST=${MYSQL_HOST:-"radius.db"}   
MYSQL_PORT=${MYSQL_PORT:-"3306"}   
MYSQL_USER=${MYSQL_USER:-"radius"}   
MYSQL_PASSWORD=${MYSQL_PASSWORD:-"radpass"}   
MYSQL_DATABASE=${MYSQL_DATABASE:-"radius"}   
   
CLIENT_NETWORK=${CLIENT_NETWORK:-"0.0.0.0/0"}   
PSK=${PSK:-"123456"}   

PASS_FILE=${PASS_FILE:-""}   

YOURNAME=${YOURNAME:-""}   
SENDER_MAIL_ADDR=${SENDER_MAIL_ADDR:-""}   
ECIPIENT_MAIL_ADDR=${RECIPIENT_MAIL_ADDR:-""}   
SMTP_SERVER=${SMTP_SERVER:-""}   
SENDER_USERNAME=${SENDER_USERNAME:-""}   
SENDER_MAIL_PASS=${SENDER_MAIL_PASS:-""}   

CRON_EVENT=${CRON_EVENT:-"*/2 * * * * /bin/bash /etc/cron.d/update.sh"}   

### Networking

1812/udp    
1813/udp    
18120/udp   



# alpine-s6-freeradius
