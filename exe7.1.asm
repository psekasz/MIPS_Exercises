			j Main			# Jump to label "Main"
			
Spesum:			beq $a0, $a1, Else	# if ($a0 == $a1) go to label "Else  
			add $v0, $a0, $a1	# $v0 <- ($a0 + $a1)
			srl $v0, $v0, 1		# $v0 <- shift right logic (/2)
			j Endl			# jump to label "Endl"
						
Else:			sub $v0, $a0, $a1	# $v0 <- ($a0 - $a1)
			sll $v0, $v0, 1		# $v0 <- shift lefft logic (*2)
Endl:			jr $ra			# go back to "Main"		
			
			
Main:			addi $s0, $zero, 5	# $s0 <- 5
			addi $s1, $zero, 9	# $s1 <- 9
			or $a0, $zero, $s0	# $a0 <- $s0
			or $a1, $zero, $s1	# a1 <- $s1
			jal Spesum		# Jump to label "Spesum"
			or $s2, $zero, $v0 	# $s2 <- $v0
End:			nop			# The end ..