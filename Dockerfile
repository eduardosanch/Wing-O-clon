FROM ghcr.io/cirruslabs/flutter:stable

WORKDIR /app

COPY . .

RUN flutter pub get
RUN flutter build web

FROM nginx:alpine

COPY --from=0 /app/build/web /usr/share/nginx/html

EXPOSE 80