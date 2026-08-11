FROM node:22-alpine

RUN apk add --no-cache unzip patch
WORKDIR /app

COPY StudentOS_360_v18_Connected.zip /tmp/studentos.zip
RUN unzip /tmp/studentos.zip -d /app \
    && rm /tmp/studentos.zip

COPY studentos_v20_patch_00.b64 /tmp/v20_00.b64
COPY studentos_v20_patch_01.b64 /tmp/v20_01.b64
COPY studentos_v20_patch_02.b64 /tmp/v20_02.b64
COPY studentos_v20_patch_03.b64 /tmp/v20_03.b64
COPY studentos_v20_patch_04.b64 /tmp/v20_04.b64
COPY studentos_v20_copyfix.patch /tmp/studentos_v20_copyfix.patch
COPY studentos_v20_pricing.patch /tmp/studentos_v20_pricing.patch
RUN cat /tmp/v20_00.b64 /tmp/v20_01.b64 /tmp/v20_02.b64 /tmp/v20_03.b64 /tmp/v20_04.b64 \
    | base64 -d | gunzip > /tmp/studentos_v20.patch \
    && patch -p1 -d /app < /tmp/studentos_v20.patch \
    && patch -p1 -d /app < /tmp/studentos_v20_copyfix.patch \
    && patch -p1 -d /app < /tmp/studentos_v20_pricing.patch \
    && rm /tmp/v20_*.b64 /tmp/studentos_v20.patch /tmp/studentos_v20_copyfix.patch /tmp/studentos_v20_pricing.patch

RUN npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 10000

CMD ["node", "backend/server.mjs"]
