FROM node:16.14.2-alpine as builder

USER root
WORKDIR /tmp

COPY package*.json .
RUN npm ci

COPY . .
RUN npm run build

FROM nginx:1.24.0-alpine-slim

USER root
WORKDIR /usr/share/nginx/html

COPY docker-entrypoint.sh .
COPY --from=builder /tmp/dist .

# Here we grant permissions to any user to read, write and execute any file in the WORKDIR.
# This is necessary where the container in run in an unprivileged environment.
# In this case, executing "docker-entrypoint.sh" and editing .js files requires permissions.
RUN chmod -R 777 .

EXPOSE 80

CMD ["sh", "docker-entrypoint.sh"]