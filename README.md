# Cuda Boilerplate

# About

This boilerplate should make one program that runs one nvidia cuda kernel,
which calls a `complex_t` that is linked by device and host when built.
The idea is to have cuda code built and linked via nvcc and host/app
code built with g++. We're using the separate compilation mode with
nvcc, so the Makefile has an extra step that links the cuda code.
The host linker will link the object(s) created by nvcc.



# Requirements

Nvidia compute level 5.2, >=5; although, this value can be adjusted.
The drivers. The Nvidia sdk, nvcc.


# Building

It works with GNU Make. Do a `make && ./build/program`.


# License

This project, called `cuda-boilerplate` by Alexander Ressler,
is licensed under the MIT license.
