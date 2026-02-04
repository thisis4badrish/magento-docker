FROM php:8.2-fpm

RUN apt-get update && apt-get install -y \
    libzip-dev \
    libicu-dev \
    libxml2-dev \
    libxslt-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libsodium-dev \
    unzip \
    git \
    curl \
    vim \
    cron \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        bcmath \
        intl \
        pdo_mysql \
        soap \
        sockets \
        xsl \
        zip \
        gd \
        ftp \
    && docker-php-ext-enable opcache \
    && rm -rf /var/lib/apt/lists/*

# Magento PHP requirements
RUN echo "memory_limit=2G" > /usr/local/etc/php/conf.d/memory.ini \
 && echo "max_execution_time=1800" > /usr/local/etc/php/conf.d/time.ini \
 && echo "realpath_cache_size=10M" > /usr/local/etc/php/conf.d/realpath.ini \
 && echo "realpath_cache_ttl=7200" >> /usr/local/etc/php/conf.d/realpath.ini

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer


# Create a non-root user to avoid permission issues (fixes 'I have no name!')
RUN useradd -u 1000 -m -s /bin/bash magento

# Switch to magento user
USER magento


WORKDIR /var/www/html
