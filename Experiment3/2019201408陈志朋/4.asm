main:
#	li		$s0,	2
#	li		$s1,	5
#	li		$s2,	0
	
	move	$t0,	$zero
START_A:
	slt		$t2,	$t0,	$s0
	beq		$t2,	$zero,	END_A 	# �ж�ѭ������
	move	$t1,	$zero
START_B:
	slt		$t2,	$t1,	$s1
	beq		$t2,	$zero,	END_B 	# �ж�ѭ������
	add		$t2,	$t0,	$t1		# ����i + j
	sll		$t3,	$t1,	4		# ƫ����Ϊj * 4 * 4
	add		$t3,	$t3,	$s2
	sw		$t2,	($t3)			# ���浽����
	addi	$t1,	$t1,	1
	j		START_B 				# ѭ��
END_B:
	addi	$t0,	$t0,	1
	j	START_A 					# ѭ��
END_A:
