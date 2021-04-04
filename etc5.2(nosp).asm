		j Main			# go to "Main"
Prod:		mul $v0, $a0, $a1	# $v0 <- ($a0 * $a1)
		jr $ra			# go back 
Main:		addi $s0, $zero, 10	# $s0 <- 10
		addi $s1, $zero, 12	# $s1 <- 12
		add $a0, $zero, $s0 	# $a0 <- $s0 
		add $a1, $zero, $s1 	# $a1 <- $s1
		jal Prod		# call the "Prod"
		add $s2, $zero, $v0	# $s2 <- $v0