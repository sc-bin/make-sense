#!/bin/bash

PORT="3001"

# Build Docker Image
docker build -t make-sense - <<EOF
FROM node:16.16.0

RUN apt-get update && apt-get -y install git && rm -rf /var/lib/apt/lists/*

WORKDIR /make-sense

ENTRYPOINT ["npm", "run", "dev"]
EOF

# Run Docker Image as Service with volume mapping
docker run -it -p ${PORT}:3000 --name=make-sense --rm -v $(pwd):/make-sense make-sense

# Get Docker Container Logs
docker logs make-sense
