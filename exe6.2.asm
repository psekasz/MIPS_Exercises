		.data			# after this we have data segment
Name:		.asciiz "architecture"	# symbols	
Forif:		.asciiz "e"		
		.text			# after this we have text segment


		
		j Main			# jump to "Main"
		
Funct:		addi $v0, $zero, 0	# $t0 <- 0 {n}
		addi $v1, $zero, 0 	# $t1 <- 0 {k}
		lbu $t3, 0($a1)		# $t3 <- "e"

Loop:		add $t1, $a0, $v0 	# $t1 <- &s[n]
		lbu $t2, 0($t1)		# $t2 <- s[n]
		beq $t2, $zero, Endl	# if ($t2 == $zero) go to "End"	
		addi $v0, $v0, 1	# $v0 <- $v0 + 1
		bne $t3, $t2, Loop
		addi $v1, $v1, 1	# $v1 <- 1
		j Loop			# jump to "Loop"
		
Endl:		jr $ra			# go 

Main:		la $s0, Name		# $s0 <- &Name[0]
		la $s1, Forif		# $s1 <- &Forif
		or $a0, $zero, $s0	# $a0 <- $s0
		or $a1, $zero, $s1	# $a1 <- $s1
		jal Funct		# jump to "Funct"
		add $s3, $zero, $v1	# $s3 <- $v1
End:		nop			# End 
