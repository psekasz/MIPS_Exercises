			j Main			# jump to "Main"
			
Maxi:			slt $t0, $a1, $a0	# if ($a1 < $a0) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, Else	# if ($t0 == $zero) then go to "Else"
			or $v0, $zero, $a0	# $v0 <- $a0
			j Endor			# jump to label "Endor"	
Else:			or $v0, $zero, $a1	# $v0 <- $a1

Endor:			jr $ra			# go back to "Main"			
			
Main:			addi $s0, $zero, 3	# $s0 <- 3 
			addi $s1, $zero, 5	# $s1 <- 5
			addi $s2, $zero, 4	# $s2 <- 4
			or $a0, $zero, $s0	# $a0 <- $s0
			or $a1, $zero, $s1 	# $a1 <- $s1
			jal Maxi		# Call the function "Maxi"
			add $a0, $zero, $v0	# $a0 <- $v0
			or $a1, $zero, $s2	# $a1 <- $s2
			jal Maxi		# Call again the function "Maxi"
			add $s3, $zero, $v0	# $s3 <- $v0
			
End:			nop			# End ..
			
