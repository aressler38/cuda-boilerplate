#include <iostream>
#include <memory>
#include "cuda-wrapper.h"


int main (void) {
	std::cout << "main\n" << std::endl;
	const unsigned size = 128;
	unsigned i;
	std::unique_ptr<float> data(new float[size]);

	for (i=1; i<size; ++i) data.get()[i] = i;
	auto results = std::unique_ptr<float>(callAComplexType(data.get(), size));
	std::cout << "initialized i data:\n";
	for (i=0; i<size; ++i) std::cout << data.get()[i] << ",";
	std::cout << "\n\nRESULTS of calling (1, 1+i).magnitude():\n";
	for (i=0; i<size; ++i) std::cout << results.get()[i] << ",";
	std::cout << "\n\tok\n" << std::endl;
	return 0;
}
