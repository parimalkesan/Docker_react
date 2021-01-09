FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build has all the build files we need

FROM nginx
#only used whole deployment to beanstalk to specify port mapping- EXPOSE 80
COPY --from=0 /app/build usr/share/nginx/html