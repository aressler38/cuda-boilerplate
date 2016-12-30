#ifndef __CUDA_WRAPPER_HEADER__
#define __CUDA_WRAPPER_HEADER__

#include <iostream>
#include <numeric>
#include <stdlib.h>
#include <cuda.h>
#include <cuda_runtime.h>
#include "complex_t.h"

float *callAComplexType(float *data, unsigned size);

#endif
