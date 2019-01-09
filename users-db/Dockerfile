FROM mysql/mysql-server:8.0
ENV MYSQL_ROOT_PASSWORD=MyNewPass

WORKDIR /
COPY . .

ENTRYPOINT ["/init_server.sh"]

EXPOSE 3306 33060