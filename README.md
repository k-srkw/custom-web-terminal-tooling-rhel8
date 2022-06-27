# custom-web-terminal-tooling-rhel8

## How-to build image

Download and Extract the [OpenShift Dev Spaces CLI management tool archive](https://developers.redhat.com/products/openshift-dev-spaces/download) to a `etc` directory as `dsc`

Then, Run build command below.

```
podman build --creds='<user:password>' -t <image_repo>:1.5-custom -f Containerfile .
```

## Container Image

```
podman pull quay.io/kshiraka/custom-web-terminal-tooling-rhel8
```

## How-to apply to web terminal operator

```
oc apply -f web-terminal-tooling-devworkspacetemplate.yaml
```
