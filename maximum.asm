# maximum.asm program
#

.data

	# TODO: Complete these declarations / initializations

	askNum: .asciiz "Enter the next number:\n"
	maxPain: .asciiz "Maximum: "
    endln: .asciiz "\n"

#Text Area (i.e. instructions)
.text

main:

	# TODO: Write your code here
    # You can have other labels expressed here, if you need to
    
    # initialize variables
    li $t0 0
    li $t1 0
    li $t2 0

    # ask/get input 1
    li $v0 4
    la $a0 askNum
    syscall

    li $v0 5
    syscall
    add $t0 $v0 $0

    #ask/get input 2
    li $v0 4
    la $a0 askNum
    syscall

    li $v0 5
    syscall
    add $t1 $v0 $0

    #ask/get input 3
    li $v0 4
    la $a0 askNum
    syscall

    li $v0 5
    syscall
    add $t2 $v0 $0

    #finding the maximum
    
    #if $t0 >= $t1
    bge $t0 $t1 great1

    #else
    j great2

#if $t0 >= $t1
great1:
#now see if $t0 >= $t2
    li $t3 $t0
    bge $t0 $t2 exitPrint

#essentially else case
    li $t3 $t2
    j exitPrint

#if $t1 >= $t0
great2:
#now see if $t1 >= $t2
    li $t3 $t1
    bge $t1 $t2 exitPrint

#else 
    li $t3 $t2
    j exitPrint
    

exitPrint:
    
    #print what's in #t3
    li $v0 4
    la $a0 maxPain
    syscall

    li $v0 1
    move $a0 $t3
    add $a0 $a0 $0
    syscall

exit:
    #exiting instructions
    li $v0 10
    syscall
