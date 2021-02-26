# Instructions for building and using the Docker image

Build image for workflow.

```sh
docker build -t ot_covid19:latest .
```

Create and enter Docker container.

```sh
docker run -it --rm -v <...>/ot_covid19:/ot_covid19 thehyve/ot_covid19:latest bash
```

Navigate to mounted directory and run workflow.

```sh
cd /ot_covid19
make create-temp
make downloads
make parsers
make integrate
make docs
```
