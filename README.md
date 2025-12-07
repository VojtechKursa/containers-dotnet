# Dotnet containers

Repository containing my custom (alpine-based) containers for .NET development.

## Build

```sh
docker build --build-arg "DOTNET_VERSION={version}" --target {target} --tag vojtechkursa/dotnet:{target}-{version}-alpine --no-cache .
```

## Publish

```sh
docker push {tag}
```
