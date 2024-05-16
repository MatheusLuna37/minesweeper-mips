.include "macros.asm"

.globl revealNeighboringCells

revealNeighboringCells:
	save_context
	# parâmetros da função
	move $s0, $a0
	move $s1, $a1                          # row
	move $s2, $a2                          # column
	
  li $s7, 0                                    # int count = 0;
  addi $s3, $s1, -1                            # i = row - 1
  
  # inicio do laço for de i
  for_list_i:
  addi $t0, $s1, 1
  bgt $s3, $t0, end_for_i                      # se i > row + 1, sai do laço for de i
  addi $s4, $s2, -1                            # j = column - 1
  
  # inicio do laço for de j
  for_list_j:
  addi $t0, $s2, 1 
  bgt $s4, $t0, end_for_j                      # se j > column + 1, sai do laço for de j
  li $t0, SIZE
  # if 
  blt $s3, $zero, exit_if                      # i >= 0
  bge $s3, $t0, exit_if                        # i < SIZE
  blt $s4, $zero, exit_if                      # j >= 0
  bge $s4, $t0, exit_if                        # j < SIZE
  sll $t0, $s3, 5                              
  sll $t1, $s4, 2                              # $t1 = o valor de j * 2^2
  add $t0, $s0, $t0
  add $t0, $t1, $t0 
  lw $t1, 0($t0)                               # carrega o valor de board[i][j]
  li $t3, -2                                   
  bne $t1, $t3, exit_if                        # se board[i][j] != -2, pula o incremento
	 
  # Passagem de parâmetros e chamada da função countAdjacentBombs
  move $a0, $s0
  move $a1, $s3
  move $a2, $s4
  move $s5, $t0
  jal countAdjacentBombs                       # salto para a função countAdjacentBombs
  
  move $s7, $v0                                # x = o retorno da função countAdjacentBombs
  sw $s7, 0($s5)                               # board[i][j] = x
  bne $s7, $zero, exit_if                      # !x
  move $a0, $s0
  move $a1, $s3
  move $a2, $s4
  jal revealNeighboringCells
	
  exit_if:
  addi $s4, $s4, 1                             # incremento de j
	
  j for_list_j
  end_for_j:
  addi $s3, $s3, 1                             # incremento de i
	  
  j for_list_i
  end_for_i:	
  restore_context
  jr $ra
