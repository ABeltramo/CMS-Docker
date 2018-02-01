FROM postgres:9.3

COPY ./startup.sh /docker-entrypoint-initdb.d/init-user-db.sh
RUN echo "******* END NON DEFAULT INIT ********"

# healthcheck
COPY docker-healthcheck /usr/local/bin/
HEALTHCHECK CMD ["docker-healthcheck"]