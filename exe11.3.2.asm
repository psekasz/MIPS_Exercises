			.data
msgBase:		.asciiz "Give base : "
msgExpo:		.asciiz "Give the exponent: "
msgRes:		.asciiz "The result is: "
			.text
			
			j Main				# Jump to the label "Main"

################################################

Power:		addi $sp, $sp, -8		# prepare the $sp for 2 words
			sw $ra, 4($sp)			# sp <- $ra
			sw $a0, 0($sp)			# sp <- $a0
			bne $a0, $zero, L1		# if($a0 != $zero) go to label "L1"
			addiu $t0, $zero, 1		# $t0 <- 1
			mtc1 $t0, $f0 			# $f0 <- $t0
			cvt.s.w $f0, $f0		# $f0 -> 1.0
			j Exit				# jump to label "Exit"	
			
L1:			slt $t0, $zero, $a0		# if($zero < $a0) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, L2		# if($t0 == $zero) the go to label "L2"
			addi $a0, $a0, -1		# $a0 <- ($a0 - 1)
			jal Power				# call  the function with label "Power"
			mul.s $f0, $f0, $f12	# $f0 <- ($f0 * $f12)
			j Exit				# Jump to the label "Exit"
			
L2:			addi $a0, $a0, 1		# $a1 <- ($a0 + 1)
			jal Power				# Call the function with label "Power"
			div.s $f0, $f0, $f12		# $f0 <- ($f0 / $f12)
			
Exit:			lw $ra, 4($sp)			# restore the stack pointer
			lw $a0, 0($sp)			# . . . 
			addi $sp, $sp, 8		# . . .
			jr $ra				# go back to "Main"

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
