FROM ruby:2.4.1-slim


RUN apt-get update -qq && \
	apt-get install -y \
	build-essential \
	nodejs \
	libpq-dev \
	libqt5webkit5-dev \
	qt5-default \
	xvfb

# Copy project src to container
COPY Gemfile /app/
COPY Gemfile.lock /app/

# Set /app as workdir
WORKDIR /app

# Install dependencies
RUN bundle install
