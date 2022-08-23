# StartBootstrap - sb-admin

## Install Apache

```
wget https://github.com/StartBootstrap/startbootstrap-sb-admin-2/archive/refs/tags/v4.1.4.tar.gz
```
> get_url

```
tar xf v4.1.4.tar.gz
```
> unarchive

```
sudo mkdir -p /var/www/html
```
> file

```
sudo cp -r startbootstrap-sb-admin-2-4.1.4/* /var/www/html
```
> copy

```
sudo apt upate
```
> apt

```
sudo apt install apache2 -y
```
> apt

```
sudo systemctl start apache2
```
> service

```
sudo systemctl enable apache2
```
> service

## Remove Apache

```
sudo apt autoremove -y apache2
```

```
sudo rm -rf /var/www/html
```

```
rm v4.1.4.tar.gz
```

```
rm -rf startbootstrap-sb-admin-2-4.1.4/
```

## Ansible Ad-hoc Command

```
ansible mgmt -m git -a "repo=https://github.com/StartBootstrap/startbootstrap-sb-admin-2.git dest=/var/www/html version=v4.1.4" -b
```
또는
```
ansible mgmt -m get_url -a 'dest=/tmp url=https://github.com/StartBootstrap/startbootstrap-sb-admin-2/archive/refs/tags/v4.1.4.tar.gz'
```

```
ansible mgmt -m file -a 'path=/var/www/html state=directory' -b
```

```
ansible mgmt -m unarchive -a 'src=/tmp/startbootstrap-sb-admin-2-4.1.4.tar.gz remote_src=true dest=/var/www/html' -b
```

```
ansible mgmt -m apt -a 'name=apache2 state=present update_cache=true' -b
```

```
ansible mgmt -m service -a 'name=apache2 state=started enabled=true' -b
```
