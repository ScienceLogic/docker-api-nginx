# docker-api-nginx
Docker image to expose the docker API remotely via nginx.
Uses the ipallow rules in nginx to lock the API down to specific hosts that can connect. Use the IPALLOW environment variable with comma separated ip addresses

### Use

To start the API with the rules wide open:
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --restart=always -p 2375:80 sciencelogic/docker-api-nginx
```

To start the API only allowing specific hosts to connect:
```
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --restart=always -p 2375:80 -e "IPALLOW=10.10.10.10,10.10.10.11" sciencelogic/docker-api-nginx
```
