#!/bin/bash
docker build -t haowenxu/hexo-compiler "$@" . && docker push haowenxu/hexo-compiler
