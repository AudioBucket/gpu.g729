// System Include files
#include <stdio.h>
#include <assert.h>

// Cuda specific files 
#include <cuda_runtime.h>
#include <helper_functions.h>

__global__ void checkIndex(void) {
printf("threadIdx:(%d, %d, %d) blockIdx:(%d, %d, %d) blockDim:(%d, %d, %d) gridDim:(%d, %d, %d)\n", threadIdx.x, threadIdx.y, threadIdx.z,blockIdx.x, blockIdx.y, blockIdx.z, blockDim.x, blockDim.y, blockDim.z,gridDim.x,gridDim.y,gridDim.z);
}

int main(int argc, char **argv) {
   // define total data element
   int nElem = 1024;
   // define grid and block structure
   dim3 block (3);
   dim3 grid ((nElem+block.x-1)/block.x);

   // check grid and block dimension from host side
   printf("grid.x %d grid.y %d grid.z %d\n",grid.x, grid.y, grid.z);
   printf("block.x %d block.y %d block.z %d\n",block.x, block.y, block.z);
   // check grid and block dimension from device side
   checkIndex <<<grid, block>>> ();
   // reset device before you leave
   cudaDeviceReset();
   return(0);

}