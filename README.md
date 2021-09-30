# pybind11_docker

Docker image

- building pybind11
- building the tests
- running the pytest against pybind11

Acknowledgment: https://github.com/sumanstats/rakurstudio/tree/master/swig-python-boost

## Links

- [pybind11](https://github.com/pybind/pybind11)
- [SWIG (Simplified Wrapper and Interface Generator)](http://www.swig.org/)
- [Boost.Python](https://www.boost.org/doc/libs/1_65_0/libs/python/doc/html/index.html)
- [cython](http://cython.org/)
- [pybind11: Embedding python](https://pybind11.readthedocs.io/en/latest/advanced/embedding.html)
- [ pybind11: run pytest](https://pybind11.readthedocs.io/en/stable/basics.html)

# Docker

## Build image

```bash
docker build -t pybind11 .
```

## Run image

```bash
docker run -it -h pybind11 --rm --user 1000:1000 pybind11 /bin/bash
```

## Run Pytest against pybind11

In docker

```bash
$ cd /home/pybind11/build/tests
$ make pytest
==================================================== test session starts ====================================================
platform linux -- Python 3.9.2, pytest-6.2.5, py-1.10.0, pluggy-1.0.0
rootdir: /home/pybind11/tests, configfile: pytest.ini
collected 464 items / 1 skipped / 463 selected                                                                              

../../tests/test_async.py ..
../../tests/test_buffers.py ........
../../tests/test_builtin_casters.py ....s............
...
============================================== 458 passed, 7 skipped in 7.62s ===============================================
```