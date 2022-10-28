#!/bin/bash

echo "Criando as imagens..."

docker build -t rnrneves/projeto-k8s-backend:1.0 backend/.
docker build -t rnrneves/projeto-k8s-database:1.0 database/.

echo "Realizando o push para o DockerHub..."

docker push rnrneves/projeto-k8s-backend:1.0
docker push rnrneves/projeto-k8s-database:1.0

echo "Criando os serviços no cluster..."

kubectl apply -f ./services.yaml

echo "Realizando o deploy no cluster..."

kubectl apply -f ./deployment.yaml

