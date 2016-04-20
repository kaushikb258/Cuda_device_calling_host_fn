#ifndef CLASSES_H
#define CLASSES_H

#ifdef __CUDACC__
#define CUDA_CALLABLE_MEMBER __host__ __device__
#else
#define CUDA_CALLABLE_MEMBER
#endif 


class cl
{
 private:
  int x;
 public:
  CUDA_CALLABLE_MEMBER cl() {x=0;}

  CUDA_CALLABLE_MEMBER ~cl() {}

  CUDA_CALLABLE_MEMBER cl(cl & c)
  {
   this->x = c.x;
  }

  CUDA_CALLABLE_MEMBER void edit(int y)
  {
   x = y; 
  }
 
  CUDA_CALLABLE_MEMBER int out()
  {
   return x;
  } 

};

#endif
