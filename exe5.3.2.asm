		j Main			# jump to the "Main"
		
Secfunct:	srl $a0, $a0, 1		# shift right logic $a0 <- $a0 >> 1
		addi $v0, $s1, 1	# $s1 <- $s1 + 1 	
		jr $ra			# go back to the "Funct"
		
						
Funct:		addi $sp, $sp, -12	# prep the $sp for 3 words
		sw $ra, 0($sp)		# save the $ra in $sp
		sw $a0, 4($sp)		# save the $a0 in $sp
		sw $s1, 8($sp)		# save the $s1 in $sp
		slt $t0, $a0, $zero	# if ($a0 < $zero) then $t0 <- 1, if not $t0 <- 0 
		nor $a0, $a0, $zero	# logic (nor) 1 -> 0, 0 -> 1
		addi $s1, $s1 ,1	# $s0 <- $s0 + 1

		
Loop:		beq $t0, $zero, Endl	# if ($t0 == $zero) go to the "Endl"		
		jal Secfunct		# call the "Secfunct"
		add $s1, $zero, $v0	# $s1 <- $v0
		slt $t0, $zero, $a0	# if ($zero < $a0) then $t0 <- 1, if not $t0 <- 0 
		j Loop			# jump to the "Loop"
		
Endl: 		lw $ra, 0($sp)		# restore the $ra	
		lw $a0, 4($sp)		# restore the $a0
		add $sp, $sp, 12	# restore the stack pointer
		jr $ra			# jump to the "Main"
		
Main:		addi $s0, $zero, -357	# $s0 <- -357	
		or $a0, $zero, $s0	# $a0 <- $s0
		jal Funct		# jump to the "Funct"
		add $s1, $zero, $v0	# $s1 <- $s1
End:		nop			# the END..
