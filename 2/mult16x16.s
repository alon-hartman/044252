# Operands to multiply
.data
a: .word 0xBAD
b: .word 0xFEED

.text
main:   # Load data from memory
		la      t3, a
        lw      t3, 0(t3)
        la      t4, b
        lw      t4, 0(t4)
        
        # t6 will contain the result
        add		t6, x0, x0

        # Mask for 16x8=24 multiply
        ori		t0, x0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff
        slli	t0, t0, 8
        ori		t0, t0, 0xff
        
####################
# Start of your code

# Use the code below for 16x8 multiplication
#   mul		<PROD>, <FACTOR1>, <FACTOR2>
#   and		<PROD>, <PROD>, t0
		add t1, x0, x0  # t1 = i
		addi s0, x0, 2  # s0 = N
		addi s2, x0, 0xff		
		
LOOP1:	and s3, t4, s2  
		add s4, x0, t1 # s4=0
		slli s4, s4, 3 # 8i
        srl s3, s3, s4
		mul s5, t3, s3  ## a*bi
		and s5, s5, t0
		slli s2, s2, 8
        sll s5, s5, s4 
		add t6, t6, s5
		
		addi t1, t1, 1
		blt t1, s0, LOOP1
		
		

# End of your code
####################
		
finish: addi    a0, x0, 1
        addi    a1, t6, 0
        ecall # print integer ecall
        addi    a0, x0, 10
        ecall # terminate ecall


