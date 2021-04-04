			j Main				# Jump to label "Main"
			
SpecialSum:		addi $t9, $zero, 3		# $t9 <- 3
			addi $v0, $zero, 0		# $v0 <- 0	
ForLoop:		slt $t0, $a1, $a0		# if ($a1 < $a0) then $t0 <- 1, if not $t0 <- 0		
			bne $t0, $zero, Endf		# if ($t0 != 0) then go to label "Endf"
		        addi $a0, $a0, 1		# $a0 <- +1
		        div $a0, $t9			# div
		        mfhi $t5			# $t5 <- ($a0 / $t9)
		        bne $t5, $zero, ForLoop		# if ($t5 != $zero) go to label "ForLoop"
		        add $v0, $v0, $a0		# $v0 <- ($v0 + $a0)  
		        j ForLoop			# jump to label "ForLoop"

Endf:			jr $ra				# go back where you come 			
									
Main:			addi $s0, $zero, 5		# $s0 <- 5
			addi $s1, $zero, 27		# $s1 <- 27
			or $a0, $zero, $s0		# $a0 <- $s0
			or $a1, $zero, $s1		# $a1 <- $s1
			jal SpecialSum			# jump to label "SpecialSum"
			add $s3, $zero, $v0		# $s3 <- $v0
			
End:			nop				# this is the end of Main function			