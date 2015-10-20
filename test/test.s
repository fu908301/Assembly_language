TEX:
  .ascii "Hello World\000"
  .text
  .align 2
  .global main
main:
  stmfd sp!, {r0, r1, fp, lr}
  adr r0, TEX
  bl printf
  ldmfd sp!, {r0, r1, fp, lr}
  bx lr 
