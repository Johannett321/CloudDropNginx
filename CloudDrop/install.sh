# installing nginx
echo "Updating..."
apt-get update
echo "Update success!"

echo "Installing nginx..."
apt-get install nginx -y
echo "Nginx installed!"

echo "Creating directories and files"
cd /var/www
mkdir tutorial
cd tutorial

# creating a test site
cat <<EOF > index.html
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Hello, Nginx!</title>
</head>
<body>
    <h1>Hello, Nginx!</h1>
    <p>We have just configured our Nginx web server on Ubuntu Server!</p>
</body>
</html>
EOF

# setting up a virtual host
cd /etc/nginx/sites-enabled
cat <<EOF > tutorial
server {
       listen <#! Website Port !#>;
       listen [::]:<#! Website Port !#>;

       root /var/www/tutorial;
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
