Mediawiki
=========

## Docker 이미지 종류

* https://hub.docker.com/r/bitnami/phabricator
  https://github.com/bitnami/bitnami-docker-phabricator

## 주의사항

mysql 스키마를 수십개 생성해서 디비를 별도로 사용해야한다

bitnami이미지는 bitnami_ prefix가 붙는 문제

/opt/bitnami/phabricator/conf/local/local.json
```
{
  "diffusion.ssh-port": 22,
  "diffusion.ssh-user": "git",
  "phd.user": "phabricator",
  "phabricator.base-uri": "https://127.0.0.1",
  "diffusion.allow-git-lfs": false,
  "config.ignore-issues": {
    "mysql.mode": true,
    "mysql.ft_stopword_file": true,
    "mysql.ft_min_word_len": true,
    "mysql.innodb_buffer_pool_size": true,
    "mysql.utf8mb4": true,
    "extension.apc.stat-enabled": true,
    "mysql.ft_boolean_syntax": true,
    "mysql.max_allowed_packet": true,
    "pygments.noenabled": true,
    "extension.apcu": true,
    "security.security.alternate-file-domain": true
  },
  "security.hmac-key": "4b2woUAet1Ke5YnvzrcPVlfdFwHoG6b599uhtvkxUhRT",
  "mysql.pass": "5SXBlbW5WE",
  "storage.mysql-engine.max-size": 0,
  "storage.default-namespace": "bitnami_phabricator",
  "mysql.user": "bn_phabricator",
  "mysql.port": "3306",
  "mysql.host": "db",
  "environment.append-paths": [
    "/opt/bitnami/git/bin"
  ],
  "repository.default-local-path": "/opt/bitnami/phabricator/repo",
  "storage.local-disk.path": "/opt/bitnami/phabricator/data",
  "phd.log-directory": "/opt/bitnami/phabricator/tmp/phd/log"
}
```
storage.default-namespace 이걸 빼먹어놔서 수동으로 변경필요

bitnami docker에서 보면
/2020/debian-10/rootfs/phabricator-inputs.json
```
{
  "alternateFileDomain": "{{$global.env.PHABRICATOR_ALTERNATE_FILE_DOMAIN}}",
  "databaseAdminPassword": "{{$global.env.MARIADB_PASSWORD}}",
  "databaseAdminUser": "{{$global.env.MARIADB_USER}}",
  "databaseServerHost": "{{$global.env.MARIADB_HOST}}",
  "databaseServerPort": "{{$global.env.MARIADB_PORT_NUMBER}}",
  "email": "{{$global.env.PHABRICATOR_EMAIL}}",
  "enableGitSSHRepository": "{{$global.env.PHABRICATOR_ENABLE_GIT_SSH_REPOSITORY}}",
  "firstName": "{{$global.env.PHABRICATOR_FIRSTNAME}}",
  "host": "{{$global.env.PHABRICATOR_HOST}}",
  "lastName": "{{$global.env.PHABRICATOR_LASTNAME}}",
  "password": "{{$global.env.PHABRICATOR_PASSWORD}}",
  "phpMemoryLimit": "{{$global.env.PHP_MEMORY_LIMIT}}",
  "smtpHost": "{{$global.env.SMTP_HOST}}",
  "smtpPassword": "{{$global.env.SMTP_PASSWORD}}",
  "smtpPort": "{{$global.env.SMTP_PORT}}",
  "smtpProtocol": "{{$global.env.SMTP_PROTOCOL}}",
  "smtpUser": "{{$global.env.SMTP_USER}}",
  "sshServerPort": "{{$global.env.PHABRICATOR_SSH_PORT_NUMBER}}",
  "useLFS": "{{$global.env.PHABRICATOR_USE_LFS}}",
  "username": "{{$global.env.PHABRICATOR_USERNAME}}"
}
```
이걸 추가 해 줘도 될 것 같지만 확인은 안 해 봣다.`"databaseSchemaPrefix": "{{$global.env.MARIADB_PREFIX}}",`
어디서 이 값이 사용되는지 확인을 못해서


자동으로 http -> https redirect가 되는데 설정문제.. 이미지가 완벽하지 않음

## 볼륨 경로

### bitnami/phabricator

```
/bitnami
```

## 사용법

```
docker-compose up

docker system prune --force --volumes
```