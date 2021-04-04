		j Main				# Jump to Main funtion
		
Ekth:	addi $t4, $zero, 0		# $t4 <- 0
		mtc1 $t4, $f4			# $f4 <- $t4
		cvt.s.w $f4, $f4		# 0 -> 0.0
		add.s $f0, $f4, $f4		# $f0 <- $f4(0)
		add.s $f0, $f0, $f12		# $f0 <- $f12(Base)	
		beq $a0, 0, End1		# if ($a0 == 1)
		slt $t0, $a0, $zero		# if($a0 < $zero) then $t0 <- 1, if  not $t0 <- 0
		beq $t0, 1, Neg		# if($t0 == 1) the go to label "Neg"
			
Loop:	beq $a0, 1, Endw		# if($a0 == 1) the go to label "Endw"
		addi $a0, $a0, -1 		# $a0 <- ($a0 - 1)
		mul.s $f0, $f0, $f12	# $f0 <- ($f0 * $f12)
		j Loop				# Jump to label "Loop"
		
End1: 	div.s $f0, $f12, $f12	# $f0 <- 1($f12 / $f12)
Endw:	jr $ra				# Go back to "Main" with results in $f0		

Neg:		beq $a0, -1, Endw		# if($a0 == -1) go to label "Endw"
		addi $a0, $a0, 1		# $a0 <- ($a0 +1)
		div.s $f0, $f0, $f12		# $f0 <- ($f0 / $f12)
		j Neg				# jump to label "Neg"
						
Main:	addi $t0, $zero, 5		# $t0 <- 5
		mtc1 $t0, $f20		# $f20 <- $t0
		cvt.s.w $f20, $f20		# 5 -> (5. 0)
		mov.s $f12, $f20		# $f12 <- $f20
		addi $a0, $zero, -7		# $t0 <- 7
		jal Ekth				# Call the function "Ekth"
		mov.s $f24, $f0		# $f24 <- $f0(The results from function "Ekth")
		
End:		nop					# The end of program.
		

