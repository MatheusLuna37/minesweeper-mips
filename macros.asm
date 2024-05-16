.eqv SIZE 8
.eqv BOMB_COUNT 10

.macro save_context
	addi $sp, $sp, -36
	sw $s0, 0 ($sp)
	sw $s1, 4 ($sp)
	sw $s2, 8 ($sp)
	sw $s3, 12 ($sp)
	sw $s4, 16 ($sp)
	sw $s5, 20 ($sp)
	sw $s6, 24 ($sp)
	sw $s7, 28 ($sp)
  sw $ra, 32 ($sp)
.end_macro

.macro restore_context
	lw $s0, 0 ($sp)
	lw $s1, 4 ($sp)
	lw $s2, 8 ($sp)
	lw $s3, 12 ($sp)
	lw $s4, 16 ($sp)
	lw $s5, 20 ($sp)
	lw $s6, 24 ($sp)
	lw $s7, 28 ($sp)
  lw $ra, 32 ($sp)
  addi $sp, $sp, 36
.end_macro
