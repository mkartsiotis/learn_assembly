.section .text
.globl __start

__start:
    # Perform a simple calculation
    dli $t0, 100         # dli is 'Double Load Immediate' (64-bit)
    dli $t1, 200
    daddu $t2, $t0, $t1  # Double Add Unsigned

    # N64 System Call for exit is 5058
    li $v0, 5058         
    li $a0, 0            # Success code 0
    syscall
