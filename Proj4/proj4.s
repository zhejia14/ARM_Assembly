/* =================== */
/*	DATA Section	*/
/* =================== */
	.data
	.align 4
	.type a, %object
	.size a, 32
a:			/*Input array 8 numbers*/
	.word 13
	.word 11
	.word 19
	.word 5
	.word 7
	.word 2
	.word 3
	.word 1
input_text:		/*Print the text in front of Input array numbers*/ 
	.ascii "Input array:\000"
output_text:		/*Printf the text in front of Output array numbers*/ 
	.ascii "Result array:\000"
number:			/*Printf numbers*/ 
	.ascii "%d \000"
enter:			/*End printf*/
	.ascii "\n\000"
/* =================== */
/*	TEXT Section	*/
/* =================== */
	.section .text
	.global main
	.type main,%function
/*	Begin function	*/
main:
	mov ip, sp	
	stmfd sp!, {fp, ip, lr, pc}
	sub fp, ip, #4

	mov r0, #32	/*Get input array size*/
	ldr r1, =a		/*Get input array address*/

	mov r9, r0		/*Keep input array size at r9*/
	mov r8, r1		/*Keep input array address at r8*/

	bl NumSort	/*Go to NumSort function*/

	mov r11, r0	/*Get result array address from r0*/
	
	ldr r0, =input_text	/*Let r0 =address of input_text*/
	bl printf		/*Printf input_text {printf("Input array:");}*/

	mov r4, #0	/*r4=0 Let r4 be a counter*/
	mov r5, r8		/*r5= the first element of Input array*/  
LOOP:			/*r4=i	for(i=0;i<size;i++)*/
	cmp r4, r9
	bge EXIT
	ldr r0, =number	/*Let r0 =address of number*/
	ldr r1, [r5]		/*r1 =array element*/
	
	bl printf		/*Printf number(element)*/
	
	add r4, r4, #4	/*r4=r4+4	  (i++)*/
	add r5, r5, #4	/*r5=r5+4   (next element)*/
	b LOOP
EXIT:
	ldr r0, =enter	/*Let r0 =address of enter*/
	bl printf		/*Print "\n"*/
	ldr r0, =output_text	/*Let r0 =address of output_text*/
	bl printf		/*Printf output_text {printf("Output array:");}*/
	mov r4, #0	/*r4=0 Let r4 be a counter*/
	mov r5, r11	/*r5= the first element of Output array*/
	bl LOOP2
LOOP2:			/*r4=i	for(i=0;i<size;i++)*/
	cmp r4, r9
	bge EXIT2
	ldr r0, =number	/*Let r0 =address of number*/
	ldr r1, [r5]		/*r1 =array element*/

	bl printf		/*Printf number(element)*/

	add r4, r4, #4	/*r4=r4+4	  (i++)*/
	add r5, r5, #4	/*r5=r5+4   (next element)*/
	b LOOP2
EXIT2:
	ldr r0, =enter	/*Let r0 =address of enter*/
	bl printf		/*Print "\n"*/
	mov r0, r11
/*	End function	*/
	nop
	ldmea fp, {fp, sp, pc}
	.end
