FROM nginx:alpine
MAINTAINER DevOps at ScienceLogic
RUN apk update && apk add bash
RUN rm /etc/nginx/conf.d/default.conf
COPY entry.sh /entry.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY ip-rules.conf /etc/nginx/conf.d/ip-rules.conf
COPY docker-api.conf /etc/nginx/conf.d/docker-api.conf
ENTRYPOINT ["/entry.sh"]
CMD ["nginx", "-g", "daemon off;"]
