FROM node:12-alpine

RUN npm i -g @squoosh/cli

ENV NODE_NO_WARNINGS=1

COPY squoosh-cli-wrapper /bin/squoosh-cli-wrapper

WORKDIR /data

ENTRYPOINT [ "/bin/squoosh-cli-wrapper" ]
