FROM klakegg/hugo

COPY ./hello-discord/. /src

WORKDIR /src

ENTRYPOINT [ "hugo-official", "server", "-D", "--bind=0.0.0.0", "-p", "8080" ]
