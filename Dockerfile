FROM jameshiew/rustbuilder:1.67.1 AS builder
RUN apt-get update && apt-get install --no-install-recommends -y \
    libpq-dev

RUN cargo install --locked diesel_cli@2.0.1 --no-default-features --features "postgres"

FROM debian:bookworm-20230208-slim
RUN apt-get update && apt-get install --no-install-recommends -y \
    postgresql-client
COPY --from=builder /usr/local/cargo/bin/diesel /usr/local/bin/diesel
