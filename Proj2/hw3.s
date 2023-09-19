/* =================== */
/*	DATA Section	*/
/* =================== */
	.data
	.align 4
/*	vriable a		*/
	.type a, %object
	.size a, 64			/*The size of a is 64*/	
a:
	.word 1			/*Set the matrix (1,1)=1*/
	.word 2			/*(1,2)=2*/
	.word 3 			/*(1,3)=3*/
	.word 4			/*(1,4)=4*/
	.word 2			/*Set the matrix (2,1)=2*/
	.word 2			/*(2,2)=2*/
	.word 3			/*(2,3)=3*/
	.word 4			/*(2,4)=4*/
/*	vriable b		*/
	.type b, %object
	.size b, 64			/*The size of b is 64*/
b:
	.word 2			/*Set the matrix (1,1)=2*/
	.word 2			/*(2,1)=2*/
	.word 3 			/*(3,1)=3*/
	.word 4			/*(4,1)=4*/
	.word 1			/*(1,2)=1*/
	.word 2			/*(2,2)=2*/
	.word 3			/*(3,2)=3*/
	.word 4			/*(4,2)=4*/
/*	vriable c		*/
c:
	.space 16, 0		/*The size of c is 16 and each is 0*/
/* =================== */
/*	TEXT Section	*/
/* =================== */
	.section .text
	.global main
	.type main,%function
.matrix:				/*A label .matrix*/
	.word a
	.word b
 	.word c
main:
	ldr r0, .matrix		/*r0 go to word a*/
	ldr r2,[r0],#4		/*r2=1  r0+4*/
	ldr r3,[r0],#4		/*r3=2  r0+4*/
	ldr r4,[r0],#4		/*r4=3  r0+4*/
	ldr r5,[r0]			/*r5=4*/

	ldr r0, .matrix+4		/*r0 go to word b*/
	ldr r6,[r0],#4		/*r6=2  r0+4*/
	ldr r7,[r0],#4		/*r7=2  r0+4*/
	ldr r8,[r0],#4		/*r8=3  r0+4*/
	ldr r9,[r0]			/*r9=4  */

	ldr r1, .matrix+8		/*r1 go to word c*/

	mul r10,r2,r6		/*r10=r2*r6*/
	mul r11,r3,r7		/*r11=r3*r7*/
	add r12,r11,r10		/*r12=r11+r10*/
	mul r10,r4,r8		/*r10=r4*r8*/
	mul r11,r5,r9		/*r11=r5*r9*/
	add r11,r11,r10		/*r11=r11+r10*/
	add r12,r11,r12		/*r12=r11+r12*/

	str r12,[r1],#4		/*r1:=r12 r1+4*/
	
	ldr r0, .matrix+4		/*r0 go to word b*/
	ldr r6,[r0,#16]!		/*r0+16 r6=1*/
	ldr r7,[r0,#4]!		/*r0+4   r7=2*/
	ldr r8,[r0,#4]!		/*r0+4   r8=3*/
	ldr r9,[r0,#4]		/*r0+4   r9=4*/

	mul r10,r2,r6		/*r10=r2*r6*/
	mul r11,r3,r7		/*r11=r3*r7*/
	add r12,r11,r10		/*r12=r11+r10*/
	mul r10,r4,r8		/*r10=r4*r8*/
	mul r11,r5,r9		/*r11=r5*r9*/
	add r11,r11,r10		/*r11=r11+r10*/
	add r12,r11,r12		/*r12=r11+r12*/

	str r12,[r1],#4		/*r1:=r12 r1+4*/

	ldr r0, .matrix		/*r0 go to word a*/
	ldr r2,[r0,#16]!		/*r0+16 r2=2*/
	ldr r3,[r0,#4]!		/*r0+4   r3=2*/
	ldr r4,[r0,#4]!		/*r0+4   r4=3*/
	ldr r5,[r0,#4]		/*r0+4   r5=4*/

	ldr r0, .matrix+4		/*r0 go to word b*/
	ldr r6,[r0],#4		/*r6=2  r0+4*/
	ldr r7,[r0],#4		/*r7=2  r0+4*/
	ldr r8,[r0],#4		/*r8=3  r0+4*/
	ldr r9,[r0]			/*r9=4  */

	mul r10,r2,r6		/*r10=r2*r6*/
	mul r11,r3,r7		/*r11=r3*r7*/
	add r12,r11,r10		/*r12=r11+r10*/
	mul r10,r4,r8		/*r10=r4*r8*/
	mul r11,r5,r9		/*r11=r5*r9*/
	add r11,r11,r10		/*r11=r11+r10*/
	add r12,r11,r12		/*r12=r11+r12*/

	str r12,[r1],#4		/*r1:=r12 r1+4*/

	ldr r0, .matrix+4		/*r0 go to word b*/
	ldr r6,[r0,#16]!		/*r0+16 r6=1*/
	ldr r7,[r0,#4]!		/*r0+4   r7=2*/
	ldr r8,[r0,#4]!		/*r0+4   r8=3*/
	ldr r9,[r0,#4]		/*r0+4   r9=4*/

	mul r10,r2,r6		/*r10=r2*r6*/
	mul r11,r3,r7		/*r11=r3*r7*/
	add r12,r11,r10		/*r12=r11+r10*/
	mul r10,r4,r8		/*r10=r4*r8*/
	mul r11,r5,r9		/*r11=r5*r9*/
	add r11,r11,r10		/*r11=r11+r10*/
	add r12,r11,r12		/*r12=r11+r12*/

	str r12,[r1]		/*r1:=r12*/
	ldr r1, .matrix+8		/*r1 go to word c*/
	nop
	.end

