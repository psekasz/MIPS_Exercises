			addi $s1, $zero, 2000		# $s1 <- 2000
			addi $s2, $zero, -2000		# $s2 <- -2000
			mult $s1, $s2			#
			mflo $t9			# $t9 <- mflo
			mfhi $t0			# $t0 <- mfhi
			slt $t1, $t9, $zero		# if ($t9 < $zero) then $t1 <- 1, if not $t1 <-0
			beq $t1, $zero, CheckFor0	# if ($t1 == $zero) go to "CheckFor0"
			
		
CheckFor0:		beq $t0, $zero, No_Overflow	# if ($t0(mfhi) == $zero) then "No_Overflow"
Overflow:		slt $t2, $s1, $zero		# if ($s1 < $zero) then $t2 <- 1, if not $t2 <- 0 
			slt $t3, $s2, $zero		# if ($s2 < $zero) then $t3 <- 1, if not $t3 <- 0
			xor $t4, $t2, $t3		# the same $t4 <- 0, else $t1 <- 1
			beq $t4, $zero, MaxPositive	# if ($t4 == $zero) jump to "MaxPositive"
MaxNegative:		addi $t9, $zero, 1		# $t9 <- 1
			sll $t9, $t9, 1			# $t9 <- shift left logic (*2)
			j OverflowTreated		# jump to "OverflowTreated"
MaxPositive:		nor $t9, $zero, $zero	 	# $t9 <- 1111....11 ( all the "1")
			srl $t9, $t9, 1			# $t9 <- shift right logic (/2)
OverflowTreated:	nop				# after the overflow
No_Overflow:		nop 				# without "OVERFLOW"	 		