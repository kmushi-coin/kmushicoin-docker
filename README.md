# kmushicoin-docker
Dockerfile for Kmushicoin


# Building

```bash
docker build -t kmushicoin .
```

# Running

```bash
docker run --rm -it --name kmushicoin-node -p 0.0.0.0:36600:36600 kmushicoin
```
