#!/bin/bash
set -eux
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>${web_page_title} - ${vm_name}</h1>" > /var/www/html/index.html
