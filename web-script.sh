#################################TESTED IN ROCKY LINUX 9#######################################
sudo setenforce permissive
grubby --update-kernel ALL --args selinux=0
sudo dnf install nginx php php-fpm git php-pdo_mysql nano -y
sudo systemctl enable nginx
sudo systemctl start nginx
sudo systemctl enable php-fpm
sudo systemctl start php-fpm
user="nginx"
sed -i "s@user = apache@user = $user@g" /etc/php-fpm.d/www.conf
sed -i "s@group = apache@group = $user@g" /etc/php-fpm.d/www.conf
sudo systemctl restart php-fpm
sudo git clone https://github.com/atlasblue/ims-app.git /code
sudo mv /code/* /usr/share/nginx/html
#Replace x.x.x.x by the DATABASE VM IP
sed -i "s/REPLACE_DB_HOST_ADDRESS/x.x.x.x/g" /usr/share/nginx/html/inc/config/constants.php 
sed -i "s/REPLACE_DB_USER_NAME/root/g" /usr/share/nginx/html/inc/config/constants.php
sed -i "s/REPLACE_DB_PASSWORD//g" /usr/share/nginx/html/inc/config/constants.php
