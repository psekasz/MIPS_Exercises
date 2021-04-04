			.data					# data place
const32:		.float 32.0			# float number 32.0
const5:		.float 5.0				# float number 5.0
const9:		.float 9.0				# float number 9.0
			.text					# code starting ..
		
			j Main				# Jump to "Main"
		
Celsius:		la $t0, const32		# $t0 <- the address with the float number (32.0)
			lwc1 $f4, 0($t0)		# $f4 <- $t0(32.0)
			sub.s $f0, $f12, $f4		# $f0 <- ($f12 - $f4)
			la $t0, const5			# $t0 <- the address with the float number (5.0)
			lwc1 $f4, 0($t0)		# $f4 <- $t0(5.0)
			lwc1 $f8, const9		# $f8 <- the address with the float number (9.0)
			div.s $f6, $f4, $f8		# $f6 <- ($f4 / $f8)
			mul.s $f0, $f0, $f6		# $f0 <- ($f0 * $f6)
			jr $ra 				# Jump to "Main" with the results in the $f0		

Main:		addiu $t0, $zero, 140	# $t0 <- 140 (temperature in fahreneit)
			mtc1 $t0, $f22		# transfer $t0 to coprocessor 1. $f22
			cvt.s.w $f12, $f22		# convert $f22 to a single precission
			jal Celsius				# Call the procidure "Celsius"
			mov.s $f20, $f0		# $f20 <- $f0 (the result from the procidure)
		
End:			nop					# The end ..
