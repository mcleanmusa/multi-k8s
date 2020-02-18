docker build -t mcleanmusa/multi-client:latest -t mcleanmusa/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t mcleanmusa/multi-server:latest -t mcleanmusa/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t mcleanmusa/multi-worker:latest -t mcleanmusa/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push mcleanmusa/multi-client:latest
docker push mcleanmusa/multi-server:latest
docker push mcleanmusa/multi-worker:latest

docker push mcleanmusa/multi-client:$SHA
docker push mcleanmusa/multi-server:$SHA
docker push mcleanmusa/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=mcleanmusa/multi-client:$SHA
kubectl set image deployments/server-deployment server=mcleanmusa/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=mcleanmusa/multi-worker:$SHA
