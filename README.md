# docker-nodejs

### Build the image

    TMP="$(mktemp -d)" \
      && git clone http://git.simpledrupalcloud.com/simpledrupalcloud/docker-nodejs.git "${TMP}" \
      && cd "${TMP}" \
      && sudo docker build -t simpledrupalcloud/nodejs:latest . \
      && cd -

## License

**MIT**
