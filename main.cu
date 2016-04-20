#include <iostream>
#include "classes.h"
#include "kernel.h"
using namespace std;

#define N 64
#define TPB 16

int main()
{
 cl* cc = new cl[N]; 
 cl* dcc = new cl;
 int size = N*sizeof(cl);

 cudaMalloc(&dcc,size);
 cudaMemcpy(dcc,cc,size,cudaMemcpyHostToDevice);
 fn<<<N/TPB,TPB>>>(dcc,N);
 cudaMemcpy(cc,dcc,size,cudaMemcpyDeviceToHost);

 for (int i=0; i<N; i++)
 {
  cout<<"i, i-th entry = "<<i<<" "<<cc[i].out()<<endl;
 } 

 cudaFree(dcc);   
 delete [] cc; 
}
