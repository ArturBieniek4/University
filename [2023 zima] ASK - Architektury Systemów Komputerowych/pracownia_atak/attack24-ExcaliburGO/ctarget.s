
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	48 83 ec 08          	sub    $0x8,%rsp
  401004:	48 8b 05 ed 3f 00 00 	mov    0x3fed(%rip),%rax        # 404ff8 <__gmon_start__>
  40100b:	48 85 c0             	test   %rax,%rax
  40100e:	74 02                	je     401012 <_init+0x12>
  401010:	ff d0                	call   *%rax
  401012:	48 83 c4 08          	add    $0x8,%rsp
  401016:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 3f 00 00    	push   0x3fe2(%rip)        # 405008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 3f 00 00    	jmp    *0x3fe4(%rip)        # 405010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strcasecmp@plt>:
  401030:	ff 25 e2 3f 00 00    	jmp    *0x3fe2(%rip)        # 405018 <strcasecmp@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <.plt>

0000000000401040 <__errno_location@plt>:
  401040:	ff 25 da 3f 00 00    	jmp    *0x3fda(%rip)        # 405020 <__errno_location@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <.plt>

0000000000401050 <srandom@plt>:
  401050:	ff 25 d2 3f 00 00    	jmp    *0x3fd2(%rip)        # 405028 <srandom@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <.plt>

0000000000401060 <strncmp@plt>:
  401060:	ff 25 ca 3f 00 00    	jmp    *0x3fca(%rip)        # 405030 <strncmp@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <.plt>

0000000000401070 <strcpy@plt>:
  401070:	ff 25 c2 3f 00 00    	jmp    *0x3fc2(%rip)        # 405038 <strcpy@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <.plt>

0000000000401080 <puts@plt>:
  401080:	ff 25 ba 3f 00 00    	jmp    *0x3fba(%rip)        # 405040 <puts@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <.plt>

0000000000401090 <write@plt>:
  401090:	ff 25 b2 3f 00 00    	jmp    *0x3fb2(%rip)        # 405048 <write@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <.plt>

00000000004010a0 <strlen@plt>:
  4010a0:	ff 25 aa 3f 00 00    	jmp    *0x3faa(%rip)        # 405050 <strlen@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <.plt>

00000000004010b0 <mmap@plt>:
  4010b0:	ff 25 a2 3f 00 00    	jmp    *0x3fa2(%rip)        # 405058 <mmap@GLIBC_2.2.5>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <.plt>

00000000004010c0 <printf@plt>:
  4010c0:	ff 25 9a 3f 00 00    	jmp    *0x3f9a(%rip)        # 405060 <printf@GLIBC_2.2.5>
  4010c6:	68 09 00 00 00       	push   $0x9
  4010cb:	e9 50 ff ff ff       	jmp    401020 <.plt>

00000000004010d0 <memset@plt>:
  4010d0:	ff 25 92 3f 00 00    	jmp    *0x3f92(%rip)        # 405068 <memset@GLIBC_2.2.5>
  4010d6:	68 0a 00 00 00       	push   $0xa
  4010db:	e9 40 ff ff ff       	jmp    401020 <.plt>

00000000004010e0 <alarm@plt>:
  4010e0:	ff 25 8a 3f 00 00    	jmp    *0x3f8a(%rip)        # 405070 <alarm@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	push   $0xb
  4010eb:	e9 30 ff ff ff       	jmp    401020 <.plt>

00000000004010f0 <close@plt>:
  4010f0:	ff 25 82 3f 00 00    	jmp    *0x3f82(%rip)        # 405078 <close@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	push   $0xc
  4010fb:	e9 20 ff ff ff       	jmp    401020 <.plt>

0000000000401100 <read@plt>:
  401100:	ff 25 7a 3f 00 00    	jmp    *0x3f7a(%rip)        # 405080 <read@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	push   $0xd
  40110b:	e9 10 ff ff ff       	jmp    401020 <.plt>

0000000000401110 <signal@plt>:
  401110:	ff 25 72 3f 00 00    	jmp    *0x3f72(%rip)        # 405088 <signal@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	push   $0xe
  40111b:	e9 00 ff ff ff       	jmp    401020 <.plt>

0000000000401120 <gethostbyname@plt>:
  401120:	ff 25 6a 3f 00 00    	jmp    *0x3f6a(%rip)        # 405090 <gethostbyname@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	push   $0xf
  40112b:	e9 f0 fe ff ff       	jmp    401020 <.plt>

0000000000401130 <fprintf@plt>:
  401130:	ff 25 62 3f 00 00    	jmp    *0x3f62(%rip)        # 405098 <fprintf@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	push   $0x10
  40113b:	e9 e0 fe ff ff       	jmp    401020 <.plt>

0000000000401140 <strtol@plt>:
  401140:	ff 25 5a 3f 00 00    	jmp    *0x3f5a(%rip)        # 4050a0 <strtol@GLIBC_2.2.5>
  401146:	68 11 00 00 00       	push   $0x11
  40114b:	e9 d0 fe ff ff       	jmp    401020 <.plt>

0000000000401150 <memcpy@plt>:
  401150:	ff 25 52 3f 00 00    	jmp    *0x3f52(%rip)        # 4050a8 <memcpy@GLIBC_2.14>
  401156:	68 12 00 00 00       	push   $0x12
  40115b:	e9 c0 fe ff ff       	jmp    401020 <.plt>

0000000000401160 <time@plt>:
  401160:	ff 25 4a 3f 00 00    	jmp    *0x3f4a(%rip)        # 4050b0 <time@GLIBC_2.2.5>
  401166:	68 13 00 00 00       	push   $0x13
  40116b:	e9 b0 fe ff ff       	jmp    401020 <.plt>

0000000000401170 <random@plt>:
  401170:	ff 25 42 3f 00 00    	jmp    *0x3f42(%rip)        # 4050b8 <random@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	push   $0x14
  40117b:	e9 a0 fe ff ff       	jmp    401020 <.plt>

0000000000401180 <__isoc99_sscanf@plt>:
  401180:	ff 25 3a 3f 00 00    	jmp    *0x3f3a(%rip)        # 4050c0 <__isoc99_sscanf@GLIBC_2.7>
  401186:	68 15 00 00 00       	push   $0x15
  40118b:	e9 90 fe ff ff       	jmp    401020 <.plt>

0000000000401190 <munmap@plt>:
  401190:	ff 25 32 3f 00 00    	jmp    *0x3f32(%rip)        # 4050c8 <munmap@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	push   $0x16
  40119b:	e9 80 fe ff ff       	jmp    401020 <.plt>

00000000004011a0 <memmove@plt>:
  4011a0:	ff 25 2a 3f 00 00    	jmp    *0x3f2a(%rip)        # 4050d0 <memmove@GLIBC_2.2.5>
  4011a6:	68 17 00 00 00       	push   $0x17
  4011ab:	e9 70 fe ff ff       	jmp    401020 <.plt>

00000000004011b0 <fopen@plt>:
  4011b0:	ff 25 22 3f 00 00    	jmp    *0x3f22(%rip)        # 4050d8 <fopen@GLIBC_2.2.5>
  4011b6:	68 18 00 00 00       	push   $0x18
  4011bb:	e9 60 fe ff ff       	jmp    401020 <.plt>

00000000004011c0 <getopt@plt>:
  4011c0:	ff 25 1a 3f 00 00    	jmp    *0x3f1a(%rip)        # 4050e0 <getopt@GLIBC_2.2.5>
  4011c6:	68 19 00 00 00       	push   $0x19
  4011cb:	e9 50 fe ff ff       	jmp    401020 <.plt>

00000000004011d0 <strtoul@plt>:
  4011d0:	ff 25 12 3f 00 00    	jmp    *0x3f12(%rip)        # 4050e8 <strtoul@GLIBC_2.2.5>
  4011d6:	68 1a 00 00 00       	push   $0x1a
  4011db:	e9 40 fe ff ff       	jmp    401020 <.plt>

00000000004011e0 <gethostname@plt>:
  4011e0:	ff 25 0a 3f 00 00    	jmp    *0x3f0a(%rip)        # 4050f0 <gethostname@GLIBC_2.2.5>
  4011e6:	68 1b 00 00 00       	push   $0x1b
  4011eb:	e9 30 fe ff ff       	jmp    401020 <.plt>

00000000004011f0 <sprintf@plt>:
  4011f0:	ff 25 02 3f 00 00    	jmp    *0x3f02(%rip)        # 4050f8 <sprintf@GLIBC_2.2.5>
  4011f6:	68 1c 00 00 00       	push   $0x1c
  4011fb:	e9 20 fe ff ff       	jmp    401020 <.plt>

0000000000401200 <exit@plt>:
  401200:	ff 25 fa 3e 00 00    	jmp    *0x3efa(%rip)        # 405100 <exit@GLIBC_2.2.5>
  401206:	68 1d 00 00 00       	push   $0x1d
  40120b:	e9 10 fe ff ff       	jmp    401020 <.plt>

0000000000401210 <connect@plt>:
  401210:	ff 25 f2 3e 00 00    	jmp    *0x3ef2(%rip)        # 405108 <connect@GLIBC_2.2.5>
  401216:	68 1e 00 00 00       	push   $0x1e
  40121b:	e9 00 fe ff ff       	jmp    401020 <.plt>

0000000000401220 <getc@plt>:
  401220:	ff 25 ea 3e 00 00    	jmp    *0x3eea(%rip)        # 405110 <getc@GLIBC_2.2.5>
  401226:	68 1f 00 00 00       	push   $0x1f
  40122b:	e9 f0 fd ff ff       	jmp    401020 <.plt>

0000000000401230 <socket@plt>:
  401230:	ff 25 e2 3e 00 00    	jmp    *0x3ee2(%rip)        # 405118 <socket@GLIBC_2.2.5>
  401236:	68 20 00 00 00       	push   $0x20
  40123b:	e9 e0 fd ff ff       	jmp    401020 <.plt>

Disassembly of section .text:

0000000000401240 <_start>:
  401240:	31 ed                	xor    %ebp,%ebp
  401242:	49 89 d1             	mov    %rdx,%r9
  401245:	5e                   	pop    %rsi
  401246:	48 89 e2             	mov    %rsp,%rdx
  401249:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40124d:	50                   	push   %rax
  40124e:	54                   	push   %rsp
  40124f:	49 c7 c0 b0 2e 40 00 	mov    $0x402eb0,%r8
  401256:	48 c7 c1 50 2e 40 00 	mov    $0x402e50,%rcx
  40125d:	48 c7 c7 08 15 40 00 	mov    $0x401508,%rdi
  401264:	ff 15 86 3d 00 00    	call   *0x3d86(%rip)        # 404ff0 <__libc_start_main@GLIBC_2.2.5>
  40126a:	f4                   	hlt    
  40126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401270 <_dl_relocate_static_pie>:
  401270:	c3                   	ret    
  401271:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401278:	00 00 00 
  40127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401280 <deregister_tm_clones>:
  401280:	b8 90 54 40 00       	mov    $0x405490,%eax
  401285:	48 3d 90 54 40 00    	cmp    $0x405490,%rax
  40128b:	74 13                	je     4012a0 <deregister_tm_clones+0x20>
  40128d:	b8 00 00 00 00       	mov    $0x0,%eax
  401292:	48 85 c0             	test   %rax,%rax
  401295:	74 09                	je     4012a0 <deregister_tm_clones+0x20>
  401297:	bf 90 54 40 00       	mov    $0x405490,%edi
  40129c:	ff e0                	jmp    *%rax
  40129e:	66 90                	xchg   %ax,%ax
  4012a0:	c3                   	ret    
  4012a1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4012a8:	00 00 00 00 
  4012ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012b0 <register_tm_clones>:
  4012b0:	be 90 54 40 00       	mov    $0x405490,%esi
  4012b5:	48 81 ee 90 54 40 00 	sub    $0x405490,%rsi
  4012bc:	48 89 f0             	mov    %rsi,%rax
  4012bf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012c3:	48 c1 f8 03          	sar    $0x3,%rax
  4012c7:	48 01 c6             	add    %rax,%rsi
  4012ca:	48 d1 fe             	sar    %rsi
  4012cd:	74 11                	je     4012e0 <register_tm_clones+0x30>
  4012cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d4:	48 85 c0             	test   %rax,%rax
  4012d7:	74 07                	je     4012e0 <register_tm_clones+0x30>
  4012d9:	bf 90 54 40 00       	mov    $0x405490,%edi
  4012de:	ff e0                	jmp    *%rax
  4012e0:	c3                   	ret    
  4012e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4012e8:	00 00 00 00 
  4012ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012f0 <__do_global_dtors_aux>:
  4012f0:	80 3d f1 41 00 00 00 	cmpb   $0x0,0x41f1(%rip)        # 4054e8 <completed.0>
  4012f7:	75 17                	jne    401310 <__do_global_dtors_aux+0x20>
  4012f9:	55                   	push   %rbp
  4012fa:	48 89 e5             	mov    %rsp,%rbp
  4012fd:	e8 7e ff ff ff       	call   401280 <deregister_tm_clones>
  401302:	c6 05 df 41 00 00 01 	movb   $0x1,0x41df(%rip)        # 4054e8 <completed.0>
  401309:	5d                   	pop    %rbp
  40130a:	c3                   	ret    
  40130b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  401310:	c3                   	ret    
  401311:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  401318:	00 00 00 00 
  40131c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401320 <frame_dummy>:
  401320:	eb 8e                	jmp    4012b0 <register_tm_clones>

