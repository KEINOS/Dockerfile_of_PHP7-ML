FROM keinos/php7-composer-alpine:latest

# Add Composer's global bin path
ENV PATH="~/.composer/vendor/bin:$PATH"

# Ensure www-data user exists
RUN set -x \
	&& addgroup -g 82 -S www-data \
	&& adduser -u 82 -D -S -G www-data www-data \
    && ln -s /home/www-data /app

USER www-data
WORKDIR /app

# Install composer
RUN \
    cd /app && \
    composer require php-ai/php-ml
