			j Main 			# jump to "Main"

Per:			slt $t0, $zero, $a0 	# if ($zero < $a0) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, Endl	# if ($zero == $t0) jump to label "Endl"
			slt $t1, $zero, $a1	# if ($zero < $a1) the $t1 <- 1, if not $t1 <- 0
			beq $t1, $zero, Endl	# if ($zero == $t1) jump to label "Endl"
			sll $a0, $a0, 1	 	# $a0 <- shift left logic (* 2) 
			sll $a1, $a1, 1		# $a1 <- shift left logic (* 2) 
			add $v0, $a1, $a0	# $v0 <- ($a1 + $a0)
			jr $ra			# go back to "Main"
			
Endl:			jr $ra			# go back to "Main"			
			
Main:			addi $s0, $zero, 4	# $s0 <- 4
			addi $s1, $zero, 10	# $s1 <- 10
			or $a0, $zero, $s0	# $a0 <- $s0(4)
			or $a1, $zero, $s1	# $a1 <- $s1(10)
			jal Per			# jump to "Per"
			add $s2, $zero, $v0 	# add $s2 <- $v0
End:			nop			# end ..	