#!/bin/bash

cd payara/
bash build.sh
cd ..

docker-compose up
