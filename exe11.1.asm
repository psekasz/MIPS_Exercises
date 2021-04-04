           	.data
msg1:	.asciiz "Give me the Base "
msg2:	.asciiz "Give me the height "
msg3:	.asciiz "Triangle's area is "
		.text
		
		addiu $v0, $zero, 4		# call the service 4
		la $a0, msg1			# $a0 <- msg1("Give me the Base")
		syscall				# call the system
		addi $v0, $zero, 6		# call the service 6
		syscall				# system call
		mov.s $f20, $f0		# $f20 <- $f0
		addiu $v0, $zero, 4		# service 4 -> print the message
		la $a0, msg2			# $a0 <- msg2("Give me the height ")
		syscall 				# system call
		addi $v0, $zero, 6		# service 6 "read the number"
		syscall				# system call
		mov.s $f21, $f0		# $f21 <- $f0
		mul.s $f22, $f20, $f21	# $f22 <- ($f20 * $f21)
		addi $t0, $zero, 2		# $t0 <- 2
		mtc1 $t0, $f4			# $f4 <- $t0(2)
		cvt.s.w $f4, $f4		# $f4 <-> 2.0	
		div.s $f22, $f22, $f4	# $f22 <- ($f22 / $f4)
		addiu $v0, $zero, 4		#  service 4 -> print the message	
		la $a0, msg3			# $a0 <- msg3("Triangles area is ")
		syscall 				#system call
		addi $v0, $zero, 2		# service 2 -> print the number 
		mov.s $f12, $f22		# $f12 <- $f22
		syscall				# system call
				
End:		nop					# the end of the program
		
	            
