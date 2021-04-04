				.data
Pi:				.double 3.1415926535897932		
msg1:			.asciiz "Give me the radians: "
res:				.asciiz "\nThe area is: "
per:				.asciiz "The perimeter is: "
				.text
				
				j Main					# jump to label "Main"
				
Area:			la $t0, Pi					# $t0 <- 3.1415....
				ldc1 $f0, 0($t0)			# 
				mul.d $f14, $f14, $f0		# $f14/$f15 <- ($f14/$f15 * $f0/$f1)
				mul.d $f14, $f14, $f12		# $f14/$f15 <- ($f14/$f15 * $f12/$f13)
				mul.d $f0, $f0, $f12		# $f0/$f1 <- ($f0/$f1 * $f12/$f13)
				mul.d $f0, $f0, $f12		# $f0/$f1 <- ($f0/$f1 $f12/$f13)
				jr $ra					# go back to "Main"
				
############ MAIN FUNCTION ###################
								
Main:			addi $v0, $zero, 4			# service 4 -> print screen
				la $a0, msg1				
				syscall
				addi $v0, $zero, 5 			# service 5 -> read intiger
				syscall
				addi $t0, $zero, 2			# $t0 <- 2
				mtc1 $t0, $f20			# $f20/$f21 <- $t0
				cvt.d.w $f20, $f20
				mov.d $f14, $f20			# $f14/$f15 <- $f20/$f21
				add $a1, $zero, $v0 		# $a1 <- $v0
				
				mtc1 $a1, $f22			# $f22/$f23 <- $a1
				cvt.d.w $f22, $f22			# $f22/$f23 ->  xxx.xxxxxx
				mov.d $f12, $f22 			# $f12/$f13 <- $f22/$f23
				jal Area					# Call the function with label "Area"
				
				ori $v0, $zero, 4			# sevice 4 -> print string
				la $a0, per
				syscall
				ori $v0, $zero, 3			# service 3 -> print double
				mov.d $f12, $f14			# $f12/$f13 <- $f14/$f15
				syscall			
				addi $v0, $zero, 4			# service 4 -> print string
				la $a0, res
				syscall
				addi $v0, $zero, 3			# service 3 -> print double
				mov.d $f12, $f0			# $f12/$f13 <- $f0/$f1( The result)
				syscall
	
End:				nop						# The end of program
