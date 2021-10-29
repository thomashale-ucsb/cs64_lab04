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
    is: .asciiz "is:\n"
    endln: .asciiz "\n"

    #numbs and anaesthesia
    li $t0 0        #loop count stuff
    li $t1 1        #factorialz and logic stuff

#Text Area (i.e. instructions)
.text
    # loop with bge (bge >= 0), till increment counter is < 0, then goto
    # end processing label thingy, which then gotos exit
main:
    
	# TODO: Write your code here

exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
