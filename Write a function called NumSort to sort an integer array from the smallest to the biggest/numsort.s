/* =================== */
/*	DATA Section	*/
/* =================== */
	.data
	.align 4
b:			/*an empty array b*/
	.space 400

/* =================== */
/*	TEXT Section	*/
/* =================== */	
	.section .text
	.global NumSort
	.type NumSort,%function
.matrix:
	.word b
/*	begin function	*/
NumSort:
	MOV ip, sp
	STMFD  sp!, {r0-r10, fp, ip, lr}	
	SUB fp, ip, #4

	LDR r1, [ip], #4	/*Get array size*/
	LDR r0, [ip], #4	/*Get array  address*/
	
	MOV r10, r0	/*r10=r0*/
	MOV r9, r1	/*r9=r1*/

	LDR r2, .matrix	/*r2 go to word b*/
	
	MOV r3, r0	/*get array "a" address*/
	MOV r4, r2	/*get array "b" address*/
	MOV r5, #0	/*r5=0*/

LOOP:			/*copy array "a" to empty array "b"*/
	CMP r5, r9	/*r5 is counter if r5>array size exit*/
	BGE EXIT		/*r5=i for(i=0;i<size;i++)*/
	LDR r7, [r3], #4	/*array "a" value=r7*/
	STR r7, [r4], #4	/*r7= value of array "b"*/
	ADD r5, r5, #4
	B LOOP
EXIT:
	ADD r3,r9,#-4	/* r3=size-4*/
	MOV r5,#0	/* r5=0*/

LOOP2:			
	CMP r5, r9	/*r5=i for(i=0;i<size;i++)*/	
	BGE EXIT2		/*r5 is counter if r5>array size exit*/

	MOV r4, r2	/*get array "b" address*/
	MOV r6, #0	/*r6=j for(j=0;j<size;j++) r6 is a counter*/

LOOP3:	
	CMP r6, r3
	BGE EXIT3		/*r5 is counter if r5>array size exit*/

	LDR r7, [r4]
	LDR r8, [r4,#4]	
	
	CMP r7, r8	/*array[i]>array[j]*/
	MOVGT r11, r7	/*r11 is tmp tmp=array[i]*/
	MOVGT r7, r8	/*array[i]=array[j]*/
	MOVGT r8, r11	/*array[j]=tmp*/

	STRGT r7, [r4]	/*push back*/
	STRGT r8, [r4,#4]

	ADD r4, r4, #4
	ADD r6, r6, #4
	
	B LOOP3

EXIT3:
	ADD r5, r5, #4	
	B LOOP2

/*	end funtion	*/
EXIT2:
	nop
	LDMFD fp, {r0-r10, fp, ip, pc}
	.end