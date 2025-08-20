FROM postgres:latest
WORKDIR /app
EXPOSE 5432

# Copy seed
COPY src/init.sql /docker-entrypoint-initdb.d/

