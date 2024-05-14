FROM php:8.1.0-apache
WORKDIR /var/www/html

#Mod Rewrite

RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y libicu-dev unzip zip

#Installing apache in non-interactive mode
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get install apache2 -y

#Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install gettext intl pdo_mysql
EXPOSE 80

CMD ["apachectl", "-D", "FOREGROUND"]
