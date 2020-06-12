.global main
.data
    A1: .quad 12 #Array 1
        .quad 11

    A2: .quad 12 #Array 2
        .quad 11

    A3: .quad 0 #Array 3
        .quad 0

    x: .quad 0

.text
main:
    xorq %rax, %rax #xorq is used to set a register to zero.
    xorq %rcx, %rcx
    xorq %rbx, %rbx
    xorq %rdx, %rdx
    xorq %rsi, %rsi

    movq $A3, %rsi #Creates a array pointer for A3.
    pushq %rsi      #Pushes the address of the first index to the stack.

    movq $A1, %rbx #Creates a array pointer for A1.
    movq (%rbx), %rax #Moves the value of A1's first index into the rax register.
    pushq %rax #Pushes the value of the rax register to the stack.
    addq $8, %rbx #Moves to the next index of A1.
    movq (%rbx), %rax #Moves the value of A1's second index into the rax register.

    movq $A2, %rcx #Creates a array pointer for A2.
    movq (%rcx), %rdx #Moves the value of A2's first index into the rdx register.
    pushq %rdx #Pushes the value of the rdx register to the stack.
    addq $8, %rcx #Moves to the next index of A2.
    movq (%rcx), %rdx #Moves the value of A2's second index into the rdx register.
    addq  %rax, %rdx #Adds the rdx register with the rax register.
    movq %rdx, (%rsi) #Moves the value of the rax register into A3's first index.


    popq %rdx #Moves the value from line 31's stack push into the rdx register.
    popq %rax #Moves the value from line 25's stack push into the rax register.
    addq %rax, %rdx #See line 38.
    addq $8, %rsi #Moves to the next index of A3.
    movq %rdx, (%rsi) #Moves the value of the rax register into A3's second index.

    movq (%rsi), %rdx #Moves the value of A3's second index into the rdx register.
    popq %rsi         #Moves the address from line 21's stack push into the rsi register.  
    movq (%rsi), %rax #Moves the value of A3's first index into the rdx register.

    xorq %rax, %rax
    xorq %rdx, %rdx
    xorq %rcx, %rcx
    
    loopStart:
        cmpq $2, %rdx 
        jge loopEnd
        incq %rdx
        movq (%rsi), %rcx
        addq %rcx, %rax
        addq $8, %rsi
        jmp loopStart

    loopEnd:
        movq $60, %rax  #Exit.
        movq $0, %rdi   #Exit success.
        syscall #Requests the operating system.
