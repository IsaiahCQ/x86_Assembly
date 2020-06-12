.global main
.data
    numArray:   .quad 7
                .quad 1
                .quad 6
                .quad 8
                .quad 0
                .quad 9
.text
main:
xorq %rcx, %rcx

whileStart:
cmpq $6, %rcx
je whileEnd
incq %rcx

xorq %rax, %rax
xorq %rax, %rax
xorq %rdx, %rdx
xorq %rdi, %rdi

movq $numArray, %rdi

loopStart:
incq %rdx
cmpq $6, %rdx    
je loopEnd
        #pushq %rdi
pushq %rdi
addq $8, %rdi
movq (%rdi), %rax
popq %rdi
cmpq (%rdi), %rax

jg ifGreater
pushq (%rdi)
#pushq %rdi
movq %rax, (%rdi)
popq %rax
pushq %rdi
addq $8, %rdi
movq %rax, (%rdi)
popq %rdi

ifGreater:
addq $8, %rdi
jmp loopStart

loopEnd:
jmp whileStart

whileEnd:
xorq %rdi, %rdi
xorq %rcx, %rcx
movq $numArray, %rdi
        
arrayDiplay:
incq %rcx
cmpq $7, %rcx
je programEnd
movq (%rdi), %rax #016789
addq $8, %rdi
jmp arrayDiplay

programEnd:
