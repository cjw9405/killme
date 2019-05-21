#Jinwoo Choi
#110096881
#20190521HW5P1

#a0 = first input mul
#a1 = second input mul
#t0 = temp for a0
#t1 = temp for a1
#t2 = temp for v0
#t3 = counter
#t4 = counter limit
#t5 = flag


.data
inmsg1:	.asciiz "Input first number:\n"
inmsg2:	.asciiz "Input second number:\n"
outmsg:	.asciiz "The result is: \n"	

.text
main:   	addi $sp, $sp, -4
	sw $ra, 0($sp)
				
	la $a0, inmsg1
	li $v0, 4 
	syscall		
	li $v0, 5	
	syscall
	move $t0, $v0

	la $a0, inmsg2
	li $v0, 4 
	syscall
	li $v0, 5
	syscall
	move $t1, $v0

	move $a0, $t0
	move $a1, $t1

	jal multp

	move $t2, $v0

	la $a0, outmsg 
	li $v0, 4
	syscall
	move $a0, $t2
	li $v0,1
	syscall

	lw $ra, 0($sp)
	addi $sp, $sp, 4

	jr $ra

multp: 	addi $sp, $sp, -20

	sw $t1, 0($sp)
	sw $t2, 4($sp)
	sw $t3, 8($sp)
	sw $t4, 12($sp)
	sw $t5, 16($sp)
		
	li $t3,0
	li $t4,15
	li $t5,1
	li $v0,0

loop:	beq $t3, $t4, end
	andi $t5, $a0, 1
	beq $t5, $0, shift
	add $v0,$v0, $a1

shift:	sll $a1,$a1, 1 
	srl $a0,$a0, 1 
	addi $t3, $t3, 1
	j loop

end:	lw $t1, 0($sp)
	lw $t2, 4($sp)
	lw $t3, 8($sp)
	lw $t4, 12($sp)
	lw $t5, 16($sp)

	addi $sp, $sp, 20

	jr $ra