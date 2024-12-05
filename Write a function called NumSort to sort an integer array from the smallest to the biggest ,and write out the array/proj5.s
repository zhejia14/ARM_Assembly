.set SWI_open, 0x1
.set SWI_write, 0x5
.set SWI_close, 0x2
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
string_adds:
	.space 32, 0
number:			/*Printf numbers*/ 
	.ascii "%d \000"
filename:
	.ascii "result.txt\000"
/* =================== */
/*	TEXT Section	*/
/* =================== */
	.section .text
	.global main
	.type main,%function
.string_adds:
	.word string_adds
.open:
	.word filename
	.word 0x4
	.word 0x8
.write:
	.space 4		/*file descriptor*/
	.space 4		/*address of the string*/
	.space 4		/*length of the string*/
.close:
	.space 4
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

	mov r4, #0	/*r4=0 Let r4 be a counter*/
	mov r5, r11	/*r5= the first element of Output array*/ 
	ldr r6, .string_adds
LOOP:			/*r4=i	for(i=0;i<size;i++)*/
	cmp r4, r9
	bge EXIT
	mov r0, r6
	ldr r1, =number	/*Let r1 =address of number*/
	ldr r2, [r5]	
	bl sprintf		/*Do sprintf*/
	
	add r4, r4, #4	/*r4=r4+4	  (i++)*/
	add r5, r5, #4	/*r5=r5+4   (next element)*/
	str r6 , [r6,#4]!
	b LOOP
EXIT:
	mov r0, #SWI_open
	adr r1, .open
	swi 0x123456
	mov r2,r0		/*r2 is file descriptor*/
	
	adr r1, .write
	str r2, [r1,#0]	/*store file descriptor*/

	ldr r3, .string_adds
	str r3, [r1, #4]	/*store the address of string_adds*/
	
	mov r3, #32
	str r3,[r1, #8]	/*store the length of the string*/

	mov r0, #SWI_write
	swi 0x123456

	adr r1, .close
	str r2, [r1, #0]	/*store file descriptor*/

	mov r0, #SWI_close
	swi 0x123456 

/*	End function	*/
	nop
	ldmea fp, {fp, sp, pc}
	.end
