# syntax=docker/dockerfile:1

# Build Container
FROM rust:1-alpine3.20 AS build

WORKDIR /workspace
COPY . /workspace
RUN apk add musl-dev --no-cache
RUN cargo install --root ./.cargo cargo-about

# Runtime Container
FROM alpine:3.20 AS runtime

COPY --from=build /workspace/.cargo/bin/cargo-about /cargo-about

ENTRYPOINT ["/cargo-about"]
