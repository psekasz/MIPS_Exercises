		addi $s0, $zero, 0	# $s0 <- 0
		addi $s1, $zero, 7 	# $s1 <- 7
		slt $t0, $s0, $s1 	# if ($s0 < $s1) then $t0 <- 1, if not $t0 <- 0
		beq $t0, $zero, Else 	# if ($t0 == $zero) then go to "Else"
		or $s2, $zero, $s1	# $s2 <- ($zero + $s1)
		j Endif
Else:		add $s2, $zero, $s0	# $s2 <- ($zero + $s0)
Endif:		nop			# end if