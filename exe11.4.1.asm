##include <stdio.h>
#int main() {
#    int i, n, t1 = 0, t2 = 1, nextTerm;
#    printf("Enter the number of terms: ");
#    scanf("%d", &n);
#    printf("Fibonacci Series: ");
#
#    for (i = 1; i <= n; ++i) {
#        printf("%d, ", t1);
#        nextTerm = t1 + t2;
#        t1 = t2;
#        t2 = nextTerm;
#    }
#
#    return 0;
#}

		
			
				
					
			.data
Dt1:			.asciiz "Give me an intiger: "
Ress:		.asciiz "fibonacci sequence: "
Emp:		.asciiz " "
			.text 
			
			j Main				# jump to label "Main"
			
Func:		and $t2, $t2, $a1		# $t2 <- 0
			addi $t1, $a3, 1		# $t1 <- ($a3 + 1)
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Ress			
			syscall
			addi $v0, $zero, 1		# service 1 -> print intiger
			add $a0, $zero, $t2 	# $a0 <- $t2
			syscall 
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Emp		
			syscall
			
Loop:		slt $t0, $t1, $a1		# if($t1 < $a1) then $t0 <- 1, if not $t0 <- 0
			beq $t0, $zero, EndL	# if ($t0 == $zero) go to label "EndL"
			addi $v0, $zero, 1		# service 1 -> print intiger
			or $a0, $zero, $a3 		# $a0 <- $t2
			syscall 
			ori $v0, $zero, 4		# service 4 -> print string
			la $a0, Emp		
			syscall
			add $t2, $a2, $a3		# $t2 <- ($a2 + $a3)          
			add $a2, $zero, $a3	# $a2 <- ($zero + $a3)			                                      
			add $a3, $zero, $t2	# $a3 <- ($zero + $t2)                         
			addi $t1, $t1, 1		# $t1 <- ($t1 + 1)
			j Loop				# jump to label "Loop" 
			
EndL:		bne $a1, 1, EndF		# if($t2 != 2) go to label "EndD"
			add $t2, $zero, $a1	# $t2 <- $a1	
EndF:		jr $ra				# go back to "Main"

######### MAIN FUNCTION #######################
										
Main:		addi $v0, $zero, 4		# service 4 -> print string
			la $a0, Dt1		
			syscall
			addi $v0, $zero, 5		# $v0 <- read the number
			syscall	
			add $s4, $zero, $v0	# $s4 <- $v0
			or $a1, $zero, $s4		# $a1 <- $s4($v0)
			addi $s0, $zero, 0		# $s0 <- 0
			and $a2, $zero, $s4	# $a1 <- $s4(0)
			ori $s1, $zero, 1		# $s1 <- 1
			or $a3, $zero, $s1 		# $a3 <- $s1(1)
			jal Func				# Call the function with label "Func"
		
			addi $v0, $zero, 1		# service 1 -> print intiger	
			add $a0, $t2 , $zero	# $a0 <- $t2
			syscall

End:			nop					# The end . . .
			
				
			
