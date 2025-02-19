	.file	"odd.c"
	.text
	.globl	is_odd
	.type	is_odd, @function
is_odd:
.LFB0:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L2
	decq	%rdi
	jmp	is_even@PLT
.L2:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	is_odd, .-is_odd
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
