extern printf
extern scanf

section .data
  fm_printf db "enter a positive integer pls", 10, 0
  fm_scanf db "%u", 0
  fm_printf_res db "the result is %u", 10, 0
section .bss
  res resq 1
  user_input resq 1
section .text
  global main
main:
  push rbp
  mov rbp, rsp

  mov rdi, fm_printf
  call printf

  lea rsi, [user_input]
  mov rdi, fm_scanf
  call scanf

  mov rax,[user_input]
  mov rdx,0
Sum:
  cmp rax, 0
  je Sum_END
  add rdx, rax
  dec rax
  jmp Sum

Sum_END:
  mov [res], rdx
  
  mov rax, [res]
  mov rdi, fm_printf_res
  mov rsi, rax
  call printf

  mov rsp, rbp
  pop rbp

  ret
  
