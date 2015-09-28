program loancal
!Name: Xi Chen
!Date: Sep 27, 2015
implicit none

real :: monthly_pay, interest_rate, principal, interest, balance, total_interest, total_pay
integer ::year, line_num=3
real :: initial_balance
integer :: i
!reads in the loan terms and displays that information
open(unit=1, file='loanTerms.tab')
do i = 1,line_num
	read(1, *)initial_balance, year, interest_rate
	write(*, "(A16, A2, F12.2)"), "Initial Balance:", " $",initial_balance
	write(*, "(A16, I14)"),"Years to pay:", year
	write(*, "(A16, F14.3, A1)"), "Interest Rate:", interest_rate, "%"
	! calculates the monthly payment and displays that information

	! calculates the first year of payments

	! calculates the total interest and total payments and displays them.
end do
end program loancal
