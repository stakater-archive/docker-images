FROM node:6

RUN apt-get update && apt-get install -y git vim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN git clone https://github.com/prerender/prerender.git && cd prerender && npm install

ENV PORT=1337

EXPOSE 1337

CMD ["node","prerender/server.js"]
