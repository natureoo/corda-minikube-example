# Corda Minikube Kubernetes

Scripts and configuration to run the [cordapp-example](https://github.com/corda/cordapp-example) on [minikube](https://github.com/kubernetes/minikube).

Follow the steps below to get started.
```
alias kubectl="minikube kubectl --"
./build.sh
./deploy.sh
minikube service party-a
./stop.sh
```

After running `minikube service party-a` Party A's website opens in your 
browser.

Note that you might encounter the "pod unable to reach itself through a
service" [issue](https://github.com/kubernetes/minikube/issues/1568), when 
the webserver attempts to connect to its node. This can be resolved by 
running the following command inside the minikube vm.

```
sudo ip link set docker0 promisc on
```


docker run  -id  --name=network-map-service -e NMS_ROOT_CA_FILE_PATH="" -p 8080:8080 cordite/network-map:latest

#Use docker images
minikube docker-env
eval $(minikube -p minikube docker-env)
minikube image ls --format table


docker build -t corda-os:4.10 . -f ./os/Dockerfile --no-cache


docker run --name corda-os -d corda-os:4.10


docker run --name zulu-openjdk-alpine -d azul/zulu-openjdk-alpine:8u192

docker run -it --rm azul/zulu-openjdk-alpine:8u192 java -version


helm install my-corda -f values.yaml ./

git remote set-url origin https://natureoo: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@github.com/natureoo/corda-minikube-example.git

git remote add origin git@github.com:natureoo/corda-minikube-example.git

git push https://natureoo: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@github.com/natureoo/corda-minikube-example.git

https://repo1.maven.org/maven2/net/corda/corda/4.10/corda-4.10.jar
https://repo1.maven.org/maven2/net/corda/corda/4.10/corda-4.10.jar

https://repo1.maven.org/maven2/net/corda/corda-webserver/4.1/corda-webserver-4.1.jar

minikube image load corda:4.10
minikube image load azul/zulu-openjdk-alpine:8u192
minikube image load cordite/network-map

minikube image rm docker.io/library/corda:4.10

#GKE load docker image
gcloud auth configure-docker europe-west2-docker.pkg.dev

docker push europe-west2-docker.pkg.dev/canvas-hook-339503/corda/corda:4.10



kubectl -n default create configmap corda --from-file=config

kubectl -n default apply -f services/
kubectl -n default apply -f deployments/
kubectl -n default apply -f postgres/
kubectl -n default apply -f volume/


kubectl get configmap

kubectl delete -f services/
kubectl delete -f deployments/
kubectl delete configmap corda
kubectl delete -f postgres/
kubectl delete -f volume/




kubectl logs party-a-66b6b98f84-x8csr --all-containers

kubectl exec -it party-a-6fd574876c-tm4qg  /bin/sh
kubectl exec -it controller-5bc99f9c57-59pvf  /bin/sh

kubectl get event --namespace default --field-selector involvedObject.name=party-a-6dbcc679b9-8ppjl

kubectl logs party-a-6fd574876c-8467v

docker run -id --name=network-map-service -e NMS_ROOT_CA_FILE_PATH="" -p 8080:8080 cordite/network-map:latest

apk upgrade --update && \
apk add --update --no-cache curl && \
rm -rf /var/cache/apk/*


minikube start --no-vtx-check --driver=docker


host.minikube.internal


mkdir certificates && cd certificates

#### 1.3. Register the nodes
- [ ] download the network truststore

    ```bash 
     curl http://34.76.103.90:8080/network-map/truststore -o ./network-truststore.jks
    ```
- [ ] for each node run initial registration

  ```bash
  pushd build/nodes
  for N in */; do
        pushd $N
        java -jar corda.jar --initial-registration --network-root-truststore ./certificates/network-truststore.jks --network-root-truststore-password trustpass
        popd
  done
  popd
  ```

#### 1.5 Designate the notary
- [ ] login to the NMS API and cache the token

  ```bash
  TOKEN=`curl -X POST "http://34.76.103.90:8080/admin/api/login" -H  "accept: text/plain" -H  "Content-Type: application/json" -d "{  \"user\": \"sa\",  \"password\": \"admin\"}"`
  ```


- [ ] Upload the notary

    ```bash
    pushd build/nodes/Notary
    NODEINFO=`ls nodeInfo*`
    curl -X POST -H "Authorization: Bearer $TOKEN" -H "accept: text/plain" -H "Content-Type: application/octet-stream" --data-binary @$NODEINFO http://34.76.103.90:8080/admin/api/notaries/validating
    popd


check notaries
curl http://34.76.103.90:8080/admin/api/notaries

check nodes
curl http://34.76.103.90:8080/admin/api/nodes



>>> docker exec -it CONTAINERID /bin/sh
/app # telnet
/bin/sh: telnet: not found

/app # apk update
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/main/x86_64/APKINDEX.tar.gz
fetch http://dl-cdn.alpinelinux.org/alpine/v3.7/community/x86_64/APKINDEX.tar.gz
v3.7.0-243-gf26e75a186 [http://dl-cdn.alpinelinux.org/alpine/v3.7/main]
v3.7.0-229-g087f28e29d [http://dl-cdn.alpinelinux.org/alpine/v3.7/community]
OK: 9051 distinct packages available

/app # apk add busybox-extras
(1/1) Installing busybox-extras (1.27.2-r11)
Executing busybox-extras-1.27.2-r11.post-install
Executing busybox-1.27.2-r7.trigger
OK: 77 MiB in 64 packages

/app # busybox-extras telnet localhost 6900


kubectl exec party-a-6dbcc679b9-ttbjx -- netstat -tulpn

kubectl exec party-a-6dbcc679b9-ttbjx -- netstat -tulpn | grep "search string"



#postgres
kubectl exec -it postgres-6647979d66-mkf68 sh


psql -U admin postgres


\dt


dataSourceProperties = {
dataSourceClassName = "org.postgresql.ds.PGSimpleDataSource"
dataSource.url = "jdbc:postgresql://postgres:5432/party-a"
dataSource.user = "admin"
dataSource.password = "123456"
}

kubectl get pod party-a-6dbcc679b9-fkrvw --template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'

kubectl port-forward party-a-7979d68b5f-nz6px 20003:10003  2>&1 &

kubectl port-forward party-b-dfbbd8ffc-5tfj4 30003:10003  2>&1 &




java -jar ./corda-shell-4.10.jar --host 127.0.0.1 --port 30003 --user user1 --password test --cordapp-directory /home/feil_zou/corda4/corda-minikube-example/build/cordapps

flow start ExampleFlow$Initiator iouValue: 60, otherParty: "O=PartyA,L=London,C=GB"

run vaultQuery contractStateType: com.example.state.IOUState


flow start ProposalFlow$Initiator isBuyer: true, amount: 10, counterparty: PartyB

run vaultQuery contractStateType: negotiation.states.ProposalState

flow start AcceptanceFlow$Initiator proposalId: "3d5cce7e-538f-4202-adce-b91427600da5"

run vaultQuery contractStateType: negotiation.states.TradeState


if [ ! -z "${VAR}" ]; then
echo "VAR is unset or set to the empty string"
fi

if [ ! -z "${ROLE}" &&  "NOTARY" = ${ROLE} ]; then

fi



gcloud components install kubectl
gcloud components install gke-gcloud-auth-plugin


Verify your cluster has been created and is ready:
gcloud container clusters list  --region europe-west2 --project canvas-hook-339503

Generate a kubeconfig file for accessing the cluster:
gcloud container clusters get-credentials autopilot-cluster-1 --region europe-west2 --project canvas-hook-339503

Retrieve your current kubectl context (this should have been set by the previous gcloud command):
kubectl config current-context

