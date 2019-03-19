FROM openjdk:8-jdk-slim

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends software-properties-common && \
    apt-get install -y --no-install-recommends \
        automake \
        ca-certificates \
        curl \
        g++ \
        gfortran \
        git \
        libboost-program-options-dev \
        libffi-dev \
        libpq-dev \
        libtool \
        libxrender1 \
        make \
        python3 \
        python3-dev \
        wget && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*


RUN apt-get update && \
    apt-get install -qyy \
    -o APT::Install-Recommends=false -o APT::Install-Suggests=false \
    python-virtualenv python-dev python3-pip pypy libffi6 openssl &&\
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*


RUN pip3 install --upgrade pip setuptools

# Set environment variables for pyspark
ENV PYSPARK_PYTHON=python3 \
PYSPARK_DRIVER_PYTHON=python3

WORKDIR intro_to_pyspark

COPY . .

RUN pip3 install -r requirements.txt

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
