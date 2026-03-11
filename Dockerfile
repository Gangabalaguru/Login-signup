FROM php:8.2-apache

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev

# Install PHP extensions
RUN docker-php-ext-install mysqli

# Install MongoDB and Redis extensions
RUN pecl install mongodb redis \
    && docker-php-ext-enable mongodb redis

# Fix Apache MPM conflict
RUN a2dismod mpm_event
RUN a2enmod mpm_prefork

# Enable rewrite
RUN a2enmod rewrite

# Copy project
COPY . /var/www/html/

WORKDIR /var/www/html

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-interaction --optimize-autoloader

EXPOSE 80

CMD ["apache2-foreground"]