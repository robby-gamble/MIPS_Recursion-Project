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






li $v0,4
li $a0,0
la $a0, message2        #about to print 'output:'
syscall  


end:
li $v0,10
syscall
