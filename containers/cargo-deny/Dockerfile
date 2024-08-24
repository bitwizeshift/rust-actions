# syntax=docker/dockerfile:1

# Build Container
FROM rust:1-alpine3.20 AS build

WORKDIR /workspace
COPY . /workspace
RUN apk add musl-dev --no-cache
RUN cargo install --root ./.cargo cargo-deny

# Runtime Container
FROM rust:1-alpine3.20 AS runtime

# cargo-deny requires 'cargo' to be installed.
COPY --from=build /workspace/.cargo/bin/cargo-deny /cargo-deny
RUN apk add git --no-cache

ENTRYPOINT ["/cargo-deny"]
