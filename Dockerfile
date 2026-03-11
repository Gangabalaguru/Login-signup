FROM php:8.2-apache

# Install required system packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    && docker-php-ext-install mysqli

# Install MongoDB and Redis PHP extensions
RUN pecl install mongodb redis \
    && docker-php-ext-enable mongodb redis

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Copy project
COPY . /var/www/html/

WORKDIR /var/www/html

# Install dependencies
RUN composer install

EXPOSE 80