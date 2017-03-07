FROM armhf/alpine:3.5

ENV   OPENVPN=/etc/openvpn \
      EASYRSA=/usr/share/easy-rsa \
      EASYRSA_PKI=$OPENVPN/pki \
      EASYRSA_VARS_FILE=$OPENVPN/vars

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk add --update openvpn iptables bash easy-rsa openvpn-auth-pam google-authenticator pamtester && \
    ln -s /usr/share/easy-rsa/easyrsa /usr/local/bin && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

COPY container-files /

VOLUME ["/etc/openvpn"]

CMD ["ovpn_run"]

EXPOSE 1194/udp
