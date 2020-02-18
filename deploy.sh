docker build -t mcleanmusa/multi-client:latest -t mcleanmusa/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mcleanmusa/multi-server:latest -t mcleanmusa/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mcleanmusa/multi-worker:latest -t mcleanmusa/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push mcleanmusa/multi-client
docker push mcleanmusa/multi-server
docker push mcleanmusa/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployments
