# Overview

**Title:** Eminem Red (Infinite)   
**Category:** Web  
**Flag:** libctf{0cea4c0e-7d0b-471d-a457-b2c8f558c748}
**Difficulty:** Trivial

# Usage

The following will pull the latest 'elttam/ctf-eminem-red' image from DockerHub, run a new container named 'libctfso-eminem-red', and publish the vulnerable service on port 80:

```sh
docker run --rm \
  --publish 80:80 \
  --name libctfso-eminem-red \
  elttam/ctf-eminem-red:latest
```

# Build (Optional)

If you prefer to build the 'elttam/ctf-eminem-red' image yourself you can do so first with:

```sh
docker build ${PWD} \
  --tag elttam/ctf-eminem-red:latest
```
