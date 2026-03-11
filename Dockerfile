FROM php:8.2-apache

# Install packages
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libzip-dev

# Fix Apache MPM conflict (disable all then enable one)
RUN a2dismod mpm_event || true \
 && a2dismod mpm_worker || true \
 && a2dismod mpm_prefork || true \
 && a2enmod mpm_prefork

# Install PHP extensions
RUN docker-php-ext-install mysqli

# Install MongoDB + Redis extensions
RUN pecl install mongodb redis \
    && docker-php-ext-enable mongodb redis

# Enable rewrite module
RUN a2enmod rewrite

# Copy project
COPY . /var/www/html/

WORKDIR /var/www/html

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN composer install --no-interaction --optimize-autoloader

EXPOSE 80

CMD ["apache2-foreground"]
