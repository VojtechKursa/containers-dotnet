#!/bin/sh

# Run after removing old images

version=10
subversion=0

docker build --build-arg "DOTNET_VERSION=$version" --target sdk --tag vojtechkursa/dotnet:sdk-$version.$subversion-alpine .
docker build --build-arg "DOTNET_VERSION=$version" --target dotnet --tag vojtechkursa/dotnet:dotnet-$version.$subversion-alpine .
docker build --build-arg "DOTNET_VERSION=$version" --target aspnet --tag vojtechkursa/dotnet:aspnet-$version.$subversion-alpine .

docker push vojtechkursa/dotnet:sdk-$version.$subversion-alpine
docker push vojtechkursa/dotnet:dotnet-$version.$subversion-alpine
docker push vojtechkursa/dotnet:aspnet-$version.$subversion-alpine