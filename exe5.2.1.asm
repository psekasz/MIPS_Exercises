			addi $s0, $zero, 357	# $s0 <- 357      
      		  	addi $s1, $zero, 0  	# $s1 <- 0
       			bne $s0, $zero,  Loop	# if ($s0 != $zero) go to the "Loop"
        		addi $s1, $zero, 0      # $s1 <- 0 
        		j End			# go to "End"
Loop:   		beq $s0, $zero,  End	# if ($s0 == $zero) go to the "End"
        		srl  $s0, $s0, 1  	# shift right logic $s0 <- ($s0 >> 1)
       			addi $s1, $s1, 1	# $s1 <- ($s1 + 1)
        		j Loop			# jump to the "Loop"
End:		    	nop			# End
