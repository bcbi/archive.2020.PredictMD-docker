# PredictMD-docker: Docker and Singularity images for [PredictMD](https://predictmd.net)

<p>
<a
href="https://doi.org/10.5281/zenodo.1291209">
<img
src="https://zenodo.org/badge/109460252.svg"/>
</a>
</p>

<p>
<a
href="https://app.bors.tech/repositories/12699">
<img
src="https://bors.tech/images/badge_small.svg"
alt="Bors enabled">
</a>
<a
href="https://travis-ci.com/aluthge/PredictMD-docker/branches">
<img
src="https://travis-ci.com/aluthge/PredictMD-docker.svg?branch=master"/>
</a>
</p>

This repository contains scripts for creating Docker images and
Singularity images for [PredictMD](https://predictmd.net).

## Recommended image

| Name | Dockerfile | Image |
| ---- | ---------- | ----- |
| `dilumaluthge/predictmd` | [Dockerfile.template](/docker/images/predictmd/builddir/Dockerfile.template) | <a href="https://hub.docker.com/r/dilumaluthge/predictmd"><img src="https://images.microbadger.com/badges/image/dilumaluthge/predictmd.svg"></a> |

## Instructions for use
Download and start the container by running the following line:
```bash
docker run --name predictmd -it dilumaluthge/predictmd /bin/bash
```

Once you are inside the container, you can start Julia by running the following line:
```bash
julia
```

In Julia, run the following line to load PredictMD:
```julia
import PredictMDFull
```

You can run the test suite by running the following four lines in Julia:
```julia
import Pkg
Pkg.test("PredictMDExtra")
Pkg.test("PredictMDFull")
Pkg.test("PredictMD")
```

After you have exited the container, you can return to it by running the following line:
```bash
docker start -ai predictmd
```

To delete your container, run the following line:
```bash
docker container rm -f predictmd
```

To also delete the downloaded image, run the following line:
```bash
docker image rm -f dilumaluthge/predictmd
```
