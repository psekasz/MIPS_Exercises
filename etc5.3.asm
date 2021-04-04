		j Main			# jump to "Main"
		
Prod:	mul $v0, $a0, $a1	# $v0 <- ($a0 * $a1)
		jr $ra			# go back
Factorial:	addi $sp, $sp, -16	# prep the $sp // save 4 words 
		
		sw $ra, 0($sp)		# save $ra in $sp
		sw $a0, 4($sp)		# save the $a0 in $sp
		sw $s0, 8($sp)		# save the $s0 in $sp
		sw $s1, 12 ($sp)	# save the $s1 in $sp
		addi $s1, $zero, 1	# $s1, <- 1
		addi $s0, $zero, 2	# $s1 <- 2
		
Loop:	slt $t0, $a0, $s0	# if ($a0 < $s0) then $t0 <- 1, if not $t0 <- 0
		bne $t0, $zero, Endfor 	# if ($t0 == $zero) go to "Endfor"
		add $a0, $zero, $s1	# $a0 <- $s1
		add $a1, $zero, $s0 	# $a1 <- $s0
		jal Prod		# call the "Prod"
		add $s1, $zero, $v0	# $s1 <- $v0
		addi $s0, $s0, 1	# $s0 <- $s0 + 1
		lw $a0, 4($sp)		# restore the $a0 from the $sp
		j Loop			# jump to "Loop"
		
Endfor:	lw $ra, 0($sp)		# restore the $ra from the $sp	
		lw $s0, 8($sp)		# restore the $s0 from the $sp
		lw $s1, 12($sp)	# restore the $s1 from the $sp
		add $sp, $sp, 16	# restore the stack pointer
		jr $ra			# go back
		
Main:	addi $s0, $zero, 7	# $s0 <- 7
		or $a0, $zero, $s0	# $a0 <- $s0
		jal Factorial		# call the "Fuctorial"
		add $s1, $zero, $v0	# $s1 <- $v0		
End:		nop					# The end of the function
