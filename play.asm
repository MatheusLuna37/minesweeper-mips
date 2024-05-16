.include "macros.asm"

.globl play

play:
	save_context
	#parâmetros da função
	move $s1, $a0                            # row
	move $s2, $a1                            # column
	
  sll $t0, $s1, 5
  sll $t1, $s2, 2
  add $t0, $s0, $t0
  add $t0, $t1, $t0
  lw $t1, 0 ($t0)                                  # Registrador "$t1" recebe o valor do endereço de board[row][column]                               
  li $t2, -1 
  bne $t1, $t2, exit_if_1                          # se board[row][column] != -1, sai do if
  li $v0, 0
  j return                                         # caso o if seja atendido, retorna 0
  
  exit_if_1:
  li $t2, -2 
  bne $t1, $t2, exit_if_2                          # se board[row][column] != -2, sai do if 2
  move $a0, $s0
  move $a1, $s1
  move $a2, $s2
  move $s5, $t0
  jal countAdjacentBombs                           # salto para a função countAdjacentBombs
  move $s7, $v0
  sw $s7, 0 ($s5)                                  # board[row][column] = x;
  
  exit_if_2:
  bne $s7, $zero, exit_if_3                        # se x != de 0, sai do if 3
  move $a0, $s0
  move $a1, $s1
  move $a2, $s2
  jal revealNeighboringCells                       # salto para a função revealNeighboringCells
  
  exit_if_3:
  li $v0, 1                                        # return 1
  return:
  restore_context
  jr $ra
