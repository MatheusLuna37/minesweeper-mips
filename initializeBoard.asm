.include "macros.asm"

.globl initializeBoard

initializeBoard:
	save_context
	move $s0, $a0 
  
li $s1,0 				# i = 0
begin_for_i_ib:				# for (int i = 0; i < SIZE; ++i) {
li $t0,SIZE
bge $s1,$t0,end_for_i_ib 
	li $s2,0 			# j = 0
	begin_for_j_ib:			# for (int j = 0; j < SIZE; ++j) {
	li $t0,SIZE
	bge $s2,$t0,end_for_j_ib
		sll $t0, $s1, 5 	# i*8
		sll $t1, $s2, 2 	# j
		add $t0, $t0, $t1
		add $t0, $t0, $s0
		li $t1, -2
		sw $t1,0($t0)		# board[i][j] = -2; // -2 means no bomb
		addi $s2,$s2,1
		j begin_for_j_ib
	end_for_j_ib:
	addi $s1, $s1, 1
	j begin_for_i_ib
end_for_i_ib:
restore_context
jr $ra 
