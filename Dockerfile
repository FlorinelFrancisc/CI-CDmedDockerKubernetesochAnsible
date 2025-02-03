
FROM nginx:stable 

COPY index.html /usr/share/nginx/html/index.html

EXPOSE 81

CMD ["nginx", "-g", "daemon off;"]
