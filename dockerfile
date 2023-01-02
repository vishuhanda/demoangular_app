FROM node:latest as node
LABEL org.opencontainers.image.source="https://github.com/vishuhanda/demoangular_app"
WORKDIR /angularapp
COPY . .
RUN npm install
RUN npm run build --prod



FROM nginx:latest as nginx
COPY --from=node /angularapp/dist/angulardemoproject /usr/share/nginx/html
