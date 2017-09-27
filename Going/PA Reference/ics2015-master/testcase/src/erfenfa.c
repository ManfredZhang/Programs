#include "trap.h"

#define FLOAT int

unsigned long long tmp[] = {0x7fffffffffffffff, 0x3fffffffffffffff, 0x1fffffffffffffff, 0xfffffffffffffff, 0x7ffffffffffffff, 0x3ffffffffffffff, 0x1ffffffffffffff, 0xffffffffffffff, 0x7fffffffffffff, 0x3fffffffffffff, 0x1fffffffffffff, 0xfffffffffffff, 0x7ffffffffffff, 0x3ffffffffffff, 0x1ffffffffffff, 0xffffffffffff, 0x7fffffffffff, 0x3fffffffffff, 0x1fffffffffff, 0xfffffffffff, 0x7ffffffffff, 0x3ffffffffff, 0x1ffffffffff, 0xffffffffff, 0x7fffffffff, 0x3fffffffff, 0x1fffffffff, 0xfffffffff, 0x7ffffffff, 0x3ffffffff, 0x1ffffffff, 0xffffffff, 0x7fffffff, 0x3fffffff, 0x1fffffff, 0xfffffff, 0x7ffffff, 0x3ffffff, 0x1ffffff, 0xffffff, 0x7fffff, 0x3fffff, 0x1fffff, 0xfffff, 0x17ffff, 0x13ffff, 0x11ffff, 0x10ffff, 0x107fff, 0x103fff, 0x101fff, 0x100fff, 0x1007ff, 0x1003ff, 0x1001ff, 0x1000ff, 0x10007f, 0x10003f, 0x10001f, 0x10000f, 0x100007, 0x100003, 0x100001, 0x100000};

unsigned long long l[] = {0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000, 0x100000};

unsigned long long r[] = {0xffffffffffffffff, 0x7ffffffffffffffe, 0x3ffffffffffffffe, 0x1ffffffffffffffe, 0xffffffffffffffe, 0x7fffffffffffffe, 0x3fffffffffffffe, 0x1fffffffffffffe, 0xfffffffffffffe, 0x7ffffffffffffe, 0x3ffffffffffffe, 0x1ffffffffffffe, 0xffffffffffffe, 0x7fffffffffffe, 0x3fffffffffffe, 0x1fffffffffffe, 0xfffffffffffe, 0x7ffffffffffe, 0x3ffffffffffe, 0x1ffffffffffe, 0xffffffffffe, 0x7fffffffffe, 0x3fffffffffe, 0x1fffffffffe, 0xfffffffffe, 0x7ffffffffe, 0x3ffffffffe, 0x1ffffffffe, 0xffffffffe, 0x7fffffffe, 0x3fffffffe, 0x1fffffffe, 0xfffffffe, 0x7ffffffe, 0x3ffffffe, 0x1ffffffe, 0xffffffe, 0x7fffffe, 0x3fffffe, 0x1fffffe, 0xfffffe, 0x7ffffe, 0x3ffffe, 0x1ffffe, 0x1ffffe, 0x17fffe, 0x13fffe, 0x11fffe, 0x10fffe, 0x107ffe, 0x103ffe, 0x101ffe, 0x100ffe, 0x1007fe, 0x1003fe, 0x1001fe, 0x1000fe, 0x10007e, 0x10003e, 0x10001e, 0x10000e, 0x100006, 0x100002, 0x100000};
FLOAT Fabs(FLOAT a){
	return a > 0 ? a : -a;
}
int i = 0;
unsigned long long A, B, left, right, middle;
FLOAT F_div_F(FLOAT a, FLOAT b) {
	A = Fabs(a);
	nemu_assert(A == 0x1000ll);
	A <<= 16;
	nemu_assert(A == 0x10000000ll);
	B = Fabs(b);
	nemu_assert(B == 0x100ll);
	left = 0;
	right = 0xffffffffffffffff;
	while(left <= right){
		middle = (right + left) / 2;
		nemu_assert(left == l[i]);
		nemu_assert(right == r[i]);
		nemu_assert(middle == tmp[i]);
		middle &= 0x7fffffffffffffff;
		if(middle * B > A) right = middle - 1;
		else if(middle * B < A) left = middle + 1;
		else break;
		i++;
	}
	if( (a > 0 && b < 0) || (a < 0 && b > 0) ) middle = -middle;
	return middle;
}

int main(){
	F_div_F(0x1000, 0x100);
	HIT_GOOD_TRAP;
	return 0;
}
