FROM alpine:3.6
RUN apk add --no-cache caddy=0.9.3-r1
RUN chown -R caddy:caddy /var/www /var/log
WORKDIR /var/www
COPY files/Caddyfile /etc/Caddyfile
COPY files/index.html /var/www
EXPOSE 2015
USER caddy
ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
