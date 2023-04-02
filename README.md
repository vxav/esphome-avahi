# esphome-avahi

![avahi-esphome](https://github.com/vxav/vxav.github.io/blob/master/img/avahi-esphome.png?raw=true)

When running ESPHome in a container, it fails to resolve `.local` addresses and can't check the status of devices (even with `ESPHOME_DASHBOARD_USE_PING=true`).

[This thread](https://github.com/esphome/issues/issues/3517#issuecomment-1369256899) provides a Dockerfile to include the Avahi daemon in the image to support mdns.

The purpose of this repository is simply to build an ESPHome image with the Avahi daemon from [the base image in DockerHub](https://hub.docker.com/r/esphome/esphome). It uses Github action on release based on the tag (e.g. Creating a release with tag `2023.3` will pull `esphome/esphome:2023.3`, build the image with Avahi and push to `vxav/esphome-avahi:2023.3`).

For now the Github action only pushes to docker hub, you will find the image at : **vxav/esphome-avahi:[release tag]**
