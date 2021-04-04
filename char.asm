			.data			
Str1:			.asciiz "Write something:  "		
Buff1:		.space 20
Str2:			.asciiz "\nGive me the character you want to search: "
Buff2:		.space 20
Res1:		.asciiz "\nThere are: "
Res2:		.asciiz "--->"
			.text		
			
			j Main				# jump to "Main"
			
Lilfunc:		addi $v0, $zero, 0		# $v0 <- 0
			addi $v1, $zero, 0		# $v1 <- 0
			lbu $t9, 0($a1)		# $t9 <- the char we search for
			
Loop:		add $t0, $a0, $v0 		# $t0 <- &s[n]
			lbu $t1, 0($t0)		# $t1 <- s[n]
			beq $t1, $zero, Endl	# if ($t2 == $zero) go to "End"	
			addi $v0, $v0, 1		# $v0 <- $v0 + 1
			bne $t9, $t1, Loop
			addi $v1, $v1, 1		# $v1 <- 1
			j Loop				# jump to "Loop"
		
Endl:		jr $ra				# Go back to "Main"	


Main:		addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Str1
			syscall 
			ori $v0, $zero, 8		# service 8 -> read string
			la $a0, Buff1		
			ori $a1, $zero, 20		
			syscall
			or $s0, $zero, $a0		# $s0 <- $a0 (our chars)
			
			# We have read our string #
			
			ori $v0, $zero, 4 		# service 4 -> print string
			la $a0, Str2
			syscall
			ori $v0, $zero, 8		# service 8 -> read string 
			la $a0, Buff2
			ori $a1, $zero, 20
			syscall
			or $s1, $zero, $a0 	# $s1 <- $a0 (our char)
			
			# We have read our character we want to search #
			
			add $a0, $zero, $s0	# $a0 <- $s0
			add $a1, $zero, $s1 	# $a1 <- $s1
			
			# We are ready to call our function #
			
			jal Lilfunc
			
			# Now, after scan we have to show the results #
			
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Res1	
			syscall
			ori $v0, $zero, 1		# service 1 -> print integer
			add $a0, $zero, $v1	
			syscall
			ori $v0, $zero, 4		# service 4 -> print string 
			la $a0, Res2
			syscall
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Buff2
			syscall

End:			nop