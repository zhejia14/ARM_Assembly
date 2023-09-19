.section .text
.global main
.type main,%function
main:
mov r1, #3  /*r1=3*/
mov r2, #2   /*r2=2*/
mov r3, #10   /*r3=10*/
mov r4, #2   /*r4=2*/
mul r0,r1,r4  /*r0:=r1*r4  3*2  */
add r0,r0,r2,lsl#2  /*r0:=r0+r2*4*/
add r0,r0,r3,lsl#3 /*r0:=r0+r3*8*/
nop
.end

