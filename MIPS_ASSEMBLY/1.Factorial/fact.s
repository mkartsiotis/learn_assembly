# 1. Data Segment: Declare variables and constants here
.data
    message: .asciiz "Factorial program!Give me a number:\n"  # A null-terminated string
# 2. Text Segment: Contain the actual program instructions
.text
.globl main      # Declare 'main' as a global label so the simulator can find it

# 3. Execution Start: The code starts at the 'main' label
main:
    # Your code goes here
    addi $v0, $zero, 4           # Syscall code 4: print string
    la $a0, message     # Load address of the string
    syscall             # Execute the print
    addi $v0, $zero, 5
    syscall
    add $a0, $zero, $v0
    jal fact
    add $s0, $zero, $v0
    add $a0, $s0, $zero
    addi $v0, $zero, 1
    syscall
    # 4. Program Exit: You MUST tell MIPS to stop
    li $v0, 10          # Syscall code 10: exit
    syscall

fact:
    addi $sp, $sp, -8
    sw $a0, 0($sp)
    sw $ra, 4($sp)
    slti $t0, $a0, 1
    beq $t0, $zero, else
    addi $v0, $zero, 1
    addi $sp, $sp, 8
    jr $ra
else:
    addi $a0, $a0, -1
    jal fact
    addi $sp, $sp, 8
    lw $t0, 0($sp)
    mul $v0, $t0, $v0
    lw $ra, 4($sp)
    jr $ra


