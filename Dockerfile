
FROM php:8.2-apache

# Install PHP extensions for MySQL
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache URL rewriting
RUN a2enmod rewrite

# Set the website directory
WORKDIR /var/www/html

# Copy your project files into the container
COPY . /var/www/html/

# Set file permissions
RUN chown -R www-data:www-data /var/www/html

# Expose the web server port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
