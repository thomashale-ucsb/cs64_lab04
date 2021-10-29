# Factorial.asm program
#

# Assembly (NON-RECURSIVE) version of:
#   int n, fn=1;
#   cout << "Enter a number:\n";
#   cin >> n;
#   for (int x = 2; x <= n; x++) {
#       fn = fn * x;
#   }
#   cout << "Factorial of " << x << " is:\n" << fn << "\n";
#
.data

	# TODO: Write your initializations here
    # kk teacher
    askNum: .asciiz "Enter a number:\n"
    shapirz: .asciiz "Factorial of "
    is: .asciiz " is:\n"
    endln: .asciiz "\n"

    #numbs and anaesthesia
    li $t0 0        #loop count stuff
    li $t1 1        #factorialz and logic stuff
    li $t2 0        #holder value for num being factorialed

#Text Area (i.e. instructions)
.text
    # loop with bge (bge >= 0), till increment counter is < 0, then goto
    # end processing label thingy, which then gotos exit
main:
    
	# TODO: Write your code here
    
    #printing out the questioning statement
    li $v0 4
    la $a0 askNum
    syscall

    # get num
    li $v0 5
    syscall
    add $t0 $v0 $0
    move $t2 $t0
    
    j factLoop

#looping stuff lol
factLoop:
    
    #if (n < 0) --> stop looping
    ble $t0 $t2 exitStuff
    
    #action stuff
    mult $t1 $t0
    mflo $t1
    
    #decrement schizz
    add $t0 $t0 -1
    
    #testing print --> this isn't even working??????
    li $v0 1
    move $a0 $t0
    add $a0 $a0 $0
    syscall
    
    li $v0 4
    la $a0 is
    syscall

    j factLoop

#handles the final ugly string thingy
exitStuff:
    
    #typing all of this is painful
    
    #shapirz
    li $v0 4
    la $a0 shapirz
    syscall

    #num being factorialed
    li $v0 1
    move $a0 $t2
    add $a0 $a0 $0
    syscall
    
    #is
    li $v0 4
    la $a0 is
    syscall

    #factz and logicz (factorial number)
    li $v0 1
    move $a0 $t1
    add $a0 $a0 $0
    syscall

    #endln
    li $v0 4
    la $a0 endln
    syscall
    

    #why not?
    j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
