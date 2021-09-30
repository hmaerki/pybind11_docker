FROM debian:bullseye

ENV LANG=C.UTF-8 \
    LC_ALL=C.UTF-8

RUN apt-get update \
    && apt-get install -y git g++ make cmake swig libboost-python-dev python3-pip \
    && rm -rf /var/lib/apt/lists/*

RUN pip3 install --upgrade pip \
    && pip3 install pytest numpy wheel cython ipython

RUN useradd -r -u 1000 user
RUN chown -R 1000:1000 /home

USER user
WORKDIR /home

# Compile and install pybind11
RUN git clone https://github.com/pybind/pybind11.git
RUN cd pybind11 \
    && pip install .

# https://pybind11.readthedocs.io/en/stable/basics.html
# Build tests
WORKDIR /home/pybind11
RUN mkdir build \
    && cd build \
    && cmake .. \
    && make check -j 4

# Run pytest against pybind11
WORKDIR /home/pybind11/build
RUN make pytest

# python_example
# Build
WORKDIR /home/pybind11
RUN git clone https://github.com/pybind/python_example.git
RUN cd python_example \
    pip install -e .

WORKDIR /home/pybind11
CMD ["ipython"]
