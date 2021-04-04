		addi $s0, $zero, 0	# $s0 <- 0
		addi $s1, $zero, 7	# $s1 <- 7
		bne $s0, $s1, Else 	# if ($s0 != $s1) then go to "Else" 
		or $s2, $zero, $s1	# $s2 <- ($zero + $s1)
		j Endif
Else:		add $s2, $zero, $s0	# $s2 <- ($zero + $s0)
Endif:					# End if
