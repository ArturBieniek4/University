	.file	"data.c"
	.text
	.globl	foo
	.data
	.align 2
	.type	foo, @object
	.size	foo, 2
foo:
	.value	314
	.data
	.type	abc, @object
	.size	abc, 4
abc:
	.string	"abc"
	.globl	some
	.section	.data.rel,"aw"
	.align 32
	.type	some, @object
	.size	some, 38
some:
	.quad	weird
	.long	-3
	.zero	4
	.quad	abc
	.quad	foo
	.string	"efghi"
	.globl	bar
	.bss
	.align 8
	.type	bar, @object
	.size	bar, 8
bar:
	.zero	8
	.globl	array
	.align 32
	.type	array, @object
	.size	array, 800
array:
	.zero	800
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
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
