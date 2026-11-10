	.file	"strings.c"
	.text
	.globl	reverse_str
	.type	reverse_str, @function
reverse_str:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L2
.L3:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	subl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-4(%rbp), %eax
	subl	$1, %eax
	subl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	addl	$1, -8(%rbp)
.L2:
	movl	-4(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	cmpl	%eax, -8(%rbp)
	jl	.L3
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	reverse_str, .-reverse_str
	.globl	count_char
	.type	count_char, @function
count_char:
.LFB1:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movl	%esi, %eax
	movb	%al, -28(%rbp)
	movl	$0, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L5
.L7:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	cmpb	%al, -28(%rbp)
	jne	.L6
	addl	$1, -8(%rbp)
.L6:
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L7
	movl	-8(%rbp), %eax
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	count_char, .-count_char
	.section	.rodata
.LC0:
	.string	"cba"
.LC1:
	.string	"level"
.LC2:
	.string	""
.LC3:
	.string	"banana"
.LC4:
	.string	"hello world"
.LC5:
	.string	"abc"
	.text
	.globl	main
	.type	main, @function
main:
.LFB2:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$6513249, -18(%rbp)
	leaq	-18(%rbp), %rax
	movq	%rax, %rdi
	call	reverse_str
	leaq	.LC0(%rip), %rdx
	leaq	-18(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	checkString@PLT
	movl	$1702258028, -14(%rbp)
	movw	$108, -10(%rbp)
	leaq	-14(%rbp), %rax
	movq	%rax, %rdi
	call	reverse_str
	leaq	.LC1(%rip), %rdx
	leaq	-14(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	checkString@PLT
	movb	$0, -19(%rbp)
	leaq	-19(%rbp), %rax
	movq	%rax, %rdi
	call	reverse_str
	leaq	.LC2(%rip), %rdx
	leaq	-19(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	checkString@PLT
	leaq	.LC3(%rip), %rax
	movl	$97, %esi
	movq	%rax, %rdi
	call	count_char
	movl	$3, %esi
	movl	%eax, %edi
	call	checkInt@PLT
	leaq	.LC4(%rip), %rax
	movl	$108, %esi
	movq	%rax, %rdi
	call	count_char
	movl	$3, %esi
	movl	%eax, %edi
	call	checkInt@PLT
	leaq	.LC5(%rip), %rax
	movl	$122, %esi
	movq	%rax, %rdi
	call	count_char
	movl	$0, %esi
	movl	%eax, %edi
	call	checkInt@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L11
	call	__stack_chk_fail@PLT
.L11:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	main, .-main
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
