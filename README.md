# sb-samples-websolution
도커 - 웹 솔루션

필요할 때 쓰려고 정리

volume은 /bitnami나 /var/www/html처럼 범위가 과도하게 넓게 잡힌 경우가 있는데
제대로 파악이 안되서 그냥 넓게 잡아놨다.
사용할 때 줄여서 써야된다.

일반적으로 `plugins, config, contents, uploads, themes` 등등의 항목

bitnami 이미지가 초기 구성은 쉬운 경향이 있는데
이미지에 따라서 백업 리스토어 할 때 스크립트 때문에 오류가 나는 경우가 종종 있다.
