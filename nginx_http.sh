#!/bin/bash
rm /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-enabled/pterodactyl.conf
systemctl stop apache2
systemctl stop nginx
killall apache2
killall nginx

echo
echo '---------- Elige el puerto que usara el servidor web nginx, si no sabes pone 80 ----------'
echo
read -p "Puerto: " PORT

echo
echo '---------- Pone tu dominio si no tienes dominio pone 0.0.0.0 ----------'
echo
sleep 1s
read -p "Dominio: " DOM

cat << EOF > /etc/nginx/sites-available/pterodactyl.conf
server {
    listen $PORT;
    server_name $DOM;

    root /var/www/pterodactyl/public;
    index index.html index.htm index.php;
    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log off;
    error_log  /var/log/nginx/pterodactyl.app-error.log error;

    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;

    sendfile off;

    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/run/php/php8.0-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param PHP_VALUE "upload_max_filesize = 100M \n post_max_size=100M";
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param HTTP_PROXY "";
        fastcgi_intercept_errors off;
        fastcgi_buffer_size 16k;
        fastcgi_buffers 4 16k;
        fastcgi_connect_timeout 300;
        fastcgi_send_timeout 300;
        fastcgi_read_timeout 300;
    }

    location ~ /\.ht {
        deny all;
    }
}
EOF
ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf

ufw allow $PORT/tcp
ufw allow $PORT/udp

systemctl restart nginx

exit