0000000000401322 <usage>:
  401322:	48 83 ec 08          	sub    $0x8,%rsp
  401326:	48 89 fe             	mov    %rdi,%rsi
  401329:	83 3d 08 42 00 00 00 	cmpl   $0x0,0x4208(%rip)        # 405538 <is_checker>
  401330:	74 4b                	je     40137d <usage+0x5b>
  401332:	48 8d 3d cf 1c 00 00 	lea    0x1ccf(%rip),%rdi        # 403008 <_IO_stdin_used+0x8>
  401339:	b8 00 00 00 00       	mov    $0x0,%eax
  40133e:	e8 7d fd ff ff       	call   4010c0 <printf@plt>
  401343:	48 8d 3d f6 1c 00 00 	lea    0x1cf6(%rip),%rdi        # 403040 <_IO_stdin_used+0x40>
  40134a:	e8 31 fd ff ff       	call   401080 <puts@plt>
  40134f:	48 8d 3d 62 1e 00 00 	lea    0x1e62(%rip),%rdi        # 4031b8 <_IO_stdin_used+0x1b8>
  401356:	e8 25 fd ff ff       	call   401080 <puts@plt>
  40135b:	48 8d 3d 06 1d 00 00 	lea    0x1d06(%rip),%rdi        # 403068 <_IO_stdin_used+0x68>
  401362:	e8 19 fd ff ff       	call   401080 <puts@plt>
  401367:	48 8d 3d 64 1e 00 00 	lea    0x1e64(%rip),%rdi        # 4031d2 <_IO_stdin_used+0x1d2>
  40136e:	e8 0d fd ff ff       	call   401080 <puts@plt>
  401373:	bf 00 00 00 00       	mov    $0x0,%edi
  401378:	e8 83 fe ff ff       	call   401200 <exit@plt>
  40137d:	48 8d 3d 6a 1e 00 00 	lea    0x1e6a(%rip),%rdi        # 4031ee <_IO_stdin_used+0x1ee>
  401384:	b8 00 00 00 00       	mov    $0x0,%eax
  401389:	e8 32 fd ff ff       	call   4010c0 <printf@plt>
  40138e:	48 8d 3d fb 1c 00 00 	lea    0x1cfb(%rip),%rdi        # 403090 <_IO_stdin_used+0x90>
  401395:	e8 e6 fc ff ff       	call   401080 <puts@plt>
  40139a:	48 8d 3d 17 1d 00 00 	lea    0x1d17(%rip),%rdi        # 4030b8 <_IO_stdin_used+0xb8>
  4013a1:	e8 da fc ff ff       	call   401080 <puts@plt>
  4013a6:	48 8d 3d 5f 1e 00 00 	lea    0x1e5f(%rip),%rdi        # 40320c <_IO_stdin_used+0x20c>
  4013ad:	e8 ce fc ff ff       	call   401080 <puts@plt>
  4013b2:	eb bf                	jmp    401373 <usage+0x51>

00000000004013b4 <initialize_target>:
  4013b4:	55                   	push   %rbp
  4013b5:	53                   	push   %rbx
  4013b6:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  4013bd:	89 f5                	mov    %esi,%ebp
  4013bf:	89 3d 63 41 00 00    	mov    %edi,0x4163(%rip)        # 405528 <check_level>
  4013c5:	8b 3d 65 3d 00 00    	mov    0x3d65(%rip),%edi        # 405130 <target_id>
  4013cb:	e8 5a 1a 00 00       	call   402e2a <gencookie>
  4013d0:	89 c7                	mov    %eax,%edi
  4013d2:	89 05 5c 41 00 00    	mov    %eax,0x415c(%rip)        # 405534 <cookie>
  4013d8:	e8 4d 1a 00 00       	call   402e2a <gencookie>
  4013dd:	89 05 4d 41 00 00    	mov    %eax,0x414d(%rip)        # 405530 <authkey>
  4013e3:	8b 05 47 3d 00 00    	mov    0x3d47(%rip),%eax        # 405130 <target_id>
  4013e9:	8d 78 01             	lea    0x1(%rax),%edi
  4013ec:	e8 5f fc ff ff       	call   401050 <srandom@plt>
  4013f1:	e8 7a fd ff ff       	call   401170 <random@plt>
  4013f6:	48 89 c7             	mov    %rax,%rdi
  4013f9:	e8 df 02 00 00       	call   4016dd <scramble>
  4013fe:	89 c3                	mov    %eax,%ebx
  401400:	85 ed                	test   %ebp,%ebp
  401402:	75 3d                	jne    401441 <initialize_target+0x8d>
  401404:	b8 00 00 00 00       	mov    $0x0,%eax
  401409:	01 d8                	add    %ebx,%eax
  40140b:	0f b7 c0             	movzwl %ax,%eax
  40140e:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  401415:	89 c0                	mov    %eax,%eax
  401417:	48 89 05 6a 40 00 00 	mov    %rax,0x406a(%rip)        # 405488 <buf_offset>
  40141e:	c6 05 ff 40 00 00 63 	movb   $0x63,0x40ff(%rip)        # 405524 <target_prefix>
  401425:	83 3d f4 40 00 00 00 	cmpl   $0x0,0x40f4(%rip)        # 405520 <notify>
  40142c:	74 09                	je     401437 <initialize_target+0x83>
  40142e:	83 3d 03 41 00 00 00 	cmpl   $0x0,0x4103(%rip)        # 405538 <is_checker>
  401435:	74 23                	je     40145a <initialize_target+0xa6>
  401437:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  40143e:	5b                   	pop    %rbx
  40143f:	5d                   	pop    %rbp
  401440:	c3                   	ret    
  401441:	bf 00 00 00 00       	mov    $0x0,%edi
  401446:	e8 15 fd ff ff       	call   401160 <time@plt>
  40144b:	48 89 c7             	mov    %rax,%rdi
  40144e:	e8 fd fb ff ff       	call   401050 <srandom@plt>
  401453:	e8 18 fd ff ff       	call   401170 <random@plt>
  401458:	eb af                	jmp    401409 <initialize_target+0x55>
  40145a:	48 89 e7             	mov    %rsp,%rdi
  40145d:	be 00 01 00 00       	mov    $0x100,%esi
  401462:	e8 79 fd ff ff       	call   4011e0 <gethostname@plt>
  401467:	89 c5                	mov    %eax,%ebp
  401469:	85 c0                	test   %eax,%eax
  40146b:	75 26                	jne    401493 <initialize_target+0xdf>
  40146d:	89 c3                	mov    %eax,%ebx
  40146f:	48 63 c3             	movslq %ebx,%rax
  401472:	48 8d 15 e7 3c 00 00 	lea    0x3ce7(%rip),%rdx        # 405160 <host_table>
  401479:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40147d:	48 85 ff             	test   %rdi,%rdi
  401480:	74 2c                	je     4014ae <initialize_target+0xfa>
  401482:	48 89 e6             	mov    %rsp,%rsi
  401485:	e8 a6 fb ff ff       	call   401030 <strcasecmp@plt>
  40148a:	85 c0                	test   %eax,%eax
  40148c:	74 1b                	je     4014a9 <initialize_target+0xf5>
  40148e:	83 c3 01             	add    $0x1,%ebx
  401491:	eb dc                	jmp    40146f <initialize_target+0xbb>
  401493:	48 8d 3d 4e 1c 00 00 	lea    0x1c4e(%rip),%rdi        # 4030e8 <_IO_stdin_used+0xe8>
  40149a:	e8 e1 fb ff ff       	call   401080 <puts@plt>
  40149f:	bf 08 00 00 00       	mov    $0x8,%edi
  4014a4:	e8 57 fd ff ff       	call   401200 <exit@plt>
  4014a9:	bd 01 00 00 00       	mov    $0x1,%ebp
  4014ae:	85 ed                	test   %ebp,%ebp
  4014b0:	74 38                	je     4014ea <initialize_target+0x136>
  4014b2:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  4014b9:	00 
  4014ba:	e8 c5 16 00 00       	call   402b84 <init_driver>
  4014bf:	85 c0                	test   %eax,%eax
  4014c1:	0f 89 70 ff ff ff    	jns    401437 <initialize_target+0x83>
  4014c7:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  4014ce:	00 
  4014cf:	48 8d 3d 8a 1c 00 00 	lea    0x1c8a(%rip),%rdi        # 403160 <_IO_stdin_used+0x160>
  4014d6:	b8 00 00 00 00       	mov    $0x0,%eax
  4014db:	e8 e0 fb ff ff       	call   4010c0 <printf@plt>
  4014e0:	bf 08 00 00 00       	mov    $0x8,%edi
  4014e5:	e8 16 fd ff ff       	call   401200 <exit@plt>
  4014ea:	48 89 e6             	mov    %rsp,%rsi
  4014ed:	48 8d 3d 2c 1c 00 00 	lea    0x1c2c(%rip),%rdi        # 403120 <_IO_stdin_used+0x120>
  4014f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4014f9:	e8 c2 fb ff ff       	call   4010c0 <printf@plt>
  4014fe:	bf 08 00 00 00       	mov    $0x8,%edi
  401503:	e8 f8 fc ff ff       	call   401200 <exit@plt>

0000000000401508 <main>:
  401508:	41 56                	push   %r14
  40150a:	41 55                	push   %r13
  40150c:	41 54                	push   %r12
  40150e:	55                   	push   %rbp
  40150f:	53                   	push   %rbx
  401510:	89 fd                	mov    %edi,%ebp
  401512:	48 89 f3             	mov    %rsi,%rbx
  401515:	48 c7 c6 96 1f 40 00 	mov    $0x401f96,%rsi
  40151c:	bf 0b 00 00 00       	mov    $0xb,%edi
  401521:	e8 ea fb ff ff       	call   401110 <signal@plt>
  401526:	48 c7 c6 42 1f 40 00 	mov    $0x401f42,%rsi
  40152d:	bf 07 00 00 00       	mov    $0x7,%edi
  401532:	e8 d9 fb ff ff       	call   401110 <signal@plt>
  401537:	48 c7 c6 ea 1f 40 00 	mov    $0x401fea,%rsi
  40153e:	bf 04 00 00 00       	mov    $0x4,%edi
  401543:	e8 c8 fb ff ff       	call   401110 <signal@plt>
  401548:	83 3d e9 3f 00 00 00 	cmpl   $0x0,0x3fe9(%rip)        # 405538 <is_checker>
  40154f:	75 26                	jne    401577 <main+0x6f>
  401551:	4c 8d 25 d5 1c 00 00 	lea    0x1cd5(%rip),%r12        # 40322d <_IO_stdin_used+0x22d>
  401558:	48 8b 05 41 3f 00 00 	mov    0x3f41(%rip),%rax        # 4054a0 <stdin@GLIBC_2.2.5>
  40155f:	48 89 05 b2 3f 00 00 	mov    %rax,0x3fb2(%rip)        # 405518 <infile>
  401566:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40156c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401572:	e9 88 00 00 00       	jmp    4015ff <main+0xf7>
  401577:	48 c7 c6 3e 20 40 00 	mov    $0x40203e,%rsi
  40157e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401583:	e8 88 fb ff ff       	call   401110 <signal@plt>
  401588:	bf 05 00 00 00       	mov    $0x5,%edi
  40158d:	e8 4e fb ff ff       	call   4010e0 <alarm@plt>
  401592:	4c 8d 25 8c 1c 00 00 	lea    0x1c8c(%rip),%r12        # 403225 <_IO_stdin_used+0x225>
  401599:	eb bd                	jmp    401558 <main+0x50>
  40159b:	48 8b 3b             	mov    (%rbx),%rdi
  40159e:	e8 7f fd ff ff       	call   401322 <usage>
  4015a3:	48 8d 35 a8 1e 00 00 	lea    0x1ea8(%rip),%rsi        # 403452 <_IO_stdin_used+0x452>
  4015aa:	48 8b 3d 0f 3f 00 00 	mov    0x3f0f(%rip),%rdi        # 4054c0 <optarg@GLIBC_2.2.5>
  4015b1:	e8 fa fb ff ff       	call   4011b0 <fopen@plt>
  4015b6:	48 89 05 5b 3f 00 00 	mov    %rax,0x3f5b(%rip)        # 405518 <infile>
  4015bd:	48 85 c0             	test   %rax,%rax
  4015c0:	75 3d                	jne    4015ff <main+0xf7>
  4015c2:	48 8b 15 f7 3e 00 00 	mov    0x3ef7(%rip),%rdx        # 4054c0 <optarg@GLIBC_2.2.5>
  4015c9:	48 8d 35 62 1c 00 00 	lea    0x1c62(%rip),%rsi        # 403232 <_IO_stdin_used+0x232>
  4015d0:	48 8b 3d 09 3f 00 00 	mov    0x3f09(%rip),%rdi        # 4054e0 <stderr@GLIBC_2.2.5>
  4015d7:	e8 54 fb ff ff       	call   401130 <fprintf@plt>
  4015dc:	b8 01 00 00 00       	mov    $0x1,%eax
  4015e1:	e9 ce 00 00 00       	jmp    4016b4 <main+0x1ac>
  4015e6:	ba 10 00 00 00       	mov    $0x10,%edx
  4015eb:	be 00 00 00 00       	mov    $0x0,%esi
  4015f0:	48 8b 3d c9 3e 00 00 	mov    0x3ec9(%rip),%rdi        # 4054c0 <optarg@GLIBC_2.2.5>
  4015f7:	e8 d4 fb ff ff       	call   4011d0 <strtoul@plt>
  4015fc:	41 89 c6             	mov    %eax,%r14d
  4015ff:	4c 89 e2             	mov    %r12,%rdx
  401602:	48 89 de             	mov    %rbx,%rsi
  401605:	89 ef                	mov    %ebp,%edi
  401607:	e8 b4 fb ff ff       	call   4011c0 <getopt@plt>
  40160c:	3c ff                	cmp    $0xff,%al
  40160e:	74 5d                	je     40166d <main+0x165>
  401610:	0f be f0             	movsbl %al,%esi
  401613:	83 e8 61             	sub    $0x61,%eax
  401616:	3c 10                	cmp    $0x10,%al
  401618:	77 3a                	ja     401654 <main+0x14c>
  40161a:	0f b6 c0             	movzbl %al,%eax
  40161d:	48 8d 15 4c 1c 00 00 	lea    0x1c4c(%rip),%rdx        # 403270 <_IO_stdin_used+0x270>
  401624:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  401628:	48 01 d0             	add    %rdx,%rax
  40162b:	ff e0                	jmp    *%rax
  40162d:	ba 0a 00 00 00       	mov    $0xa,%edx
  401632:	be 00 00 00 00       	mov    $0x0,%esi
  401637:	48 8b 3d 82 3e 00 00 	mov    0x3e82(%rip),%rdi        # 4054c0 <optarg@GLIBC_2.2.5>
  40163e:	e8 fd fa ff ff       	call   401140 <strtol@plt>
  401643:	41 89 c5             	mov    %eax,%r13d
  401646:	eb b7                	jmp    4015ff <main+0xf7>
  401648:	c7 05 ce 3e 00 00 00 	movl   $0x0,0x3ece(%rip)        # 405520 <notify>
  40164f:	00 00 00 
  401652:	eb ab                	jmp    4015ff <main+0xf7>
  401654:	48 8d 3d f4 1b 00 00 	lea    0x1bf4(%rip),%rdi        # 40324f <_IO_stdin_used+0x24f>
  40165b:	b8 00 00 00 00       	mov    $0x0,%eax
  401660:	e8 5b fa ff ff       	call   4010c0 <printf@plt>
  401665:	48 8b 3b             	mov    (%rbx),%rdi
  401668:	e8 b5 fc ff ff       	call   401322 <usage>
  40166d:	be 00 00 00 00       	mov    $0x0,%esi
  401672:	44 89 ef             	mov    %r13d,%edi
  401675:	e8 3a fd ff ff       	call   4013b4 <initialize_target>
  40167a:	83 3d b7 3e 00 00 00 	cmpl   $0x0,0x3eb7(%rip)        # 405538 <is_checker>
  401681:	74 09                	je     40168c <main+0x184>
  401683:	44 39 35 a6 3e 00 00 	cmp    %r14d,0x3ea6(%rip)        # 405530 <authkey>
  40168a:	75 31                	jne    4016bd <main+0x1b5>
  40168c:	8b 35 a2 3e 00 00    	mov    0x3ea2(%rip),%esi        # 405534 <cookie>
  401692:	48 8d 3d c9 1b 00 00 	lea    0x1bc9(%rip),%rdi        # 403262 <_IO_stdin_used+0x262>
  401699:	b8 00 00 00 00       	mov    $0x0,%eax
  40169e:	e8 1d fa ff ff       	call   4010c0 <printf@plt>
  4016a3:	48 8b 3d de 3d 00 00 	mov    0x3dde(%rip),%rdi        # 405488 <buf_offset>
  4016aa:	e8 6a 0a 00 00       	call   402119 <stable_launch>
  4016af:	b8 00 00 00 00       	mov    $0x0,%eax
  4016b4:	5b                   	pop    %rbx
  4016b5:	5d                   	pop    %rbp
  4016b6:	41 5c                	pop    %r12
  4016b8:	41 5d                	pop    %r13
  4016ba:	41 5e                	pop    %r14
  4016bc:	c3                   	ret    
  4016bd:	44 89 f6             	mov    %r14d,%esi
  4016c0:	48 8d 3d c1 1a 00 00 	lea    0x1ac1(%rip),%rdi        # 403188 <_IO_stdin_used+0x188>
  4016c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4016cc:	e8 ef f9 ff ff       	call   4010c0 <printf@plt>
  4016d1:	b8 00 00 00 00       	mov    $0x0,%eax
  4016d6:	e8 54 06 00 00       	call   401d2f <check_fail>
  4016db:	eb af                	jmp    40168c <main+0x184>

