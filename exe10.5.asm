			j Main				# Jump to Main funtion
			
Function2:	beq $a0, 0, Ifits0Loop	# if ($a0 == 1)	
			beq $a0, 1, Endfu		# if($a0 == 1)
			addi $a0, $a0, -1 		# $a0 <- ($a0 - 1)
			mul.s $f0, $f0, $f12	# $f0 <- ($f0 * $f12)
			j Function2			# Jump to label "Function2"
			
			# The result is "1" because we have exponent equal zero !
			
Ifits0Loop:	div.s $f0, $f12, $f12	# $f0 <- 1 = ($f12 / $f12)
			
Endfu:		jr $ra				# Go back where you are with the results
			
Base:		addi $t4, $zero, 0		# $t4 <- 0 		
			mtc1 $t4, $f4			# $f4 <- 0
			cvt.s.w $f4, $f4		# 0 -> 0.0
			add.s $f0, $f4, $f4		# $f0 <- $f4(0.0)
			add.s $f0, $f0, $f12		# $f0 <- $f12(Base)	

StackPointer:	addi $sp, $sp, -16		# prepare the stack pointer for three words
			sw $ra, 0($sp)			# save the $ra to the stack pointer
			sw $t0, 4($sp)			# save the $t0 to the stack pointer
			sw $a0, 8($sp)			# save the $a0 to the stack pointer 
			swc1 $f12, 12($sp)		# save the $f12 to the stack pointer

			jal Function2			# Call the function with label "Function2"			
			
RestoreSp:	lw $ra, 0($sp)			# restore the $sp
			lw $t0, 4($sp)			# . . . 
			lw $a0, 8($sp)			# . . .
			lwc1 $f12, 12($sp)		# . . .
			addi $sp, $sp, 16		# . . .
			 
Endw:		jr $ra				# Go back to "Main" with results in $f0			
						
Main:		addi $t0, $zero, 5		# $t0 <- 5
			mtc1 $t0, $f20		# $f20 <- $t0
			cvt.s.w $f20, $f20		# 5 -> (5. 0)
			mov.s $f12, $f20		# $f12 <- $f20
			addi $a0, $zero, 7		# $t0 <- 7
			
			jal Base				# Call the function "Base"
			
			mov.s $f24, $f0		# $f24 <- $f0(The results from function "Function2")
		
End:			nop					# The end of program.
		

