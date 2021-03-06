FROM node:alpine AS builder
COPY . ./frontend
WORKDIR /frontend

RUN npm i
RUN $(npm bin)/ng build --prod --build-optimizer=false --aot=false

FROM nginx:alpine
COPY --from=builder /frontend/dist/webclient/ /usr/share/nginx/html/