00000000004016dd <scramble>:
  4016dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4016e2:	eb 11                	jmp    4016f5 <scramble+0x18>
  4016e4:	69 d0 cd c3 00 00    	imul   $0xc3cd,%eax,%edx
  4016ea:	01 fa                	add    %edi,%edx
  4016ec:	89 c1                	mov    %eax,%ecx
  4016ee:	89 54 8c d0          	mov    %edx,-0x30(%rsp,%rcx,4)
  4016f2:	83 c0 01             	add    $0x1,%eax
  4016f5:	83 f8 09             	cmp    $0x9,%eax
  4016f8:	76 ea                	jbe    4016e4 <scramble+0x7>
  4016fa:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4016fe:	69 c0 7b be 00 00    	imul   $0xbe7b,%eax,%eax
  401704:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401708:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40170c:	69 c0 8d 37 00 00    	imul   $0x378d,%eax,%eax
  401712:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401716:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40171a:	69 c0 67 05 00 00    	imul   $0x567,%eax,%eax
  401720:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401724:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401728:	69 c0 e6 f3 00 00    	imul   $0xf3e6,%eax,%eax
  40172e:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401732:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401736:	69 c0 e3 5a 00 00    	imul   $0x5ae3,%eax,%eax
  40173c:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401740:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401744:	69 c0 d4 ca 00 00    	imul   $0xcad4,%eax,%eax
  40174a:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40174e:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401752:	69 c0 a4 ca 00 00    	imul   $0xcaa4,%eax,%eax
  401758:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40175c:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401760:	69 c0 b9 5f 00 00    	imul   $0x5fb9,%eax,%eax
  401766:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40176a:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40176e:	69 c0 88 a1 00 00    	imul   $0xa188,%eax,%eax
  401774:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401778:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40177c:	69 c0 5d 6b 00 00    	imul   $0x6b5d,%eax,%eax
  401782:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401786:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40178a:	69 c0 e2 58 00 00    	imul   $0x58e2,%eax,%eax
  401790:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401794:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401798:	69 c0 61 09 00 00    	imul   $0x961,%eax,%eax
  40179e:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4017a2:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4017a6:	69 c0 b7 ed 00 00    	imul   $0xedb7,%eax,%eax
  4017ac:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4017b0:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4017b4:	69 c0 42 5d 00 00    	imul   $0x5d42,%eax,%eax
  4017ba:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4017be:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4017c2:	69 c0 5e 2b 00 00    	imul   $0x2b5e,%eax,%eax
  4017c8:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4017cc:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4017d0:	69 c0 9d 85 00 00    	imul   $0x859d,%eax,%eax
  4017d6:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4017da:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4017de:	69 c0 1a 4f 00 00    	imul   $0x4f1a,%eax,%eax
  4017e4:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4017e8:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4017ec:	69 c0 88 a0 00 00    	imul   $0xa088,%eax,%eax
  4017f2:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4017f6:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4017fa:	69 c0 e3 a6 00 00    	imul   $0xa6e3,%eax,%eax
  401800:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401804:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401808:	69 c0 fd 4a 00 00    	imul   $0x4afd,%eax,%eax
  40180e:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401812:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401816:	69 c0 37 cd 00 00    	imul   $0xcd37,%eax,%eax
  40181c:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401820:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401824:	69 c0 e7 4e 00 00    	imul   $0x4ee7,%eax,%eax
  40182a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40182e:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401832:	69 c0 9f 9d 00 00    	imul   $0x9d9f,%eax,%eax
  401838:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40183c:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401840:	69 c0 0f eb 00 00    	imul   $0xeb0f,%eax,%eax
  401846:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40184a:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40184e:	69 c0 21 95 00 00    	imul   $0x9521,%eax,%eax
  401854:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401858:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40185c:	69 c0 26 f2 00 00    	imul   $0xf226,%eax,%eax
  401862:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401866:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  40186a:	69 c0 13 36 00 00    	imul   $0x3613,%eax,%eax
  401870:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401874:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401878:	69 c0 17 39 00 00    	imul   $0x3917,%eax,%eax
  40187e:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401882:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401886:	69 c0 b7 2e 00 00    	imul   $0x2eb7,%eax,%eax
  40188c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401890:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401894:	69 c0 9a e5 00 00    	imul   $0xe59a,%eax,%eax
  40189a:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40189e:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4018a2:	69 c0 43 ee 00 00    	imul   $0xee43,%eax,%eax
  4018a8:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4018ac:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4018b0:	69 c0 ee 43 00 00    	imul   $0x43ee,%eax,%eax
  4018b6:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4018ba:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4018be:	69 c0 61 28 00 00    	imul   $0x2861,%eax,%eax
  4018c4:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4018c8:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4018cc:	69 c0 de 91 00 00    	imul   $0x91de,%eax,%eax
  4018d2:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4018d6:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4018da:	69 c0 e4 78 00 00    	imul   $0x78e4,%eax,%eax
  4018e0:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4018e4:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4018e8:	69 c0 0a d1 00 00    	imul   $0xd10a,%eax,%eax
  4018ee:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4018f2:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4018f6:	69 c0 ae f2 00 00    	imul   $0xf2ae,%eax,%eax
  4018fc:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401900:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401904:	69 c0 f7 dd 00 00    	imul   $0xddf7,%eax,%eax
  40190a:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40190e:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401912:	69 c0 91 ce 00 00    	imul   $0xce91,%eax,%eax
  401918:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  40191c:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401920:	69 c0 74 cf 00 00    	imul   $0xcf74,%eax,%eax
  401926:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40192a:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40192e:	69 c0 73 1f 00 00    	imul   $0x1f73,%eax,%eax
  401934:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401938:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40193c:	69 c0 b7 51 00 00    	imul   $0x51b7,%eax,%eax
  401942:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401946:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40194a:	69 c0 22 bd 00 00    	imul   $0xbd22,%eax,%eax
  401950:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401954:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401958:	69 c0 51 79 00 00    	imul   $0x7951,%eax,%eax
  40195e:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401962:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401966:	69 c0 28 21 00 00    	imul   $0x2128,%eax,%eax
  40196c:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401970:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401974:	69 c0 ee 45 00 00    	imul   $0x45ee,%eax,%eax
  40197a:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40197e:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401982:	69 c0 22 ca 00 00    	imul   $0xca22,%eax,%eax
  401988:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40198c:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401990:	69 c0 c9 4c 00 00    	imul   $0x4cc9,%eax,%eax
  401996:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40199a:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40199e:	69 c0 52 6e 00 00    	imul   $0x6e52,%eax,%eax
  4019a4:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4019a8:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4019ac:	69 c0 c7 c1 00 00    	imul   $0xc1c7,%eax,%eax
  4019b2:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4019b6:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4019ba:	69 c0 83 bb 00 00    	imul   $0xbb83,%eax,%eax
  4019c0:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4019c4:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4019c8:	69 c0 52 2d 00 00    	imul   $0x2d52,%eax,%eax
  4019ce:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4019d2:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4019d6:	69 c0 c3 b2 00 00    	imul   $0xb2c3,%eax,%eax
  4019dc:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4019e0:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4019e4:	69 c0 7e 3e 00 00    	imul   $0x3e7e,%eax,%eax
  4019ea:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4019ee:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4019f2:	69 c0 4f d4 00 00    	imul   $0xd44f,%eax,%eax
  4019f8:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4019fc:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401a00:	69 c0 07 e5 00 00    	imul   $0xe507,%eax,%eax
  401a06:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401a0a:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401a0e:	69 c0 8d cf 00 00    	imul   $0xcf8d,%eax,%eax
  401a14:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401a18:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a1c:	69 c0 49 49 00 00    	imul   $0x4949,%eax,%eax
  401a22:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a26:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401a2a:	69 c0 8d c1 00 00    	imul   $0xc18d,%eax,%eax
  401a30:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401a34:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401a38:	69 c0 88 78 00 00    	imul   $0x7888,%eax,%eax
  401a3e:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401a42:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401a46:	69 c0 85 21 00 00    	imul   $0x2185,%eax,%eax
  401a4c:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401a50:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401a54:	69 c0 20 f2 00 00    	imul   $0xf220,%eax,%eax
  401a5a:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  401a5e:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401a62:	69 c0 52 48 00 00    	imul   $0x4852,%eax,%eax
  401a68:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401a6c:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401a70:	69 c0 2a de 00 00    	imul   $0xde2a,%eax,%eax
  401a76:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401a7a:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401a7e:	69 c0 91 1d 00 00    	imul   $0x1d91,%eax,%eax
  401a84:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401a88:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401a8c:	69 c0 da 9d 00 00    	imul   $0x9dda,%eax,%eax
  401a92:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401a96:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401a9a:	69 c0 c3 32 00 00    	imul   $0x32c3,%eax,%eax
  401aa0:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401aa4:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401aa8:	69 c0 46 87 00 00    	imul   $0x8746,%eax,%eax
  401aae:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401ab2:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401ab6:	69 c0 75 d6 00 00    	imul   $0xd675,%eax,%eax
  401abc:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401ac0:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401ac4:	69 c0 da 66 00 00    	imul   $0x66da,%eax,%eax
  401aca:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401ace:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401ad2:	69 c0 b7 d3 00 00    	imul   $0xd3b7,%eax,%eax
  401ad8:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401adc:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401ae0:	69 c0 88 9e 00 00    	imul   $0x9e88,%eax,%eax
  401ae6:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401aea:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401aee:	69 c0 a0 82 00 00    	imul   $0x82a0,%eax,%eax
  401af4:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401af8:	b8 00 00 00 00       	mov    $0x0,%eax
  401afd:	ba 00 00 00 00       	mov    $0x0,%edx
  401b02:	eb 0b                	jmp    401b0f <scramble+0x432>
  401b04:	89 c1                	mov    %eax,%ecx
  401b06:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  401b0a:	01 ca                	add    %ecx,%edx
  401b0c:	83 c0 01             	add    $0x1,%eax
  401b0f:	83 f8 09             	cmp    $0x9,%eax
  401b12:	76 f0                	jbe    401b04 <scramble+0x427>
  401b14:	89 d0                	mov    %edx,%eax
  401b16:	c3                   	ret    

0000000000401b17 <getbuf>:
  401b17:	48 83 ec 28          	sub    $0x28,%rsp
  401b1b:	48 89 e7             	mov    %rsp,%rdi
  401b1e:	e8 3f 02 00 00       	call   401d62 <Gets>
  401b23:	b8 01 00 00 00       	mov    $0x1,%eax
  401b28:	48 83 c4 28          	add    $0x28,%rsp
  401b2c:	c3                   	ret    

0000000000401b2d <touch1>:
  401b2d:	48 83 ec 08          	sub    $0x8,%rsp
  401b31:	c7 05 f1 39 00 00 01 	movl   $0x1,0x39f1(%rip)        # 40552c <vlevel>
  401b38:	00 00 00 
  401b3b:	48 8d 3d b0 17 00 00 	lea    0x17b0(%rip),%rdi        # 4032f2 <_IO_stdin_used+0x2f2>
  401b42:	e8 39 f5 ff ff       	call   401080 <puts@plt>
  401b47:	bf 01 00 00 00       	mov    $0x1,%edi
  401b4c:	e8 0b 03 00 00       	call   401e5c <validate>
  401b51:	bf 00 00 00 00       	mov    $0x0,%edi
  401b56:	e8 a5 f6 ff ff       	call   401200 <exit@plt>

