		.data
No1:		.asciiz "Give me the Fahrenheit: "
No2:		.asciiz "The temperature in Celsius is: "
		.text
		
		
		j Main 				# Jump to "Main"
			
Celsius:	addiu $t0, $zero, 32	# $t0 <- 32
		mtc1 $t0, $f4			# $f4 <- $t0
		cvt.s.w $f4, $f4		# convert $f4 to a single precession -> 32.0
		sub.s $f0, $f12, $f4		# $f0 <- ($f12 - $f4 (32.0))
		
		addiu $t0, $zero, 5		# $t0 <- 5
		mtc1 $t0, $f4			# $f4 <- $t0
		cvt.s.w $f4, $f4		# convert $f4 to a single precission -> 5.0
		
		addiu $t0, $zero, 9		# $t0 <- 9
		mtc1 $t0, $f8			# $f8 <- $t0
		cvt.s.w $f8, $f8		# convert $f8 to a single precission -> 9.0
		
		div.s $f6, $f4, $f8		# $f6 <- ($f4 / $f8)
		mul.s $f0, $f0, $f6		# $f0 <- ($f0 * $f6)
		jr $ra				# Jump to "Main" with the results...  

Main:	addi $v0, $zero, 4		# service 4 -> print string
		la $a0, No1			
		syscall
		addi $v0, $zero, 6		# service 6 -> read float
		syscall	
		mov.s $f12, $f0		# $f12 <- $f0
		jal Celsius			# Call the procidure "Clesius"
		mov.s $f12, $f0		# $f12 <- $f0 

		addi $v0, $zero, 4		# service 4 -> print string
		la $a0, No2
		syscall
		addi $v0, $zero, 2		# service 2 -> print float
		mov.s $f20, $f0		# $f20 <- $f0 (the results from the procidure) 
		syscall

End:		nop					# The end ..			
