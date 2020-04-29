FROM nginx:stable-alpine 
#COPY --from=build-stage /app/dist /usr/share/nginx/html
#COPY ./dist /usr/share/nginx/html
COPY ./config/nginx /etc/nginx/conf.d
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

