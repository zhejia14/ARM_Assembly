/* =================== */
/*	DATA Section	*/
/* =================== */
	.data
	.align 4
/*	vriable a		*/
	.type a, %object
	.size a, 400	/*	array "a" maximum 100 numbers 	*/
/*	array "a" now have 8 numbers 	*/
a:
	.word 13
	.word 11
	.word 19
	.word 5
	.word 7
	.word 2
	.word 3
	.word 1			
/* =================== */
/*	TEXT Section	*/
/* =================== */
	.section .text
	.global main
	.type main,%function
.matrix:
	.word a
main :
	MOV ip, sp
	STMFD sp!, {fp, ip, lr, pc}
	SUB fp, ip, #4
/*	begin function	*/
	
	LDR r10, .matrix		/*let r10 get array address*/
	MOV r9,#32		/*let r9 get array size*/

	MOV r1,r10		/*r1=r10*/
	MOV r2,r9		/*r2=r9*/

	STR r1,[sp,#-4]!		/*push array size into sp(stack)*/
	STR r2,[sp,#-4]!		/*push array address into sp(stack)*/

	BL NumSort		/*jump to Numsort*/
	
/*	end function	*/

	nop
	LDMEA fp, {fp, sp, pc}
	.end
