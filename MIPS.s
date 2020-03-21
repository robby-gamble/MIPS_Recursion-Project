.data

.text
.global main 
.ent main
message1: .asciiz "Input 20 characters max.\n" #I'll need this to communicate with the user
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


li $v0,10
syscall
.end main
