.include "macros.asm"

.globl plantBombs

plantBombs:
	save_context
	move $s0, $a0
	
li $a0, 0	  			# srand(time(NULL));
li $a1, 8
	
li $s1, 0   				# i = 0
begin_for_i_pb:				
bge $s1, BOMB_COUNT, end_for_i_pb 	# for (int i = 0; i < BOMB_COUNT; i++) {
	do_cb:				# do {
		li $v0, 42
		syscall 
		move $s2, $a0  		# row = rand() % SIZE;
		syscall 
		move $s3, $a0  		# column = rand() % SIZE;
	sll $t0, $s2, 5
	sll $t1, $s3, 2
	add $t2, $t0, $t1
	add $t0, $t2, $s0
	lw $t1,0 ($t0)
	li $t2, -1
	beq $t1, $t2, do_cb 		# while ( board[row][column] == -1);
	sw $t2,0 ($t0)			# board[row][column] = -1; // -1 is no bomb
	addi $s1, $s1, 1    
	j begin_for_i_pb
end_for_i_pb:
restore_context
jr $ra
