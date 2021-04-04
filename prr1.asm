					.data 
Name:				.asciiz "Give the name : "
Buffer:				.space 20
Price:				.asciiz "\nEnter the price: "
Quant:				.asciiz "\nGive me the quantity: "
Prt1:					.asciiz "\nName: "
Prt2:					.asciiz "\nPrice: "					# $f20 <- price
Prt3:					.asciiz "\nQuantity: "				# $f24 <- quantity
Prt4:					.asciiz "\nTotal Cost: "				# $f4 <- total cost
					.text
					
					j Main				 	# Jump to label "Main"
					
Function2:			mtc1 $a3, $f24			# $f24 <- $a3
					cvt.s.w $f24, $f24			# f24 -> x.x
					mul.s $f4, $f24 ,$f20		# $f4 <- ($f20 * $f20)					
EndL:				jr $ra					# Go bak where you came from
					
				# 		NAME		#
Main:				addi $v0, $zero, 4			# service 4 -> print string
					la $a0, Name				# $a0 <- Name(" . . .")
					syscall					
					addi $v0, $zero, 8 			# service 8 -> read string
					la $a0, Buffer				# $a1 <- $v0
					addi $a1, $zero, 20			# $a1 <- 20
					syscall
				#	PRICE	#
					addi $v0, $zero, 4			# service 4 -> pritn string
					la $a0, Price				# $a0 <- Price(. . .)
					syscall
					addi $v0, $zero, 6			# service 6 -> read float number
					syscall 
					mov.s $f20, $f0			# $a2 <- $v0
				# 	QUANTITY	#
					addi $v0, $zero, 4			# service 4 -> print string
					la $a0, Quant				# $a0 <- Quant(. . .)
					syscall 
					addi $v0, $zero, 5			# service 5 -> read integer
					syscall 
					or $a3, $zero, $v0			# $a3 <- $v0
					jal Function2 				# call the function with label "Function2"
					
############## 	RESULTS		#######################################
				
				#	NAME		#
					addi $v0, $zero, 4			# service 4 -> print string
					la $a0, Prt1				# $a0 <- Prt1(". . .")
					syscall
					addi $v0, $zero, 4			# service 4 -> print sting
					la $a0, Buffer
					syscall
				#	PRICE		#
					ori $v0, $zero, 4			# service 4 -> print string
					la $a0, Prt2				# $a0 <- Prt2(". . .")
					syscall
					addi $v0, $zero, 2			# service 2 -> print float
					mov.s $f12, $f20			# $f12 <-  $f20
					syscall
				#	QAUANTITY	#
					addi $v0, $zero, 4			# service 4 -> print string
					la $a0, Prt3				# $a0 <- Prt3(". . .")
					syscall
					addi $v0, $zero, 1			# service 5 -> print integer
					add $a0, $a3, $zero		# $a0 <- $a3
					syscall
				# 	TOTAL COST	#
					addi $v0, $zero, 4			# service 4 -> print string
					la $a0, Prt4				# $a0 <- Prt4(". . .")
					syscall 
					ori $v0, $zero, 2			# service 2 -> print float
					mov.s $f12, $f4			# $f12 <- $f4
					syscall
					
End:					nop						# The end of program
					
					
					
					
