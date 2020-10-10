FROM node:12-slim

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 9229 9230

RUN npm i npm@latest -g

RUN mkdir /opt/node_app && chown node:node /opt/node_app
WORKDIR /opt/node_app

USER node
COPY package.json package-lock.json* ./
RUN npm install 
ENV PATH /opt/node_app/node_modules/.bin:$PATH

WORKDIR /opt/node_app/node_app
COPY . .

CMD ["npm", "run", "dev"]