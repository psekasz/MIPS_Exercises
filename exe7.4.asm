			j Main			# Jump to label "Main"

Volume:			addi $v0, $zero, 0	# $v0 <- 0
			slt $t0, $zero, $a0 	# if ($zero < $a0) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, Endl	# if ($t0 == $zero) then go to label "Endl"
			slt $t1, $zero, $a1 	# if ($zero < $a1) then $t1 <- 1, if not $t1 <- 0
			beq $t1, $zero, Endl	# if ($t1 == $zero) the go to labe; "Endl"
			slt $t2, $zero, $a2	# if ($zero < $a2) then $t2 <- 1, if not $t2 <- 0
			beq $t2, $zero, Endl	# if ($t2 == $zero) then go to label "Endl"
			multu $a0, $a1		# $a0 * $a1
			mflo $v0		# $v0 <- ($a0 * $a1)
			multu $v0, $a2		# $v0 * $a2
			mflo $v0		# $v0 <- ($v0 * $a2)
Endl:			jr $ra			# go back to "Main"						
									
			
			
Main:			addi $s0, $zero, 5	# $s0 <- 5
			addi $s1, $zero, 6	# $s1 <- 6
			addi $s2, $zero, 7	# $s2 <- 7
			or $a0, $zero, $s0	# $a0 <- $s0
			or $a1, $zero, $s1	# $a1 <- $s1
			or $a2, $zero, $s2	# $a2 <- $s1=2
			jal Volume		# Call the fucntion "Volume"
			add $s3, $zero, $v0	# $s3 <- $v0

End:			nop			# The end .. 
				