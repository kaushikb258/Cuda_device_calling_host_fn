#include "classes.h"
#include "kernel.h"

__global__ void fn(cl* dcc, int n)
{

 const int idx = blockIdx.x*blockDim.x + threadIdx.x;
 dcc[idx].edit(1); 

}
