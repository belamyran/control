FROM redocly/cli  AS build

WORKDIR /app

COPY openapi.yaml .

RUN redocly build-docs openapi.yaml -o index.html

FROM nginx:alpine

COPY --from=build /app/index.html /usr/share/nginx/html/index.html

EXPOSE 80