# Instructions for building and using the Docker image

Build image for workflow.

```sh
docker build -t ot_covid19:latest .
```

Create `temp` directory for results, `src` directory in case it contains modified scripts or integration configs, and enter the Docker container.

```sh
mkdir temp
docker run -it --rm \
-v <...>/ot_covid19/src:/ot_covid19/src \
-v <...>/ot_covid19/temp:/ot_covid19/temp \
thehyve/ot_covid19:latest bash
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
