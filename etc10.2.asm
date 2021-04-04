		.data				# data place
Pi:		.double 3.1415926535897932	# double pr number 3.14..
		.text				# code starting ..
		
		j Main				# Jump to "Main"
		
Emvadon:	la $t0, Pi			# load the 3.1415....
		ldc1 $f0, 0($t0)		# load double word for coprocessor
		mul.d $f0, $f0, $f12		# $f0/$f1 <- ($f0/$f1 * $f12/$f13)
		mul.d $f0, $f0, $f12		# $f0/$f1 <- ($f0/$f1 * $f12/$f13)
		jr $ra				# Go back to "Main" with the resurlts
		
Main:		addiu $t0, $zero, 10		# $t0 <- 10(rad)
		mtc1 $t0, $f22			# transfer $t0 to coprocessor 1. $f22
		cvt.d.w $f22, $f22		# conver $f12 to a double precission
		mov.d $f12, $f22
		jal Emvadon			# Call the procidure "Emvadon"
		mov.d $f20, $f0			# $f20 <- $f0/$f1 (the results for the procidure)

End:		nop				# The end ..		 
		
