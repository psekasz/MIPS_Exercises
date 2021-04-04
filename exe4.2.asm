# a) bgt $s0, $s1, Label1  
# b) bge $s2, #s3, Label2 
# c) blt $s4, $s5, Label3
# d) ble $s6, $7, Label4

#a)                             its like -> if ($s0 > $s1) go to...
	addi $s0, $zero, 15  
	addi $s1, $zero, 60 
	slt $t0, $s1, $s0       
	bne $t0, $zero, Label1

Label1:	nop

#b)                             its like -> if ($s0 >= $s1) go to...
	addi $s2, $zero, 15  
	addi $s3, $zero, 60
	beq $s2, $s3, Label2
	slt $t0, $s3, $s2
	bne $t0, $zero, Label2
	
	
Label2: nop

#c)                             its like -> if ($s0 < $s1)
	addi $s4, $zero, 15
	addi $s5, $zero, 60
	slt $t0, $s5, $s4       
	beq $t0, $zero, Label3
	
Label3: nop

#d)                             its like -> if ($s0 <= $s1)
	addi $s6,$zero,15
	addi $s7,$zero,60
	beq $s6,$s7,Label4
	slt $t0, $s6, $s7 
	bne $t0, $zero, Label4
	
Label4:	nop




	