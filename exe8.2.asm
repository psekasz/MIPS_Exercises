			j Main				# Jump to "Main"
			
Mips:			addi $t9, $zero, 5		# $t9 <- 5
			addi $v0, $zero, 0		# $v0 <- 0
				
Loop:			div $a0, $t9			# div
			mfhi $t0			# $t0 <- ($a0 / $t9)
			beq $t0, $zero, Loop2		# if ($t0 == $zero) the go to label "Loop2"
			addi $a0, $a0, 1		# $a0 <- ($a0 +1)
			j Loop				# Jump to "Loop"
			
Loop2:			slt $t1, $a1, $a0		# if ($a1 < $a0) then $t1 <- 1, if not $t1 <- 0
			bne $t1, $zero, Endl		# if ($t1 != 0) then go to label "Endl"
			add $v0, $v0, $a0		# $v0 <- ($v0 + $a0)
			addi $a0, $a0, 5		# $a0 <- ($a0 +5)
			j Loop2				# jump to "Loop2"
			
Endl:			jr $ra				# go back to "Main"						
			
Main:			addi $s0, $zero, 3		# $s0 <- 3
			addi $s1, $zero, 32		# $s1 <- 32
			or $a0, $zero, $s0		# $a0 <- $s0
			or $a1, $zero, $s1		# $a1 <- $s1
			jal Mips			# Call the "Mips"
			add $s2, $zero, $v0		# $s2 <- $v0
End:			nop				# The end ..