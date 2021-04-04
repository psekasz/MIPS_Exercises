

#include <stdio.h>

#void main()  
#{  
#    int i, n1, n2, j, hcf=1,lcm;  


#   printf("\n\n The LCM is:\n ");
#   printf("Give me a number: ");  
#   scanf("%d", &n1);  
#   printf("Give me a second number: ");  
#   scanf("%d", &n2); 
  
#    j = (n1<n2) ? n1 : n2;  
  
#   for(i = 1; i <= j; i++)  
#    {  

#        if(n1 % i == 0 && n2 % i == 0)  
#        {  
#            hcf = i;  
#        }  
#    }  
#    lcm = (n1 * n2) / hcf;
  
#    printf("\nThe LCM of %d and %d is : %d\n\n", n1, n2, lcm);  

#}
				
				.data
Prt1:				.asciiz "Give a number: "
Prt2:				.asciiz "Give me a second number: "
Lcm:				.asciiz "The LCM is: "
				.text
				
				j Main				# Jump to label "Main"
				
###################################################################


Proc1:			addi $t8, $t8, 1		# $t8 <- ($t8 + 1)
				mul $a1, $s0 , $t8		# $a1 <- ($s0 * $t8)
				jr $ra 				# go back where you came from			
			
####################################################################
	
			
Proc2:			addi $t9, $t9, 1		# $t9 <- ($t9 + 1)		
				mul $a2, $s1, $t9		# $a2 <- ($s1 * $t9)
				jr $ra				# go back where you came from . . .
				
####################################################################
				
LcFunction:		and $t9, $zero, $a2	# $t9 <- 0
				or $t8 , $zero, $s6		# $t8 <- 0
				addi $a3, $zero, 100	# parameter that if program run 100 times, will be stop (because we will not have results for a lot)
				addi $sp, $sp, -28		# prepare the stack pointer
				sw $ra, 0($sp)			# sp <- $ra
				sw $s0, 4($sp)			# . . .
				sw $s1, 8($sp)			# . . . 
				sw $t8, 12($sp)		# . . .
				sw $t9, 16($sp)		# . . .
				sw $a1, 20($sp)		# . . .
				sw $a2, 24($sp)		# . . .

				
			#	Least Common Multiple Procedure	#
			
Loop:			beq $a3, $zero, EndL	# if($a3 == $zero) then jump to label "EndL")
				beq $a1, $a2, EndL		# if($a1 == $a2) the jump to label "EndL"
				slt $t0, $a1, $a2		# if($a1 < $a2) then $t0 <- 1, if not $t0 <- 0
				bne $t0, $zero, Ok1	# if($t0 != $zero) then jump to label "Ok1"
				jal Proc2				# call the function with label "Proc1"
				addi $a3, $a3, -1		# $a3 <- ($a3 - 1)
				j Loop				# Jump to label "Loop"
				
Ok1:				addi $a3, $a3, -1		# $a3 <- ($a3 - 1)
				jal Proc1				# call the function with abel "Proc2"
				j Loop				# Jump to label "Loop'
				
EndL:			
				lw $ra, 0($sp)			# restore the sp
				lw $s0, 4($sp)			# . . .
				lw $s1, 8($sp)			# . . . 
				lw $t8, 12($sp)		# . . .
				lw $t9, 16($sp)		# . . .
				lw $a1, 20($sp)		# . . .
				addi $sp, $sp, 28		# . . . 
				jr $ra				# Go back to function with label "Main" 	
				
##################################################################
			# 	MAIN FUNCTION		#
				
Main:			addi $v0, $zero, 4 		# service 4 -> print string
				la $a0, Prt1			
				syscall
				addi $v0, $zero, 5		# service 5 -> read integer
				syscall 
				add $s0, $zero, $v0 	# $s0 <- $v0
				addi $v0, $zero, 4		# service 4 -> print string
				la $a0, Prt2			
				syscall
				addi $v0, $zero, 5		# service 5 -> read integer
				syscall
				or $s1, $zero, $v0		# $s1 <- $v0
				or $a1, $zero, $s0		# . . .
				or $a2, $zero, $s1		# . . .
				jal LcFunction			# Call the function with label "LcFunction"
				add $a1, $zero, $v0
				
				addi $v0, $zero, 4		# service 4 -> print string
				la $a0, Lcm			
				syscall
				addi $v0, $zero, 1		# service 1 -> print integer
				add $a0 , $zero, $a2	# $v0 <- $a2
				syscall
				
End:				nop					# The end of program
				
