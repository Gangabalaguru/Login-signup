FROM php:8.2-apache

# Install system packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev \
    libssl-dev \
    pkg-config

# Fix Apache MPM conflict
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2enmod mpm_prefork

# Install PHP extensions
RUN docker-php-ext-install mysqli

# Install MongoDB extension
RUN pecl install mongodb \
 && docker-php-ext-enable mongodb

# Install Redis extension
RUN pecl install redis \
 && docker-php-ext-enable redis

# Enable rewrite module
RUN a2enmod rewrite

# Copy project files
COPY . /var/www/html/

# Install composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install composer dependencies safely
RUN composer install --no-interaction --no-dev || true

EXPOSE 80