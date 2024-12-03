#################################TESTED IN ROCKY LINUX 9#################
sudo setenforce permissive
grubby --update-kernel ALL --args selinux=0
sudo dnf install mariadb mariadb-server git nano -y 
sudo systemctl enable mariadb
sudo systemctl start mariadb
sudo git clone https://github.com/atlasblue/ims-app.git /code
sudo mysqladmin -u root create shop_inventory
sudo mysql -u root shop_inventory < /code/inc/config/shop_inventory.sql
sudo echo "CREATE USER 'root'@'%' IDENTIFIED BY '';" | sudo mysql
sudo echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';" | sudo mysql
