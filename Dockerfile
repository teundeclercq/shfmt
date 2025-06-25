# Dockerfile
FROM alpine:latest

# Set desired shfmt version
ARG SHFMT_VERSION=v3.6.0

# Install curl, bash, and shfmt
RUN apk add --no-cache bash curl \
  && curl -sSL -o /usr/local/bin/shfmt \
       https://github.com/mvdan/sh/releases/download/${SHFMT_VERSION}/shfmt_${SHFMT_VERSION}_linux_amd64 \
  && chmod +x /usr/local/bin/shfmt

# Set working directory for file mounting
WORKDIR /scripts

# Default to shell (so you can override or drop into shell)
CMD ["/bin/sh"]