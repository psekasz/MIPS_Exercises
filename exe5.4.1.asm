		addi $s0, $zero, 5	# $s0 <- 5
		addi $s1, $zero,  7	# $s1 <- 7
		beq $s1, $zero, End	# if ($s1 == $zero) go to the "End"
		addi $s1, $s1, -1	# $s1 <- ($s1 - 1)       					
		add $t0, $zero, $s0 	# $t0 <- $s0
		
Loop:	beq $s1, $zero, End	# if ($s1 == $zero) go to the "End"
		mul $s0, $s0, $t0	# $s0 <- ($s0 * $t0)   
		addi $s1, $s1, -1	# $s1 <- ($s1 -1)
		j Loop			# jump to the "Loop"
		
End:		nop			# End
