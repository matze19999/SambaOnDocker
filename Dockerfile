FROM alpine:edge
RUN PASSWD=PASSWD
RUN USER=USER
RUN apk add --update samba-common-tools samba-client samba-server && rm -rf /var/cache/apk/*
RUN PASS=$PASSWD
RUN adduser -s /sbin/nologin -h /home/samba -H -D $USER
RUN echo -e "$PASSWD\n$PASSWD" | smbpasswd -s -a $USER
EXPOSE 445/tcp
ENTRYPOINT ["smbd" "--foreground" "--no-process-group" "--log-stdout"]
CMD []
