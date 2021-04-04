		addi $s0, $zero, -357	# $s0 <- -357    
		addi $s1, $zero, 1     	# $s1 <- 1
     		slt $t0, $s0, $zero	# if ($s0 < $zero) then $t0 <- 1, if not $t0 <-0
        	beq $t0, $zero, Loop	# if ($t0 == $zero) go to "Loop"
        	nor $s0, $s0, $zero	# logic (nor) 1 -> 0, 0 -> 1
        	addi $s0, $s0, 1	# $s0 <- $s0 + 1
	
Loop: 		beq $s0, $zero,  End	# if ($s0 == $zero) go to the "End"
        	srl $s0, $s0, 1  	# shift right logic $so <- $s0 << 1
        	addi $s1, $s1, 1	# $s1 <- $s1 + 1
        	j Loop			# jump to the "Loop"
        
End:    	nop			# End
