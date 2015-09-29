program loancal
!Name: Xi Chen
!Date: Sep 27, 2015
implicit none

integer,parameter :: rr=selected_real_kind(16,307)
real(kind=rr) :: monthly_pay, interest_rate, principal, interest, balance, total_interest, total_pay
integer ::year, line_num=3, month
real(kind=rr) :: initial_balance
integer :: i

!reads in the loan terms and displays that information
open(unit=1, file='loanTerms.tab')
do i = 1,line_num
	read(1, *)initial_balance, year, interest_rate
	write(*, "(A16, A2, F12.2)"), "Initial Balance:", " $",initial_balance
	write(*, "(A16, I14)"),"Years to pay:", year
	write(*, "(A16, F14.3, A1)"), "Interest Rate:", interest_rate, "%"
	
	! calculates the monthly payment and displays that information
	month=year*12;
	monthly_pay=cal_monthlypay(initial_balance,month,interest_rate)
	write(*,*)
	write(*, "(A, A, F12.2)"), "Monthly Payment:", " $", monthly_pay

	! calculates the first year of payments

	! calculates the total interest and total payments and displays them.
end do
contains
real(kind=rr) function cal_monthlypay(initial_balancein,monthin,interest_ratein)
	integer :: monthin
	real(kind=rr) :: initial_balancein, interest_ratein, month_interate
	month_interate = interest_ratein/(12*100)
	cal_monthlypay=initial_balancein*month_interate*(1+month_interate)**monthin/((1+month_interate)**monthin-1)
end function
end program loancal
