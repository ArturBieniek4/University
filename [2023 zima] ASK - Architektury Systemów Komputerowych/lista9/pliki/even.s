	.file	"even.c"
	.text
	.globl	is_even
	.type	is_even, @function
is_even:
.LFB0:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L2
	decq	%rdi
	jmp	is_odd@PLT
.L2:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	is_even, .-is_even
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
