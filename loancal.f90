program loancal
!Name: Xi Chen
!Date: Sep 27, 2015
implicit none

integer,parameter :: rr=selected_real_kind(16,307)
real(kind=rr) :: monthly_pay, interest_rate, principal, interest, balance, total_interest, total_pay
integer ::year,  month, period
real(kind=rr) :: initial_balance
integer :: i, io=0, counter

!reads in the loan terms and displays that information
open(unit=1, file='loanTerms.tab', status='OLD', iostat=io)
do while( io==0)
	counter=0
	read(1, *,iostat=io),initial_balance, year, interest_rate
	if(io .ne. 0)then
		exit
	endif
	write(*, "(A16, A2, F12.2)"), "Initial Balance:", " $",initial_balance
	write(*, "(A16, I14)"),"Years to pay:", year
	write(*, "(A16, F14.3, A1)"), "Interest Rate:", interest_rate, "%"
	
	! calculates the monthly payment and displays that information
	month=year*12
	interest_rate = interest_rate/100
	monthly_pay=cal_monthlypay(initial_balance,month,interest_rate)
	write(*,*)
	write(*, "(A, A, F12.2)"), "Monthly Payment:", " $", monthly_pay

	! calculates the first year of payments
	balance=initial_balance
	interest_rate = interest_rate/12
	total_interest=0
	total_pay=0
	write(*,*)
	write(*,"(A, A12, A11, A12)"), "Period", "Principal", "Interest", "Balance"
	do period=1,month
		interest=balance*interest_rate
		principal=monthly_pay-interest
		balance=balance-principal
		if(period>12*(year-1) .or. period<12+1)then
			counter=counter+1;
			write(*,"(I6,F12.2,F11.2,F12.2)"),period, principal, interest, balance
			if(counter==12) then
				write(*,*)
			endif
		endif
		total_interest=total_interest+interest
		total_pay=total_pay+principal+interest
end do
	! calculates the total interest and total payments and displays them.
	write(*,*)
	write(*,"(A18, F12.2)"),"Total Interest: $", total_interest
	write(*,"(A18, F12.2)"),"Total Payments: $", total_pay
	write(*,*)
end do
close(1)
contains
real(kind=rr) function cal_monthlypay(initial_balancein,monthin,interest_ratein)
	integer :: monthin
	real(kind=rr) :: initial_balancein, interest_ratein, month_interate
	month_interate = interest_ratein/12
	cal_monthlypay=initial_balancein*month_interate*(1+month_interate)**monthin/((1+month_interate)**monthin-1)
end function
end program loancal
