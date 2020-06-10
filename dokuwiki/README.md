Joomla
======

## Docker 이미지 종류

* https://hub.docker.com/r/bitnami/dokuwiki
  https://github.com/bitnami/bitnami-docker-dokuwiki
* https://hub.docker.com/r/linuxserver/dokuwiki
  https://github.com/linuxserver/docker-dokuwiki
* https://hub.docker.com/r/mprasil/dokuwiki
  https://bitbucket.com/mprasil/docker_dokuwiki

## install

linuxserver는 초기 설치가 자동으로 안된다.
volume을 잡아버리면 실행이 안되서 초기 파일은 넣어줘야한다.
초기 파일을 bitnami 컨테이너로 생성해도 되지만
여기서는 dokuwiki-install에서 생성해서 dokuwiki에 복사하는걸로

```
docker exec -it dokuwiki_dokuwiki-install_1 cp -r /config/dokuwiki /install/
```

## 주의사항

* 웹에서 설치하는게 좋음
* DB없이 파일로 저장함
* bitnami는 초기화 스크립트 때문에 오류나는 경우가 많아서 운영은 linuxserver이용

## 볼륨 경로

### linuxserver/dokuwiki

```
/config/dokuwiki/conf
/config/dokuwiki/data
/config/dokuwiki/lib
```

### bitnami/dokuwiki

```
/bitnami
```
