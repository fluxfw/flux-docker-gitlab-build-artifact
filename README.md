# flux-docker-gitlab-build-artifact

Create gitlab artifact from build in docker image

## Example

```yaml
create-gitlab-artifact-from-build:
    stage: build
    image: docker-registry.fluxpublisher.ch/flux-docker-gitlab-build-artifact:latest
    script:
        - create-gitlab-artifact-from-docker-build $CI_REGISTRY_IMAGE:latest /xyz xyz.tar.gz
    artifacts:
        paths:
            - xyz.tar.gz
```
