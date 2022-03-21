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
echo '---------- Elige el puerto que usara SSL, si no sabes pone 443 ----------'
echo
read -p "Puerto: " PORTS

echo
echo '---------- Pone tu dominio ----------'
echo
sleep 1s
read -p "Dominio: " DOM

cat << EOF > /etc/nginx/sites-available/pterodactyl.conf
server_tokens off;
server {
    listen $PORT;
    server_name $DOM;
    return 301 https://\$server_name\$request_uri;
}
server {
    listen $PORTS ssl http2;
    server_name $DOM;
    root /var/www/pterodactyl/public;
    index index.php;
    access_log /var/log/nginx/pterodactyl.app-access.log;
    error_log  /var/log/nginx/pterodactyl.app-error.log error;
    # allow larger file uploads and longer script runtimes
    client_max_body_size 100m;
    client_body_timeout 120s;
    sendfile off;
    # SSL Configuration
    ssl_certificate /etc/letsencrypt/live/$DOM/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOM/privkey.pem;
    ssl_session_cache shared:SSL:10m;
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers "ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES256-GCM-SHA384:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-CHACHA20-POLY1305:ECDHE-RSA-CHACHA20-POLY1305:DHE-RSA-AES128-GCM-SHA256:DHE-RSA-AES256-GCM-SHA384";
    ssl_prefer_server_ciphers on;
    # See https://hstspreload.org/ before uncommenting the line below.
    # add_header Strict-Transport-Security "max-age=15768000; preload;";
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Robots-Tag none;
    add_header Content-Security-Policy "frame-ancestors 'self'";
    add_header X-Frame-Options DENY;
    add_header Referrer-Policy same-origin;
    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }
    location ~ \.php$ {
        fastcgi_split_path_info ^(.+\.php)(/.+)\$;
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
        include /etc/nginx/fastcgi_params;
    }
    location ~ /\.ht {
        deny all;
    }
}
EOF
ln -s /etc/nginx/sites-available/pterodactyl.conf /etc/nginx/sites-enabled/pterodactyl.conf

ufw allow $PORT/tcp
ufw allow $PORT/udp
ufw allow $PORTS/tcp
ufw allow $PORTS/udp

systemctl restart nginx

exit