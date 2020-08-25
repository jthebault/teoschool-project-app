FROM node:14.5.0 as compile-image

RUN npm uninstall -g angular-cli @angular/cli
RUN npm cache clean -f
RUN npm install -g @angular/cli@8.0.3
RUN mkdir application
COPY . application/
WORKDIR application
RUN ls
RUN npm version
RUN npm install --save-dev @angular/cli@8.0.3
RUN rm package-lock.json
RUN npm install
RUN ng version
RUN npm version
RUN ls
RUN ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
RUN ls
#ENTRYPOINT ["docker-entrypoint.sh", "localhost","9966"]

FROM nginx
#COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf
RUN mkdir /usr/share/nginx/html/petclinic
#RUN ls
#RUN cat /etc/nginx/nginx.conf
#RUN cat nginx.conf >> /etc/nginx/nginx.conf
#RUN cat /etc/nginx/nginx.conf
#COPY nginx.conf /etc/nginx/
COPY --from=compile-image /application/dist/ /usr/share/nginx/html/petclinic/
COPY --from=compile-image /application/fullconfignginx.conf /
RUN rm /etc/nginx/nginx.conf
RUN mv fullconfignginx.conf /etc/nginx/nginx.conf
#RUN cat nginx.conf >> /etc/nginx/nginx.conf
RUN cat /etc/nginx/nginx.conf
RUN mkdir scripts
COPY --from=compile-image /application/docker-entrypoint.sh /scripts
RUN chmod 777 /scripts/docker-entrypoint.sh
RUN /scripts/docker-entrypoint.sh
RUN cat /etc/nginx/nginx.conf
#RUN rm docker-entrypoint.sh
#RUN nginx -s reload
