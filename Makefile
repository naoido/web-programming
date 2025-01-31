apply:
	kubectl create configmap mysql-init-sql --from-file=./k8s/db/init.sql || true
	kubectl apply -f k8s/manifests/

delete:
	kubectl delete deployments,services,configmap --all

push:
	docker build -t naoido/java-fortune-tomcat .
	docker push naoido/java-fortune-tomcat:latest

url:
	minikube service java-fortune-tomcat-service --url

status:
	kubectl get pods,services,deployments,configmap

logs:
	kubectl logs -l app=java-fortune --tail 100
