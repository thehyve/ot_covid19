FROM ubuntu:20.04

# install system libraries
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install --yes \
    build-essential \
    locales \
    jq \
    pandoc \
    software-properties-common \
    pipenv \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev

# set locale
RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
  && locale-gen
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install Python 3.7
RUN add-apt-repository ppa:deadsnakes/ppa \
  && apt-get install --yes python3.7

# install R 4.0
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
  && add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' \
  && apt-get update \
  && apt-get --yes install r-base r-base-core r-recommended r-base-dev

# copy files
RUN mkdir /ot_covid19
COPY ./ /ot_covid19

# run setup
RUN cd /ot_covid19 \
  && make setup-environment
