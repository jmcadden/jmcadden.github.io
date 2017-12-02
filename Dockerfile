FROM starefossen/ruby-node:2-6-alpine

ENV GITHUB_GEM_VERSION 172
ENV JSON_GEM_VERSION 1.8.6

RUN apk --update add cmake
RUN apk --update add --virtual alpine-sdk ruby-dev \
  && gem update bundler \
  && gem install --verbose --no-document \
    json:${JSON_GEM_VERSION} \
    github-pages:${GITHUB_GEM_VERSION} \
    jekyll-github-metadata \
    minitest \
  && mkdir -p /usr/src/app \
  && rm -rf /usr/lib/ruby/gems/*/cache/*.gem


WORKDIR /usr/src/app

EXPOSE 4000 80
CMD bundle update && bundle install && jekyll serve -d /_site --watch --force_polling -H 0.0.0.0 -P 4000