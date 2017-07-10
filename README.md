# docker-api-nginx
Docker image to expose the docker API remotely via nginx. Adds ipallow rules in nginx to lock the API down to specific hosts that can connect

### Use

To start the API with the rules wide open:
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --restart=always -p 2375:80 repository.auto.sciencelogic.local:5000/docker-api-nginx
```

To start the API only allowing specific hosts to connect:
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --restart=always -p 2375:80 -e "IPALLOW=10.2.252.211,10.2.252.212,10.2.252.213" repository.auto.sciencelogic.local:5000/docker-api-nginx
```
