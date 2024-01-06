# installing nginx
sudo apt update
sudo apt install nginx
cd /var/www
sudo mkdir tutorial
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
       listen 80;
       listen [::]:80;

       server_name example.ubuntu.com;

       root /var/www/tutorial;
       index index.html;

       location / {
               try_files $uri $uri/ =404;
       }
}
EOF