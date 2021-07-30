#!/usr/bin/env bash
mvn clean package && docker build -t ICICI/ICICI_FS .
docker rm -f ICICI_FS || true && docker run -d -p 8080:8080 -p 9990:9990 --name ICICI_FS ICICI/ICICI_FS
