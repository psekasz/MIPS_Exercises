
		j Main			# jump to the "Main"
		
Duofunc:	mul $v0, $s0, $a0	# $v0 <- ($s0 * $a0)
		jr $ra			# go back 
		
Funct:		addi $sp, $sp, -16	# prep the sp for 4 words
		sw $ra, 0($sp)		# save the $ra in $sp	
		sw $s0, 4($sp)		# save the $s0 in $sp
		sw $a0, 8($sp)		# save the $a0 in $sp
		sw $s1, 12($sp)		# save the $s1 in $sp
		addi $s1, $s1, -1	# $s1 <- ($s1 - 1)
		add $t0, $a0, $a0	# $t0 <- $a0
		
Loop:	beq $s1, $zero, Endl	# if ($s1 == $zero) go to the "Endl"
		jal Duofunc		# call the "Duofunc" 
		add $s0, $zero, $v0	# $s0 <- $v0
		addi $s1, $s1, -1	# $s1 <- ($s1 -1)
		j Loop			# jump to the "Loop"
		
Endl:		lw $ra, 0($sp)		# restore the $ra
		lw $a0, 8($sp)		# restore the $a0
		lw $s1, 12($sp)		# restore the $s1
		addi $sp, $sp, 16	# restore the sp 
		jr $ra			# go back to "Main"
				
Main:		addi $s0, $zero, 5	# $s0 <- 5
		addi $s1, $zero, 7	# $s1 <- 7
		or $a0, $s0, $zero	# $a0 <- $s0
		or $a1, $s1, $zero	# $a1 <- $s1
		beq $s1, $zero, End	# if ($s1 == $zero) go to the "End"
		jal Funct		# call the "Funct"
		add $s0, $zero, $v0	# $s0 <- $v0
End:		nop			# End
		