0000000000401b5b <touch2>:
  401b5b:	48 83 ec 08          	sub    $0x8,%rsp
  401b5f:	89 fe                	mov    %edi,%esi
  401b61:	c7 05 c1 39 00 00 02 	movl   $0x2,0x39c1(%rip)        # 40552c <vlevel>
  401b68:	00 00 00 
  401b6b:	39 3d c3 39 00 00    	cmp    %edi,0x39c3(%rip)        # 405534 <cookie>
  401b71:	74 25                	je     401b98 <touch2+0x3d>
  401b73:	48 8d 3d c6 17 00 00 	lea    0x17c6(%rip),%rdi        # 403340 <_IO_stdin_used+0x340>
  401b7a:	b8 00 00 00 00       	mov    $0x0,%eax
  401b7f:	e8 3c f5 ff ff       	call   4010c0 <printf@plt>
  401b84:	bf 02 00 00 00       	mov    $0x2,%edi
  401b89:	e8 8c 03 00 00       	call   401f1a <fail>
  401b8e:	bf 00 00 00 00       	mov    $0x0,%edi
  401b93:	e8 68 f6 ff ff       	call   401200 <exit@plt>
  401b98:	48 8d 3d 79 17 00 00 	lea    0x1779(%rip),%rdi        # 403318 <_IO_stdin_used+0x318>
  401b9f:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba4:	e8 17 f5 ff ff       	call   4010c0 <printf@plt>
  401ba9:	bf 02 00 00 00       	mov    $0x2,%edi
  401bae:	e8 a9 02 00 00       	call   401e5c <validate>
  401bb3:	eb d9                	jmp    401b8e <touch2+0x33>

0000000000401bb5 <hexmatch>:
  401bb5:	41 54                	push   %r12
  401bb7:	55                   	push   %rbp
  401bb8:	53                   	push   %rbx
  401bb9:	48 83 ec 70          	sub    $0x70,%rsp
  401bbd:	89 fd                	mov    %edi,%ebp
  401bbf:	48 89 f3             	mov    %rsi,%rbx
  401bc2:	e8 a9 f5 ff ff       	call   401170 <random@plt>
  401bc7:	48 89 c1             	mov    %rax,%rcx
  401bca:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401bd1:	0a d7 a3 
  401bd4:	48 f7 ea             	imul   %rdx
  401bd7:	48 01 ca             	add    %rcx,%rdx
  401bda:	48 c1 fa 06          	sar    $0x6,%rdx
  401bde:	48 89 c8             	mov    %rcx,%rax
  401be1:	48 c1 f8 3f          	sar    $0x3f,%rax
  401be5:	48 29 c2             	sub    %rax,%rdx
  401be8:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401bec:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401bf0:	48 c1 e0 02          	shl    $0x2,%rax
  401bf4:	48 29 c1             	sub    %rax,%rcx
  401bf7:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  401bfb:	89 ea                	mov    %ebp,%edx
  401bfd:	48 8d 35 0b 17 00 00 	lea    0x170b(%rip),%rsi        # 40330f <_IO_stdin_used+0x30f>
  401c04:	4c 89 e7             	mov    %r12,%rdi
  401c07:	b8 00 00 00 00       	mov    $0x0,%eax
  401c0c:	e8 df f5 ff ff       	call   4011f0 <sprintf@plt>
  401c11:	ba 09 00 00 00       	mov    $0x9,%edx
  401c16:	4c 89 e6             	mov    %r12,%rsi
  401c19:	48 89 df             	mov    %rbx,%rdi
  401c1c:	e8 3f f4 ff ff       	call   401060 <strncmp@plt>
  401c21:	85 c0                	test   %eax,%eax
  401c23:	0f 94 c0             	sete   %al
  401c26:	0f b6 c0             	movzbl %al,%eax
  401c29:	48 83 c4 70          	add    $0x70,%rsp
  401c2d:	5b                   	pop    %rbx
  401c2e:	5d                   	pop    %rbp
  401c2f:	41 5c                	pop    %r12
  401c31:	c3                   	ret    

0000000000401c32 <touch3>:
  401c32:	53                   	push   %rbx
  401c33:	48 89 fb             	mov    %rdi,%rbx
  401c36:	c7 05 ec 38 00 00 03 	movl   $0x3,0x38ec(%rip)        # 40552c <vlevel>
  401c3d:	00 00 00 
  401c40:	48 89 fe             	mov    %rdi,%rsi
  401c43:	8b 3d eb 38 00 00    	mov    0x38eb(%rip),%edi        # 405534 <cookie>
  401c49:	e8 67 ff ff ff       	call   401bb5 <hexmatch>
  401c4e:	85 c0                	test   %eax,%eax
  401c50:	74 28                	je     401c7a <touch3+0x48>
  401c52:	48 89 de             	mov    %rbx,%rsi
  401c55:	48 8d 3d 0c 17 00 00 	lea    0x170c(%rip),%rdi        # 403368 <_IO_stdin_used+0x368>
  401c5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401c61:	e8 5a f4 ff ff       	call   4010c0 <printf@plt>
  401c66:	bf 03 00 00 00       	mov    $0x3,%edi
  401c6b:	e8 ec 01 00 00       	call   401e5c <validate>
  401c70:	bf 00 00 00 00       	mov    $0x0,%edi
  401c75:	e8 86 f5 ff ff       	call   401200 <exit@plt>
  401c7a:	48 89 de             	mov    %rbx,%rsi
  401c7d:	48 8d 3d 0c 17 00 00 	lea    0x170c(%rip),%rdi        # 403390 <_IO_stdin_used+0x390>
  401c84:	b8 00 00 00 00       	mov    $0x0,%eax
  401c89:	e8 32 f4 ff ff       	call   4010c0 <printf@plt>
  401c8e:	bf 03 00 00 00       	mov    $0x3,%edi
  401c93:	e8 82 02 00 00       	call   401f1a <fail>
  401c98:	eb d6                	jmp    401c70 <touch3+0x3e>

0000000000401c9a <test>:
  401c9a:	48 83 ec 08          	sub    $0x8,%rsp
  401c9e:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca3:	e8 6f fe ff ff       	call   401b17 <getbuf>
  401ca8:	89 c6                	mov    %eax,%esi
  401caa:	48 8d 3d 07 17 00 00 	lea    0x1707(%rip),%rdi        # 4033b8 <_IO_stdin_used+0x3b8>
  401cb1:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb6:	e8 05 f4 ff ff       	call   4010c0 <printf@plt>
  401cbb:	48 83 c4 08          	add    $0x8,%rsp
  401cbf:	c3                   	ret    

0000000000401cc0 <save_char>:
  401cc0:	8b 05 7e 44 00 00    	mov    0x447e(%rip),%eax        # 406144 <gets_cnt>
  401cc6:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401ccb:	7f 4a                	jg     401d17 <save_char+0x57>
  401ccd:	89 f9                	mov    %edi,%ecx
  401ccf:	c0 e9 04             	shr    $0x4,%cl
  401cd2:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401cd5:	4c 8d 05 54 19 00 00 	lea    0x1954(%rip),%r8        # 403630 <trans_char>
  401cdc:	83 e1 0f             	and    $0xf,%ecx
  401cdf:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  401ce4:	48 8d 0d 55 38 00 00 	lea    0x3855(%rip),%rcx        # 405540 <gets_buf>
  401ceb:	48 63 f2             	movslq %edx,%rsi
  401cee:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  401cf2:	8d 72 01             	lea    0x1(%rdx),%esi
  401cf5:	83 e7 0f             	and    $0xf,%edi
  401cf8:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  401cfd:	48 63 f6             	movslq %esi,%rsi
  401d00:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  401d04:	83 c2 02             	add    $0x2,%edx
  401d07:	48 63 d2             	movslq %edx,%rdx
  401d0a:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  401d0e:	83 c0 01             	add    $0x1,%eax
  401d11:	89 05 2d 44 00 00    	mov    %eax,0x442d(%rip)        # 406144 <gets_cnt>
  401d17:	c3                   	ret    

0000000000401d18 <save_term>:
  401d18:	8b 05 26 44 00 00    	mov    0x4426(%rip),%eax        # 406144 <gets_cnt>
  401d1e:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401d21:	48 98                	cltq   
  401d23:	48 8d 15 16 38 00 00 	lea    0x3816(%rip),%rdx        # 405540 <gets_buf>
  401d2a:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  401d2e:	c3                   	ret    

0000000000401d2f <check_fail>:
  401d2f:	48 83 ec 08          	sub    $0x8,%rsp
  401d33:	0f be 35 ea 37 00 00 	movsbl 0x37ea(%rip),%esi        # 405524 <target_prefix>
  401d3a:	48 8d 0d ff 37 00 00 	lea    0x37ff(%rip),%rcx        # 405540 <gets_buf>
  401d41:	8b 15 e1 37 00 00    	mov    0x37e1(%rip),%edx        # 405528 <check_level>
  401d47:	48 8d 3d 8d 16 00 00 	lea    0x168d(%rip),%rdi        # 4033db <_IO_stdin_used+0x3db>
  401d4e:	b8 00 00 00 00       	mov    $0x0,%eax
  401d53:	e8 68 f3 ff ff       	call   4010c0 <printf@plt>
  401d58:	bf 01 00 00 00       	mov    $0x1,%edi
  401d5d:	e8 9e f4 ff ff       	call   401200 <exit@plt>

0000000000401d62 <Gets>:
  401d62:	41 54                	push   %r12
  401d64:	55                   	push   %rbp
  401d65:	53                   	push   %rbx
  401d66:	49 89 fc             	mov    %rdi,%r12
  401d69:	c7 05 d1 43 00 00 00 	movl   $0x0,0x43d1(%rip)        # 406144 <gets_cnt>
  401d70:	00 00 00 
  401d73:	48 89 fb             	mov    %rdi,%rbx
  401d76:	eb 11                	jmp    401d89 <Gets+0x27>
  401d78:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401d7c:	88 03                	mov    %al,(%rbx)
  401d7e:	0f b6 f8             	movzbl %al,%edi
  401d81:	e8 3a ff ff ff       	call   401cc0 <save_char>
  401d86:	48 89 eb             	mov    %rbp,%rbx
  401d89:	48 8b 3d 88 37 00 00 	mov    0x3788(%rip),%rdi        # 405518 <infile>
  401d90:	e8 8b f4 ff ff       	call   401220 <getc@plt>
  401d95:	83 f8 ff             	cmp    $0xffffffff,%eax
  401d98:	74 05                	je     401d9f <Gets+0x3d>
  401d9a:	83 f8 0a             	cmp    $0xa,%eax
  401d9d:	75 d9                	jne    401d78 <Gets+0x16>
  401d9f:	c6 03 00             	movb   $0x0,(%rbx)
  401da2:	b8 00 00 00 00       	mov    $0x0,%eax
  401da7:	e8 6c ff ff ff       	call   401d18 <save_term>
  401dac:	4c 89 e0             	mov    %r12,%rax
  401daf:	5b                   	pop    %rbx
  401db0:	5d                   	pop    %rbp
  401db1:	41 5c                	pop    %r12
  401db3:	c3                   	ret    

0000000000401db4 <notify_server>:
  401db4:	83 3d 7d 37 00 00 00 	cmpl   $0x0,0x377d(%rip)        # 405538 <is_checker>
  401dbb:	0f 85 9a 00 00 00    	jne    401e5b <notify_server+0xa7>
  401dc1:	53                   	push   %rbx
  401dc2:	48 81 ec 00 20 00 00 	sub    $0x2000,%rsp
  401dc9:	81 3d 71 43 00 00 9c 	cmpl   $0x1f9c,0x4371(%rip)        # 406144 <gets_cnt>
  401dd0:	1f 00 00 
  401dd3:	7f 5a                	jg     401e2f <notify_server+0x7b>
  401dd5:	44 0f be 0d 47 37 00 	movsbl 0x3747(%rip),%r9d        # 405524 <target_prefix>
  401ddc:	00 
  401ddd:	83 3d 3c 37 00 00 00 	cmpl   $0x0,0x373c(%rip)        # 405520 <notify>
  401de4:	74 64                	je     401e4a <notify_server+0x96>
  401de6:	44 8b 05 43 37 00 00 	mov    0x3743(%rip),%r8d        # 405530 <authkey>
  401ded:	85 ff                	test   %edi,%edi
  401def:	74 61                	je     401e52 <notify_server+0x9e>
  401df1:	48 8d 1d fe 15 00 00 	lea    0x15fe(%rip),%rbx        # 4033f6 <_IO_stdin_used+0x3f6>
  401df8:	48 89 e7             	mov    %rsp,%rdi
  401dfb:	48 8d 05 3e 37 00 00 	lea    0x373e(%rip),%rax        # 405540 <gets_buf>
  401e02:	50                   	push   %rax
  401e03:	56                   	push   %rsi
  401e04:	48 89 d9             	mov    %rbx,%rcx
  401e07:	8b 15 23 33 00 00    	mov    0x3323(%rip),%edx        # 405130 <target_id>
  401e0d:	48 8d 35 e7 15 00 00 	lea    0x15e7(%rip),%rsi        # 4033fb <_IO_stdin_used+0x3fb>
  401e14:	b8 00 00 00 00       	mov    $0x0,%eax
  401e19:	e8 d2 f3 ff ff       	call   4011f0 <sprintf@plt>
  401e1e:	48 89 df             	mov    %rbx,%rdi
  401e21:	e8 5a f2 ff ff       	call   401080 <puts@plt>
  401e26:	48 81 c4 10 20 00 00 	add    $0x2010,%rsp
  401e2d:	5b                   	pop    %rbx
  401e2e:	c3                   	ret    
  401e2f:	48 8d 3d 8a 16 00 00 	lea    0x168a(%rip),%rdi        # 4034c0 <_IO_stdin_used+0x4c0>
  401e36:	b8 00 00 00 00       	mov    $0x0,%eax
  401e3b:	e8 80 f2 ff ff       	call   4010c0 <printf@plt>
  401e40:	bf 01 00 00 00       	mov    $0x1,%edi
  401e45:	e8 b6 f3 ff ff       	call   401200 <exit@plt>
  401e4a:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401e50:	eb 9b                	jmp    401ded <notify_server+0x39>
  401e52:	48 8d 1d 98 15 00 00 	lea    0x1598(%rip),%rbx        # 4033f1 <_IO_stdin_used+0x3f1>
  401e59:	eb 9d                	jmp    401df8 <notify_server+0x44>
  401e5b:	c3                   	ret    

