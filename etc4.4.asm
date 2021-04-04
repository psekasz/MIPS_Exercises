		addi $s0, $zero, 7	# $s0 <- 3
		addi $s1, $zero, 10	# $s1 <- 10
		addi $t0, $zero, 6	# $t0 <- 6 (for use "if")
		slt $t1, $t0, $s0	# if ( $t0(6) < $s0) then $t1 <- 1, if not $t1 <- 0
		beq $t1, $zero, Exit	# if ($t1 == $zero) then go to "Exit"
		sll $s1, $s0, 3		# $s1 <- ($s0 << 3)
		
Exit:		nop 			# end if