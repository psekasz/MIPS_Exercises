Main:	mtc1 $zero, $f4 			# move to coprocessor 1. ($f4 <- 0)
		cvt.d.w $f20, $f4			# $f20/$f21 <- 0 convert from word to double precision
		ori $s1, $zero, 1			# $s1 <- 1
		addi $t1, $zero, 10			# $t1 <- 10
Loop:	slt $t0, $t1, $s1			# if ($t1 < $s1) then $t0 <- 1, if not $t0 <- 0
		bne $t0, $zero, End		# if ($t0 == $zero) then go to Label "End"
		mul $t2, $s1, $s1 			# $t2 <- ($s1(1) *$s1(1) ** only for the first time**
		mtc1 $t2, $f5				# move to coprocessor 1. $f5 <- $t2 (take the result of multiply because we need to store it like a double precision number
		cvt.d.w $f6, $f5 			# conver to double precision  
		add.d $f20, $f20, $f6		# $f20 <- ($f20 +1) 
		addi $s1, $s1, 1			# $s1 <- ($s1 +1)
		j Loop					# Jump to the Label "Loop"
		
End:		nop						# the end of program .