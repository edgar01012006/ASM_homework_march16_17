extern printf
extern scanf

section .data
  fm_printf db "enter 2 integeres pls", 10, 0
  fm_scanf db "%d %d", 0
  fm_printf_res db "the result is %d", 10, 0
section .bss
  num1 resq 1
  num2 resq 1
  res resq 1

section .text
  global main:
main:
  push rbp
  mov rbp, rsp
  

  mov rdi, fm_printf
  call printf

  lea rsi, [num1]
  lea rdx, [num2]
  mov rdi, fm_scanf
  call scanf

  mov rax, 1
  mov rdi, [num1]
  mov rsi, [num2]

L1:
  cmp rsi, 0
  je L1_END
  mul rdi
  dec rsi
  jmp L1
L1_END:
  mov [res], rax
  
  mov rax, [res]
  mov rdi, fm_printf_res
  mov rsi, rax
  call printf

  mov rsp, rbp
  pop rbp

  ret

