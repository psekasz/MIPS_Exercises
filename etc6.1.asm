		.data 	
str1:		.asciiz "1234567890abcDE"
str2:		.space 50	
		
		.text				# from here start the part of coding
		.globl Main			
strcopy:	and $t0, $zero, $zero		# $t0 <- 0
loop:		add $t1, $t0, $a1		# $t1 <- &y[i]
		lbu $t1, 0($t1)			# $t1 <- y[i]
		add $t2, $t0, $a0		# $t2 <- &x[i]
		sb $t1, 0($t2)			# x[i] <- y[i]		
		beq $t1, $zero, endloop		# if ($t1 = '\0') go to the "endloop"
		addi $t0, $t0, 1		# $t0 <- ($t0 +1)
		j loop				# jump to the "loop"	
endloop:	jr $ra				# go back to "Main"

Main:		la $s1, str1			# $s1 <- str1
		la $s2, str2			# $s2 <- str2
		or $a0, $zero, $s2		# $a0 <- $s2 (<- str2)
		or $a1, $zero, $s1		# $a1 <- $s1 (<- str1)
		jal strcopy			# call the function "strcopy"