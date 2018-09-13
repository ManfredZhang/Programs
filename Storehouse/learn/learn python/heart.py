# -*- coding: UTF-8 -*-

import random
import cmath

suc = 1
fai = 1
while 1:
	x = random.uniform(-2,2)
	y = random.uniform(-2,2)
	if (x**2 + (y-(x**2)**(1/3))**2) < 1:
	#if (x**2 + y**2 < 4):
		suc = suc + 1
	else:
		fai = fai + 1
	print(16.0/(fai+suc)*suc)

