FROM docker:latest

RUN ln -s /flux-docker-gitlab-build-artifact/bin/create-gitlab-artifact-from-docker-build.sh /usr/bin/create-gitlab-artifact-from-docker-build

ENTRYPOINT []

COPY . /flux-docker-gitlab-build-artifact
