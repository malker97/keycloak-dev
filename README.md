swich to root
```bash
sudo -s
```
update apt package list
```bash
apt update
apt upgrade
```
install nginx ,certbot, and certbot plugin for nginx
```bash
apt install nginx certbot python3-certbot-nginx
```
check nginx status
```bash
systemctl status nginx
```
if nginx is not active, start nginx
```bash
systemctl start nginx
```
check nginx status again
```bash
systemctl status nginx
```
visit your domain name in browser, you should see the default nginx page
If u can't see the default nginx page, check your firewall setting
```bash
ufw status
```
use certbot to get ssl certificate
```bash
certbot --nginx -d <your_domain_name>
certbot renew --dry-run
```
unlink default nginx config file
```bash
unlink /etc/nginx/sites-enabled/default
```
create new nginx config file
```bash
vim /etc/nginx/sites-available/<your_domain_name>.conf
```

link new nginx config file
```bash
ln -s /etc/nginx/sites-available/<your_domain_name>.conf /etc/nginx/sites-enabled/<your_domain_name>.conf
```
test nginx config file
```bash
nginx -t
```
reload or restart nginx
```bash
systemctl restart nginx
```
install docker and docker-compose
```bash
apt install docker.io docker-compose
```
up docker-compose
```bash
docker-compose up -d
```