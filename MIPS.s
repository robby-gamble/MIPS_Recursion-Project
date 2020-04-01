.data
output: .asciiz "Output\n" #I'll display this after I finish converting everything
notvalid: .asciiz "Invalid Input.\n" #I'll display this aft
data: .space 1001
comma: .asciiz ","

.text

li $v0, 8
la $a0, data #Getting User Input
li $a1, 1001
syscall

jal SubA

cont1:
j print

SubA:

sub $sp, $sp,4 #creates stack space
sw $a0, 0($sp) #puts input in stack
lw $t1, 0($sp) # stores the input into $t1
addi $sp,$sp,4 # moves the stack pointer up
move $t7, $t1 # stores beginning of input into $t7

run:

li $t3,0 #Looking for tabs or spaces
li $t0, -1 #used for invaild input
lb $s0, ($t1) # loads the bit that $t0 is pointing to
beq $s0, 0, insidesubstring# check for null
beq $s0, 10, insidesubstring #checks for new line
beq $s0, 44, invalloop #check for comma
beq $s0, 9, skip # checks for tabs character
beq $s0, 32, skip #checksc checks for space character
move $t7, $t1 #stores first non-space/tab character
j loop # starts loop over


skip:
addi $t1,$t1,1 #move $t1 to the next element
j run

loop:


lb $s0, ($t1) # loads the bit that $t0 is pointing to
beq $s0, 0,next# check for null
beq $s0, 10, next #checks for new line
addi $t1,$t1,1 #move the $t1 to the next element
beq $s0, 44, substring #check if bit is a comma

check:
bgt $t3,0, invalloop #checks to see if I have spaces or tabs between my valid characters:
beq $s0, 9,  gap #checks for tab characters
beq $s0, 32, gap #checks for  space character
ble $s0, 47, invalloop # checks for ascii less than 48
ble $s0, 57, isvalid # checks for integers
ble $s0, 64, invalloop # checksfor ascii less than 64
ble $s0, 88, isvalid    # checks for my capital letters
ble $s0, 96, invalloop # checks for ascii less than 96
ble $s0, 120, isvalid     # checks for lowercase letters
bge $s0, 121, invalloop # checks for ascii greater than 120


gap:

addi $t3,$t3,-1 #tracking spaces/tabs
j loop

isvalid:

addi $t4, $t4,1 #tracking valid characters
mul $t3,$t3,$t0 #if there was a space before a valid character it will change $t3 to a positive number
j loop #jumps to the beginning of loop




invalloop:

lb $s0, ($t1) # loads the bit that $t1 is pointing to
beq $s0, 0, insidesubstring
beq $s0, 10, insidesubstring
addi $t1,$t1,1
beq $s0, 44, insidesubstring

j invalloop #jumps to the beginning of loop





li $v0,4
li $a0,0
la $a0, message2        #about to print 'output:'
syscall  


end:
li $v0,10
syscall
