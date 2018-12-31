#!/bin/sh

set -x

function Update_User_PW {
    echo "[i] Update users password file"
    tfile=`mktemp`

    if [ ! -f "$tfile" ]; then
        return 1
    fi

    > $tfile
    for i in `seq 1 9`; do
        echo -e "update radcheck set value = '`pwgen 6 1`' where username = 'guest0$i';" >> $tfile
    done
    for i in `seq 10 50`; do
        echo -e "update radcheck set value = '`pwgen 6 1`' where username = 'guest$i';" >> $tfile
    done
    $mysqlcmd $DB_NAME < $tfile
}

function Export_User_PW {
    rm -rf /userpass/$PASS_FILE
    echo "[i] Create users password file"
    userpasswd="$($mysqlcmd $DB_NAME -e "select username,value from radcheck;")"
    dump_data=/userpass/$PASS_FILE
    >$dump_data
    echo -e "$userpasswd" > $dump_data
}

function Send_Mail {
    # mail title
    mail_subject="【"$CUSTOMER_NAME"】[$(date +%F)]"$PASS_FILE""    
    # mail content
    mail_content=""$PASS_FILE" at $(date +%F_%H:%M)"
    # mail address
    mail_address="$RECIPIENT_MAIL_ADDR"
    # send mail
    echo $mail_content | mutt -s $mail_subject -b $mail_address -a /userpass/$PASS_FILE
    # clean the temp file for mutt
    cat /dev/null > ~/sent
}

#------MAIN------#
DB_HOST=${DB_HOST:-"radius-db"}
DB_PORT=${DB_PORT:-"3306"}
DB_USER=${DB_USER:-"radius"}
DB_PASS=${DB_PASS:-"radpass"}
DB_NAME=${DB_NAME:-"radius"}
RECIPIENT_MAIL_ADDR=${RECIPIENT_MAIL_ADDR:-""}
PASS_FILE=${PASS_FILE:-""}
CUSTOMER_NAME=${CUSTOMER_NAME:-"GSL"}

mysqlcmd="mysql -h$DB_HOST -u$DB_USER -p$DB_PASS -A -N"

Update_User_PW
Export_User_PW
Send_Mail

