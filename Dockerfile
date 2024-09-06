FROM node:alpine as builder

USER root
WORKDIR /tmp

COPY package*.json .
RUN npm ci

COPY . .
RUN npm run build

FROM nginxinc/nginx-unprivileged:alpine3.20

USER root
WORKDIR /usr/share/nginx/html

COPY docker-entrypoint.sh .
COPY --from=builder /tmp/dist .

# Here we grant permissions to any user to read, write and execute any file in the WORKDIR.
# This is necessary when the container is run in an unprivileged environment.
# In this case, executing "docker-entrypoint.sh" and editing .js files requires permissions.
RUN chmod -R 777 .

EXPOSE 8080

CMD ["sh", "docker-entrypoint.sh"]