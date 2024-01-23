# esphome-avahi

![avahi-esphome](https://github.com/vxav/vxav.github.io/blob/master/img/avahi-esphome.png?raw=true)

When running ESPHome in a container, it fails to resolve `.local` addresses and can't check the status of devices (even with `ESPHOME_DASHBOARD_USE_PING=true`).

[This thread](https://github.com/esphome/issues/issues/3517#issuecomment-1369256899) provides a Dockerfile to include the Avahi daemon in the image to support mdns.

The purpose of this repository is simply to build an ESPHome image with the Avahi daemon from [the base image in DockerHub](https://hub.docker.com/r/esphome/esphome).

The Github actions to create a release when there is a new latest tag runs at 00:45AM daily and build/push to `vxav/esphome-avahi` runs on release.
