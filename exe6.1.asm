		.data			# after this we have data segment
Name:		.asciiz "architecture"	# symbols		
		.text			# after this we have text segment
		
		j Main			# jump to "Main"
		
Length:		addi $v0, $zero, 0	# $v0 <- 0

Loop:		add $t1, $a0, $v0 	# $t1 <- &s[n]
		lbu $t2, 0($t1)		# $t2 <- s[n]
		beq $t2, $zero, Endl	# if ($t2 == $zero) go to "End"
		addi $v0, $v0, 1	# $v0 <- $v0 + 1
		j Loop			# jump to "Loop"
		
Endl:		jr $ra			# go back

Main:		la $s0, Name		# $s0 <- &Name[0]
		or $a0, $zero, $s0 	# $a0 <- $s0
		jal Length		# call "Length"
		or $s1, $zero, $v0	# $s1 <- $v0
End:		nop			# END
