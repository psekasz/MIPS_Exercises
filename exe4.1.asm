		addi $s0, $zero, 50	# $s0 <- 50
		addi $s1, $zero, 70	# $s1 <- 70
		addi $s2, $zero, 60	# $s2 <- 60
		slt $t0, $s2, $s0	# if ($s2 < $s0) then $t0 <- 1, if not $t0 <- 0
		slt $t1, $s1, $s2	# if ($s1 < $s2) then $t1 <- 1, if not $t1 <- 0
		bne $t0, $zero, Exit	# if ($t0 != $zero) then go to label "Exit"
		bne $t0, $t1, Exit	# if ($t0 == $t1) then go to label "Exit"
		add $t2, $s0, $s1	# $t2 <- $s0 + $s1
		sll $t2, $t2, 3        #  $t3 <- ($t2 << 3)
Exit:		nop 			# End
