#include <stdio.h>
#define SCALE_FACTOR 64
#define SCALE 18446744073709551616.0
#define FINAL_SCALE 4611686018427387904.0
 
struct my_uint128_t {
  unsigned long long hi;
  unsigned long long lo;
};
 
// Left shift
void shiftl128 (struct my_uint128_t *num, size_t s)
{
   // shifting a 64-bit integer by more than 63 bits is "undefined"
   (s >= 64) ? (
       num->hi=num->lo,
       num->lo=0,
       shiftl128(num,s-64)
   ) : (
       num->hi = (num->hi << s) | (num->lo >> (64-s)),
       num->lo = (num->lo << s)
   );
}
 
// Right shift
void shiftr128 (struct my_uint128_t *num, size_t s)
{
   // shifting a 64-bit integer by more than 63 bits is "undefined"
   (s >= 64) ? (
       num->lo=num->hi,
       num->hi=0,
       shiftr128(num,s-64)
   ) : (
       num->lo = (num->hi << (64-s)) | (num->lo >> s),
       num->hi = (num->hi >> s)
   );
}
 
struct my_uint128_t addShift(struct my_uint128_t num, size_t s) {
   struct my_uint128_t num_temp;
   num_temp.hi = num.hi;
   num_temp.lo = num.lo;
   shiftr128(&num, s);
   num_temp.lo += num.lo;
   num_temp.hi += num.hi + (num_temp.lo < num.lo);
   return num_temp;
}
 
 
int main() {
 
   double M_init;
   scanf("%lf", &M_init);
   M_init *= 1099511627776.0; // multiply by 2^40
 
   struct my_uint128_t f;
   f.hi = 1ULL;
   f.lo = 0ULL;
   struct my_uint128_t f_sqrt_16;
   f_sqrt_16.hi = 1ULL;
   f_sqrt_16.lo = 0ULL;
   struct my_uint128_t M;
   M.hi = 0ULL;
   M.lo = (unsigned long long) M_init;
 
   shiftl128(&f, SCALE_FACTOR - 64);
   shiftl128(&f_sqrt_16, 62);
   shiftl128(&M, SCALE_FACTOR - 40);
  
   int i,j;
   struct my_uint128_t u;
   struct my_uint128_t u_sqrt_16;
 
   for(i^=i; !(i&128); i+=4) {
       u.hi = f.hi;
       u.lo = f.lo;
       for(j^=j; !(j&16); j++) {
           u = addShift(u, (size_t)i);
       }
 
       if(u.hi < M.hi || (u.hi == M.hi && u.lo <= M.lo) ) {
           u_sqrt_16 = addShift(f_sqrt_16, (size_t)i);
 
           f.hi = u.hi;
           f.lo = u.lo;
           f_sqrt_16.hi = u_sqrt_16.hi;
           f_sqrt_16.lo = u_sqrt_16.lo;
       }
       u.hi = f.hi;
       u.lo = f.lo;
       for(j^=j; !(j&16); j++) {
           u = addShift(u, (size_t)i+1);
       }
 
       if(u.hi < M.hi || (u.hi == M.hi && u.lo <= M.lo) ) {
           u_sqrt_16 = addShift(f_sqrt_16, (size_t)i+1);
 
           f.hi = u.hi;
           f.lo = u.lo;
           f_sqrt_16.hi = u_sqrt_16.hi;
           f_sqrt_16.lo = u_sqrt_16.lo;
       }
       u.hi = f.hi;
       u.lo = f.lo;
       for(j^=j; !(j&16); j++) {
           u = addShift(u, (size_t)i+2);
       }
 
       if(u.hi < M.hi || (u.hi == M.hi && u.lo <= M.lo) ) {
           u_sqrt_16 = addShift(f_sqrt_16, (size_t)i+2);
 
           f.hi = u.hi;
           f.lo = u.lo;
           f_sqrt_16.hi = u_sqrt_16.hi;
           f_sqrt_16.lo = u_sqrt_16.lo;
       }
       u.hi = f.hi;
       u.lo = f.lo;
       for(j^=j; !(j&16); j++) {
           u = addShift(u, (size_t)i+3);
       }
 
       if(u.hi < M.hi || (u.hi == M.hi && u.lo <= M.lo) ) {
           u_sqrt_16 = addShift(f_sqrt_16, (size_t)i+3);
 
           f.hi = u.hi;
           f.lo = u.lo;
           f_sqrt_16.hi = u_sqrt_16.hi;
           f_sqrt_16.lo = u_sqrt_16.lo;
       }
 
   }
 
   double final_hi = (double)(f_sqrt_16.hi);
   double final_lo = (double)(f_sqrt_16.lo) / SCALE;
   double final_answer = (final_hi + final_lo) / FINAL_SCALE;
   printf("%.30f\n", final_answer);
 
}
