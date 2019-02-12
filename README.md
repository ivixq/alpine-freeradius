#### Default Environment Variables
```bash
DB_HOST=${DB_HOST:-"radius-db"}
DB_PORT=${DB_PORT:-"3306"}
DB_USER=${DB_USER:-"radius"}
DB_PASS=${DB_PASS:-"radpass"}
DB_NAME=${DB_NAME:-"radius"}

RECIPIENT=${RECIPIENT:-""}
PASS_FILE=${PASS_FILE:-"pass_file"}
CUSTOMER=${CUSTOMER:-"customer"}
SQL_DRIVER=${SQL_DRIVER:-"rlm_sql_mysql"}
DIALECT=${DIALECT:-"sqlite"}

CLIENT_NAME=${CLIENT_NAME:-"demo"}
CLIENT_NETWORK=${CLIENT_NETWORK:-"0.0.0.0/0"}
PSK=${PSK:-"123456"}

RECIPIENT=${RECIPIENT:-""}
CUSTOMER=${CUSTOMER:-"customer"}
CRON_CMD=${CRON_CMD:-""}
```
