			.data					# from here we declare data
Array1:		.word 11, 12, 13, 14, 15, 16, 17, 18, 19, 20
Array2:		.word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0		
Array3:		.space 40
Array4:		.word 10
			.text
			
			j Main				# Jump to label "Main"
			
PrintArr:		addu $t0, $zero, $a0	# start of the table
			and $t1, $zero, $t1		# start the counter
			
Loop:		slt $t2, $t1 ,$a1		# if($t1 < $a1) then $t2 <- 1, if not $t2 <- 0
			beq $t2, $zero, EndL	# if($t2 == $zero) then go to label "EndL"
			addiu $v0, $zero, 1		# service 1 -> print intiger
			sll $t2, $t1, 2			# $t2 <- ($t1 << 2)	
			addu $t3, $t0, $t2 		# $t3 <- ($t0 + $t2)
			lw $a0, 0($t3)			# $a0 take the next .
			syscall				
			addi $t1, $t1, 1		# $t1 <- ($t1 +1)
			addiu $v0, $zero, 11 	# service 11 -> print char
			addiu $a0, $zero, 32	#$a0 <- the empty character
			syscall
			j Loop				# Jump to label "Loop"
			
EndL:		addiu $v0, $zero, 11	# service 11 -> print char
			addiu $a0, $zero, 10 	# $a0 <- character for new line
			syscall
EndL1:		jr $ra

			# 2nd TABLE ---------------------------------------		

RandArr:		addu $t0, $zero, $a0 	# start of the table
			addu $t4, $zero, $a1	# hosts
			and $t1, $zero, $t1		# $t1 <- 0
			
Loop2:		slt $t2, $t1, $t4		# if($t1 < $t4) then $t2 <- 1, if not $t2 <- 0
			beq $t2, $zero, EndL2	# if ($t2 == $zero) then go to label "EndL2"
			addiu $v0, $zero, 42	# service 42 -> random intiger range
			addiu $a0, $zero, 50	# for numbers between [0, 50]
			syscall
			sll $t2, $t1, 2			# $t2 <- ($t1 << 1)
			addu $t3, $t0, $t2		# the address of the next 
			addiu $a0, $a0, 30		# $a0 <- ($a0 +30) that means i will go to [30, 80]
			sw $a0, 0($t3)			# $a0 in table
			#syscall
			addi $t1, $t1, 1 		# $t1 <- ($t1 + 1)
			j Loop2				# Jump to label "Loop2"
EndL2:		jr $ra

			# 3rd TABLE -----------------------------------------
SumArr:		and $t0, $zero, $t0		# $t0 <- 0  <- this is my counter

Loop3:		slt $t1, $t0, $a3		# if($t1 < $a3) then $t1 <- 1, if not $t1 <- 0
			beq $t1, $zero, EndL3	# if($t1 == $zero) the jump to label "EndL3"	
			sll $t1, $t0, 2			# $t1 <- ($t0 << 2)
			addu $t2, $a1, $t1		# $t2 <- ($a1 + $t1) -> address element  Array1[i]
			lw $t3, 0($t2)			# $t3 <- the element from Array1[i]
			addu $t2, $a2, $t1		# $t2 <- ($a2 + $t1) -> address element  Array2[i]
			lw $t4, 0($t2)			# $t4 <- the element from Array2[i]
			add $s5, $t3, $t4		# $t5 <- ($t3 + $t4) the sum of Array1[i] + Array2[i]
			addu $t2, $a0, $t1		# address for Array3[i]
			sw $t5, 0($t2)			# save the sum in the address of table Array3[i]
			addi $t0, $t0, 1 		# $t0 <- ($t0 + 1) counter +1
			j Loop3				# Jump to label "Loop3"

EndL3:		jr $ra

######### MAIN FUNCTION ##############	

Main:		la $a0, Array1			# 1st $a0 <- Array1
			addiu $a1, $zero, 10	# 2nd
			jal PrintArr			# Call the funtion with label "PrintArr"
			
			la $a0, Array2			# 1st $a0 <- Array2
			addiu $a1, $zero, 10	# 2nd
			jal RandArr			# Call the function with label "RandArr"
			
			la $a0, Array2			# 1st $a0 <- Array2
			addiu $a1, $zero, 10	# 2nd
			jal PrintArr			# Call the function with label "PrintArr"
			
			la $a0, Array3 		# 1st $a0 <- Array3
			la $a1, Array1			# 2nd $a1 <- Array1
			la $a2, Array2			# 3rd $a2 <- Array2
			addiu $a3, $zero, 10	# 4th $a3 <- 10
			jal SumArr			# Call the funtion with label "SumArr"
			
			la $a0, Array3			# 1st
			addiu $a1, $zero, 10	# 2nd
			jal PrintArr			# Print the 3rd table
			
			

				