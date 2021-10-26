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
    


exit:
	# TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
