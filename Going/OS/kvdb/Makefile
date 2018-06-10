# Do *NOT* modify the existing build rules.
# You may add your own rules, e.g., "make run" or "make test".
# https://blog.csdn.net/xibeichengf/article/details/52136919


LAB = kvdb

include Makefile.git

.PHONY: build submit

build: $(LAB).c
	$(call git_commit, "compile")
	gcc -fPIC -shared -std=gnu99 -O1 -Wall -o lib$(LAB).so $(LAB).c
	gcc -L./ -Wl,-rpath=./ -Wall -o test main.c -lkvdb -lpthread
	./test

submit:
	cd .. && tar cj $(LAB) > submission.tar.bz2
	curl -F "task=M6" -F "id=161220169" -F "name=张铭方" -F "submission=@../submission.tar.bz2" 114.212.81.90:5000/upload
