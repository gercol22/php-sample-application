FROM mysql:latest

COPY /sql/db.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=password
ENV MYSQL_DATABASE=nombre_basedatos
ENV MYSQL_USER=usuario
ENV MYSQL_PASSWORD=password
EXPOSE 3306