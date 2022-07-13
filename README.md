# flux-docker-gitlab-build-artifact

Create gitlab artifact from build in docker image

## Example

```yaml
build-artifact:
    stage: build
    image: docker:latest
    script:
        - (if [ ! -d flux-docker-gitlab-build-artifact ]; then mkdir -p flux-docker-gitlab-build-artifact && cd flux-docker-gitlab-build-artifact && wget -O - https://github.com/flux-eco/flux-docker-gitlab-build-artifact/releases/download/%tag%/flux-docker-gitlab-build-artifact-%tag%-build.tar.gz | tar -xz --strip-components=1; fi)
        - flux-docker-gitlab-build-artifact/bin/create-gitlab-artifact-from-docker-build $CI_REGISTRY_IMAGE:latest /xyz xyz.tar.gz
    cache:
        key: build-artifact
        paths:
            - flux-docker-gitlab-build-artifact
    artifacts:
        paths:
            - xyz.tar.gz
```
