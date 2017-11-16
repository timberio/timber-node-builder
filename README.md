# Timber Node Package Builder

This Docker image is used with CircleCI 2.0 to build the [Timber
Node Package](https://github.com/timberio/timber-node). It is based on the official
[`node`](https://hub.docker.com/_/node/) Docker image.

## Contents

  - git: For cloning the repository in CircleCI
  - grease: For managing releases on GitHub
  - make: Build tool
  - openssh: Required for git to fetch repositories on CircleCI
  - sed: Required for parsing text to produce release notes

## Changes

When you make a change, please update the `CHANGELOG.md` file.

## Releasing a New Version

Only contributors can release new versions.

In order to release a new version, you must have Docker running locally. It is
easiest if you are using a tool like Docker Machine, but as long as you are able
to run the `docker` commands, everything is good.

Releasing a new version involves two steps: building and pushing. To build the
new image, you issue a build command with the appropriate tag. The tag follows
the format `timberio/node-builder:$(version)`.

The `$(version)` should be the current version number. The version number should
be incremented based on [Semantic Versioning](http://semver.org/)
specifications.

To build the new image, use the following command from the directory:

```bash
docker build -t TAG ./
```

replacing TAG with the appropriate tag. Once the image has successfully built,
you can push the image to the repository using the following command:

```bash
docker push TAG
```

replacing TAG with the appropriate tag. Note that in order to do this you must
be logged in and have write permissions on the timberio/node-builder image in
DockerHub.
