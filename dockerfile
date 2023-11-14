FROM rust:latest

ENV NODE_OPTIONS=--openssl-legacy-provider

WORKDIR /app

RUN apt update

RUN apt install nodejs -y

RUN apt install npm -y

RUN npm --version

RUN node --version

COPY . .

RUN cargo install wasm-pack

RUN wasm-pack build

WORKDIR /app/webapp

RUN npm install --legacy-peer-deps

CMD npm run start