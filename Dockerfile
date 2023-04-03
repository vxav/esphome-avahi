# Thanks to https://github.com/esphome/issues/issues/3517#issuecomment-1369256899

ARG RELEASE
FROM ghcr.io/esphome/esphome:${RELEASE}

RUN set -ex \
 && apt-get update && apt-get install -y --no-install-recommends avahi-daemon libnss-mdns \
 && echo '*' > /etc/mdns.allow \
 && sed -i "s/hosts:.*/hosts:          files mdns4 dns/g" /etc/nsswitch.conf \
 && printf "[server]\nenable-dbus=no\n" >> /etc/avahi/avahi-daemon.conf \
 && chmod 777 /etc/avahi/avahi-daemon.conf \
 && mkdir -p /var/run/avahi-daemon \
 && chown avahi:avahi /var/run/avahi-daemon \
 && chmod 777 /var/run/avahi-daemon

COPY avahi-entrypoint.sh /avahi-entrypoint.sh

ENTRYPOINT ["bash", "/avahi-entrypoint.sh"]

CMD ["/entrypoint.sh", "dashboard", "/config"]
