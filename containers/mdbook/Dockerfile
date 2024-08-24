# syntax=docker/dockerfile:1

# Build Container
FROM rust:1-alpine3.20 AS build

WORKDIR /workspace
COPY . /workspace
RUN apk add musl-dev --no-cache
RUN cargo install --root ./.cargo mdbook
RUN cargo install --root ./.cargo mdbook-mermaid
RUN cargo install --root ./.cargo mdbook-admonish

# Runtime Container
FROM alpine:3.20 AS runtime

COPY run.sh /run.sh
COPY --from=build /workspace/.cargo/bin/mdbook /mdbook
COPY --from=build /workspace/.cargo/bin/mdbook-mermaid /mdbook-mermaid
COPY --from=build /workspace/.cargo/bin/mdbook-admonish /mdbook-admonish

ENTRYPOINT ["/run.sh"]
