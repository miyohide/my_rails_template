FROM ruby:3.1.2

WORKDIR /app

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get update && apt-get install -y \
      git \
      nodejs \
      vim

RUN npm install -g yarn
