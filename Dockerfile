# Create temporary node container
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Create new nginx container and copy over results of 
# node container build
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html

