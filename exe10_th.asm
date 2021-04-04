##include <stdio.h>
#double nysum(double a, double b)
#{   double s = 0.0, p = a;
 #   while(s <= b)
#    {   printf("P before : %2lf \n", p);
#        if(p >= 0.0)
#        {   s = s + p;
#            printf("IF");
#        }
#        else
#        {   printf("S before : %2lf \n", s);
#            s = s - (p / 2);
#            printf("S after  : %2lf \n", s);
#        }
#    p += 1.23456789;
#    printf("P after  : %2lf \n", p);
#    }
#    return s;
#}

#int main(void)
#{   double x = -20.5, y = 18.0, z;
#    z = nysum(x, y);
#    printf("\nThe number is %2lf \n", z);
#    return 0; 
#}




		
		.data					# From here we declare data . . .
numX: 	.double -20.5			# double number -20.5, 		
numY:	.double 18.0			# double number 18.0,
Fuse:	.double 1.23456789		# double number 1.23456789,
		.text					# . . . From here we start coding
				
		j Main				# Jump to Main function	
		
Mysum:	mtc1 $zero, $f0		# $f0 <- 0
		cvt.d.w $f0, $f0		# Convert($f0) to double precision --> $f0/$f1 <- for the results.
		mov.d $f4, $f12		# $f4/$f5 <- (numX($f12/$13)).
		mov.d $f6, $f0 		# $f6/$f6 <- $f0/$f1 with this way i have and $zero in $f0.
		addi $t2, $zero, 2		# $t2 <- 2 for the div.
		mtc1 $t2, $f8			# $f8 <- 2.
		cvt.d.w $f8, $f8		# Convert $f8 to double precision ->  $f8/$f9. 
		la $t0, Fuse			# $t0 <- (Fuse(1.23456789).
		ldc1 $f16, 0($t0)		# $f16/$f17 <- $t0(Fuse(1.23456789)). 

Loop:	c.le.d $f4, $f14		# if ($f4/$f5 <= $f14/$f15).
		bc1f Endwl			# if flag = 0 then go to label "Endwl".
		c.le.d $f6, $f4			# if ( $f6/$f7 <= $f4/$f5).
		bc1f Else				# if flag = 0 the go to label "Else".
		add.d $f0, $f0, $f4		# $f0/$f1 <- ($f0/$f1 + $f4/$f5).
		j Endl				# Jump to label "Endl".

Else:		div.d $f10, $f4, $f8 		# $f10/$11 <- ($f4/$f5 / $f8/$f9).
		sub.d $f0, $f0, $f10 	# $f10/$f11 <- ($f0 - $f10).

Endl:	add.d $f4, $f4, $f16 	# $f4/$f5 <- ($f4/$f5 + $f16/$f17).
		j Loop				# Jump to label "Loop".

Endwl:	jr $ra				# Move back to "Main" with the results in $f0/$f1.						

Main:	la $t0, numX			# $t0 <-  numX(-20.5).
		ldc1 $f20, 0($t0)		# $f20/$f21 <- $t0(numX(-20.5)).
		la $t0, numY			# $t0 <- numY(18.0).
		ldc1 $f22, 0($t0)		# $f22/ $f23 <- $t0(numY(18.0)).
		mov.d $f12, $f20		# $f12/$f13 <- numX($f20/ $f21).
		mov.d $f14, $f22		# $f14/$f15 <-numY($f22/$f23).
		jal Mysum			# Call the function "Mysum".
		mov.d $f24, $f0 		# $f24/$f25 <- $f0/$f1.

End:		nop					# The end of function.
