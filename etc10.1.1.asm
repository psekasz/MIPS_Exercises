		j Main 			# Jump to "Main"
			
Celsius:	addiu $t0, $zero, 32	# $t0 <- 32
		mtc1 $t0, $f4		# transfer $t0 to coprocessor 1. $f4
		cvt.s.w $f4, $f4	# convert $f4 to a single precession
		sub.s $f0, $f12, $f4	# $f0 <- $f12 - $f4 (32.0)
		
		addiu $t0, $zero, 5	# $t0 <- 5
		mtc1 $t0, $f4		# tranfer $t0 to coprocessor 1. $f4
		cvt.s.w $f4, $f4	# convert $f4 to a single precission
		
		addiu $t0, $zero, 9	# $t0 <- 9
		mtc1 $t0, $f8		# transfer $t0 to coprocessor 1. $f8
		cvt.s.w $f8, $f8	# convert $f8 to a single precission
		
		div.s $f6, $f4, $f8	# $f6 <- ($f4 / $f8)
		mul.s $f0, $f0, $f6	# $f0 <- $f0 * $f6)
		jr $ra			# Jump to "Main" with the results...  

Main:		addiu $t0, $zero, 100	# $t0 <- (temperatiure 140)
		mtc1 $t0, $f22		# transfer $t0 to coprocessor 1. $f22 (binary part)
		cvt.s.w $f22, $f22	# convert $f22 to a single precission
		mov.s $f12, $f22	# $f12 <- $f22 (for use in the procidure)
		jal Celsius		# Call the procidure "Clesius"
		mov.s $f20, $f0		# $f20 <- $f0 (the results from the procidure) 

End:		nop			# Th end ..			
