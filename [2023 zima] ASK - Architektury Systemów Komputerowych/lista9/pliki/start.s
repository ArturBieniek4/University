	.file	"start.c"
	.text
	.globl	_start
	.type	_start, @function
_start:
.LFB0:
	.cfi_startproc
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$42, %edi
	call	is_even@PLT
	movl	%eax, %edi
	movl	$60, %eax
#APP
# 4 "start.c" 1
	syscall
# 0 "" 2
#NO_APP
	popq	%rdx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE0:
	.size	_start, .-_start
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
