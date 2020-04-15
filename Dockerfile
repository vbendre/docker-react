FROM node:alpine 
#FROM node:alpine as builder removed phase since it is causing build issues in AWS beanstalk

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx
#EXPOSE 80
#COPY --from=builder /app/build /usr/share/nginx/html removed phase name and using integer value
COPY --from=0 /app/build /usr/share/nginx/html