#ifndef UTIL_CUDA_CUH
#define UTIL_CUDA_CUH

#include <cuda_runtime.h>

/**
 * Sets up a grid-stride loop for use in a CUDA kernel.
 */
#define GRID_STRIDE_LOOP(indexName, n) \
    for (int indexName = blockIdx.x * blockDim.x + threadIdx.x; \
         indexName < (n); \
         indexName += blockDim.x * gridDim.x)

/**
 * Convenience macro for CUDA error checking.
 */
#define CUDA_CHECK(errcode) cuda_check(errcode, __FILE__, __LINE__)

/**
 * If code is not cudaSuccess, print an error message and terminate the program.
 */
void cuda_check(cudaError_t code, const char *file, int line);

#endif
