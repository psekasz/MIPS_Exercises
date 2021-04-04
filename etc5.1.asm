		j Main			# go to "Main"
Prod:		addi $sp, $sp, -4 	# move $sp 1 word
		sw $s1, 0($sp)		# save the content of $s1
		mul $s1, $a0, $a1 	# $s1 <- $a0 * $a1
		add $v0, $zero, $s1	# #v0 <- $s1
		lw $s1, 0($sp)		# restore the $s1(..)
		addi $sp, $sp, 4 	# restore $sp
		jr $ra			# go back

Main:		addi $s0, $zero, 10	# $s0 <- 10
		addi $s1, $zero, 12	# $s1 <- 12
		add $a0, $zero, $s0	# $a0 <- 10
		add $a1, $zero, $s1	# $a1 <- 12
		jal Prod		# Call the "Prod"
		add $s2, $zero, $v0	# $s2 <- $zero + $v0 