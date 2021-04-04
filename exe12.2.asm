			.data 
Prt1:			.asciiz "Give a number: "
Res1:		.asciiz "The factorial is: "
Res2:		.asciiz "\nThe sum of factorials: "
Mess:		.asciiz "\n The sum of factorials until 5 is: "
			.text
			
			j Main				# jump to label "Main"
Par5:		and $t9, $zero, $a1	# $t9 <- 0 		(i)
			addi $t8, $zero, 1		# $t8 <- 1		(fac)
			or $t7, $zero, $t9		# $t7 <- 0		(count)
			addi $t5, $zero, 5		# $t5 <- 5
			
Loop2:		slt $t0, $t9, $t5		# if ($t9 < $t5) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndL2	# if($t0 == $zero) then go to label "EndL2"
			slt $t0, $t9, $a1 		# if($t9 < $a1) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndL2	# if($t0 == $zero) then go to label "EndL2"
			addi $t7, $t7, 1		# $t7 <- ($t7 + 1)
			mul $t8, $t8, $t7		# $t8 <- ($t8 * $t7)
			add $a2, $a2, $t8		# $a2 <- ($a2 + $t8)
			addi $t9, $t9, 1		# $t9 <- ($t9 + 1)
			j Loop2				# jump to label "Loop"

EndL2:		add $a1, $zero, $t8	# $a1 <- $t8
			jr $ra				# go back to Main
				
########################################################

			
Ath_Par:		add $a2, $a2, $t8		# $a2 <- ($a2 + $t8)
			jr $ra
			
Par:			and $t9, $zero, $a1	# $t9 <- 0 		
			addi $t8, $zero, 1		# $t8 <- 1		
			or $t7, $zero, $t9		# $t7 <- 0		
			addi $sp, $sp, -12		# prepare the stack pointer for 3 words
			sw $ra, 0($sp)			# sp <- $ra
			sw $t8, 4($sp)			# . . . 
			sw $a2, 8($sp)			# . . .
			 			
Loop:		slt $t0, $t9, $a1 		# if($t9 < $a1) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndL	# if($t0 == $zero) then go to label "EndL"
			addi $t7, $t7, 1		# $t7 <- ($t7 + 1)
			mul $t8, $t8, $t7		# $t8 <- ($t8 * $t7)
			jal Ath_Par			# Call the function with label "Ath_Par')
			addi $t9, $t9, 1		# $t9 <- ($t9 + 1)
			add $a1, $zero, $v0	# $a1 <- $v0
			j Loop				# jump to label "Loop"

EndL:		lw $ra, 0($sp)			# restore the sp
			addi $sp, $sp, 12		# . . . 		
			add $t7, $zero, $a1		
			jr $ra				# go back to Main											

		# 	MAIN FUNCTION		#	
				
Main:		addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Prt1			
			syscall
			addi $v0, $zero, 5		# service 5 -> read intiger
			syscall
			add $s0, $zero, $v0	# $s0 <- $v0
			add $a1, $zero, $s0	# $a1 <- $s0
			addi $s1, $zero, 0		# $s1 <- 0
			and $a2, $zero, $s1 	# $a2 <- $s1
			jal Par				# Call the function with label "Par"
			
			addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Res1			
			syscall
			addi $v0, $zero, 1		# service 1 -> print intiger
			add $a0, $zero, $t8	# $a0 <- $t8
			syscall
			addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Res2			
			syscall
			addi $v0, $zero, 1		# service 1 -> print intiger
			add $a0, $zero, $a2	# $a0 <- $a2 
			syscall	
			or $a1, $zero, $s0		# $a1 <- $s0
			or $a2, $zero, $s1		# $a2 <- $s1
			jal Par5				# call the function witj label "Par5"
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Mess			
			syscall				# system call
			ori $v0, $zero, 1  		#service 1 -> print intiger
			add $a0, $zero, $a2	# $a0 <- $a2
			syscall
			
End:			nop					# The end of program
