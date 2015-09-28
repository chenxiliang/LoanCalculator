loanCalculator: loanCalculator.o
	gfortran -o loanCalculator loanCalculator.o

loanCalculator.o: loancal.f90
	gfortran -c loancal.f90 -o loanCalculator.o

.PHONY: clean
clean:
	rm loanCalculator.o
veryclean:
	rm loanCalculator.o loanCalculator
