FROM jameshiew/diesel-cli:2.0.1
RUN apt-get update && apt-get install --no-install-recommends -y \
    postgresql
COPY print-schema.sh /usr/local/bin/print-schema.sh
CMD [ "print-schema.sh" ]