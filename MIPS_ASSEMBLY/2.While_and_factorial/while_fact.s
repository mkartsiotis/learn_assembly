#data segment:Declare Variabels and strings 
.data 
    message: .asciiz "Factorial Calculator!!!!!ENTER ANY POSITIVE INTEGER(-1 TO TERMINATE)\n"
    newline: .asciiz "\n"
.text #Here we tell the assembler that the code part starts
.globl  main #Delcere where the assembler should start reading
main:
while_loop_start:
    # SYscall 4 is for outputting strings
    addi $v0, $zero, 4 #Load the syscall code to v0
    la $a0, message #Load the message address to register a0
    syscall # Call the OS to output
    addi $v0, $zero, 5 # Syscall 5 is for integer input
    syscall
    add $t0, $v0, $zero # Move the returned value to t0
    # Now we need to check if the input is specifically -1
    addi $t1, $zero, -1 # Move -1 to register t1
    beq $t0, $t1, EXIT # If input ius -1 exit(go to the exit label that breaks the loop)
    add $a0, $zero, $t0 # Since the syscall saves the results to register v0 and we saved that to t0 we need to move it to a0 for our function call later
    jal fact # We call the function
    add $s0, $zero, $v0 # Now tranfer the results to register s0
    add $a0, $s0, $zero # Tranfer the results from s0 to a0 for the syscall to print
    addi $v0, $zero, 1 # Now do syscall 1 to primnt the integer
    syscall
    #New line to clear...
    addi $v0, $zero ,4 # Load syscall code to v0
    la $a0, newline # Load string address to a0(required per syscall)
    syscall
    j while_loop_start # Jump to the beginning since we are in a while true loop
EXIT:
    # Call the OS to terminate the program(syscall 10)
    addi $v0, $zero, 10
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
