FROM ruby:3.2.2

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler:2.2.27
RUN bundle install
RUN rails tailwindcss:install

COPY . .

EXPOSE 3000

CMD ["bin/dev"]
