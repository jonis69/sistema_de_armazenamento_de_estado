#! /bin/bash
configurar_apache () {

sudo mkdir -p /var/www/atividade.info/html

sudo chown -R $USER:$USER /var/www/atividade.info/html

sudo chmod -R 755 /var/www/atividade.info

echo "
<VirtualHost *:80>
    ServerAdmin admin@atividade.info
    ServerName atividade.info
    ServerAlias www.atividade.info
    DocumentRoot /var/www/atividade.info/html
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/acess.log combined
</VirtualHost>
" > /etc/apache2/sites-available/atividade.info.conf

sudo a2ensite atividade.info.conf

sudo a2dissite 000-default.conf

sudo systemctl restart apache2

sudo systemctl reload apache2

echo "127.0.0.5"    atividade.info >> /etc/hosts
}

rodar_scripts () {
sudo mv scripts /var/www/
sudo mv img /var/www/atividade.info/html

sudo sh /var/www/scripts/cron_job.sh
}

configurar_apache
rodar_scripts
