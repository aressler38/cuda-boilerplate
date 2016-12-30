#include "cuda-wrapper.h"

/**
 * CUDA kernel that computes reciprocal values for a given vector
 */
__global__ void callAComplexTypeKernel(float *data, unsigned size) {
	unsigned index = blockIdx.x * blockDim.x + threadIdx.x;

	if (index < size) {
		complex_t z(1.0, index);
		data[index] = z.magnitude();
	}
}


/**
 * Host function that copies the data and launches the work on GPU
 */
float *callAComplexType(float *data, unsigned size) {
	static const int BLOCK_SIZE = 256;
	const int blockCount = (size+BLOCK_SIZE-1)/BLOCK_SIZE;
	float *rc = new float[size];
	float *gpuData;

	cudaMalloc((void **)&gpuData, sizeof(float)*size);
	cudaMemcpy(gpuData, data, sizeof(float)*size, cudaMemcpyHostToDevice);

	callAComplexTypeKernel<<<blockCount, BLOCK_SIZE>>> (gpuData, size);

	cudaMemcpy(rc, gpuData, sizeof(float)*size, cudaMemcpyDeviceToHost);
	cudaFree(gpuData);
	return rc;
}
