#include "complex_t.h"

__host__ __device__ complex_t::complex_t () : a(0), b(0) { }
__host__ __device__ complex_t::complex_t (const double &x) : a(x), b(0) { }
__host__ __device__ complex_t::complex_t (const double &x, const double &y) : a(x), b(y) { }
__host__ __device__ complex_t::complex_t (const complex_t &rhs) : a(rhs.a), b(rhs.b) { }

__host__ __device__ complex_t complex_t::operator-() const {
	complex_t inverse (-a, -b);
	return inverse;
}

__host__ __device__ double complex_t::magnitude() const {
	return sqrt(a*a + b*b);
}

__host__ __device__ complex_t complex_t::operator* (const complex_t &c2) {
	complex_t product;
	product.a = a*c2.a - b*c2.b;
	product.b = a*c2.b + b*c2.a;
	return product;}

__host__ __device__ complex_t complex_t::operator- (const complex_t &c) {
	complex_t difference (a - c.a,b - c.b);
	return difference;
}

__host__ __device__ complex_t complex_t::operator+ (const complex_t &c) {
    complex_t sum = *this - -c;
	return sum;
}

std::ostream& operator<< (std::ostream &os, const complex_t &c) {
	os << "(" << c.a << " + i" << c.b << ")";
	return os;
}
