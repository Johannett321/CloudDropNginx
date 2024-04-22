# installing nginx
echo "Updating..."
apt-get update
echo "Update success!"

echo "Installing nginx..."
apt-get install nginx -y
echo "Nginx installed!"

# setting up a virtual host
cd /etc/nginx/sites-enabled
cat <<EOF > default
server {
       listen <#! Website Port !#>;
       listen [::]:<#! Website Port !#>;

       root <#! Website path !#>;
       index index.html;

       location / {
               try_files \$uri \$uri/ =404;
       }
}
EOF

echo "Directories and files created"

echo "Installing systemctl..."
apt-get install systemctl -y
echo "Systemctl installed!"

echo "Starting NGINX..."
systemctl start nginx
echo "Nginx started!"
