.data

.text
.global main 
.ent main
message1: .asciiz "Input 20 characters max.\n" #I'll need this to communicate with the user
message2: .asciiz "Output\n" #I'll display this after I finish converting everything
message3: .asciiz "Invalid Input.\n" #I'll display this aft
buffer: .space 64



main:
#I'm about to ask the user to input characters
li $v0, 4   	    #Command to print a string
la $a0, message1    #Loading the string into the argument to enable printing
syscall #executing command

li $v0, 8 #Command to read a string
la $a0, buffer #storing space for the string
li $a1, 21 #allocating byte space for string to be stored
syscall #executing command

addi $t0,$t0,0      #initializing my counter
addi $t1,$t1,1      #trigger for loop 1: continues looping, 0: haults the loop
addi $t2,$t2,0      #length of my string

lengthOfString:
li $t2,0                          #setting the intital value of my string's length to 0 string length
count: li $t3,0
addu $t3,$t3,$t7                  #$t3 = my iterator
addu $t3,$t3,$a1                  #$t3 = position in my string
lbu $a2,($t3)                     #loads position to $a2
beq $a2,0,exit                    #check for a NULL value
addi $t0,$t0,1                    #increment my iterator by 1
addi $t4,$t4,1                    #increaseing the value of my string length by 1
j count                           #restarts my count loop
exit: jr $ra



li $v0,10
syscall
.end main
