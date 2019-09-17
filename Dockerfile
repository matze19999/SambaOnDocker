FROM alpine:edge

RUN apk add --update samba-common-tools samba-client samba-server && rm -rf /var/cache/apk/*

EXPOSE 445/tcp

ENTRYPOINT ["smbd", "--foreground", "--no-process-group", "--log-stdout"]

CMD []
