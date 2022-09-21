# flux-docker-gitlab-build-artifact

Create gitlab artifact from build in docker image

```yaml
build-artifact:
    stage: build
    image: fluxfw/flux-docker-gitlab-build-artifact:latest
    script:
        - create-gitlab-artifact-from-docker-build $CI_REGISTRY_IMAGE:latest /xyz xyz.tar.gz
    artifacts:
        paths:
            - xyz.tar.gz
        expire_in: 5 minutes
    only:
        - main
```
