FROM ruby:3.2.2-alpine as build

ARG RAILS_ROOT="/app"
ARG BUILD_PKGS="build-base"
ARG DEV_PKGS="mariadb-dev yaml-dev zlib-dev openssl-dev icu-dev curl-dev"
ARG RUBY_PKGS="tzdata bash openssl git"

ENV LANG=C.UTF-8 \
  RUBY_YJIT_ENABLE=1 \
  BUNDLE_JOBS=20 \
  BUNDLE_RETRY=3 \
  BUNDLE_GEMFILE=./Gemfile

WORKDIR ${RAILS_ROOT}

COPY . ${RAILS_ROOT}

RUN set -xe; apk update && apk upgrade --no-cache \
  && apk add --no-cache ${BUILD_PKGS} ${DEV_PKGS} ${RUBY_PKGS} \
  && bundle install

FROM ruby:3.2.2-alpine as app

ARG RAILS_ROOT="/app"
ARG RUBY_PKGS="tzdata mariadb-connector-c bash openssl netcat-openbsd shared-mime-info git gcompat"

ENV LANG=C.UTF-8 \
  RUBY_YJIT_ENABLE=1 \
  BUNDLE_JOBS=20 \
  BUNDLE_RETRY=3 \
  BUNDLE_GEMFILE=./Gemfile

RUN set -xe; apk update && apk upgrade --no-cache \
  && apk add --no-cache ${RUBY_PKGS}

WORKDIR ${RAILS_ROOT}

COPY --from=build ${RAILS_ROOT} ${RAILS_ROOT}
COPY --from=build /usr/local/bundle /usr/local/bundle

RUN set -xe; \
      /usr/sbin/adduser -h /home/cage -G root -u 1000 -D -s /bin/bash cage; \
      /bin/mkdir -p ${RAILS_ROOT}/tmp; \
      /bin/chown -R cage:root ${RAILS_ROOT}; \
      find ${RAILS_ROOT} -type d -exec chmod 750 {} \; ; \
      find ${RAILS_ROOT} -type f -exec chmod 640 {} \; ; \
      find ${RAILS_ROOT}/log -type d -exec chmod 770 {} \; ; \
      find ${RAILS_ROOT}/log -type f -exec chmod 660 {} \; ; \
      find ${RAILS_ROOT}/public -type d -exec chmod 755 {} \; ; \
      find ${RAILS_ROOT}/public -type f -exec chmod 644 {} \; ; \
      /bin/chmod 750 ${RAILS_ROOT}/bin/*

USER 1000

CMD ["/usr/local/bin/ruby", "/app/bin/run"]