0000000000401e5c <validate>:
  401e5c:	53                   	push   %rbx
  401e5d:	89 fb                	mov    %edi,%ebx
  401e5f:	83 3d d2 36 00 00 00 	cmpl   $0x0,0x36d2(%rip)        # 405538 <is_checker>
  401e66:	74 68                	je     401ed0 <validate+0x74>
  401e68:	39 3d be 36 00 00    	cmp    %edi,0x36be(%rip)        # 40552c <vlevel>
  401e6e:	75 2d                	jne    401e9d <validate+0x41>
  401e70:	8b 35 b2 36 00 00    	mov    0x36b2(%rip),%esi        # 405528 <check_level>
  401e76:	39 fe                	cmp    %edi,%esi
  401e78:	75 39                	jne    401eb3 <validate+0x57>
  401e7a:	0f be 35 a3 36 00 00 	movsbl 0x36a3(%rip),%esi        # 405524 <target_prefix>
  401e81:	48 8d 0d b8 36 00 00 	lea    0x36b8(%rip),%rcx        # 405540 <gets_buf>
  401e88:	89 fa                	mov    %edi,%edx
  401e8a:	48 8d 3d a4 15 00 00 	lea    0x15a4(%rip),%rdi        # 403435 <_IO_stdin_used+0x435>
  401e91:	b8 00 00 00 00       	mov    $0x0,%eax
  401e96:	e8 25 f2 ff ff       	call   4010c0 <printf@plt>
  401e9b:	5b                   	pop    %rbx
  401e9c:	c3                   	ret    
  401e9d:	48 8d 3d 73 15 00 00 	lea    0x1573(%rip),%rdi        # 403417 <_IO_stdin_used+0x417>
  401ea4:	e8 d7 f1 ff ff       	call   401080 <puts@plt>
  401ea9:	b8 00 00 00 00       	mov    $0x0,%eax
  401eae:	e8 7c fe ff ff       	call   401d2f <check_fail>
  401eb3:	89 fa                	mov    %edi,%edx
  401eb5:	48 8d 3d 34 16 00 00 	lea    0x1634(%rip),%rdi        # 4034f0 <_IO_stdin_used+0x4f0>
  401ebc:	b8 00 00 00 00       	mov    $0x0,%eax
  401ec1:	e8 fa f1 ff ff       	call   4010c0 <printf@plt>
  401ec6:	b8 00 00 00 00       	mov    $0x0,%eax
  401ecb:	e8 5f fe ff ff       	call   401d2f <check_fail>
  401ed0:	39 3d 56 36 00 00    	cmp    %edi,0x3656(%rip)        # 40552c <vlevel>
  401ed6:	74 1a                	je     401ef2 <validate+0x96>
  401ed8:	48 8d 3d 38 15 00 00 	lea    0x1538(%rip),%rdi        # 403417 <_IO_stdin_used+0x417>
  401edf:	e8 9c f1 ff ff       	call   401080 <puts@plt>
  401ee4:	89 de                	mov    %ebx,%esi
  401ee6:	bf 00 00 00 00       	mov    $0x0,%edi
  401eeb:	e8 c4 fe ff ff       	call   401db4 <notify_server>
  401ef0:	eb a9                	jmp    401e9b <validate+0x3f>
  401ef2:	0f be 15 2b 36 00 00 	movsbl 0x362b(%rip),%edx        # 405524 <target_prefix>
  401ef9:	89 fe                	mov    %edi,%esi
  401efb:	48 8d 3d 16 16 00 00 	lea    0x1616(%rip),%rdi        # 403518 <_IO_stdin_used+0x518>
  401f02:	b8 00 00 00 00       	mov    $0x0,%eax
  401f07:	e8 b4 f1 ff ff       	call   4010c0 <printf@plt>
  401f0c:	89 de                	mov    %ebx,%esi
  401f0e:	bf 01 00 00 00       	mov    $0x1,%edi
  401f13:	e8 9c fe ff ff       	call   401db4 <notify_server>
  401f18:	eb 81                	jmp    401e9b <validate+0x3f>

0000000000401f1a <fail>:
  401f1a:	48 83 ec 08          	sub    $0x8,%rsp
  401f1e:	83 3d 13 36 00 00 00 	cmpl   $0x0,0x3613(%rip)        # 405538 <is_checker>
  401f25:	75 11                	jne    401f38 <fail+0x1e>
  401f27:	89 fe                	mov    %edi,%esi
  401f29:	bf 00 00 00 00       	mov    $0x0,%edi
  401f2e:	e8 81 fe ff ff       	call   401db4 <notify_server>
  401f33:	48 83 c4 08          	add    $0x8,%rsp
  401f37:	c3                   	ret    
  401f38:	b8 00 00 00 00       	mov    $0x0,%eax
  401f3d:	e8 ed fd ff ff       	call   401d2f <check_fail>

