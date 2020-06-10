#!/bin/bash

sed -i 's/"storage.default-namespace": "bitnami_phabricator",/"storage.default-namespace": "phabricator",/g' /opt/bitnami/phabricator/conf/local/local.json
sed -i 's/"phabricator.base-uri": "https://127.0.0.1",/"phabricator.base-uri": "http://127.0.0.1:8080",/g' /opt/bitnami/phabricator/conf/local/local.json

  