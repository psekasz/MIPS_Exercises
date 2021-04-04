		addi $s0, $zero, 5 	# $s0 <- 5
		addi $s1, $zero, 7	# $s1 <- 7
		slt $t0, $s1, $s0	# if ($s1 < $s0) then $t0 <- 1 if not $t0 <- 0
		bne $t0, $zero, Else	# if ($t0 == $zero) then go to "Else"
		addi $s2, $s1, 2	# $s2 <- $s1 + 27
		j Endif
Else: 		addi $s2, $s0, -3	# $2 <- $s0 - 3
Endif:		nop			# end if