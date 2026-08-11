FROM node:22-alpine

RUN apk add --no-cache unzip
WORKDIR /app

COPY StudentOS_360_v18_Connected.zip /tmp/studentos.zip
RUN unzip /tmp/studentos.zip -d /app \
    && rm /tmp/studentos.zip

RUN npm install --omit=dev

ENV NODE_ENV=production
EXPOSE 10000

CMD ["node", "backend/server.mjs"]
