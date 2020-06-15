Wordpress
=========

## Docker 이미지 종류

* https://hub.docker.com/_/redis/
  https://github.com/docker-library/redis
  https://github.com/docker-library/docs/tree/master/redis
* https://hub.docker.com/r/bitnami/redis
  https://github.com/bitnami/bitnami-docker-redis

## 볼륨 경로

### redis

```
/var/www/html/wp-content
redis.conf /usr/local/etc/redis/redis.conf
```

### bitnami/redis

```
/opt/bitnami/redis/certs
/bitnami/redis/data
/opt/bitnami/redis/mounted-etc/redis.conf
```

## 사용법

### Certs

```bash
# https://docs.redislabs.com/latest/rs/administering/cluster-operations/updating-certificates/

rladmin cluster certificate set <cert-name> certificate_file <cert-file-name>.pem key_file <key-file-name>.pem

docker run --rm -v $(pwd)/certs:/opt/bitnami/redis/certs redislabs/redis rladmin cluster certificate set tmpcert certificate_file tmpcert.pem key_file tmpkey.pem

```

생성 cli
```
openssl genrsa -out /etc/stunnel/key.pem 4096
openssl req -new -x509 -key /etc/stunnel/key.pem -out /etc/stunnel/cert.pem -days 1826
```

http://tgrall.github.io/blog/2020/01/02/how-to-use-ssl-slash-tls-with-redis-enterprise/

https://redis.io/topics/encryption

https://github.com/bitnami/bitnami-docker-redis-sentinel

https://docs.redislabs.com/latest/rs/administering/designing-production/security/tls-configuration/

https://docs.redislabs.com/latest/rs/administering/cluster-operations/updating-certificates/

https://www.letmecompile.com/certificate-file-format-extensions-comparison/



vpn ldap

https://medium.com/chequer/%ED%95%9C%EB%8B%AC-%EB%A7%8C%EC%9B%90%EC%9C%BC%EB%A1%9C-vpn-%EA%B5%AC%EC%B6%95%ED%95%98%EA%B8%B0-softether-vpn-openldap-freeradius-9c629f923eb0

OPENSSL key pair
```
## RSA  key pair(public, private key) 생성
openssl genrsa -aes256 -out redis.key 2048
## pass phrase 제거
cp redis.key redis.key.enc
openssl rsa -in redis.key.enc -out redis.key
chmod 600 redis.key*
## CSR 생성
openssl req -new -key redis.key -out redis.csr

chown 1001:1001 -R certs/
```
