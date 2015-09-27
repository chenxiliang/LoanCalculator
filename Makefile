loancal: loancal.o
	gfortran -o loancal loancal.o

loancal.o: loancal.f90
	gfortran -c loancal.f90 -o loancal.o

.PHONY: clean
clean:
	rm loancal.o
veryclean:
	rm loancal.o loancal
