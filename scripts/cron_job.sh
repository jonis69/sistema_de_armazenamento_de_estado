#!/bin/sh

DIRNAME=$(pwd)
cd ${DIRNAME}

sudo crontab -l > cron_bkp
sudo echo "*/2 7-23 * * * sudo /usr/bin/sh /var/www/scripts/gerar_log.sh" >> cron_bkp
sudo echo "*/2 23 * * * sudo /usr/bin/sh /var/www/scripts/gerar_log.sh" >> cron_bkp
sudo echo "*/1 0-6 * * * sudo /usr/bin/sh /var/www/scripts/gerar_html_manutencao.sh" >> cron_bkp
sudo crontab cron_bkp
sudo rm cron_bkp
