FROM ruby

RUN apt-get update && apt-get install -y nodejs npm
RUN npm install -g yarn

RUN mkdir /school-ruby-app

WORKDIR /school-ruby-app