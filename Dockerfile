FROM nginx

COPY nginx.conf /etc/nginx/nginx.conf
COPY vhosts/* /etc/nginx/conf.d/
COPY public /public

