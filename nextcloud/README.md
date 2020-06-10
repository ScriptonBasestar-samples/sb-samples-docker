Wordpress
=========

## Docker 이미지 종류

* https://hub.docker.com/_/nextcloud
  https://github.com/nextcloud/docker
* https://hub.docker.com/r/linuxserver/nextcloud
  https://github.com/linuxserver/docker-nextcloud

## 문제

dc-my 안됨. mysql transaction isolation level을 조절해야된다는 것 같은데 pg쓸거라서

## 볼륨 경로

### nextcloud

```
/var/www/html/data
/var/www/html/config
/var/www/html/custom_apps
/var/www/html/apps
/var/www/html/themes
```

### linuxserver/nextcloud

```
/data
/config
```
