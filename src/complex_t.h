#ifndef __COMPLEX_T_HEADER__
#define __COMPLEX_T_HEADER__

#include <cuda.h>
#include <cuda_runtime.h>
#include <iostream>

struct complex_t {
	double a, b;
	__host__ __device__ complex_t();
	__host__ __device__ complex_t(const double&, const double&);
	__host__ __device__ complex_t(const double&);
	__host__ __device__ complex_t(const complex_t&);
	__host__ __device__ double magnitude () const;
	__host__ __device__ complex_t operator* (const complex_t&);
	__host__ __device__ complex_t operator- () const;
	__host__ __device__ complex_t operator- (const complex_t&);
	__host__ __device__ complex_t operator+ (const complex_t&);
	friend std::ostream& operator<< (std::ostream&, const complex_t&);
};

#endif