0000000000401f42 <bushandler>:
  401f42:	48 83 ec 08          	sub    $0x8,%rsp
  401f46:	83 3d eb 35 00 00 00 	cmpl   $0x0,0x35eb(%rip)        # 405538 <is_checker>
  401f4d:	74 16                	je     401f65 <bushandler+0x23>
  401f4f:	48 8d 3d f4 14 00 00 	lea    0x14f4(%rip),%rdi        # 40344a <_IO_stdin_used+0x44a>
  401f56:	e8 25 f1 ff ff       	call   401080 <puts@plt>
  401f5b:	b8 00 00 00 00       	mov    $0x0,%eax
  401f60:	e8 ca fd ff ff       	call   401d2f <check_fail>
  401f65:	48 8d 3d e4 15 00 00 	lea    0x15e4(%rip),%rdi        # 403550 <_IO_stdin_used+0x550>
  401f6c:	e8 0f f1 ff ff       	call   401080 <puts@plt>
  401f71:	48 8d 3d dc 14 00 00 	lea    0x14dc(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  401f78:	e8 03 f1 ff ff       	call   401080 <puts@plt>
  401f7d:	be 00 00 00 00       	mov    $0x0,%esi
  401f82:	bf 00 00 00 00       	mov    $0x0,%edi
  401f87:	e8 28 fe ff ff       	call   401db4 <notify_server>
  401f8c:	bf 01 00 00 00       	mov    $0x1,%edi
  401f91:	e8 6a f2 ff ff       	call   401200 <exit@plt>

0000000000401f96 <seghandler>:
  401f96:	48 83 ec 08          	sub    $0x8,%rsp
  401f9a:	83 3d 97 35 00 00 00 	cmpl   $0x0,0x3597(%rip)        # 405538 <is_checker>
  401fa1:	74 16                	je     401fb9 <seghandler+0x23>
  401fa3:	48 8d 3d c0 14 00 00 	lea    0x14c0(%rip),%rdi        # 40346a <_IO_stdin_used+0x46a>
  401faa:	e8 d1 f0 ff ff       	call   401080 <puts@plt>
  401faf:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb4:	e8 76 fd ff ff       	call   401d2f <check_fail>
  401fb9:	48 8d 3d b0 15 00 00 	lea    0x15b0(%rip),%rdi        # 403570 <_IO_stdin_used+0x570>
  401fc0:	e8 bb f0 ff ff       	call   401080 <puts@plt>
  401fc5:	48 8d 3d 88 14 00 00 	lea    0x1488(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  401fcc:	e8 af f0 ff ff       	call   401080 <puts@plt>
  401fd1:	be 00 00 00 00       	mov    $0x0,%esi
  401fd6:	bf 00 00 00 00       	mov    $0x0,%edi
  401fdb:	e8 d4 fd ff ff       	call   401db4 <notify_server>
  401fe0:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe5:	e8 16 f2 ff ff       	call   401200 <exit@plt>

0000000000401fea <illegalhandler>:
  401fea:	48 83 ec 08          	sub    $0x8,%rsp
  401fee:	83 3d 43 35 00 00 00 	cmpl   $0x0,0x3543(%rip)        # 405538 <is_checker>
  401ff5:	74 16                	je     40200d <illegalhandler+0x23>
  401ff7:	48 8d 3d 7f 14 00 00 	lea    0x147f(%rip),%rdi        # 40347d <_IO_stdin_used+0x47d>
  401ffe:	e8 7d f0 ff ff       	call   401080 <puts@plt>
  402003:	b8 00 00 00 00       	mov    $0x0,%eax
  402008:	e8 22 fd ff ff       	call   401d2f <check_fail>
  40200d:	48 8d 3d 84 15 00 00 	lea    0x1584(%rip),%rdi        # 403598 <_IO_stdin_used+0x598>
  402014:	e8 67 f0 ff ff       	call   401080 <puts@plt>
  402019:	48 8d 3d 34 14 00 00 	lea    0x1434(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  402020:	e8 5b f0 ff ff       	call   401080 <puts@plt>
  402025:	be 00 00 00 00       	mov    $0x0,%esi
  40202a:	bf 00 00 00 00       	mov    $0x0,%edi
  40202f:	e8 80 fd ff ff       	call   401db4 <notify_server>
  402034:	bf 01 00 00 00       	mov    $0x1,%edi
  402039:	e8 c2 f1 ff ff       	call   401200 <exit@plt>

000000000040203e <sigalrmhandler>:
  40203e:	48 83 ec 08          	sub    $0x8,%rsp
  402042:	83 3d ef 34 00 00 00 	cmpl   $0x0,0x34ef(%rip)        # 405538 <is_checker>
  402049:	74 16                	je     402061 <sigalrmhandler+0x23>
  40204b:	48 8d 3d 3f 14 00 00 	lea    0x143f(%rip),%rdi        # 403491 <_IO_stdin_used+0x491>
  402052:	e8 29 f0 ff ff       	call   401080 <puts@plt>
  402057:	b8 00 00 00 00       	mov    $0x0,%eax
  40205c:	e8 ce fc ff ff       	call   401d2f <check_fail>
  402061:	be 05 00 00 00       	mov    $0x5,%esi
  402066:	48 8d 3d 5b 15 00 00 	lea    0x155b(%rip),%rdi        # 4035c8 <_IO_stdin_used+0x5c8>
  40206d:	b8 00 00 00 00       	mov    $0x0,%eax
  402072:	e8 49 f0 ff ff       	call   4010c0 <printf@plt>
  402077:	be 00 00 00 00       	mov    $0x0,%esi
  40207c:	bf 00 00 00 00       	mov    $0x0,%edi
  402081:	e8 2e fd ff ff       	call   401db4 <notify_server>
  402086:	bf 01 00 00 00       	mov    $0x1,%edi
  40208b:	e8 70 f1 ff ff       	call   401200 <exit@plt>

0000000000402090 <launch>:
  402090:	55                   	push   %rbp
  402091:	48 89 e5             	mov    %rsp,%rbp
  402094:	48 89 fa             	mov    %rdi,%rdx
  402097:	48 8d 47 17          	lea    0x17(%rdi),%rax
  40209b:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  40209f:	48 29 c4             	sub    %rax,%rsp
  4020a2:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  4020a7:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  4020ab:	be f4 00 00 00       	mov    $0xf4,%esi
  4020b0:	e8 1b f0 ff ff       	call   4010d0 <memset@plt>
  4020b5:	48 8b 05 e4 33 00 00 	mov    0x33e4(%rip),%rax        # 4054a0 <stdin@GLIBC_2.2.5>
  4020bc:	48 39 05 55 34 00 00 	cmp    %rax,0x3455(%rip)        # 405518 <infile>
  4020c3:	74 2b                	je     4020f0 <launch+0x60>
  4020c5:	c7 05 5d 34 00 00 00 	movl   $0x0,0x345d(%rip)        # 40552c <vlevel>
  4020cc:	00 00 00 
  4020cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d4:	e8 c1 fb ff ff       	call   401c9a <test>
  4020d9:	83 3d 58 34 00 00 00 	cmpl   $0x0,0x3458(%rip)        # 405538 <is_checker>
  4020e0:	75 21                	jne    402103 <launch+0x73>
  4020e2:	48 8d 3d c8 13 00 00 	lea    0x13c8(%rip),%rdi        # 4034b1 <_IO_stdin_used+0x4b1>
  4020e9:	e8 92 ef ff ff       	call   401080 <puts@plt>
  4020ee:	c9                   	leave  
  4020ef:	c3                   	ret    
  4020f0:	48 8d 3d a2 13 00 00 	lea    0x13a2(%rip),%rdi        # 403499 <_IO_stdin_used+0x499>
  4020f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4020fc:	e8 bf ef ff ff       	call   4010c0 <printf@plt>
  402101:	eb c2                	jmp    4020c5 <launch+0x35>
  402103:	48 8d 3d 9c 13 00 00 	lea    0x139c(%rip),%rdi        # 4034a6 <_IO_stdin_used+0x4a6>
  40210a:	e8 71 ef ff ff       	call   401080 <puts@plt>
  40210f:	b8 00 00 00 00       	mov    $0x0,%eax
  402114:	e8 16 fc ff ff       	call   401d2f <check_fail>

0000000000402119 <stable_launch>:
  402119:	53                   	push   %rbx
  40211a:	48 89 3d ef 33 00 00 	mov    %rdi,0x33ef(%rip)        # 405510 <global_offset>
  402121:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402127:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40212d:	b9 32 01 00 00       	mov    $0x132,%ecx
  402132:	ba 07 00 00 00       	mov    $0x7,%edx
  402137:	be 00 00 10 00       	mov    $0x100000,%esi
  40213c:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402141:	e8 6a ef ff ff       	call   4010b0 <mmap@plt>
  402146:	48 89 c3             	mov    %rax,%rbx
  402149:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  40214f:	75 43                	jne    402194 <stable_launch+0x7b>
  402151:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  402158:	48 89 15 a9 33 00 00 	mov    %rdx,0x33a9(%rip)        # 405508 <stack_top>
  40215f:	48 89 e0             	mov    %rsp,%rax
  402162:	48 89 d4             	mov    %rdx,%rsp
  402165:	48 89 c2             	mov    %rax,%rdx
  402168:	48 89 15 91 33 00 00 	mov    %rdx,0x3391(%rip)        # 405500 <global_save_stack>
  40216f:	48 8b 3d 9a 33 00 00 	mov    0x339a(%rip),%rdi        # 405510 <global_offset>
  402176:	e8 15 ff ff ff       	call   402090 <launch>
  40217b:	48 8b 05 7e 33 00 00 	mov    0x337e(%rip),%rax        # 405500 <global_save_stack>
  402182:	48 89 c4             	mov    %rax,%rsp
  402185:	be 00 00 10 00       	mov    $0x100000,%esi
  40218a:	48 89 df             	mov    %rbx,%rdi
  40218d:	e8 fe ef ff ff       	call   401190 <munmap@plt>
  402192:	5b                   	pop    %rbx
  402193:	c3                   	ret    
  402194:	be 00 00 10 00       	mov    $0x100000,%esi
  402199:	48 89 c7             	mov    %rax,%rdi
  40219c:	e8 ef ef ff ff       	call   401190 <munmap@plt>
  4021a1:	ba 00 60 58 55       	mov    $0x55586000,%edx
  4021a6:	48 8d 35 53 14 00 00 	lea    0x1453(%rip),%rsi        # 403600 <_IO_stdin_used+0x600>
  4021ad:	48 8b 3d 2c 33 00 00 	mov    0x332c(%rip),%rdi        # 4054e0 <stderr@GLIBC_2.2.5>
  4021b4:	b8 00 00 00 00       	mov    $0x0,%eax
  4021b9:	e8 72 ef ff ff       	call   401130 <fprintf@plt>
  4021be:	bf 01 00 00 00       	mov    $0x1,%edi
  4021c3:	e8 38 f0 ff ff       	call   401200 <exit@plt>

00000000004021c8 <rio_readinitb>:
  4021c8:	89 37                	mov    %esi,(%rdi)
  4021ca:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4021d1:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4021d5:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4021d9:	c3                   	ret    

00000000004021da <sigalrm_handler>:
  4021da:	48 83 ec 08          	sub    $0x8,%rsp
  4021de:	ba 00 00 00 00       	mov    $0x0,%edx
  4021e3:	48 8d 35 56 14 00 00 	lea    0x1456(%rip),%rsi        # 403640 <trans_char+0x10>
  4021ea:	48 8b 3d ef 32 00 00 	mov    0x32ef(%rip),%rdi        # 4054e0 <stderr@GLIBC_2.2.5>
  4021f1:	b8 00 00 00 00       	mov    $0x0,%eax
  4021f6:	e8 35 ef ff ff       	call   401130 <fprintf@plt>
  4021fb:	bf 01 00 00 00       	mov    $0x1,%edi
  402200:	e8 fb ef ff ff       	call   401200 <exit@plt>

0000000000402205 <urlencode>:
  402205:	41 54                	push   %r12
  402207:	55                   	push   %rbp
  402208:	53                   	push   %rbx
  402209:	48 83 ec 10          	sub    $0x10,%rsp
  40220d:	48 89 fb             	mov    %rdi,%rbx
  402210:	48 89 f5             	mov    %rsi,%rbp
  402213:	e8 88 ee ff ff       	call   4010a0 <strlen@plt>
  402218:	eb 0e                	jmp    402228 <urlencode+0x23>
  40221a:	88 55 00             	mov    %dl,0x0(%rbp)
  40221d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402221:	48 83 c3 01          	add    $0x1,%rbx
  402225:	44 89 e0             	mov    %r12d,%eax
  402228:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40222c:	85 c0                	test   %eax,%eax
  40222e:	0f 84 95 00 00 00    	je     4022c9 <urlencode+0xc4>
  402234:	0f b6 13             	movzbl (%rbx),%edx
  402237:	80 fa 2a             	cmp    $0x2a,%dl
  40223a:	0f 94 c1             	sete   %cl
  40223d:	80 fa 2d             	cmp    $0x2d,%dl
  402240:	0f 94 c0             	sete   %al
  402243:	08 c1                	or     %al,%cl
  402245:	75 d3                	jne    40221a <urlencode+0x15>
  402247:	80 fa 2e             	cmp    $0x2e,%dl
  40224a:	74 ce                	je     40221a <urlencode+0x15>
  40224c:	80 fa 5f             	cmp    $0x5f,%dl
  40224f:	74 c9                	je     40221a <urlencode+0x15>
  402251:	8d 42 d0             	lea    -0x30(%rdx),%eax
  402254:	3c 09                	cmp    $0x9,%al
  402256:	76 c2                	jbe    40221a <urlencode+0x15>
  402258:	8d 42 bf             	lea    -0x41(%rdx),%eax
  40225b:	3c 19                	cmp    $0x19,%al
  40225d:	76 bb                	jbe    40221a <urlencode+0x15>
  40225f:	8d 42 9f             	lea    -0x61(%rdx),%eax
  402262:	3c 19                	cmp    $0x19,%al
  402264:	76 b4                	jbe    40221a <urlencode+0x15>
  402266:	80 fa 20             	cmp    $0x20,%dl
  402269:	74 4c                	je     4022b7 <urlencode+0xb2>
  40226b:	8d 42 e0             	lea    -0x20(%rdx),%eax
  40226e:	3c 5f                	cmp    $0x5f,%al
  402270:	0f 96 c1             	setbe  %cl
  402273:	80 fa 09             	cmp    $0x9,%dl
  402276:	0f 94 c0             	sete   %al
  402279:	08 c1                	or     %al,%cl
  40227b:	74 47                	je     4022c4 <urlencode+0xbf>
  40227d:	0f b6 d2             	movzbl %dl,%edx
  402280:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  402285:	48 8d 35 49 14 00 00 	lea    0x1449(%rip),%rsi        # 4036d5 <trans_char+0xa5>
  40228c:	b8 00 00 00 00       	mov    $0x0,%eax
  402291:	e8 5a ef ff ff       	call   4011f0 <sprintf@plt>
  402296:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  40229b:	88 45 00             	mov    %al,0x0(%rbp)
  40229e:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  4022a3:	88 45 01             	mov    %al,0x1(%rbp)
  4022a6:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  4022ab:	88 45 02             	mov    %al,0x2(%rbp)
  4022ae:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4022b2:	e9 6a ff ff ff       	jmp    402221 <urlencode+0x1c>
  4022b7:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4022bb:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4022bf:	e9 5d ff ff ff       	jmp    402221 <urlencode+0x1c>
  4022c4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4022c9:	48 83 c4 10          	add    $0x10,%rsp
  4022cd:	5b                   	pop    %rbx
  4022ce:	5d                   	pop    %rbp
  4022cf:	41 5c                	pop    %r12
  4022d1:	c3                   	ret    

00000000004022d2 <rio_writen>:
  4022d2:	41 55                	push   %r13
  4022d4:	41 54                	push   %r12
  4022d6:	55                   	push   %rbp
  4022d7:	53                   	push   %rbx
  4022d8:	48 83 ec 08          	sub    $0x8,%rsp
  4022dc:	41 89 fc             	mov    %edi,%r12d
  4022df:	48 89 f5             	mov    %rsi,%rbp
  4022e2:	49 89 d5             	mov    %rdx,%r13
  4022e5:	48 89 d3             	mov    %rdx,%rbx
  4022e8:	eb 06                	jmp    4022f0 <rio_writen+0x1e>
  4022ea:	48 29 c3             	sub    %rax,%rbx
  4022ed:	48 01 c5             	add    %rax,%rbp
  4022f0:	48 85 db             	test   %rbx,%rbx
  4022f3:	74 24                	je     402319 <rio_writen+0x47>
  4022f5:	48 89 da             	mov    %rbx,%rdx
  4022f8:	48 89 ee             	mov    %rbp,%rsi
  4022fb:	44 89 e7             	mov    %r12d,%edi
  4022fe:	e8 8d ed ff ff       	call   401090 <write@plt>
  402303:	48 85 c0             	test   %rax,%rax
  402306:	7f e2                	jg     4022ea <rio_writen+0x18>
  402308:	e8 33 ed ff ff       	call   401040 <__errno_location@plt>
  40230d:	83 38 04             	cmpl   $0x4,(%rax)
  402310:	75 15                	jne    402327 <rio_writen+0x55>
  402312:	b8 00 00 00 00       	mov    $0x0,%eax
  402317:	eb d1                	jmp    4022ea <rio_writen+0x18>
  402319:	4c 89 e8             	mov    %r13,%rax
  40231c:	48 83 c4 08          	add    $0x8,%rsp
  402320:	5b                   	pop    %rbx
  402321:	5d                   	pop    %rbp
  402322:	41 5c                	pop    %r12
  402324:	41 5d                	pop    %r13
  402326:	c3                   	ret    
  402327:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40232e:	eb ec                	jmp    40231c <rio_writen+0x4a>

0000000000402330 <rio_read>:
  402330:	41 55                	push   %r13
  402332:	41 54                	push   %r12
  402334:	55                   	push   %rbp
  402335:	53                   	push   %rbx
  402336:	48 83 ec 08          	sub    $0x8,%rsp
  40233a:	48 89 fb             	mov    %rdi,%rbx
  40233d:	49 89 f5             	mov    %rsi,%r13
  402340:	49 89 d4             	mov    %rdx,%r12
  402343:	eb 0a                	jmp    40234f <rio_read+0x1f>
  402345:	e8 f6 ec ff ff       	call   401040 <__errno_location@plt>
  40234a:	83 38 04             	cmpl   $0x4,(%rax)
  40234d:	75 5a                	jne    4023a9 <rio_read+0x79>
  40234f:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402352:	85 ed                	test   %ebp,%ebp
  402354:	7f 22                	jg     402378 <rio_read+0x48>
  402356:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40235a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40235f:	48 89 ee             	mov    %rbp,%rsi
  402362:	8b 3b                	mov    (%rbx),%edi
  402364:	e8 97 ed ff ff       	call   401100 <read@plt>
  402369:	89 43 04             	mov    %eax,0x4(%rbx)
  40236c:	85 c0                	test   %eax,%eax
  40236e:	78 d5                	js     402345 <rio_read+0x15>
  402370:	74 40                	je     4023b2 <rio_read+0x82>
  402372:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402376:	eb d7                	jmp    40234f <rio_read+0x1f>
  402378:	89 e8                	mov    %ebp,%eax
  40237a:	4c 39 e0             	cmp    %r12,%rax
  40237d:	72 03                	jb     402382 <rio_read+0x52>
  40237f:	44 89 e5             	mov    %r12d,%ebp
  402382:	4c 63 e5             	movslq %ebp,%r12
  402385:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  402389:	4c 89 e2             	mov    %r12,%rdx
  40238c:	4c 89 ef             	mov    %r13,%rdi
  40238f:	e8 bc ed ff ff       	call   401150 <memcpy@plt>
  402394:	4c 01 63 08          	add    %r12,0x8(%rbx)
  402398:	29 6b 04             	sub    %ebp,0x4(%rbx)
  40239b:	4c 89 e0             	mov    %r12,%rax
  40239e:	48 83 c4 08          	add    $0x8,%rsp
  4023a2:	5b                   	pop    %rbx
  4023a3:	5d                   	pop    %rbp
  4023a4:	41 5c                	pop    %r12
  4023a6:	41 5d                	pop    %r13
  4023a8:	c3                   	ret    
  4023a9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4023b0:	eb ec                	jmp    40239e <rio_read+0x6e>
  4023b2:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b7:	eb e5                	jmp    40239e <rio_read+0x6e>

00000000004023b9 <rio_readlineb>:
  4023b9:	41 55                	push   %r13
  4023bb:	41 54                	push   %r12
  4023bd:	55                   	push   %rbp
  4023be:	53                   	push   %rbx
  4023bf:	48 83 ec 18          	sub    $0x18,%rsp
  4023c3:	49 89 fd             	mov    %rdi,%r13
  4023c6:	48 89 f5             	mov    %rsi,%rbp
  4023c9:	49 89 d4             	mov    %rdx,%r12
  4023cc:	bb 01 00 00 00       	mov    $0x1,%ebx
  4023d1:	eb 18                	jmp    4023eb <rio_readlineb+0x32>
  4023d3:	85 c0                	test   %eax,%eax
  4023d5:	75 55                	jne    40242c <rio_readlineb+0x73>
  4023d7:	48 83 fb 01          	cmp    $0x1,%rbx
  4023db:	75 3d                	jne    40241a <rio_readlineb+0x61>
  4023dd:	b8 00 00 00 00       	mov    $0x0,%eax
  4023e2:	eb 3d                	jmp    402421 <rio_readlineb+0x68>
  4023e4:	48 83 c3 01          	add    $0x1,%rbx
  4023e8:	48 89 d5             	mov    %rdx,%rbp
  4023eb:	4c 39 e3             	cmp    %r12,%rbx
  4023ee:	73 2a                	jae    40241a <rio_readlineb+0x61>
  4023f0:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4023f5:	ba 01 00 00 00       	mov    $0x1,%edx
  4023fa:	4c 89 ef             	mov    %r13,%rdi
  4023fd:	e8 2e ff ff ff       	call   402330 <rio_read>
  402402:	83 f8 01             	cmp    $0x1,%eax
  402405:	75 cc                	jne    4023d3 <rio_readlineb+0x1a>
  402407:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  40240b:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  402410:	88 45 00             	mov    %al,0x0(%rbp)
  402413:	3c 0a                	cmp    $0xa,%al
  402415:	75 cd                	jne    4023e4 <rio_readlineb+0x2b>
  402417:	48 89 d5             	mov    %rdx,%rbp
  40241a:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40241e:	48 89 d8             	mov    %rbx,%rax
  402421:	48 83 c4 18          	add    $0x18,%rsp
  402425:	5b                   	pop    %rbx
  402426:	5d                   	pop    %rbp
  402427:	41 5c                	pop    %r12
  402429:	41 5d                	pop    %r13
  40242b:	c3                   	ret    
  40242c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402433:	eb ec                	jmp    402421 <rio_readlineb+0x68>

0000000000402435 <submitr>:
  402435:	41 57                	push   %r15
  402437:	41 56                	push   %r14
  402439:	41 55                	push   %r13
  40243b:	41 54                	push   %r12
  40243d:	55                   	push   %rbp
  40243e:	53                   	push   %rbx
  40243f:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402446:	49 89 fc             	mov    %rdi,%r12
  402449:	89 74 24 10          	mov    %esi,0x10(%rsp)
  40244d:	49 89 d6             	mov    %rdx,%r14
  402450:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  402455:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  40245a:	4d 89 cd             	mov    %r9,%r13
  40245d:	48 8b ac 24 90 a0 00 	mov    0xa090(%rsp),%rbp
  402464:	00 
  402465:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  40246c:	00 00 00 00 
  402470:	ba 00 00 00 00       	mov    $0x0,%edx
  402475:	be 01 00 00 00       	mov    $0x1,%esi
  40247a:	bf 02 00 00 00       	mov    $0x2,%edi
  40247f:	e8 ac ed ff ff       	call   401230 <socket@plt>
  402484:	85 c0                	test   %eax,%eax
  402486:	0f 88 6c 02 00 00    	js     4026f8 <submitr+0x2c3>
  40248c:	89 c3                	mov    %eax,%ebx
  40248e:	4c 89 e7             	mov    %r12,%rdi
  402491:	e8 8a ec ff ff       	call   401120 <gethostbyname@plt>
  402496:	48 85 c0             	test   %rax,%rax
  402499:	0f 84 a5 02 00 00    	je     402744 <submitr+0x30f>
  40249f:	4c 8d bc 24 40 a0 00 	lea    0xa040(%rsp),%r15
  4024a6:	00 
  4024a7:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  4024ae:	00 00 00 00 00 
  4024b3:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  4024ba:	00 00 00 00 00 
  4024bf:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  4024c6:	00 02 00 
  4024c9:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4024cd:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4024d1:	48 8d bc 24 44 a0 00 	lea    0xa044(%rsp),%rdi
  4024d8:	00 
  4024d9:	48 8b 31             	mov    (%rcx),%rsi
  4024dc:	e8 bf ec ff ff       	call   4011a0 <memmove@plt>
  4024e1:	0f b7 74 24 10       	movzwl 0x10(%rsp),%esi
  4024e6:	66 c1 c6 08          	rol    $0x8,%si
  4024ea:	66 89 b4 24 42 a0 00 	mov    %si,0xa042(%rsp)
  4024f1:	00 
  4024f2:	ba 10 00 00 00       	mov    $0x10,%edx
  4024f7:	4c 89 fe             	mov    %r15,%rsi
  4024fa:	89 df                	mov    %ebx,%edi
  4024fc:	e8 0f ed ff ff       	call   401210 <connect@plt>
  402501:	85 c0                	test   %eax,%eax
  402503:	0f 88 a3 02 00 00    	js     4027ac <submitr+0x377>
  402509:	4c 89 ef             	mov    %r13,%rdi
  40250c:	e8 8f eb ff ff       	call   4010a0 <strlen@plt>
  402511:	49 89 c7             	mov    %rax,%r15
  402514:	4c 89 f7             	mov    %r14,%rdi
  402517:	e8 84 eb ff ff       	call   4010a0 <strlen@plt>
  40251c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402521:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402526:	e8 75 eb ff ff       	call   4010a0 <strlen@plt>
  40252b:	48 03 44 24 10       	add    0x10(%rsp),%rax
  402530:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402535:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  40253a:	e8 61 eb ff ff       	call   4010a0 <strlen@plt>
  40253f:	48 03 44 24 10       	add    0x10(%rsp),%rax
  402544:	4b 8d 14 7f          	lea    (%r15,%r15,2),%rdx
  402548:	48 8d 84 10 80 00 00 	lea    0x80(%rax,%rdx,1),%rax
  40254f:	00 
  402550:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402556:	0f 87 aa 02 00 00    	ja     402806 <submitr+0x3d1>
  40255c:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  402563:	00 
  402564:	b9 00 04 00 00       	mov    $0x400,%ecx
  402569:	b8 00 00 00 00       	mov    $0x0,%eax
  40256e:	48 89 f7             	mov    %rsi,%rdi
  402571:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402574:	4c 89 ef             	mov    %r13,%rdi
  402577:	e8 89 fc ff ff       	call   402205 <urlencode>
  40257c:	85 c0                	test   %eax,%eax
  40257e:	0f 88 f5 02 00 00    	js     402879 <submitr+0x444>
  402584:	4c 8d ac 24 30 60 00 	lea    0x6030(%rsp),%r13
  40258b:	00 
  40258c:	4d 89 e1             	mov    %r12,%r9
  40258f:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  402596:	00 
  402597:	4c 89 f1             	mov    %r14,%rcx
  40259a:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  40259f:	48 8d 35 c2 10 00 00 	lea    0x10c2(%rip),%rsi        # 403668 <trans_char+0x38>
  4025a6:	4c 89 ef             	mov    %r13,%rdi
  4025a9:	b8 00 00 00 00       	mov    $0x0,%eax
  4025ae:	e8 3d ec ff ff       	call   4011f0 <sprintf@plt>
  4025b3:	4c 89 ef             	mov    %r13,%rdi
  4025b6:	e8 e5 ea ff ff       	call   4010a0 <strlen@plt>
  4025bb:	48 89 c2             	mov    %rax,%rdx
  4025be:	4c 89 ee             	mov    %r13,%rsi
  4025c1:	89 df                	mov    %ebx,%edi
  4025c3:	e8 0a fd ff ff       	call   4022d2 <rio_writen>
  4025c8:	48 85 c0             	test   %rax,%rax
  4025cb:	0f 88 33 03 00 00    	js     402904 <submitr+0x4cf>
  4025d1:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  4025d8:	00 
  4025d9:	89 de                	mov    %ebx,%esi
  4025db:	4c 89 e7             	mov    %r12,%rdi
  4025de:	e8 e5 fb ff ff       	call   4021c8 <rio_readinitb>
  4025e3:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4025ea:	00 
  4025eb:	ba 00 20 00 00       	mov    $0x2000,%edx
  4025f0:	4c 89 e7             	mov    %r12,%rdi
  4025f3:	e8 c1 fd ff ff       	call   4023b9 <rio_readlineb>
  4025f8:	48 85 c0             	test   %rax,%rax
  4025fb:	0f 8e 72 03 00 00    	jle    402973 <submitr+0x53e>
  402601:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402608:	00 
  402609:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  402610:	00 
  402611:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402618:	00 
  402619:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  40261e:	48 8d 35 b7 10 00 00 	lea    0x10b7(%rip),%rsi        # 4036dc <trans_char+0xac>
  402625:	b8 00 00 00 00       	mov    $0x0,%eax
  40262a:	e8 51 eb ff ff       	call   401180 <__isoc99_sscanf@plt>
  40262f:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402636:	00 
  402637:	b9 03 00 00 00       	mov    $0x3,%ecx
  40263c:	48 8d 3d b0 10 00 00 	lea    0x10b0(%rip),%rdi        # 4036f3 <trans_char+0xc3>
  402643:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402645:	0f 97 c0             	seta   %al
  402648:	1c 00                	sbb    $0x0,%al
  40264a:	84 c0                	test   %al,%al
  40264c:	0f 84 9f 03 00 00    	je     4029f1 <submitr+0x5bc>
  402652:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402659:	00 
  40265a:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402661:	00 
  402662:	ba 00 20 00 00       	mov    $0x2000,%edx
  402667:	e8 4d fd ff ff       	call   4023b9 <rio_readlineb>
  40266c:	48 85 c0             	test   %rax,%rax
  40266f:	7f be                	jg     40262f <submitr+0x1fa>
  402671:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402678:	3a 20 43 
  40267b:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402682:	20 75 6e 
  402685:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402689:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40268d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402694:	74 6f 20 
  402697:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  40269e:	68 65 61 
  4026a1:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4026a5:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4026a9:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4026b0:	66 72 6f 
  4026b3:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  4026ba:	20 72 65 
  4026bd:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4026c1:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4026c5:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4026cc:	73 65 72 
  4026cf:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4026d3:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  4026da:	89 df                	mov    %ebx,%edi
  4026dc:	e8 0f ea ff ff       	call   4010f0 <close@plt>
  4026e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026e6:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  4026ed:	5b                   	pop    %rbx
  4026ee:	5d                   	pop    %rbp
  4026ef:	41 5c                	pop    %r12
  4026f1:	41 5d                	pop    %r13
  4026f3:	41 5e                	pop    %r14
  4026f5:	41 5f                	pop    %r15
  4026f7:	c3                   	ret    
  4026f8:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026ff:	3a 20 43 
  402702:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402709:	20 75 6e 
  40270c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402710:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402714:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40271b:	74 6f 20 
  40271e:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402725:	65 20 73 
  402728:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40272c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402730:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402737:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40273d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402742:	eb a2                	jmp    4026e6 <submitr+0x2b1>
  402744:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40274b:	3a 20 44 
  40274e:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402755:	20 75 6e 
  402758:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40275c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402760:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402767:	74 6f 20 
  40276a:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402771:	76 65 20 
  402774:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402778:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40277c:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402783:	72 20 61 
  402786:	48 89 45 20          	mov    %rax,0x20(%rbp)
  40278a:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402791:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402797:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  40279b:	89 df                	mov    %ebx,%edi
  40279d:	e8 4e e9 ff ff       	call   4010f0 <close@plt>
  4027a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027a7:	e9 3a ff ff ff       	jmp    4026e6 <submitr+0x2b1>
  4027ac:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4027b3:	3a 20 55 
  4027b6:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  4027bd:	20 74 6f 
  4027c0:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4027c4:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4027c8:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4027cf:	65 63 74 
  4027d2:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  4027d9:	68 65 20 
  4027dc:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4027e0:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4027e4:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  4027eb:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  4027f1:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  4027f5:	89 df                	mov    %ebx,%edi
  4027f7:	e8 f4 e8 ff ff       	call   4010f0 <close@plt>
  4027fc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402801:	e9 e0 fe ff ff       	jmp    4026e6 <submitr+0x2b1>
  402806:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40280d:	3a 20 52 
  402810:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  402817:	20 73 74 
  40281a:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40281e:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402822:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402829:	74 6f 6f 
  40282c:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  402833:	65 2e 20 
  402836:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40283a:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40283e:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402845:	61 73 65 
  402848:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  40284f:	49 54 52 
  402852:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402856:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  40285a:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402861:	55 46 00 
  402864:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402868:	89 df                	mov    %ebx,%edi
  40286a:	e8 81 e8 ff ff       	call   4010f0 <close@plt>
  40286f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402874:	e9 6d fe ff ff       	jmp    4026e6 <submitr+0x2b1>
  402879:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402880:	3a 20 52 
  402883:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  40288a:	20 73 74 
  40288d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402891:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402895:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  40289c:	63 6f 6e 
  40289f:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  4028a6:	20 61 6e 
  4028a9:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4028ad:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4028b1:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4028b8:	67 61 6c 
  4028bb:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  4028c2:	6e 70 72 
  4028c5:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4028c9:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4028cd:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4028d4:	6c 65 20 
  4028d7:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  4028de:	63 74 65 
  4028e1:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4028e5:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  4028e9:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  4028ef:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  4028f3:	89 df                	mov    %ebx,%edi
  4028f5:	e8 f6 e7 ff ff       	call   4010f0 <close@plt>
  4028fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028ff:	e9 e2 fd ff ff       	jmp    4026e6 <submitr+0x2b1>
  402904:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40290b:	3a 20 43 
  40290e:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402915:	20 75 6e 
  402918:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40291c:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402920:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402927:	74 6f 20 
  40292a:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  402931:	20 74 6f 
  402934:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402938:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40293c:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402943:	72 65 73 
  402946:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  40294d:	65 72 76 
  402950:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402954:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402958:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  40295e:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  402962:	89 df                	mov    %ebx,%edi
  402964:	e8 87 e7 ff ff       	call   4010f0 <close@plt>
  402969:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40296e:	e9 73 fd ff ff       	jmp    4026e6 <submitr+0x2b1>
  402973:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40297a:	3a 20 43 
  40297d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402984:	20 75 6e 
  402987:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40298b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40298f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402996:	74 6f 20 
  402999:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  4029a0:	66 69 72 
  4029a3:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029a7:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4029ab:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  4029b2:	61 64 65 
  4029b5:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  4029bc:	6d 20 72 
  4029bf:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4029c3:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4029c7:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  4029ce:	20 73 65 
  4029d1:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4029d5:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  4029dc:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  4029e0:	89 df                	mov    %ebx,%edi
  4029e2:	e8 09 e7 ff ff       	call   4010f0 <close@plt>
  4029e7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029ec:	e9 f5 fc ff ff       	jmp    4026e6 <submitr+0x2b1>
  4029f1:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4029f8:	00 
  4029f9:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402a00:	00 
  402a01:	ba 00 20 00 00       	mov    $0x2000,%edx
  402a06:	e8 ae f9 ff ff       	call   4023b9 <rio_readlineb>
  402a0b:	48 85 c0             	test   %rax,%rax
  402a0e:	0f 8e 97 00 00 00    	jle    402aab <submitr+0x676>
  402a14:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402a1b:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402a21:	0f 85 08 01 00 00    	jne    402b2f <submitr+0x6fa>
  402a27:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402a2e:	00 
  402a2f:	48 89 ef             	mov    %rbp,%rdi
  402a32:	e8 39 e6 ff ff       	call   401070 <strcpy@plt>
  402a37:	89 df                	mov    %ebx,%edi
  402a39:	e8 b2 e6 ff ff       	call   4010f0 <close@plt>
  402a3e:	b9 04 00 00 00       	mov    $0x4,%ecx
  402a43:	48 8d 3d a3 0c 00 00 	lea    0xca3(%rip),%rdi        # 4036ed <trans_char+0xbd>
  402a4a:	48 89 ee             	mov    %rbp,%rsi
  402a4d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402a4f:	0f 97 c0             	seta   %al
  402a52:	1c 00                	sbb    $0x0,%al
  402a54:	0f be c0             	movsbl %al,%eax
  402a57:	85 c0                	test   %eax,%eax
  402a59:	0f 84 87 fc ff ff    	je     4026e6 <submitr+0x2b1>
  402a5f:	b9 05 00 00 00       	mov    $0x5,%ecx
  402a64:	48 8d 3d 86 0c 00 00 	lea    0xc86(%rip),%rdi        # 4036f1 <trans_char+0xc1>
  402a6b:	48 89 ee             	mov    %rbp,%rsi
  402a6e:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402a70:	0f 97 c0             	seta   %al
  402a73:	1c 00                	sbb    $0x0,%al
  402a75:	0f be c0             	movsbl %al,%eax
  402a78:	85 c0                	test   %eax,%eax
  402a7a:	0f 84 66 fc ff ff    	je     4026e6 <submitr+0x2b1>
  402a80:	b9 03 00 00 00       	mov    $0x3,%ecx
  402a85:	48 8d 3d 6a 0c 00 00 	lea    0xc6a(%rip),%rdi        # 4036f6 <trans_char+0xc6>
  402a8c:	48 89 ee             	mov    %rbp,%rsi
  402a8f:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402a91:	0f 97 c0             	seta   %al
  402a94:	1c 00                	sbb    $0x0,%al
  402a96:	0f be c0             	movsbl %al,%eax
  402a99:	85 c0                	test   %eax,%eax
  402a9b:	0f 84 45 fc ff ff    	je     4026e6 <submitr+0x2b1>
  402aa1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402aa6:	e9 3b fc ff ff       	jmp    4026e6 <submitr+0x2b1>
  402aab:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ab2:	3a 20 43 
  402ab5:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402abc:	20 75 6e 
  402abf:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402ac3:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402ac7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402ace:	74 6f 20 
  402ad1:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  402ad8:	73 74 61 
  402adb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402adf:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402ae3:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402aea:	65 73 73 
  402aed:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  402af4:	72 6f 6d 
  402af7:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402afb:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402aff:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402b06:	6c 74 20 
  402b09:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402b0d:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  402b14:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  402b1a:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  402b1e:	89 df                	mov    %ebx,%edi
  402b20:	e8 cb e5 ff ff       	call   4010f0 <close@plt>
  402b25:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b2a:	e9 b7 fb ff ff       	jmp    4026e6 <submitr+0x2b1>
  402b2f:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402b34:	48 8d 35 6d 0b 00 00 	lea    0xb6d(%rip),%rsi        # 4036a8 <trans_char+0x78>
  402b3b:	48 89 ef             	mov    %rbp,%rdi
  402b3e:	b8 00 00 00 00       	mov    $0x0,%eax
  402b43:	e8 a8 e6 ff ff       	call   4011f0 <sprintf@plt>
  402b48:	89 df                	mov    %ebx,%edi
  402b4a:	e8 a1 e5 ff ff       	call   4010f0 <close@plt>
  402b4f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b54:	e9 8d fb ff ff       	jmp    4026e6 <submitr+0x2b1>

0000000000402b59 <init_timeout>:
  402b59:	85 ff                	test   %edi,%edi
  402b5b:	74 26                	je     402b83 <init_timeout+0x2a>
  402b5d:	53                   	push   %rbx
  402b5e:	89 fb                	mov    %edi,%ebx
  402b60:	78 1a                	js     402b7c <init_timeout+0x23>
  402b62:	48 8d 35 71 f6 ff ff 	lea    -0x98f(%rip),%rsi        # 4021da <sigalrm_handler>
  402b69:	bf 0e 00 00 00       	mov    $0xe,%edi
  402b6e:	e8 9d e5 ff ff       	call   401110 <signal@plt>
  402b73:	89 df                	mov    %ebx,%edi
  402b75:	e8 66 e5 ff ff       	call   4010e0 <alarm@plt>
  402b7a:	5b                   	pop    %rbx
  402b7b:	c3                   	ret    
  402b7c:	bb 00 00 00 00       	mov    $0x0,%ebx
  402b81:	eb df                	jmp    402b62 <init_timeout+0x9>
  402b83:	c3                   	ret    

0000000000402b84 <init_driver>:
  402b84:	41 54                	push   %r12
  402b86:	55                   	push   %rbp
  402b87:	53                   	push   %rbx
  402b88:	48 83 ec 10          	sub    $0x10,%rsp
  402b8c:	48 89 fd             	mov    %rdi,%rbp
  402b8f:	be 01 00 00 00       	mov    $0x1,%esi
  402b94:	bf 0d 00 00 00       	mov    $0xd,%edi
  402b99:	e8 72 e5 ff ff       	call   401110 <signal@plt>
  402b9e:	be 01 00 00 00       	mov    $0x1,%esi
  402ba3:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402ba8:	e8 63 e5 ff ff       	call   401110 <signal@plt>
  402bad:	be 01 00 00 00       	mov    $0x1,%esi
  402bb2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402bb7:	e8 54 e5 ff ff       	call   401110 <signal@plt>
  402bbc:	ba 00 00 00 00       	mov    $0x0,%edx
  402bc1:	be 01 00 00 00       	mov    $0x1,%esi
  402bc6:	bf 02 00 00 00       	mov    $0x2,%edi
  402bcb:	e8 60 e6 ff ff       	call   401230 <socket@plt>
  402bd0:	85 c0                	test   %eax,%eax
  402bd2:	0f 88 83 00 00 00    	js     402c5b <init_driver+0xd7>
  402bd8:	89 c3                	mov    %eax,%ebx
  402bda:	48 8d 3d 18 0b 00 00 	lea    0xb18(%rip),%rdi        # 4036f9 <trans_char+0xc9>
  402be1:	e8 3a e5 ff ff       	call   401120 <gethostbyname@plt>
  402be6:	48 85 c0             	test   %rax,%rax
  402be9:	0f 84 b8 00 00 00    	je     402ca7 <init_driver+0x123>
  402bef:	49 89 e4             	mov    %rsp,%r12
  402bf2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402bf9:	00 
  402bfa:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402c01:	00 00 
  402c03:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402c09:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402c0d:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402c11:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402c16:	48 8b 31             	mov    (%rcx),%rsi
  402c19:	e8 82 e5 ff ff       	call   4011a0 <memmove@plt>
  402c1e:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402c25:	ba 10 00 00 00       	mov    $0x10,%edx
  402c2a:	4c 89 e6             	mov    %r12,%rsi
  402c2d:	89 df                	mov    %ebx,%edi
  402c2f:	e8 dc e5 ff ff       	call   401210 <connect@plt>
  402c34:	85 c0                	test   %eax,%eax
  402c36:	0f 88 d3 00 00 00    	js     402d0f <init_driver+0x18b>
  402c3c:	89 df                	mov    %ebx,%edi
  402c3e:	e8 ad e4 ff ff       	call   4010f0 <close@plt>
  402c43:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402c49:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402c4d:	b8 00 00 00 00       	mov    $0x0,%eax
  402c52:	48 83 c4 10          	add    $0x10,%rsp
  402c56:	5b                   	pop    %rbx
  402c57:	5d                   	pop    %rbp
  402c58:	41 5c                	pop    %r12
  402c5a:	c3                   	ret    
  402c5b:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402c62:	3a 20 43 
  402c65:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402c6c:	20 75 6e 
  402c6f:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402c73:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402c77:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402c7e:	74 6f 20 
  402c81:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402c88:	65 20 73 
  402c8b:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402c8f:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402c93:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402c9a:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402ca0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ca5:	eb ab                	jmp    402c52 <init_driver+0xce>
  402ca7:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402cae:	3a 20 44 
  402cb1:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402cb8:	20 75 6e 
  402cbb:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402cbf:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402cc3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402cca:	74 6f 20 
  402ccd:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402cd4:	76 65 20 
  402cd7:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402cdb:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402cdf:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402ce6:	72 20 61 
  402ce9:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402ced:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402cf4:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402cfa:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402cfe:	89 df                	mov    %ebx,%edi
  402d00:	e8 eb e3 ff ff       	call   4010f0 <close@plt>
  402d05:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d0a:	e9 43 ff ff ff       	jmp    402c52 <init_driver+0xce>
  402d0f:	48 b8 63 68 61 6e 67 	movabs $0x656d65676e616863,%rax
  402d16:	65 6d 65 
  402d19:	48 ba 2e 79 6f 75 72 	movabs $0x68637372756f792e,%rdx
  402d20:	73 63 68 
  402d23:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d27:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402d2b:	48 b8 6f 6f 6c 2e 65 	movabs $0x7564652e6c6f6f,%rax
  402d32:	64 75 00 
  402d35:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d39:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402d40:	3a 20 55 
  402d43:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  402d4a:	20 74 6f 
  402d4d:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d51:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402d55:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402d5c:	65 63 74 
  402d5f:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  402d66:	65 72 76 
  402d69:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402d6d:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402d71:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402d77:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402d7b:	89 df                	mov    %ebx,%edi
  402d7d:	e8 6e e3 ff ff       	call   4010f0 <close@plt>
  402d82:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402d87:	e9 c6 fe ff ff       	jmp    402c52 <init_driver+0xce>

0000000000402d8c <driver_post>:
  402d8c:	53                   	push   %rbx
  402d8d:	4c 89 cb             	mov    %r9,%rbx
  402d90:	45 85 c0             	test   %r8d,%r8d
  402d93:	75 18                	jne    402dad <driver_post+0x21>
  402d95:	48 85 ff             	test   %rdi,%rdi
  402d98:	74 05                	je     402d9f <driver_post+0x13>
  402d9a:	80 3f 00             	cmpb   $0x0,(%rdi)
  402d9d:	75 32                	jne    402dd1 <driver_post+0x45>
  402d9f:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402da4:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402da8:	44 89 c0             	mov    %r8d,%eax
  402dab:	5b                   	pop    %rbx
  402dac:	c3                   	ret    
  402dad:	48 89 ce             	mov    %rcx,%rsi
  402db0:	48 8d 3d 5a 09 00 00 	lea    0x95a(%rip),%rdi        # 403711 <trans_char+0xe1>
  402db7:	b8 00 00 00 00       	mov    $0x0,%eax
  402dbc:	e8 ff e2 ff ff       	call   4010c0 <printf@plt>
  402dc1:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402dc6:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402dca:	b8 00 00 00 00       	mov    $0x0,%eax
  402dcf:	eb da                	jmp    402dab <driver_post+0x1f>
  402dd1:	48 83 ec 08          	sub    $0x8,%rsp
  402dd5:	41 51                	push   %r9
  402dd7:	49 89 c9             	mov    %rcx,%r9
  402dda:	49 89 d0             	mov    %rdx,%r8
  402ddd:	48 89 f9             	mov    %rdi,%rcx
  402de0:	48 89 f2             	mov    %rsi,%rdx
  402de3:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402de8:	48 8d 3d 0a 09 00 00 	lea    0x90a(%rip),%rdi        # 4036f9 <trans_char+0xc9>
  402def:	e8 41 f6 ff ff       	call   402435 <submitr>
  402df4:	48 83 c4 10          	add    $0x10,%rsp
  402df8:	eb b1                	jmp    402dab <driver_post+0x1f>

0000000000402dfa <check>:
  402dfa:	89 f8                	mov    %edi,%eax
  402dfc:	c1 e8 1c             	shr    $0x1c,%eax
  402dff:	74 1d                	je     402e1e <check+0x24>
  402e01:	b9 00 00 00 00       	mov    $0x0,%ecx
  402e06:	83 f9 1f             	cmp    $0x1f,%ecx
  402e09:	7f 0d                	jg     402e18 <check+0x1e>
  402e0b:	89 f8                	mov    %edi,%eax
  402e0d:	d3 e8                	shr    %cl,%eax
  402e0f:	3c 0a                	cmp    $0xa,%al
  402e11:	74 11                	je     402e24 <check+0x2a>
  402e13:	83 c1 08             	add    $0x8,%ecx
  402e16:	eb ee                	jmp    402e06 <check+0xc>
  402e18:	b8 01 00 00 00       	mov    $0x1,%eax
  402e1d:	c3                   	ret    
  402e1e:	b8 00 00 00 00       	mov    $0x0,%eax
  402e23:	c3                   	ret    
  402e24:	b8 00 00 00 00       	mov    $0x0,%eax
  402e29:	c3                   	ret    

0000000000402e2a <gencookie>:
  402e2a:	53                   	push   %rbx
  402e2b:	83 c7 01             	add    $0x1,%edi
  402e2e:	e8 1d e2 ff ff       	call   401050 <srandom@plt>
  402e33:	e8 38 e3 ff ff       	call   401170 <random@plt>
  402e38:	48 89 c7             	mov    %rax,%rdi
  402e3b:	89 c3                	mov    %eax,%ebx
  402e3d:	e8 b8 ff ff ff       	call   402dfa <check>
  402e42:	85 c0                	test   %eax,%eax
  402e44:	74 ed                	je     402e33 <gencookie+0x9>
  402e46:	89 d8                	mov    %ebx,%eax
  402e48:	5b                   	pop    %rbx
  402e49:	c3                   	ret    
  402e4a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000402e50 <__libc_csu_init>:
  402e50:	41 57                	push   %r15
  402e52:	4c 8d 3d b7 1f 00 00 	lea    0x1fb7(%rip),%r15        # 404e10 <__frame_dummy_init_array_entry>
  402e59:	41 56                	push   %r14
  402e5b:	49 89 d6             	mov    %rdx,%r14
  402e5e:	41 55                	push   %r13
  402e60:	49 89 f5             	mov    %rsi,%r13
  402e63:	41 54                	push   %r12
  402e65:	41 89 fc             	mov    %edi,%r12d
  402e68:	55                   	push   %rbp
  402e69:	48 8d 2d a8 1f 00 00 	lea    0x1fa8(%rip),%rbp        # 404e18 <__do_global_dtors_aux_fini_array_entry>
  402e70:	53                   	push   %rbx
  402e71:	4c 29 fd             	sub    %r15,%rbp
  402e74:	48 83 ec 08          	sub    $0x8,%rsp
  402e78:	e8 83 e1 ff ff       	call   401000 <_init>
  402e7d:	48 c1 fd 03          	sar    $0x3,%rbp
  402e81:	74 1b                	je     402e9e <__libc_csu_init+0x4e>
  402e83:	31 db                	xor    %ebx,%ebx
  402e85:	0f 1f 00             	nopl   (%rax)
  402e88:	4c 89 f2             	mov    %r14,%rdx
  402e8b:	4c 89 ee             	mov    %r13,%rsi
  402e8e:	44 89 e7             	mov    %r12d,%edi
  402e91:	41 ff 14 df          	call   *(%r15,%rbx,8)
  402e95:	48 83 c3 01          	add    $0x1,%rbx
  402e99:	48 39 dd             	cmp    %rbx,%rbp
  402e9c:	75 ea                	jne    402e88 <__libc_csu_init+0x38>
  402e9e:	48 83 c4 08          	add    $0x8,%rsp
  402ea2:	5b                   	pop    %rbx
  402ea3:	5d                   	pop    %rbp
  402ea4:	41 5c                	pop    %r12
  402ea6:	41 5d                	pop    %r13
  402ea8:	41 5e                	pop    %r14
  402eaa:	41 5f                	pop    %r15
  402eac:	c3                   	ret    
  402ead:	0f 1f 00             	nopl   (%rax)

0000000000402eb0 <__libc_csu_fini>:
  402eb0:	c3                   	ret    

Disassembly of section .fini:

0000000000402eb4 <_fini>:
  402eb4:	48 83 ec 08          	sub    $0x8,%rsp
  402eb8:	48 83 c4 08          	add    $0x8,%rsp
  402ebc:	c3                   	ret    
