# swap_array.asm program
#
#
# IMPORTANT: READ, BUT DO NOT CHANGE ANY OF THE CODE IN THIS PROGRAM
#           THAT IS ALREADY THERE! ONLY ADD YOUR NEW CODE WHERE 
#           IT SAYS TO DO SO, i.e. IN THE doSwap: AREA.
#

.data
# Data Area.  Note that while this is typically only
# For global immutable data, for SPIM, this also includes
# mutable data.        

incorrect:  .asciiz "---TEST FAILED---\n"
before:     .asciiz "Before:\n"
after:      .asciiz "After:\n"
comma:      .asciiz ", "
newline:    .asciiz "\n"
        
expectedMyArray:
        .word 29 28 27 26 25 24 23 22 21 20 19 17
myArray:
        .word 29 17 27 20 25 22 23 24 21 26 19 28

.text
# Print everything in the array (without use of a loop)
# Used as a function/sub-routine

printArray:
        la $t0, myArray

        li $v0, 1
        lw $a0, 0($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
        
        li $v0, 1
        lw $a0, 4($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 8($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 12($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 16($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 20($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 24($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 28($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 32($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall
		
	li $v0, 1
        lw $a0, 36($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 40($t0)
        syscall
        li $v0, 4
        la $a0, comma
        syscall

        li $v0, 1
        lw $a0, 44($t0)
        syscall
        li $v0, 4
        la $a0, newline
        syscall

        jr $ra
        
# unsigned int* p1 = expectedMyArray
# unsigned int* p2 = myArray
# unsigned int* limit = expectedMyArray + 12
#
# while (p1 < limit) {
#   if (*p1 != *p2) {
#     return 0                  
#   }
#   p1++                        
#   p2++
# }
# return 1                      

checkArrays:
        # $t0: p1
        # $t1: p2
        # $t2: limit
        
        la $t0, expectedMyArray
        la $t1, myArray
        addiu $t2, $t0, 44

checkArrays_loop:
        slt $t3, $t0, $t2
        beq $t3, $zero, checkArrays_exit

        lw $t4, 0($t0)
        lw $t5, 0($t1)
        bne $t4, $t5, checkArrays_nonequal
        addiu $t0, $t0, 4
        addiu $t1, $t1, 4
        j checkArrays_loop
        
checkArrays_nonequal:
        li $v0, 0
        jr $ra
        
checkArrays_exit:
        li $v0, 1
        jr $ra
        
main:   
        # Print array "before"
        la $a0, before
        li $v0, 4
        syscall

        jal printArray
        
        # Do swap function 
        jal doSwap

        # Print array "after"
        la $a0, after
        li $v0, 4
        syscall
        
        jal printArray

        # Perform check on array
        jal checkArrays
        beq $v0, $zero, main_failed
        j main_exit
        
main_failed:
        la $a0, incorrect
        li $v0, 4
        syscall
        
main_exit:      
	# TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
    #ez

# COPYFROMHERE - DO NOT REMOVE THIS LINE

doSwap:
        # TODO: translate the following C code into MIPS
        # assembly here.
        # Use only regs $v0-$v1, $t0-$t7, $a0-$a3.
        # You may assume nothing about their starting values.
        #
        #
        # unsigned int x = 1; 
        # unsigned int y = 11; 
        # while (x < 6) { 
        # int temp = myArray[x]; 
        # myArray[x] = myArray[y]; 
        # myArray[y] = temp; 
        # x+=2; 
        # y-=2; 
        # }
        
        #addresses for the array go from 0 to 44 - remember this, me
        #register t0 is also where the array is at. For example 0($t0)
        #is the first value in the array. Each number is 4 bytes long, so
        #we will have to add by 8 and sub by 8 respectivly from each side
    
        la $t0 myArray

        #current address count of t1
        li $t5 4

        #as well as the temp holder register
        li $t3 0
        li $t4 0
        
        #li $t6 24 - unnecessary
        

        #doesn't work: not sure why
        #loading addresses into t1 and t2
        #lw $t1 4($t0)
        #lw $t2 44($t0)
        
        #trying other way to load addresses:
        addiu $t1 $t0 4
        addiu $t2 $t0 44

        j swapLoop

swapLoop:
        #the c code has it so that x < 6. That means we want the left address to
        #be less that 6 x 4 = 24
        
        # t1 left pointer, t2 right pointer

        #print random shit cuz assembly is ASS
        #li $v0 1
        #li $a0 5
        #syscall

        #opposite of x < 6 -> greater than or equal to
        bge $t5 24 swapExit
        
        #li $v0 1
        #li $a0 6
        #syscall

        #copy values over to temp
        lw $t3 0($t1)
        lw $t4 0($t2)

        #initiate swapperz
        sw $t4 0($t1)                # x = y
        sw $t3 0($t2)                # y = temp

        # ^^^ I hope this works!
        
        #li $v0 1
        #li $a0 7
        #syscall

        #decrement/increment
        
        #x
        addiu $t1 $t1 8
        addu  $t5 $t5 8
        
        #y
        addiu $t2 $t2 -8
        
        #li $v0 1
        #li $a0 42
        #syscall

        j swapLoop
swapExit:
# meep. Just here for bge to work, as well as ending the thing
        # do not remove this last line
        jr $ra


