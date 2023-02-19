FROM node:18.14.1 as node
FROM ruby:3.2.1

ENV YARN_VERSION=1.22.19
ENV RAILS_ENV=production
RUN mkdir -p /opt

COPY --from=node /opt/yarn-v$YARN_VERSION /opt/yarn
COPY --from=node /usr/local/bin/node /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules/ /usr/local/lib/node_modules/
RUN ln -s /opt/yarn/bin/yarn /usr/local/bin/yarn \
  && ln -s /opt/yarn/bin/yarn /usr/local/bin/yarnpkg \
  && ln -s /usr/local/bin/node /usr/local/bin/nodejs \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npm \
  && ln -s /usr/local/lib/node_modules/npm/bin/npm-cli.js /usr/local/bin/npx

WORKDIR /app

RUN apt-get update && apt-get install -y \
      sqlite3

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install --jobs=4

COPY package.json /app/package.json
COPY yarn.lock /app/yarn.lock

RUN yarn install --frozen-lockfile

COPY . /app/

RUN --mount=type=secret,id=master_key,dst=config/master.key,required \
    /app/bin/rails assets:precompile

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "/app/bin/rails", "server", "-b", "0.0.0.0" ]
