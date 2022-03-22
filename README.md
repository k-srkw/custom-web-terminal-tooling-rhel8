# custom-web-terminal-tooling-rhel8

## How-to build image

```
podman build --creds='<user:password>' -t <image_repo>:1.4-custom -f Containerfile .
```

## Container Image

```
podman pull quay.io/kshiraka/custom-web-terminal-tooling-rhel8
```

## How-to apply to web terminal operator

```
oc apply -f web-terminal-tooling-devworkspacetemplate.yaml
```
