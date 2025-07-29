# Base stage for all builds
FROM alpine:latest AS base

ARG DOTNET_VERSION=8

# Setup user
RUN adduser -S -H -D -s /bin/bash dotnet && \
	addgroup -S dotnet && \
	adduser dotnet dotnet



FROM base AS cache

RUN mkdir -p /var/cache/apk && ln -s /var/cache/apk /etc/apk/cache



# Target for image with .NET runtime
FROM base AS dotnet

RUN --mount=type=cache,from=cache,source=/etc/apk/cache,target=/etc/apk/cache,sharing=locked \
	apk add dotnet${DOTNET_VERSION}-runtime



# Target for image with ASP.NET runtime
FROM base AS aspnet

RUN --mount=type=cache,from=cache,source=/etc/apk/cache,target=/etc/apk/cache,sharing=locked \
	apk add aspnetcore${DOTNET_VERSION}-runtime



# Target for image with .NET SDK
FROM base AS sdk

RUN --mount=type=cache,from=cache,source=/etc/apk/cache,target=/etc/apk/cache,sharing=locked \
	apk add dotnet${DOTNET_VERSION}-sdk

