FROM alpine:3.15

RUN apk --no-cache add \
    make \
    openssl \
    perl \
    perl-app-cpanminus \
    perl-http-message \
    perl-lwp-protocol-https \
    perl-libwww \
    perl-module-implementation \
    perl-net-ssleay \
    perl-params-util \
    perl-params-validate \
    perl-sub-exporter \
    perl-term-readkey

RUN cpanm -n CPAN::Uploader

COPY entrypoint.pl /entrypoint.pl

RUN chmod +x /entrypoint.pl

ENTRYPOINT ["/entrypoint.pl"]
