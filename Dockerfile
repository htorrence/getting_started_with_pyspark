FROM openjdk:8-jdk-slim-buster

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y --no-install-recommends && \
    apt-get install -y --no-install-recommends software-properties-common && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        libffi-dev \
        libpq-dev \
        libtool \
        libxrender1 \
	pandoc \
        python3 \
        python3-dev \
        python3-pip \
        wget \
	libffi6 \
	openssl \
    && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade setuptools

# Set environment variables for pyspark
ENV PYSPARK_PYTHON=python3 \
PYSPARK_DRIVER_PYTHON=python3

WORKDIR intro_to_pyspark

COPY . .

RUN pip3 install wheel
RUN pip3 install -r requirements.txt

# Add Tini. Tini operates as a process subreaper for jupyter. This prevents kernel crashes.
ENV TINI_VERSION v0.6.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
RUN chmod +x /usr/bin/tini
