main:
	li 		$v0,	5							# ����n��$t0��
	syscall
	move 	$t0,	$v0
	li		$t1,	0
	li		$s0,	16							# �����������ʼ��ַ
START_INPUT:
	slt		$t2,	$t1,	$t0
	beq		$t2,	0,		END_INPUT
	
	li 		$v0,	5							# ���뵽������
	syscall
	sw		$v0,	($s0)
	add		$s0,	$s0,	4

	add		$t1,	$t1,	1
	j		START_INPUT
END_INPUT:

	li		$t1,	0 							# ѭ������
	li		$s0,	16 							# ������ʼ��ַ
	li		$t3,	0 							# ��ǰ��Զ�ܵ����λ��
START:
	slt		$t2,	$t1,	$t0
	beq		$t2,	0,		END					# �жϵ�ǰ�Ƿ��Ѿ���������
	slt		$t2,	$t3,	$t1
	beq		$t2,	1,		FALSE				# �����Զ�ܵ����λ��С�ڵ�ǰλ�ã����ʾ��ǰλ���޷�����
	
	lw		$t5,	($s0)
	add		$t5,	$t5,	$t1					# ����ӵ�ǰ�����ܵ������Զλ��
	slt		$t2,	$t3,	$t5
	beq		$t2, 	0,		ISMAX				# ���µ�ǰ�ܵ������Զλ��
	move	$t3,	$t5
	
ISMAX:
	add		$s0,	$s0,	4
	add		$t1,	$t1,	1
	j		START
END:
	la 		$a0,	str_true					# ������һ��λ�ÿ��Ե���
	li		$v0,	4
	syscall
	j		END_ALL
FALSE:
	la 		$a0,	str_false					# ������һ��λ���޷�����
	li		$v0,	4
	syscall	
END_ALL:

.data 
    str_true:
        .ascii "True\0"
    str_false:
    	.ascii "False\0"
