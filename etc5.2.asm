		j Main			# jump to "Main"
Greatest:	slt $t0, $a1, $a0	# if ($a1 < $a0) then $t0 <- 1, if not $t0 <- 0
		beq $t0, $zero, Else	# if ($t0 == $zero) then go to "Else"
		or $v0, $zero, $a0	# $v0 <- $a0 ($s0(10))
		j If2			# jump to If2
Else:		or $v0, $zero, $a1 	# $v0 <- $a1($s1(13))
If2:		slt $t0, $v0, $a2	# if ($v0 < $a2) then $t0 <- 1, if not $t0 <- 0
		beq $t0, $zero, End	# if ($t0 == $zero) go to "End"
		or $v0, $zero, $a2 	# $v0 <- ($zero + $a2)
End:		jr $ra			# go back from where you are
Main:		addi $s0, $zero, 10	# $s0 <- 10
		addi $s1, $zero, 13	# $s1 <- 13
		addi $s2, $zero, 18	# $s2 <- 18
		add $a0, $zero, $s0	# $a0 <- $s0
		add $a1, $zero, $s1	# $a1 <- $s1
		add $a2, $zero, $s2	# $a2 <- $s2
		jal Greatest		# call the "Greatest"
		add $s3, $zero, $v0	# $s3 <- $v0	
