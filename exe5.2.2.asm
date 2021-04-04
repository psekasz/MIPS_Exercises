		j Main 			# jump to the "Main"
		
Secfunct:	srl $a0, $a0, 1		# shift right logic $a0 <- $a0 >> 1
		beq $a0, $zero, Endl 	# if ($a0 == $zero) go to the "Endl"
		addi $v0, $s1, 1	# $v0 <- $s1 + 1
		jr $ra			# go back to "Funct"
		
Funct:		addi $sp, $sp, -12	# prep the $sp for 3 words
		sw $ra, 0($sp)		# save the $ra in $sp	
		sw $a0, 4($sp)		# save the $a0 in $sp
		sw $s1, 8($sp)		# save the $s1 in $sp
		addi $s1, $zero, 1	# $s0(y) <- 1
		
Loop:		beq $a0, $zero, Endl	# if ($a0 == $zero) then go to the "Endl"
		jal Secfunct		# call the "Secfunct"
		add $s1, $zero, $v0	# $s1 <- $v0
		j Loop			# jump to the "Loop"		
		
		
Endl:		lw $ra, 0($sp)		# restore the $ra
		lw $a0, 4($sp)		# restore the $a0
		add $sp, $sp, 12	# restore the stack pointer
		jr $ra			# go back
				
		
Main:		addi $s0, $zero, 357	# $s0 <- 357
		or $a0, $zero, $s0	# $a0 <- ($zero + $s0)
		jal Funct		# go to the "Funct"
		add $s1, $zero, $v0 	# $s1 <- $s1
