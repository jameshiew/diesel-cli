# diesel-cli [![Docker Hub pulls](https://img.shields.io/docker/pulls/jameshiew/diesel-cli?style=flat-square)](https://hub.docker.com/r/jameshiew/diesel-cli/tags)

Docker images containing the [Diesel](https://diesel.rs/) CLI for Postgres.

## Generating `schema.rs`

You can run a print-schema container like below, that will run all migrations against a fresh Postgres database and then print `schema.rs` to stdout.

e.g. assuming your Diesel migrations are under `migrations/` in your current working directory, you can run something like:

```shell
docker run \
    --rm \
    -v $(pwd)/migrations:/migrations \
    jameshiew/diesel-cli:2.0.1-print-schema > schema.rs
```
