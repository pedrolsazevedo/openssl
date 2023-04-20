[![Docker Repository on Quay](https://quay.io/repository/psazevedo/openssl/status "Docker Repository on Quay")](https://quay.io/repository/psazevedo/openssl) | [![CI/CD](https://github.com/pedrolsazevedo/openssl/actions/workflows/bump_version.yaml/badge.svg?branch=main)](https://github.com/pedrolsazevedo/openssl/actions/workflows/bump_version.yaml)

# OpenSSL Docker Image
This is a Docker image that includes OpenSSL based on Alpine Linux.

## Usage

To use this image, run the following command:

Replace `<version>` with the specific version of the image you wish to use, such as `latest`, `1.1.1k`, etc.

```bash
docker run -it --rm psazevedo/openssl:<version>
```

### How to Use

Once the container is running, you can use any OpenSSL command as you normally would. For example, to generate a private key and CSR, you could use the following commands:

**Generate a private key**
```bash
openssl genrsa -out example.com.key 2048
```
**Generate a CSR**
```bash
openssl req -new -key example.com.key -out example.com.csr
```

You can also use the `-v` flag to mount a local directory as a volume in the container, so you can access the generated files on your local machine. For example:
Generate a private key and CSR and save them to a local directory
This will generate a private key and CSR in your current working directory, and you can access them on your local machine.

```bash
docker run --rm
-v $(pwd):/app
psazevedo/openssl:latest
sh -c "openssl genrsa -out /app/example.com.key 2048 && openssl req -new -key /app/example.com.key -out /app/example.com.csr"
```

## Building the Image

To build the Docker image, run the following command:
```bash
docker build -t psazevedo/openssl:<version> \
  --build-arg ALPINE_VERSION=<alpine-version> \
  --build-arg OPENSSL_VERSION=<openssl-version> \
  .
```

Replace `<version>` with the specific version tag you wish to use for the image, `<alpine-version>` with the version of Alpine Linux you want to use, and `<openssl-version>` with the version of OpenSSL you want to use.

For example, to build an image with OpenSSL 3.0.8 based on Alpine Linux 3.17.3, run:

```bash
docker build -t openssl-amd64 \
  --build-arg ALPINE_VERSION=3.17.3 \
  --build-arg OPENSSL_VERSION=3.0.8-r3 \
  -f Dockerfile.amd64 \
  --platform linux/amd64 .
```

Building multi arch image

```bash
docker buildx build --file Dockerfile.multi \
  -t psazevedo/openssl:3.0.8-r3-alpine3.17.3 \
  --platform linux/amd64,linux/arm64 \
  --build-arg ALPINE_VERSION=3.17.3 \
  --build-arg OPENSSL_VERSION=3.0.8-r3 \
  --push .
```

## Running the Container

To run the container, use the `docker run` command as shown in the Usage section. You can replace `<version>` with the version tag you built or pulled from Docker Hub.

For example, to run the container with the `1.1.1k-alpine3.14` tag, run:
```bash
docker run --rm -it psazevedo/openssl:1.1.1k-alpine3.14 version
```

This will output the version of OpenSSL installed in the container.

## OpenSSL Help