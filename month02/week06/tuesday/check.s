	.file	"check.c"
	.text
	.section	.rodata
.LC0:
	.string	"PASS"
	.align 8
.LC1:
	.base64	"RkFJTDogJWQg0LPQsNGA0YHQsNC9LCAlZCDQsdCw0LnRhSDRkdGB0YLQvtC5CgA="
	.text
	.globl	checkInt
	.type	checkInt, @function
checkInt:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jne	.L2
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L4
.L2:
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	leaq	.LC1(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
.L4:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	checkInt, .-checkInt
	.section	.rodata
	.align 8
.LC4:
	.base64	"RkFJTDogJWcg0LPQsNGA0YHQsNC9LCAlZyDQsdCw0LnRhSDRkdGB0YLQvtC5CgA="
	.text
	.globl	checkDouble
	.type	checkDouble, @function
checkDouble:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movsd	%xmm0, -8(%rbp)
	movsd	%xmm1, -16(%rbp)
	movsd	-8(%rbp), %xmm0
	subsd	-16(%rbp), %xmm0
	movq	.LC2(%rip), %xmm1
	andpd	%xmm0, %xmm1
	movsd	.LC3(%rip), %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L10
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L11
.L10:
	movsd	-16(%rbp), %xmm0
	movq	-8(%rbp), %rax
	leaq	.LC4(%rip), %rdx
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	movq	%rdx, %rdi
	movl	$2, %eax
	call	printf@PLT
.L11:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	checkDouble, .-checkDouble
	.section	.rodata
	.align 8
.LC5:
	.base64	"RkFJTDogJyVjJyDQs9Cw0YDRgdCw0L0sICclYycg0LHQsNC50YUg0ZHRgdGC0L7QuQoA"
	.text
	.globl	checkChar
	.type	checkChar, @function
checkChar:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	movzbl	-4(%rbp), %eax
	cmpb	-8(%rbp), %al
	jne	.L13
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L15
.L13:
	movsbl	-8(%rbp), %edx
	movsbl	-4(%rbp), %eax
	leaq	.LC5(%rip), %rcx
	movl	%eax, %esi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
.L15:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	checkChar, .-checkChar
	.section	.rodata
.LC6:
	.string	"true"
.LC7:
	.string	"false"
	.align 8
.LC8:
	.base64	"RkFJTDogJXMg0LPQsNGA0YHQsNC9LCAlcyDQsdCw0LnRhSDRkdGB0YLQvtC5CgA="
	.text
	.globl	checkBool
	.type	checkBool, @function
checkBool:
.LFB3:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, %edx
	movl	%esi, %eax
	movb	%dl, -4(%rbp)
	movb	%al, -8(%rbp)
	movzbl	-4(%rbp), %eax
	cmpb	-8(%rbp), %al
	jne	.L17
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L23
.L17:
	cmpb	$0, -8(%rbp)
	je	.L19
	leaq	.LC6(%rip), %rdx
	jmp	.L20
.L19:
	leaq	.LC7(%rip), %rdx
.L20:
	cmpb	$0, -4(%rbp)
	je	.L21
	leaq	.LC6(%rip), %rax
	jmp	.L22
.L21:
	leaq	.LC7(%rip), %rax
.L22:
	leaq	.LC8(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
.L23:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	checkBool, .-checkBool
	.section	.rodata
	.align 8
.LC9:
	.base64	"RkFJTDogIiVzIiDQs9Cw0YDRgdCw0L0sICIlcyIg0LHQsNC50YUg0ZHRgdGC0L7QuQoA"
	.text
	.globl	checkString
	.type	checkString, @function
checkString:
.LFB4:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L25
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L27
.L25:
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	leaq	.LC9(%rip), %rcx
	movq	%rax, %rsi
	movq	%rcx, %rdi
	movl	$0, %eax
	call	printf@PLT
.L27:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	checkString, .-checkString
	.section	.rodata
	.align 16
.LC2:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.align 8
.LC3:
	.long	-755914244
	.long	1062232653
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
