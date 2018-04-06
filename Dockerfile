FROM alpine:3.7
RUN apk add --update-cache caddy=0.10.10-r0
RUN chown -R caddy:caddy /var/www /var/log
WORKDIR /var/www
COPY files/Caddyfile /etc/Caddyfile
COPY files/index.html /var/www
EXPOSE 2015
USER caddy
ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
