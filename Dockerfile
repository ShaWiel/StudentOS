FROM node:22-alpine

RUN apk add --no-cache unzip patch
WORKDIR /app

COPY SCHOLARK_V22_Deploy.zip /tmp/scholark.zip
COPY scholark_v22_1_homepage.patch /tmp/scholark_v22_1_homepage.patch
RUN unzip /tmp/scholark.zip -d /app \
    && patch -p1 -d /app < /tmp/scholark_v22_1_homepage.patch \
    && rm /tmp/scholark.zip /tmp/scholark_v22_1_homepage.patch

RUN npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 10000

CMD ["node", "backend/server.mjs"]
