main:
	j		INPUT
ERROR:
	la		$a0,	err					# ���������Ϣ
	li		$v0,	4
	syscall
INPUT:
	li 		$v0,	5					# ����a��$t0��
	syscall
	move 	$t0,	$v0
	li 		$v0,	5					# ����b��$t1��
	syscall
	move 	$t1,	$v0
	li 		$v0,	5					# ����c��$t2��
	syscall
	move 	$t2,	$v0
	slt		$t4,	$zero,	$t0			# �ж�a��0�Ĵ�С
	beq		$t4,	$zero,	ERROR
	slt		$t4,	$zero,	$t1			# �ж�b��0�Ĵ�С
	beq		$t4,	$zero,	ERROR
	slt		$t4,	$zero,	$t2			# �ж�c��0�Ĵ�С
	beq		$t4,	$zero,	ERROR

	mul		$t4,	$t0,	$t1
	mul		$t4,	$t4,	$t2			# ����a * b * c
	move 	$a0,	$t4
	li		$v0,	1
	syscall
	
	la		$a0,	mid					# ���������֮��Ŀո�
	li		$v0,	4
	syscall
	
	mul		$t4,	$t0,	$t1			# ����a * b
	mul		$t5,	$t0,	$t2			# ����a * c
	mul		$t6,	$t1,	$t2			# ����b * c
	add		$t4,	$t4,	$t5			
	add		$t4,	$t4,	$t6
	mul		$t4,	$t4,	2			# ����(ab + ac + bc) * 2
	move 	$a0,	$t4
	li		$v0,	1
	syscall	

.data
	mid:
        .ascii " \0"
    err:
        .ascii "Illegal Input\n\0"
