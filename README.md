# Introduction

`Dockerfile` to create a wowza debian package from the official wowza installer.

This Dockerfile is not provided by or endorsed by Wowza Media Systems.

**NOTE**: By using this image you are agreeing to comply with the [Wowza EULA](https://www.wowza.com/legal)

Wowza Streaming Engine is unified streaming media server software developed by Wowza Media Systems. The server is used for streaming of live and on-demand video, audio, and rich Internet applications over IP networks to desktop, laptop, and tablet computers, mobile devices, IPTV set-top boxes, internet-connected TV sets, game consoles, and other network-connected devices.


# Getting started

## Installation

```bash
docker build -t icto/wowzapackage .
```

## Quickstart

Before you can start using this image you need to acquire a valid license from Wowza Media Systems for the Wowza Streaming Engine software. If you do not have one, you can [request a free trial license](http://www.wowza.com/pricing/trial) or purchase a license from Wowza Media Systems.

Start Wowza packaging using:

```bash
docker run --name wowzapackage \
  --env 'WOWZA_ACCEPT_LICENSE=yes' \
  --env 'WOWZA_KEY=xxxx-xxxx-xxxx-xxxx-xxxx-xxxx-xxxx' \
  icto/wowzapackage
```

**The `--env WOWZA_ACCEPT_LICENSE=yes` parameter in the above command indicates that you agree to the Wowza EULA.**

# Retrieving the package

The created package is placed within a docker volume, use docker inspect to find the full path to the volume.

# Acknowledgments

This repo is based on the following repo : https://github.com/sameersbn/docker-wowza
