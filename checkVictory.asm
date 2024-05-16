.include "macros.asm"

.globl checkVictory

checkVictory:
	# parâmetros da função
	save_context
	move $s0, $a0
	
  li $s7, 0                                 # int count = 0
  
  li $s1, 0                                 # i = 0
  for_list_i:
  li $t0, SIZE
  bge $s1, $t0, end_for_i                  # se i >= SIZE, sai do loop for
  
  li $s2, 0
  for_list_j:
  li $t0, SIZE
  bge $s2, $t0, end_for_j                  # se j >= SIZE, sai do loop for
  sll $t0, $s1, 5
  sll $t1, $s2, 2
  add $t0, $s0, $t0
  add $t0, $t1, $t0
  lw $t1, 0 ($t0)                          
  blt $t1, $zero, exit_if                  # board[i][j] < 0, sai do if
  addi $s7, $s7, 1                         # incrementa o count, count ++
  
  exit_if:
  addi $s2, $s2, 1                         # incrementa o j
  j for_list_j
  
  end_for_j:
  addi $s1, $s1, 1                         # incrementa o i
  j for_list_i
  
  end_for_i:
  li $t2, SIZE
  mul $t1, $t2, $t2                        
  subi $t1, $t1, BOMB_COUNT
  bge $s7, $t1, return_1                   # if (count < SIZE * SIZE - BOMB_COUNT);
  li $v0, 0                                # return 0;
  j end
  
  return_1:
  li $v0, 1                                # return 1;
  
  end:
  restore_context
  jr $ra
