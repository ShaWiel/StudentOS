FROM node:22-alpine

RUN apk add --no-cache unzip patch
WORKDIR /app

COPY StudentOS_360_v18_Connected.zip /tmp/studentos.zip
RUN unzip /tmp/studentos.zip -d /app \
    && rm /tmp/studentos.zip

COPY studentos_v20_consolidated.patch.gz.b64 /tmp/studentos_v20.patch.gz
RUN gzip -dc /tmp/studentos_v20.patch.gz > /tmp/studentos_v20.patch \
    && patch -p1 -d /app < /tmp/studentos_v20.patch \
    && rm /tmp/studentos_v20.patch.gz /tmp/studentos_v20.patch

RUN npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 10000

CMD ["node", "backend/server.mjs"]
