#!/bin/bash
set -eux
dnf install -y nginx || yum install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>${web_page_title} - ${vm_name}</h1>" > /usr/share/nginx/html/index.html
