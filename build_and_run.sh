#!/bin/bash

cd server && docker build -t local-wptserver .
cd ..
cd agent && docker build -t local-wptagent .

docker run -d -p 4000:80 --name local-wptserver local-wptserver
docker run -d -p 4001:80 --name local-wptagent --network="host" -e "SERVER_URL=http://localhost:4000/work/" -e "LOCATION=Test" local-wptagent
