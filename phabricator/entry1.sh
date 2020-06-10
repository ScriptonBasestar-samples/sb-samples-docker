#!/bin/bash

sed -i 's/"storage.default-namespace": "bitnami_phabricator",/"storage.default-namespace": "phabricator",/g' /opt/bitnami/phabricator/conf/local/local.json
