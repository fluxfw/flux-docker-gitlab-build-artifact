FROM docker:latest

LABEL org.opencontainers.image.source="https://github.com/flux-caps/flux-docker-gitlab-build-artifact"
LABEL maintainer="fluxlabs <support@fluxlabs.ch> (https://fluxlabs.ch)"

RUN ln -s /flux-docker-gitlab-build-artifact/bin/create-gitlab-artifact-from-docker-build.sh /usr/bin/create-gitlab-artifact-from-docker-build

ENTRYPOINT []

COPY . /flux-docker-gitlab-build-artifact

ARG COMMIT_SHA
LABEL org.opencontainers.image.revision="$COMMIT_SHA"
