 #include <stdio.h>  - int main(void) - {	float a = 3.5, b = 4.7, c; -  if (a <b){ - c = 3 * a;} - else{  - c = b / 2;} - printf("The number is : %2f", c); - return 0;
}
			.data 				# from here we start declare data
L1:			.float 3.5				# float number 4.7
L2:			.float 5.5				# float number 5.5
			.text					# from here we start writting our code
			
			la $t0, L1				# $t0 <- load address(4,7)
			lwc1 $f20, 0($t0)		# load word to coprocessor 1. $f20 <- $t0
			
			la $t0, L2				# $t0(clean the value and takes the new one) <-  load address(5.5)
			lwc1 $f21, 0($t0)		# load word to coprocessor 1. $f21 <- $t0
			
			c.lt.s $f20, $f21		# if ($f20 < $f21)
			bc1f Else 				# if condition is faulse then go to "Else"
			
			ori $t1 , $zero, 3		# $t1 <- 3 for the multiply
			mtc1 $t1, $f4			# move to coprocessor 1.  $f4 <- $t1(4.7)
			cvt.s.w $f5, $f4 		# $f5 <- $f4(3.0)
			mul.s $f22, $f5, $f20	# $f22 <- ($f20(4.7) * $f5(3))
			j End				# Jump to Label "Endif"
			
Else:			ori $t2, $zero, 2		# $t2 <- 2 for the div
			mtc1 $t2, $f6			# move to coprocessor 1. $f6 <- $t1(5.5)
			cvt.s.w $f7, $f6		# $f7 <- $f6(2.0)
			div.s $f22, $f21, $f7	# $f22 <- ($f21(5.5) / $f7(3.0))
			
End:			nop					# The end of program