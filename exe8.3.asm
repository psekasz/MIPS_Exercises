			.data
Str:			.asciiz "programmingolo"	# the word
Ch:			.asciiz	"o"			# the letter 
			.text
			
			j Main				# Jump to "Main"

Times:			and $v0, $zero, $v0		# $v0 <- 0
			and $t0, $zero, $t0		# $t0 <- 0	
		
Loop:			add $t1, $a0, $t0		# $t1 <- $a0($t0)
			lbu $t2, 0($t1)			# $t2 <- $t1
			beq $t2, $zero, Endl		# if ($t2 == $zero) then go to "Endll"
			bne $t2, $a1, Endif		# if ($t2(i) != $a1(letter) then go to "Endif 
			addi $v0, $v0, 1		# $v0 <- ($v0 +1)
			
Endif:			addi $t0, $t0, 1		# $t0 <- ($t0 +1)
			j Loop				# Jump to "Loop"
		
Endl:			jr $ra				# go back to "Main"
			
Main:			la $s0, Str			# Load in $s0 <- Str dir
			la $t0, Ch			# Load in $t0 <- Ch dir
			lbu $s1, 0($t0)			# $s1 <- 'a'
			or $a0, $zero, $s0		# $a0 <- $s0
			or $a1, $zero, $s1		# $a1 <- $s1
			jal Times			# jump to "Times"
			add $s2, $zero, $v0		# $s2 <- $v0
End:			nop				# The end..  