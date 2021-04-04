			.data
msgBase:		.asciiz "Give base : "
msgExpo:		.asciiz "Give the exponent: "
msgRes:		.asciiz "The result is "
			.text
			
			j Main				# Jump to the label "Main"

Power:		addi $t0, $zero, 1 		# $t0 <- 1
			mtc1 $t0, $f4			# $f4 <- $t0
			cvt.s.w $f4, $f4		# $f4 -> 1.0
			mov.s $f0, $f4 		# $f0 <- $f4
			addu $t2, $zero, $a0	# $t2 <- $a0
			slt $t0, $a0, $zero		# if($a0 < $zero) the $t0 <- 1, if not $t0 <- 0 
			beq $t0, $zero, EndAbs	# if $t0 <- 0 the go to the label "EndAbs"
			nor $t2, $t2, $zero		# supplement - > 1
			addiu $t2, $t2, 1		# $t2 <- ($t2 + 1) supplement -> 2
EndAbs: 		addi $t1, $zero, 0		# $t1 <- 0
ForLoop:		slt $t0, $t1, $t2		# if($t1 < $t2) then %t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndFor	# if($t0 == $zero) then jump to Label "EndFor"
			mul.s $f0, $f0, $f12	# $f0 <- ($f0 * $f12)
			addi $t1, $t1, 1		# $t1 <- ($t1 + 1)
			j ForLoop				# Jump to label "ForLoop"
EndFor:		slt $t0, $a0, $zero 		# if($a0 < $zero) then $t0 <- 1, if not $t0 <-0 
			beq $t0, $zero, End	# if($t0 == $zero) then go to label "End"
			div.s $f0, $f4, $f0		# $f0 <- ($f4 / $f0)
End:			jr $ra				

######### MAIN FUNCTION ######################																		
Main:		addi $v0, $zero, 4		# service 4 -> print string
			la $a0, msgBase		# $a0 <- msgBase("Give base: ")			
			syscall
			addi $v0, $zero, 6		# service 6 -> read float
			syscall 
			mov.s $f12, $f0		# $f12 <- $f0
			addi $v0, $zero, 4		# service 4 -> print string
			la $a0, msgExpo		# $a0 <- msgExpo("Give the exponent: ")
			syscall
			addi $v0, $zero, 5		# service 5 -> read intiger
			syscall
			add $a0, $zero, $v0	# $a0 <- $v0
			jal Power
			
			addi $v0, $zero, 4		# service 4 -> print sreen
			la $a0, msgRes
			syscall
			addi $v0, $zero, 2		# service 2 -> print float
			mov.s $f12, $f0 		# $f12 <- $f0
			syscall
			
EndP:		nop					# The end of program