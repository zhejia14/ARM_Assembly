/* =================== */
/*	TEXT Section	*/
/* =================== */	
	.section .text
	.global NumSort
	.type NumSort,%function
NumSort:
	stmfd sp!, {r4-r9, fp, ip, lr}
/*	Begin function	*/
	mov r4, r0		/*Get Input array size*/
	mov r5, r1		/*Get Input array address*/

	mov r0, #32	/*r0=32 the same size of Input array*/
	bl malloc		/*Creat an empty array and size is 32*/ 
	mov r6, r0 	/*Get empty array address*/	
	mov r8, #0	/*r8=0 Let r8 be a counter*/

LOOP:			/*i=r8	for(i=0;i<size;i++)*/
	cmp r8, r4		/*Copy Input array into empty array*/
	bge EXIT		/*r8 is counter if r8>array size exit*/
	ldr r9, [r5], #4	/*Input array value=r5*/
	str r9, [r6], #4	/*r5= value of empty array*/
	add r8, r8, #4
	b LOOP
EXIT:
	add r5, r4, #-4	/*r5=size-4*/
	mov r8, #0	/*r8=0*/
LOOP2:			/*Bubble Sort	i=r8	for(i=0;i<size;i++)*/
	cmp r8, r4
	bge EXIT2		/*r8 is counter if r8>array size exit*/

	mov r6, r0		/*Get empty array address*/
	mov r11, #0	/*r11=0 Let r11 be a counter*/
LOOP3:			/*j=r11	for(j=0;j<i-1;j++)*/
	cmp r11, r5
	bge EXIT3
	
	ldr r9, [r6]
	ldr r10, [r6, #4]

	cmp r9, r10	/*array[i]>array[j]*/
	movgt r12,r9	/*r12 is tmp tmp=array[i]*/
	movgt r9, r10	/*array[i]=array[j]*/
	movgt r10, r12	/*array[j]=tmp*/

	strgt r9, [r6]	/*push back*/
	strgt r10, [r6, #4]

	add r6, r6, #4
	add r11, r11, #4

	b LOOP3
EXIT3:
	add r8, r8, #4
	b LOOP2
EXIT2:			/*Get Output array and r0= address of Output array return r0*/
	nop
	ldmfd sp!, {r4-r9, fp, ip, pc}
	.end