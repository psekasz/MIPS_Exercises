		and $s6, $s6, $zero	# $s6 <- 0 
		addi $s5, $zero, 1	# $s5 <- 1
		addi $t0, $zero, 100 	# $t0 <- 100 
Loop:		slt $t1, $t0, $s5	# if ($t0 < $5) then $t1 <- 1, if not $t1 <- 0
		bne $t1, $zero, Exit	# if ($t1 == $zero) then go to "Exit"
		add $s6, $s6, $s5	# $s6 <- ($s6 + $5)
		addi $s5, $s5, 1	# $s5 <- ($5 + 1)
		j Loop			# Jump to label "Loop"
Exit:		nop 			# End  		 