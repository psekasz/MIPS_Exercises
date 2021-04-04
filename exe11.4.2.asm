			.data
Dt1:			.asciiz "Give me an intiger: "
Ress:		.asciiz "The result is: "
			.text 
			
			j Main				# jump to label "Main"
			
sFunc:		slt $t0, $t1, $a1		# if($t1 < $a1) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndsF	# if ($t0 == $zero) go to label "EndsF"
			add $t2, $a2, $a3		# $t2 <- ($a2 + $a3)          
			add $a2, $zero, $a3	# $a2 <- ($zero + $a3)			                                      
			add $a3, $zero, $t2	# $a3 <- ($zero + $t2)                         
			addi $t1, $t1, 1		# $t1 <- ($t1 + 1)
			j sFunc				# jump to label "sFunc"

######### SECOND FUNCTION #############################

EndsF:  		jr $ra				# go back where you came from
			
Func:		and $t2, $t2, $a1		# $t2 <- 0
			addi $t1, $a3, 1		# $t1 <- ($a1 + 1)
			addi $sp, $sp, -24		# prepare the stack pointer
			sw $ra, 0($sp)			# sp <- $ra
			sw $a1, 4($sp)			# . . . 
			sw $a2, 8($sp)			# . . . 
			sw $a3, 12($sp) 		# . . .
			sw $t1, 16($sp)		# . . . 
			sw $t2, 20($sp)		# . . .
			jal sFunc				# Call the function with label "sFunc"
			
Load:		lw $ra, 0($sp)			# restore the stack pointer
			lw $a1, 4($sp)			# . . . 
			lw $a2, 8($sp)			# . . . 
			lw $a3, 12($sp)		# . . .
			lw $t1, 16($sp)		# . . . 
			addi $sp, $sp, 24		# restore the sp	-----------> dhladh addi $sp, $sp, 20 ?
			
			jr $ra				# go back to "Main"
			
######### MAIN FUNCTION #######################
										
Main:		addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Dt1		
			syscall
			addi $v0, $zero, 5		# $v0 <- read the number
			syscall	
			add $s0, $zero, $v0	# $s0 <- $v0
			or $a1, $zero, $s0		# $a1 <- $s0($v0)
			addi $s1, $zero, 0		# $s0 <- 0
			and $a2, $zero, $s1	# $a1 <- $s1(0)
			addi $s2, $zero, 1		# $s1 <- 1
			or $a3, $zero, $s2 		# $a3 <- $s2(1)
			jal Func				# Call the function with label "Func"
		
			addi $v0, $zero, 4		# service 4 -> print sting
			la $a0, Ress	
			syscall 
			addi $v0, $zero, 1		# service 1 -> print intiger	
			add $a0, $t2, $zero	# $a0 <- $t2
			syscall

End:			nop					# The end . . .
			
				
			
