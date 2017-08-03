#!/bin/sh

NAME=wowzastreamingengine

fpm -s dir -t deb -n $NAME-$WOWZA_VERSION -v $WOWZA_VERSION -m "Kristof Keppens <k.keppens@ugent.be>" \
    --description "Wowza streaming engine" --after-install $NAME.postinst \
    --before-remove $NAME.prerm --after-remove $NAME.postrm \
    /usr/local/WowzaStreamingEngine-$WOWZA_VERSION
