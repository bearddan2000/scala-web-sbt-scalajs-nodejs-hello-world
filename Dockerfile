FROM hseeberger/scala-sbt:11.0.2-oraclelinux7_1.3.5_2.12.10 AS build

WORKDIR /tmp

COPY bin/ .

RUN sbt fastLinkJS

FROM node:latest

WORKDIR /app

COPY --from=build /tmp/target/scala-2.13/scala-js-tutorial-fastopt/ ./

CMD ["node", "./main.js"]
