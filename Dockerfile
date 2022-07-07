FROM alpine:latest AS build

COPY . /build/flux-docker-gitlab-build-artifact

RUN (cd /build && tar -czf flux-docker-gitlab-build-artifact.tar.gz flux-docker-gitlab-build-artifact)

FROM docker:latest

LABEL org.opencontainers.image.source="https://github.com/flux-caps/flux-docker-gitlab-build-artifact"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

RUN ln -s /flux-docker-gitlab-build-artifact/bin/create-gitlab-artifact-from-docker-build.sh /usr/bin/create-gitlab-artifact-from-docker-build

ENTRYPOINT []

COPY --from=build /build /

ARG COMMIT_SHA
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
