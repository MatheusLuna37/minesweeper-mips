.include "macros.asm"

.globl printBoard

printBoard:
	save_context
	move $s0, $a0
	move $s1, $a1
	
li $v0, 11 
li $a0, 32 					# printf("    ");
syscall							
syscall
syscall
syscall
  

li $t0, 0
begin_for_j1_prb:				# for (int j = 0; j < SIZE; ++j)	
li $t1, SIZE
bge $t0, $t1, end_for_j1_prb
  	li $v0, 11 
  	li $a0, 32 				# print (' ')
	syscall
  	li $v0, 1
  	move $a0, $t0 				# print ('j')
  	syscall
  	li $v0, 11
  	li $a0, 32 				# print (' ')
  	syscall
  	addi $t0, $t0, 1
  	j begin_for_j1_prb
end_for_j1_prb:
   
li $v0, 11
li $a0, 10 					# printf("\n");
syscall
    
li $v0, 11
li $a0, 32 					# printf("   ");
syscall
syscall
syscall
syscall
   
li $t0, 0
begin_for_j2_prb:				# for (int j = 0; j < SIZE; ++j)
li $t1, SIZE
bge $t0, $t1, end_for_j2_prb
  	li $v0, 11
  	li $a0, 95 				# printf("___");
  	syscall
  	syscall
  	syscall
  	addi $t0, $t0, 1
  	j begin_for_j2_prb
end_for_j2_prb:
    
li $v0, 11
li $a0, 10 					# printf("\n");
syscall
    
li $t0, 0
begin_for_i_prb:				# for (int i = 0; i < SIZE; ++i) {
li $t7, SIZE
bge $t0, $t7, end_for_i_prb
  	li $v0, 1
  	move $a0, $t0 				# printf(i)
  	syscall
  
  	li $v0, 11
  	li $a0, 32 				# printf(" ")
  	syscall
  
	li $v0, 11
  	li $a0, 124 				# printf("|")
  	syscall
  
  	li $v0, 11
  	li $a0, 32 				# print(" ")
  	syscall
  	
  	li $t1, 0
  	begin_for_ji_prb:			# for (int j = 0; j < SIZE; ++j) {
  	li $t7, SIZE
  	bge $t1, $t7, end_for_ji_prb
  		li $v0, 11
  		li $a0, 32 			# print(" ")
  		syscall
  	
  		sll $t2, $t0, 5
		sll $t3, $t1, 2
	
		add $t4, $t2, $t3
		add $t3, $t4, $s0
		lw  $t4, 0 ($t3)
		li $t7, -1
		bne $t4, $t7, elseif_imt	# if (board[i][j] == -1 && showBombs) {
		beqz $s1, elseif_imt		
		
			li $v0, 11
  			li $a0, 42 		# print (*)
  			syscall
  			j print_space
  	
		elseif_imt:
		blt $t4, $zero, else_imt	# else if (board[i][j] >= 0) {
			li $v0, 1
  			move $a0, $t4 		# printf(" %d ", board[i][j]); // Revealed cell
  			syscall					
  			j print_space  	
		
		else_imt:
			li $v0, 11
  			li $a0, 35 		# printf(#)
  			syscall
		print_space:
  
		li $v0, 11
		li $a0, 32 			# printf(' ')
		syscall
  
		addi $t1, $t1, 1 
		j begin_for_ji_prb
	end_for_ji_prb:
  	
  	li $v0, 11
  	li $a0, 10 				# printf('\n')
  	syscall
  
  	addi $t0, $t0, 1 
  	j begin_for_i_prb
end_for_i_prb:
  
restore_context  
jr $ra
