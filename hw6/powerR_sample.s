	.file	"powerR_sample.c"
	.text
	.globl	powerR
	.type	powerR, @function
powerR:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	%edi, -4(%rbp)
	movl	%esi, -8(%rbp)
	cmpl	$0, -4(%rbp)
	jne	.L2
	movl	$1, %eax
	jmp	.L3
.L2:
	movl	-4(%rbp), %eax
	leal	-1(%rax), %edx
	movl	-8(%rbp), %eax
	movl	%eax, %esi
	movl	%edx, %edi
	call	powerR
	imull	-8(%rbp), %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	powerR, .-powerR
	.ident	"GCC: (Debian 4.7.2-5) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
