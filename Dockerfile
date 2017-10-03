FROM nginx:alpine
LABEL BUILD_NUM="0.0.3"
MAINTAINER DevOps at ScienceLogic
RUN apk update && apk add bash
RUN rm /etc/nginx/conf.d/default.conf
COPY entry.sh /entry.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY ip-rules.conf /etc/nginx/conf.d/ip-rules.conf
ENTRYPOINT ["/entry.sh"]
CMD ["nginx", "-g", "daemon off;"]
