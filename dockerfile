FROM ubuntu:18.04
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt update -y
RUN apt update -y && apt install wget nano unzip apache2 -y
RUN apt update -y && apt install -y php php-apcu php-imap php-intl php-cli php-fpm php-json php-common php-mysql php-zip php-gd php-mbstring php-curl php-xml php-pear php-bcmath
RUN cd /var/www/html/ && wget https://bppk.info/schedule/osTicket-1-15.zip && unzip osTicket-1-15.zip && rm -rf osTicket-1-15.zip && unzip osTicket-v1.15.8.zip && rm -rf osTicket-v1.15.8.zip
RUN cd /var/www/html/ && mv -f upload/* /var/www/html/
RUN cd /var/www/html && cp include/ost-sampleconfig.php include/ost-config.php && chmod 0666 include/ost-config.php && rm -rf index.html
RUN cp /var/www/html/ru.phar /var/www/html/include/i18n/
RUN mkdir /key
RUN a2enmod ssl
RUN service apache2 start
