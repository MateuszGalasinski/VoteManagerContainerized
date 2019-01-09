#!/bin/bash

./entrypoint.sh mysqld &

sleep 10s

while true
do  
    if ./healthcheck.sh | grep -q 'mysqld is alive'; then
        break
    fi
    sleep 1s
done

echo "---> MySQL db is alive. Trying to execute setup scripts."

mysql -h "localhost" --connect-expired-password -u "root" "-pMyNewPass" < "user.sql"
echo "---> Finished user creation script."
mysql -h "localhost" --connect-expired-password -u "root" "-pMyNewPass" < "table_setup.sql"
echo "---> Finished user table creation script."
mysql -h "localhost" --connect-expired-password -u "root" "-pMyNewPass" < "priviliges.sql"
echo "---> Finished db access script."

echo "---> Users database is ready for use. It will be running for 10 days or until container stops running"

sleep 10d