
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000401000 <_init>:
  401000:	48 83 ec 08          	sub    $0x8,%rsp
  401004:	48 8b 05 ed 4f 00 00 	mov    0x4fed(%rip),%rax        # 405ff8 <__gmon_start__>
  40100b:	48 85 c0             	test   %rax,%rax
  40100e:	74 02                	je     401012 <_init+0x12>
  401010:	ff d0                	call   *%rax
  401012:	48 83 c4 08          	add    $0x8,%rsp
  401016:	c3                   	ret    

Disassembly of section .plt:

0000000000401020 <.plt>:
  401020:	ff 35 e2 4f 00 00    	push   0x4fe2(%rip)        # 406008 <_GLOBAL_OFFSET_TABLE_+0x8>
  401026:	ff 25 e4 4f 00 00    	jmp    *0x4fe4(%rip)        # 406010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000401030 <strcasecmp@plt>:
  401030:	ff 25 e2 4f 00 00    	jmp    *0x4fe2(%rip)        # 406018 <strcasecmp@GLIBC_2.2.5>
  401036:	68 00 00 00 00       	push   $0x0
  40103b:	e9 e0 ff ff ff       	jmp    401020 <.plt>

0000000000401040 <__errno_location@plt>:
  401040:	ff 25 da 4f 00 00    	jmp    *0x4fda(%rip)        # 406020 <__errno_location@GLIBC_2.2.5>
  401046:	68 01 00 00 00       	push   $0x1
  40104b:	e9 d0 ff ff ff       	jmp    401020 <.plt>

0000000000401050 <srandom@plt>:
  401050:	ff 25 d2 4f 00 00    	jmp    *0x4fd2(%rip)        # 406028 <srandom@GLIBC_2.2.5>
  401056:	68 02 00 00 00       	push   $0x2
  40105b:	e9 c0 ff ff ff       	jmp    401020 <.plt>

0000000000401060 <strncmp@plt>:
  401060:	ff 25 ca 4f 00 00    	jmp    *0x4fca(%rip)        # 406030 <strncmp@GLIBC_2.2.5>
  401066:	68 03 00 00 00       	push   $0x3
  40106b:	e9 b0 ff ff ff       	jmp    401020 <.plt>

0000000000401070 <strcpy@plt>:
  401070:	ff 25 c2 4f 00 00    	jmp    *0x4fc2(%rip)        # 406038 <strcpy@GLIBC_2.2.5>
  401076:	68 04 00 00 00       	push   $0x4
  40107b:	e9 a0 ff ff ff       	jmp    401020 <.plt>

0000000000401080 <puts@plt>:
  401080:	ff 25 ba 4f 00 00    	jmp    *0x4fba(%rip)        # 406040 <puts@GLIBC_2.2.5>
  401086:	68 05 00 00 00       	push   $0x5
  40108b:	e9 90 ff ff ff       	jmp    401020 <.plt>

0000000000401090 <write@plt>:
  401090:	ff 25 b2 4f 00 00    	jmp    *0x4fb2(%rip)        # 406048 <write@GLIBC_2.2.5>
  401096:	68 06 00 00 00       	push   $0x6
  40109b:	e9 80 ff ff ff       	jmp    401020 <.plt>

00000000004010a0 <strlen@plt>:
  4010a0:	ff 25 aa 4f 00 00    	jmp    *0x4faa(%rip)        # 406050 <strlen@GLIBC_2.2.5>
  4010a6:	68 07 00 00 00       	push   $0x7
  4010ab:	e9 70 ff ff ff       	jmp    401020 <.plt>

00000000004010b0 <mmap@plt>:
  4010b0:	ff 25 a2 4f 00 00    	jmp    *0x4fa2(%rip)        # 406058 <mmap@GLIBC_2.2.5>
  4010b6:	68 08 00 00 00       	push   $0x8
  4010bb:	e9 60 ff ff ff       	jmp    401020 <.plt>

00000000004010c0 <printf@plt>:
  4010c0:	ff 25 9a 4f 00 00    	jmp    *0x4f9a(%rip)        # 406060 <printf@GLIBC_2.2.5>
  4010c6:	68 09 00 00 00       	push   $0x9
  4010cb:	e9 50 ff ff ff       	jmp    401020 <.plt>

00000000004010d0 <memset@plt>:
  4010d0:	ff 25 92 4f 00 00    	jmp    *0x4f92(%rip)        # 406068 <memset@GLIBC_2.2.5>
  4010d6:	68 0a 00 00 00       	push   $0xa
  4010db:	e9 40 ff ff ff       	jmp    401020 <.plt>

00000000004010e0 <alarm@plt>:
  4010e0:	ff 25 8a 4f 00 00    	jmp    *0x4f8a(%rip)        # 406070 <alarm@GLIBC_2.2.5>
  4010e6:	68 0b 00 00 00       	push   $0xb
  4010eb:	e9 30 ff ff ff       	jmp    401020 <.plt>

00000000004010f0 <close@plt>:
  4010f0:	ff 25 82 4f 00 00    	jmp    *0x4f82(%rip)        # 406078 <close@GLIBC_2.2.5>
  4010f6:	68 0c 00 00 00       	push   $0xc
  4010fb:	e9 20 ff ff ff       	jmp    401020 <.plt>

0000000000401100 <read@plt>:
  401100:	ff 25 7a 4f 00 00    	jmp    *0x4f7a(%rip)        # 406080 <read@GLIBC_2.2.5>
  401106:	68 0d 00 00 00       	push   $0xd
  40110b:	e9 10 ff ff ff       	jmp    401020 <.plt>

0000000000401110 <signal@plt>:
  401110:	ff 25 72 4f 00 00    	jmp    *0x4f72(%rip)        # 406088 <signal@GLIBC_2.2.5>
  401116:	68 0e 00 00 00       	push   $0xe
  40111b:	e9 00 ff ff ff       	jmp    401020 <.plt>

0000000000401120 <gethostbyname@plt>:
  401120:	ff 25 6a 4f 00 00    	jmp    *0x4f6a(%rip)        # 406090 <gethostbyname@GLIBC_2.2.5>
  401126:	68 0f 00 00 00       	push   $0xf
  40112b:	e9 f0 fe ff ff       	jmp    401020 <.plt>

0000000000401130 <fprintf@plt>:
  401130:	ff 25 62 4f 00 00    	jmp    *0x4f62(%rip)        # 406098 <fprintf@GLIBC_2.2.5>
  401136:	68 10 00 00 00       	push   $0x10
  40113b:	e9 e0 fe ff ff       	jmp    401020 <.plt>

0000000000401140 <strtol@plt>:
  401140:	ff 25 5a 4f 00 00    	jmp    *0x4f5a(%rip)        # 4060a0 <strtol@GLIBC_2.2.5>
  401146:	68 11 00 00 00       	push   $0x11
  40114b:	e9 d0 fe ff ff       	jmp    401020 <.plt>

0000000000401150 <memcpy@plt>:
  401150:	ff 25 52 4f 00 00    	jmp    *0x4f52(%rip)        # 4060a8 <memcpy@GLIBC_2.14>
  401156:	68 12 00 00 00       	push   $0x12
  40115b:	e9 c0 fe ff ff       	jmp    401020 <.plt>

0000000000401160 <time@plt>:
  401160:	ff 25 4a 4f 00 00    	jmp    *0x4f4a(%rip)        # 4060b0 <time@GLIBC_2.2.5>
  401166:	68 13 00 00 00       	push   $0x13
  40116b:	e9 b0 fe ff ff       	jmp    401020 <.plt>

0000000000401170 <random@plt>:
  401170:	ff 25 42 4f 00 00    	jmp    *0x4f42(%rip)        # 4060b8 <random@GLIBC_2.2.5>
  401176:	68 14 00 00 00       	push   $0x14
  40117b:	e9 a0 fe ff ff       	jmp    401020 <.plt>

0000000000401180 <__isoc99_sscanf@plt>:
  401180:	ff 25 3a 4f 00 00    	jmp    *0x4f3a(%rip)        # 4060c0 <__isoc99_sscanf@GLIBC_2.7>
  401186:	68 15 00 00 00       	push   $0x15
  40118b:	e9 90 fe ff ff       	jmp    401020 <.plt>

0000000000401190 <munmap@plt>:
  401190:	ff 25 32 4f 00 00    	jmp    *0x4f32(%rip)        # 4060c8 <munmap@GLIBC_2.2.5>
  401196:	68 16 00 00 00       	push   $0x16
  40119b:	e9 80 fe ff ff       	jmp    401020 <.plt>

00000000004011a0 <memmove@plt>:
  4011a0:	ff 25 2a 4f 00 00    	jmp    *0x4f2a(%rip)        # 4060d0 <memmove@GLIBC_2.2.5>
  4011a6:	68 17 00 00 00       	push   $0x17
  4011ab:	e9 70 fe ff ff       	jmp    401020 <.plt>

00000000004011b0 <fopen@plt>:
  4011b0:	ff 25 22 4f 00 00    	jmp    *0x4f22(%rip)        # 4060d8 <fopen@GLIBC_2.2.5>
  4011b6:	68 18 00 00 00       	push   $0x18
  4011bb:	e9 60 fe ff ff       	jmp    401020 <.plt>

00000000004011c0 <getopt@plt>:
  4011c0:	ff 25 1a 4f 00 00    	jmp    *0x4f1a(%rip)        # 4060e0 <getopt@GLIBC_2.2.5>
  4011c6:	68 19 00 00 00       	push   $0x19
  4011cb:	e9 50 fe ff ff       	jmp    401020 <.plt>

00000000004011d0 <strtoul@plt>:
  4011d0:	ff 25 12 4f 00 00    	jmp    *0x4f12(%rip)        # 4060e8 <strtoul@GLIBC_2.2.5>
  4011d6:	68 1a 00 00 00       	push   $0x1a
  4011db:	e9 40 fe ff ff       	jmp    401020 <.plt>

00000000004011e0 <gethostname@plt>:
  4011e0:	ff 25 0a 4f 00 00    	jmp    *0x4f0a(%rip)        # 4060f0 <gethostname@GLIBC_2.2.5>
  4011e6:	68 1b 00 00 00       	push   $0x1b
  4011eb:	e9 30 fe ff ff       	jmp    401020 <.plt>

00000000004011f0 <sprintf@plt>:
  4011f0:	ff 25 02 4f 00 00    	jmp    *0x4f02(%rip)        # 4060f8 <sprintf@GLIBC_2.2.5>
  4011f6:	68 1c 00 00 00       	push   $0x1c
  4011fb:	e9 20 fe ff ff       	jmp    401020 <.plt>

0000000000401200 <exit@plt>:
  401200:	ff 25 fa 4e 00 00    	jmp    *0x4efa(%rip)        # 406100 <exit@GLIBC_2.2.5>
  401206:	68 1d 00 00 00       	push   $0x1d
  40120b:	e9 10 fe ff ff       	jmp    401020 <.plt>

0000000000401210 <connect@plt>:
  401210:	ff 25 f2 4e 00 00    	jmp    *0x4ef2(%rip)        # 406108 <connect@GLIBC_2.2.5>
  401216:	68 1e 00 00 00       	push   $0x1e
  40121b:	e9 00 fe ff ff       	jmp    401020 <.plt>

0000000000401220 <getc@plt>:
  401220:	ff 25 ea 4e 00 00    	jmp    *0x4eea(%rip)        # 406110 <getc@GLIBC_2.2.5>
  401226:	68 1f 00 00 00       	push   $0x1f
  40122b:	e9 f0 fd ff ff       	jmp    401020 <.plt>

0000000000401230 <socket@plt>:
  401230:	ff 25 e2 4e 00 00    	jmp    *0x4ee2(%rip)        # 406118 <socket@GLIBC_2.2.5>
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
  40124f:	49 c7 c0 d0 2f 40 00 	mov    $0x402fd0,%r8
  401256:	48 c7 c1 70 2f 40 00 	mov    $0x402f70,%rcx
  40125d:	48 c7 c7 08 15 40 00 	mov    $0x401508,%rdi
  401264:	ff 15 86 4d 00 00    	call   *0x4d86(%rip)        # 405ff0 <__libc_start_main@GLIBC_2.2.5>
  40126a:	f4                   	hlt    
  40126b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401270 <_dl_relocate_static_pie>:
  401270:	c3                   	ret    
  401271:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  401278:	00 00 00 
  40127b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000401280 <deregister_tm_clones>:
  401280:	b8 90 64 40 00       	mov    $0x406490,%eax
  401285:	48 3d 90 64 40 00    	cmp    $0x406490,%rax
  40128b:	74 13                	je     4012a0 <deregister_tm_clones+0x20>
  40128d:	b8 00 00 00 00       	mov    $0x0,%eax
  401292:	48 85 c0             	test   %rax,%rax
  401295:	74 09                	je     4012a0 <deregister_tm_clones+0x20>
  401297:	bf 90 64 40 00       	mov    $0x406490,%edi
  40129c:	ff e0                	jmp    *%rax
  40129e:	66 90                	xchg   %ax,%ax
  4012a0:	c3                   	ret    
  4012a1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4012a8:	00 00 00 00 
  4012ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012b0 <register_tm_clones>:
  4012b0:	be 90 64 40 00       	mov    $0x406490,%esi
  4012b5:	48 81 ee 90 64 40 00 	sub    $0x406490,%rsi
  4012bc:	48 89 f0             	mov    %rsi,%rax
  4012bf:	48 c1 ee 3f          	shr    $0x3f,%rsi
  4012c3:	48 c1 f8 03          	sar    $0x3,%rax
  4012c7:	48 01 c6             	add    %rax,%rsi
  4012ca:	48 d1 fe             	sar    %rsi
  4012cd:	74 11                	je     4012e0 <register_tm_clones+0x30>
  4012cf:	b8 00 00 00 00       	mov    $0x0,%eax
  4012d4:	48 85 c0             	test   %rax,%rax
  4012d7:	74 07                	je     4012e0 <register_tm_clones+0x30>
  4012d9:	bf 90 64 40 00       	mov    $0x406490,%edi
  4012de:	ff e0                	jmp    *%rax
  4012e0:	c3                   	ret    
  4012e1:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  4012e8:	00 00 00 00 
  4012ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004012f0 <__do_global_dtors_aux>:
  4012f0:	80 3d f1 51 00 00 00 	cmpb   $0x0,0x51f1(%rip)        # 4064e8 <completed.0>
  4012f7:	75 17                	jne    401310 <__do_global_dtors_aux+0x20>
  4012f9:	55                   	push   %rbp
  4012fa:	48 89 e5             	mov    %rsp,%rbp
  4012fd:	e8 7e ff ff ff       	call   401280 <deregister_tm_clones>
  401302:	c6 05 df 51 00 00 01 	movb   $0x1,0x51df(%rip)        # 4064e8 <completed.0>
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
  401329:	83 3d 08 52 00 00 00 	cmpl   $0x0,0x5208(%rip)        # 406538 <is_checker>
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
  4013bf:	89 3d 63 51 00 00    	mov    %edi,0x5163(%rip)        # 406528 <check_level>
  4013c5:	8b 3d 65 4d 00 00    	mov    0x4d65(%rip),%edi        # 406130 <target_id>
  4013cb:	e8 79 1b 00 00       	call   402f49 <gencookie>
  4013d0:	89 c7                	mov    %eax,%edi
  4013d2:	89 05 5c 51 00 00    	mov    %eax,0x515c(%rip)        # 406534 <cookie>
  4013d8:	e8 6c 1b 00 00       	call   402f49 <gencookie>
  4013dd:	89 05 4d 51 00 00    	mov    %eax,0x514d(%rip)        # 406530 <authkey>
  4013e3:	8b 05 47 4d 00 00    	mov    0x4d47(%rip),%eax        # 406130 <target_id>
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
  401417:	48 89 05 6a 50 00 00 	mov    %rax,0x506a(%rip)        # 406488 <buf_offset>
  40141e:	c6 05 ff 50 00 00 72 	movb   $0x72,0x50ff(%rip)        # 406524 <target_prefix>
  401425:	83 3d f4 50 00 00 00 	cmpl   $0x0,0x50f4(%rip)        # 406520 <notify>
  40142c:	74 09                	je     401437 <initialize_target+0x83>
  40142e:	83 3d 03 51 00 00 00 	cmpl   $0x0,0x5103(%rip)        # 406538 <is_checker>
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
  401472:	48 8d 15 e7 4c 00 00 	lea    0x4ce7(%rip),%rdx        # 406160 <host_table>
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
  4014ba:	e8 e4 17 00 00       	call   402ca3 <init_driver>
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
  401515:	48 c7 c6 b5 20 40 00 	mov    $0x4020b5,%rsi
  40151c:	bf 0b 00 00 00       	mov    $0xb,%edi
  401521:	e8 ea fb ff ff       	call   401110 <signal@plt>
  401526:	48 c7 c6 61 20 40 00 	mov    $0x402061,%rsi
  40152d:	bf 07 00 00 00       	mov    $0x7,%edi
  401532:	e8 d9 fb ff ff       	call   401110 <signal@plt>
  401537:	48 c7 c6 09 21 40 00 	mov    $0x402109,%rsi
  40153e:	bf 04 00 00 00       	mov    $0x4,%edi
  401543:	e8 c8 fb ff ff       	call   401110 <signal@plt>
  401548:	83 3d e9 4f 00 00 00 	cmpl   $0x0,0x4fe9(%rip)        # 406538 <is_checker>
  40154f:	75 26                	jne    401577 <main+0x6f>
  401551:	4c 8d 25 d5 1c 00 00 	lea    0x1cd5(%rip),%r12        # 40322d <_IO_stdin_used+0x22d>
  401558:	48 8b 05 41 4f 00 00 	mov    0x4f41(%rip),%rax        # 4064a0 <stdin@GLIBC_2.2.5>
  40155f:	48 89 05 b2 4f 00 00 	mov    %rax,0x4fb2(%rip)        # 406518 <infile>
  401566:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  40156c:	41 be 00 00 00 00    	mov    $0x0,%r14d
  401572:	e9 88 00 00 00       	jmp    4015ff <main+0xf7>
  401577:	48 c7 c6 5d 21 40 00 	mov    $0x40215d,%rsi
  40157e:	bf 0e 00 00 00       	mov    $0xe,%edi
  401583:	e8 88 fb ff ff       	call   401110 <signal@plt>
  401588:	bf 05 00 00 00       	mov    $0x5,%edi
  40158d:	e8 4e fb ff ff       	call   4010e0 <alarm@plt>
  401592:	4c 8d 25 8c 1c 00 00 	lea    0x1c8c(%rip),%r12        # 403225 <_IO_stdin_used+0x225>
  401599:	eb bd                	jmp    401558 <main+0x50>
  40159b:	48 8b 3b             	mov    (%rbx),%rdi
  40159e:	e8 7f fd ff ff       	call   401322 <usage>
  4015a3:	48 8d 35 a8 1e 00 00 	lea    0x1ea8(%rip),%rsi        # 403452 <_IO_stdin_used+0x452>
  4015aa:	48 8b 3d 0f 4f 00 00 	mov    0x4f0f(%rip),%rdi        # 4064c0 <optarg@GLIBC_2.2.5>
  4015b1:	e8 fa fb ff ff       	call   4011b0 <fopen@plt>
  4015b6:	48 89 05 5b 4f 00 00 	mov    %rax,0x4f5b(%rip)        # 406518 <infile>
  4015bd:	48 85 c0             	test   %rax,%rax
  4015c0:	75 3d                	jne    4015ff <main+0xf7>
  4015c2:	48 8b 15 f7 4e 00 00 	mov    0x4ef7(%rip),%rdx        # 4064c0 <optarg@GLIBC_2.2.5>
  4015c9:	48 8d 35 62 1c 00 00 	lea    0x1c62(%rip),%rsi        # 403232 <_IO_stdin_used+0x232>
  4015d0:	48 8b 3d 09 4f 00 00 	mov    0x4f09(%rip),%rdi        # 4064e0 <stderr@GLIBC_2.2.5>
  4015d7:	e8 54 fb ff ff       	call   401130 <fprintf@plt>
  4015dc:	b8 01 00 00 00       	mov    $0x1,%eax
  4015e1:	e9 ce 00 00 00       	jmp    4016b4 <main+0x1ac>
  4015e6:	ba 10 00 00 00       	mov    $0x10,%edx
  4015eb:	be 00 00 00 00       	mov    $0x0,%esi
  4015f0:	48 8b 3d c9 4e 00 00 	mov    0x4ec9(%rip),%rdi        # 4064c0 <optarg@GLIBC_2.2.5>
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
  401637:	48 8b 3d 82 4e 00 00 	mov    0x4e82(%rip),%rdi        # 4064c0 <optarg@GLIBC_2.2.5>
  40163e:	e8 fd fa ff ff       	call   401140 <strtol@plt>
  401643:	41 89 c5             	mov    %eax,%r13d
  401646:	eb b7                	jmp    4015ff <main+0xf7>
  401648:	c7 05 ce 4e 00 00 00 	movl   $0x0,0x4ece(%rip)        # 406520 <notify>
  40164f:	00 00 00 
  401652:	eb ab                	jmp    4015ff <main+0xf7>
  401654:	48 8d 3d f4 1b 00 00 	lea    0x1bf4(%rip),%rdi        # 40324f <_IO_stdin_used+0x24f>
  40165b:	b8 00 00 00 00       	mov    $0x0,%eax
  401660:	e8 5b fa ff ff       	call   4010c0 <printf@plt>
  401665:	48 8b 3b             	mov    (%rbx),%rdi
  401668:	e8 b5 fc ff ff       	call   401322 <usage>
  40166d:	be 01 00 00 00       	mov    $0x1,%esi
  401672:	44 89 ef             	mov    %r13d,%edi
  401675:	e8 3a fd ff ff       	call   4013b4 <initialize_target>
  40167a:	83 3d b7 4e 00 00 00 	cmpl   $0x0,0x4eb7(%rip)        # 406538 <is_checker>
  401681:	74 09                	je     40168c <main+0x184>
  401683:	44 39 35 a6 4e 00 00 	cmp    %r14d,0x4ea6(%rip)        # 406530 <authkey>
  40168a:	75 31                	jne    4016bd <main+0x1b5>
  40168c:	8b 35 a2 4e 00 00    	mov    0x4ea2(%rip),%esi        # 406534 <cookie>
  401692:	48 8d 3d c9 1b 00 00 	lea    0x1bc9(%rip),%rdi        # 403262 <_IO_stdin_used+0x262>
  401699:	b8 00 00 00 00       	mov    $0x0,%eax
  40169e:	e8 1d fa ff ff       	call   4010c0 <printf@plt>
  4016a3:	48 8b 3d de 4d 00 00 	mov    0x4dde(%rip),%rdi        # 406488 <buf_offset>
  4016aa:	e8 00 0b 00 00       	call   4021af <launch>
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
  4016d6:	e8 73 07 00 00       	call   401e4e <check_fail>
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
  401b1e:	e8 5e 03 00 00       	call   401e81 <Gets>
  401b23:	b8 01 00 00 00       	mov    $0x1,%eax
  401b28:	48 83 c4 28          	add    $0x28,%rsp
  401b2c:	c3                   	ret    

0000000000401b2d <touch1>:
  401b2d:	48 83 ec 08          	sub    $0x8,%rsp
  401b31:	c7 05 f1 49 00 00 01 	movl   $0x1,0x49f1(%rip)        # 40652c <vlevel>
  401b38:	00 00 00 
  401b3b:	48 8d 3d b0 17 00 00 	lea    0x17b0(%rip),%rdi        # 4032f2 <_IO_stdin_used+0x2f2>
  401b42:	e8 39 f5 ff ff       	call   401080 <puts@plt>
  401b47:	bf 01 00 00 00       	mov    $0x1,%edi
  401b4c:	e8 2a 04 00 00       	call   401f7b <validate>
  401b51:	bf 00 00 00 00       	mov    $0x0,%edi
  401b56:	e8 a5 f6 ff ff       	call   401200 <exit@plt>

0000000000401b5b <touch2>:
  401b5b:	48 83 ec 08          	sub    $0x8,%rsp
  401b5f:	89 fe                	mov    %edi,%esi
  401b61:	c7 05 c1 49 00 00 02 	movl   $0x2,0x49c1(%rip)        # 40652c <vlevel>
  401b68:	00 00 00 
  401b6b:	39 3d c3 49 00 00    	cmp    %edi,0x49c3(%rip)        # 406534 <cookie>
  401b71:	74 25                	je     401b98 <touch2+0x3d>
  401b73:	48 8d 3d c6 17 00 00 	lea    0x17c6(%rip),%rdi        # 403340 <_IO_stdin_used+0x340>
  401b7a:	b8 00 00 00 00       	mov    $0x0,%eax
  401b7f:	e8 3c f5 ff ff       	call   4010c0 <printf@plt>
  401b84:	bf 02 00 00 00       	mov    $0x2,%edi
  401b89:	e8 ab 04 00 00       	call   402039 <fail>
  401b8e:	bf 00 00 00 00       	mov    $0x0,%edi
  401b93:	e8 68 f6 ff ff       	call   401200 <exit@plt>
  401b98:	48 8d 3d 79 17 00 00 	lea    0x1779(%rip),%rdi        # 403318 <_IO_stdin_used+0x318>
  401b9f:	b8 00 00 00 00       	mov    $0x0,%eax
  401ba4:	e8 17 f5 ff ff       	call   4010c0 <printf@plt>
  401ba9:	bf 02 00 00 00       	mov    $0x2,%edi
  401bae:	e8 c8 03 00 00       	call   401f7b <validate>
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
  401c36:	c7 05 ec 48 00 00 03 	movl   $0x3,0x48ec(%rip)        # 40652c <vlevel>
  401c3d:	00 00 00 
  401c40:	48 89 fe             	mov    %rdi,%rsi
  401c43:	8b 3d eb 48 00 00    	mov    0x48eb(%rip),%edi        # 406534 <cookie>
  401c49:	e8 67 ff ff ff       	call   401bb5 <hexmatch>
  401c4e:	85 c0                	test   %eax,%eax
  401c50:	74 28                	je     401c7a <touch3+0x48>
  401c52:	48 89 de             	mov    %rbx,%rsi
  401c55:	48 8d 3d 0c 17 00 00 	lea    0x170c(%rip),%rdi        # 403368 <_IO_stdin_used+0x368>
  401c5c:	b8 00 00 00 00       	mov    $0x0,%eax
  401c61:	e8 5a f4 ff ff       	call   4010c0 <printf@plt>
  401c66:	bf 03 00 00 00       	mov    $0x3,%edi
  401c6b:	e8 0b 03 00 00       	call   401f7b <validate>
  401c70:	bf 00 00 00 00       	mov    $0x0,%edi
  401c75:	e8 86 f5 ff ff       	call   401200 <exit@plt>
  401c7a:	48 89 de             	mov    %rbx,%rsi
  401c7d:	48 8d 3d 0c 17 00 00 	lea    0x170c(%rip),%rdi        # 403390 <_IO_stdin_used+0x390>
  401c84:	b8 00 00 00 00       	mov    $0x0,%eax
  401c89:	e8 32 f4 ff ff       	call   4010c0 <printf@plt>
  401c8e:	bf 03 00 00 00       	mov    $0x3,%edi
  401c93:	e8 a1 03 00 00       	call   402039 <fail>
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

0000000000401cc0 <start_farm>:
  401cc0:	b8 01 00 00 00       	mov    $0x1,%eax ; mov $0x1, %eax
  401cc5:	c3                   	ret    

0000000000401cc6 <addval_134>:
  401cc6:	8d 87 83 de 78 c3    	lea    -0x3c87217d(%rdi),%eax ; ???
  401ccc:	c3                   	ret    

0000000000401ccd <addval_321>:
  401ccd:	8d 87 58 90 90 c3    	lea    -0x3c6f6fa8(%rdi),%eax ; (+2) pop rax;
  401cd3:	c3                   	ret    

0000000000401cd4 <addval_396>:
  401cd4:	8d 87 f2 48 89 c7    	lea    -0x3876b70e(%rdi),%eax; (+3) mov rdi, rax;
  401cda:	c3                   	ret    

0000000000401cdb <getval_446>:
  401cdb:	b8 48 89 c7 c7       	mov    $0xc7c78948,%eax; bajt na końcu, useless
  401ce0:	c3                   	ret    

0000000000401ce1 <getval_230>:
  401ce1:	b8 24 48 89 c7       	mov    $0xc7894824,%eax ; (+2) mov rdi, rax
  401ce6:	c3                   	ret    

0000000000401ce7 <addval_392>:
  401ce7:	8d 87 48 09 c7 c3    	lea    -0x3c38f6b8(%rdi),%eax; (+2) or rdi, rax;
  401ced:	c3                   	ret    

0000000000401cee <getval_259>:
  401cee:	b8 f3 58 c3 d6       	mov    $0xd6c358f3,%eax; To nie zadziała jeżeli się cokolwiek skipnie
  401cf3:	c3                   	ret    

0000000000401cf4 <addval_476>:
  401cf4:	8d 87 d8 78 90 c3    	lea    -0x3c6f8728(%rdi),%eax; nop
  401cfa:	c3                   	ret    

0000000000401cfb <mid_farm>:
  401cfb:	b8 01 00 00 00       	mov    $0x1,%eax; mov eax, 1
  401d00:	c3                   	ret    

0000000000401d01 <add_xy>:
  401d01:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax; lea samo w sobie, doda rdi+rsi i wynik w rax
  401d05:	c3                   	ret    

0000000000401d06 <getval_151>:
  401d06:	b8 48 89 e0 c2       	mov    $0xc2e08948,%eax; useless bo bajt na końcu
  401d0b:	c3                   	ret    

0000000000401d0c <addval_377>:
  401d0c:	8d 87 c9 d1 08 c0    	lea    -0x3ff72e37(%rdi),%eax; ??? jakiś ror
  401d12:	c3                   	ret    

0000000000401d13 <setval_123>:
  401d13:	c7 07 a9 c2 84 db    	movl   $0xdb84c2a9,(%rdi); ??? useless
  401d19:	c3                   	ret    

0000000000401d1a <setval_166>:
  401d1a:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi); mov rax, rsp ! mega użyteczne rsp->rax
  401d20:	c3                   	ret    

0000000000401d21 <getval_353>:
  401d21:	b8 48 89 e0 94       	mov    $0x94e08948,%eax; efektywnie mov rax, rsp z zerowaniem 32 bitów
  401d26:	c3                   	ret    

0000000000401d27 <addval_233>:
  401d27:	8d 87 89 c2 84 d2    	lea    -0x2d7b3d77(%rdi),%eax; mov edx, eax ale ustawia flagi
  401d2d:	c3                   	ret    

0000000000401d2e <getval_209>:
  401d2e:	b8 89 d1 28 c0       	mov    $0xc028d189,%eax; mov ecx, edx ale ustawia flagi
  401d33:	c3                   	ret    

0000000000401d34 <getval_131>:
  401d34:	b8 18 88 c2 90       	mov    $0x90c28818,%eax; (+2) mov dl, al;
  401d39:	c3                   	ret    

0000000000401d3a <addval_283>:
  401d3a:	8d 87 48 09 e0 c3    	lea    -0x3c1ff6b8(%rdi),%eax; (+2) or rax, rsp;
  401d40:	c3                   	ret    

0000000000401d41 <addval_154>:
  401d41:	8d 87 99 d1 90 c3    	lea    -0x3c6f2e67(%rdi),%eax; ??? syf
  401d47:	c3                   	ret    

0000000000401d48 <setval_156>:
  401d48:	c7 07 89 d1 48 d2    	movl   $0xd248d189,(%rdi); ??? coś dziwnego
  401d4e:	c3                   	ret    

0000000000401d4f <setval_395>:
  401d4f:	c7 07 89 c2 28 c0    	movl   $0xc028c289,(%rdi); mov edx, eax; sub al, al;
  401d55:	c3                   	ret    

0000000000401d56 <getval_335>:
  401d56:	b8 89 ce 08 db       	mov    $0xdb08ce89,%eax; (+1) mov esi, ecx; or bl, bl;
  401d5b:	c3                   	ret    

0000000000401d5c <setval_410>:
  401d5c:	c7 07 89 ce 18 db    	movl   $0xdb18ce89,(%rdi); mov esi, ecx; sbb bl, bl;
  401d62:	c3                   	ret    

0000000000401d63 <getval_299>:
  401d63:	b8 89 ce c2 06       	mov    $0x6c2ce89,%eax; ??? bad
  401d68:	c3                   	ret    

0000000000401d69 <getval_112>:
  401d69:	b8 89 ce 60 d2       	mov    $0xd260ce89,%eax; ??? bad
  401d6e:	c3                   	ret    

0000000000401d6f <getval_189>:
  401d6f:	b8 cf 89 d1 90       	mov    $0x90d189cf,%eax; mov ecx, edx; nop
  401d74:	c3                   	ret    

0000000000401d75 <addval_263>:
  401d75:	8d 87 89 c2 92 90    	lea    -0x6f6d3d77(%rdi),%eax; swap na końcu
  401d7b:	c3                   	ret    

0000000000401d7c <setval_212>:
  401d7c:	c7 07 89 d1 c3 9d    	movl   $0x9dc3d189,(%rdi); jakiś popf na końcu
  401d82:	c3                   	ret    

0000000000401d83 <getval_152>:
  401d83:	b8 89 c2 18 c0       	mov    $0xc018c289,%eax; raczej średnie
  401d88:	c3                   	ret    

0000000000401d89 <getval_129>:
  401d89:	b8 88 ce 20 db       	mov    $0xdb20ce88,%eax; też
  401d8e:	c3                   	ret    

0000000000401d8f <addval_128>:
  401d8f:	8d 87 ae 48 09 e0    	lea    -0x1ff6b752(%rdi),%eax; ?? wtf
  401d95:	c3                   	ret    

0000000000401d96 <getval_140>:
  401d96:	b8 c9 d1 20 c0       	mov    $0xc020d1c9,%eax; syf
  401d9b:	c3                   	ret    

0000000000401d9c <setval_235>:
  401d9c:	c7 07 48 89 e0 90    	movl   $0x90e08948,(%rdi); mov rax, rsp; nop !
  401da2:	c3                   	ret    

0000000000401da3 <setval_359>:
  401da3:	c7 07 89 d1 78 c9    	movl   $0xc978d189,(%rdi); syf na końcu
  401da9:	c3                   	ret    

0000000000401daa <addval_342>:
  401daa:	8d 87 88 ce 38 d2    	lea    -0x2dc73178(%rdi),%eax; średnie
  401db0:	c3                   	ret    

0000000000401db1 <getval_332>:
  401db1:	b8 89 ce 84 db       	mov    $0xdb84ce89,%eax; ustawia flagi
  401db6:	c3                   	ret    

0000000000401db7 <setval_199>:
  401db7:	c7 07 88 ce 84 d2    	movl   $0xd284ce88,(%rdi); średnie
  401dbd:	c3                   	ret    

0000000000401dbe <addval_187>:
  401dbe:	8d 87 49 89 e0 c3    	lea    -0x3c1f76b7(%rdi),%eax; mov r8, rsp; !
  401dc4:	c3                   	ret    

0000000000401dc5 <getval_200>:
  401dc5:	b8 89 c2 28 db       	mov    $0xdb28c289,%eax; mov edx, eax; sub bl;
  401dca:	c3                   	ret    

0000000000401dcb <addval_107>:
  401dcb:	8d 87 08 89 e0 90    	lea    -0x6f1f76f8(%rdi),%eax; mov eax, esp; nop
  401dd1:	c3                   	ret    

0000000000401dd2 <setval_148>:
  401dd2:	c7 07 89 c2 08 d2    	movl   $0xd208c289,(%rdi); mov edx, eax;
  401dd8:	c3                   	ret    

0000000000401dd9 <end_farm>:
  401dd9:	b8 01 00 00 00       	mov    $0x1,%eax
  401dde:	c3                   	ret    

0000000000401ddf <save_char>:
  401ddf:	8b 05 5f 53 00 00    	mov    0x535f(%rip),%eax        # 407144 <gets_cnt>
  401de5:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401dea:	7f 4a                	jg     401e36 <save_char+0x57>
  401dec:	89 f9                	mov    %edi,%ecx
  401dee:	c0 e9 04             	shr    $0x4,%cl
  401df1:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401df4:	4c 8d 05 35 18 00 00 	lea    0x1835(%rip),%r8        # 403630 <trans_char>
  401dfb:	83 e1 0f             	and    $0xf,%ecx
  401dfe:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  401e03:	48 8d 0d 36 47 00 00 	lea    0x4736(%rip),%rcx        # 406540 <gets_buf>
  401e0a:	48 63 f2             	movslq %edx,%rsi
  401e0d:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  401e11:	8d 72 01             	lea    0x1(%rdx),%esi
  401e14:	83 e7 0f             	and    $0xf,%edi
  401e17:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  401e1c:	48 63 f6             	movslq %esi,%rsi
  401e1f:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  401e23:	83 c2 02             	add    $0x2,%edx
  401e26:	48 63 d2             	movslq %edx,%rdx
  401e29:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  401e2d:	83 c0 01             	add    $0x1,%eax
  401e30:	89 05 0e 53 00 00    	mov    %eax,0x530e(%rip)        # 407144 <gets_cnt>
  401e36:	c3                   	ret    

0000000000401e37 <save_term>:
  401e37:	8b 05 07 53 00 00    	mov    0x5307(%rip),%eax        # 407144 <gets_cnt>
  401e3d:	8d 04 40             	lea    (%rax,%rax,2),%eax
  401e40:	48 98                	cltq   
  401e42:	48 8d 15 f7 46 00 00 	lea    0x46f7(%rip),%rdx        # 406540 <gets_buf>
  401e49:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  401e4d:	c3                   	ret    

0000000000401e4e <check_fail>:
  401e4e:	48 83 ec 08          	sub    $0x8,%rsp
  401e52:	0f be 35 cb 46 00 00 	movsbl 0x46cb(%rip),%esi        # 406524 <target_prefix>
  401e59:	48 8d 0d e0 46 00 00 	lea    0x46e0(%rip),%rcx        # 406540 <gets_buf>
  401e60:	8b 15 c2 46 00 00    	mov    0x46c2(%rip),%edx        # 406528 <check_level>
  401e66:	48 8d 3d 6e 15 00 00 	lea    0x156e(%rip),%rdi        # 4033db <_IO_stdin_used+0x3db>
  401e6d:	b8 00 00 00 00       	mov    $0x0,%eax
  401e72:	e8 49 f2 ff ff       	call   4010c0 <printf@plt>
  401e77:	bf 01 00 00 00       	mov    $0x1,%edi
  401e7c:	e8 7f f3 ff ff       	call   401200 <exit@plt>

0000000000401e81 <Gets>:
  401e81:	41 54                	push   %r12
  401e83:	55                   	push   %rbp
  401e84:	53                   	push   %rbx
  401e85:	49 89 fc             	mov    %rdi,%r12
  401e88:	c7 05 b2 52 00 00 00 	movl   $0x0,0x52b2(%rip)        # 407144 <gets_cnt>
  401e8f:	00 00 00 
  401e92:	48 89 fb             	mov    %rdi,%rbx
  401e95:	eb 11                	jmp    401ea8 <Gets+0x27>
  401e97:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401e9b:	88 03                	mov    %al,(%rbx)
  401e9d:	0f b6 f8             	movzbl %al,%edi
  401ea0:	e8 3a ff ff ff       	call   401ddf <save_char>
  401ea5:	48 89 eb             	mov    %rbp,%rbx
  401ea8:	48 8b 3d 69 46 00 00 	mov    0x4669(%rip),%rdi        # 406518 <infile>
  401eaf:	e8 6c f3 ff ff       	call   401220 <getc@plt>
  401eb4:	83 f8 ff             	cmp    $0xffffffff,%eax
  401eb7:	74 05                	je     401ebe <Gets+0x3d>
  401eb9:	83 f8 0a             	cmp    $0xa,%eax
  401ebc:	75 d9                	jne    401e97 <Gets+0x16>
  401ebe:	c6 03 00             	movb   $0x0,(%rbx)
  401ec1:	b8 00 00 00 00       	mov    $0x0,%eax
  401ec6:	e8 6c ff ff ff       	call   401e37 <save_term>
  401ecb:	4c 89 e0             	mov    %r12,%rax
  401ece:	5b                   	pop    %rbx
  401ecf:	5d                   	pop    %rbp
  401ed0:	41 5c                	pop    %r12
  401ed2:	c3                   	ret    

0000000000401ed3 <notify_server>:
  401ed3:	83 3d 5e 46 00 00 00 	cmpl   $0x0,0x465e(%rip)        # 406538 <is_checker>
  401eda:	0f 85 9a 00 00 00    	jne    401f7a <notify_server+0xa7>
  401ee0:	53                   	push   %rbx
  401ee1:	48 81 ec 00 20 00 00 	sub    $0x2000,%rsp
  401ee8:	81 3d 52 52 00 00 9c 	cmpl   $0x1f9c,0x5252(%rip)        # 407144 <gets_cnt>
  401eef:	1f 00 00 
  401ef2:	7f 5a                	jg     401f4e <notify_server+0x7b>
  401ef4:	44 0f be 0d 28 46 00 	movsbl 0x4628(%rip),%r9d        # 406524 <target_prefix>
  401efb:	00 
  401efc:	83 3d 1d 46 00 00 00 	cmpl   $0x0,0x461d(%rip)        # 406520 <notify>
  401f03:	74 64                	je     401f69 <notify_server+0x96>
  401f05:	44 8b 05 24 46 00 00 	mov    0x4624(%rip),%r8d        # 406530 <authkey>
  401f0c:	85 ff                	test   %edi,%edi
  401f0e:	74 61                	je     401f71 <notify_server+0x9e>
  401f10:	48 8d 1d df 14 00 00 	lea    0x14df(%rip),%rbx        # 4033f6 <_IO_stdin_used+0x3f6>
  401f17:	48 89 e7             	mov    %rsp,%rdi
  401f1a:	48 8d 05 1f 46 00 00 	lea    0x461f(%rip),%rax        # 406540 <gets_buf>
  401f21:	50                   	push   %rax
  401f22:	56                   	push   %rsi
  401f23:	48 89 d9             	mov    %rbx,%rcx
  401f26:	8b 15 04 42 00 00    	mov    0x4204(%rip),%edx        # 406130 <target_id>
  401f2c:	48 8d 35 c8 14 00 00 	lea    0x14c8(%rip),%rsi        # 4033fb <_IO_stdin_used+0x3fb>
  401f33:	b8 00 00 00 00       	mov    $0x0,%eax
  401f38:	e8 b3 f2 ff ff       	call   4011f0 <sprintf@plt>
  401f3d:	48 89 df             	mov    %rbx,%rdi
  401f40:	e8 3b f1 ff ff       	call   401080 <puts@plt>
  401f45:	48 81 c4 10 20 00 00 	add    $0x2010,%rsp
  401f4c:	5b                   	pop    %rbx
  401f4d:	c3                   	ret    
  401f4e:	48 8d 3d 6b 15 00 00 	lea    0x156b(%rip),%rdi        # 4034c0 <_IO_stdin_used+0x4c0>
  401f55:	b8 00 00 00 00       	mov    $0x0,%eax
  401f5a:	e8 61 f1 ff ff       	call   4010c0 <printf@plt>
  401f5f:	bf 01 00 00 00       	mov    $0x1,%edi
  401f64:	e8 97 f2 ff ff       	call   401200 <exit@plt>
  401f69:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401f6f:	eb 9b                	jmp    401f0c <notify_server+0x39>
  401f71:	48 8d 1d 79 14 00 00 	lea    0x1479(%rip),%rbx        # 4033f1 <_IO_stdin_used+0x3f1>
  401f78:	eb 9d                	jmp    401f17 <notify_server+0x44>
  401f7a:	c3                   	ret    

0000000000401f7b <validate>:
  401f7b:	53                   	push   %rbx
  401f7c:	89 fb                	mov    %edi,%ebx
  401f7e:	83 3d b3 45 00 00 00 	cmpl   $0x0,0x45b3(%rip)        # 406538 <is_checker>
  401f85:	74 68                	je     401fef <validate+0x74>
  401f87:	39 3d 9f 45 00 00    	cmp    %edi,0x459f(%rip)        # 40652c <vlevel>
  401f8d:	75 2d                	jne    401fbc <validate+0x41>
  401f8f:	8b 35 93 45 00 00    	mov    0x4593(%rip),%esi        # 406528 <check_level>
  401f95:	39 fe                	cmp    %edi,%esi
  401f97:	75 39                	jne    401fd2 <validate+0x57>
  401f99:	0f be 35 84 45 00 00 	movsbl 0x4584(%rip),%esi        # 406524 <target_prefix>
  401fa0:	48 8d 0d 99 45 00 00 	lea    0x4599(%rip),%rcx        # 406540 <gets_buf>
  401fa7:	89 fa                	mov    %edi,%edx
  401fa9:	48 8d 3d 85 14 00 00 	lea    0x1485(%rip),%rdi        # 403435 <_IO_stdin_used+0x435>
  401fb0:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb5:	e8 06 f1 ff ff       	call   4010c0 <printf@plt>
  401fba:	5b                   	pop    %rbx
  401fbb:	c3                   	ret    
  401fbc:	48 8d 3d 54 14 00 00 	lea    0x1454(%rip),%rdi        # 403417 <_IO_stdin_used+0x417>
  401fc3:	e8 b8 f0 ff ff       	call   401080 <puts@plt>
  401fc8:	b8 00 00 00 00       	mov    $0x0,%eax
  401fcd:	e8 7c fe ff ff       	call   401e4e <check_fail>
  401fd2:	89 fa                	mov    %edi,%edx
  401fd4:	48 8d 3d 15 15 00 00 	lea    0x1515(%rip),%rdi        # 4034f0 <_IO_stdin_used+0x4f0>
  401fdb:	b8 00 00 00 00       	mov    $0x0,%eax
  401fe0:	e8 db f0 ff ff       	call   4010c0 <printf@plt>
  401fe5:	b8 00 00 00 00       	mov    $0x0,%eax
  401fea:	e8 5f fe ff ff       	call   401e4e <check_fail>
  401fef:	39 3d 37 45 00 00    	cmp    %edi,0x4537(%rip)        # 40652c <vlevel>
  401ff5:	74 1a                	je     402011 <validate+0x96>
  401ff7:	48 8d 3d 19 14 00 00 	lea    0x1419(%rip),%rdi        # 403417 <_IO_stdin_used+0x417>
  401ffe:	e8 7d f0 ff ff       	call   401080 <puts@plt>
  402003:	89 de                	mov    %ebx,%esi
  402005:	bf 00 00 00 00       	mov    $0x0,%edi
  40200a:	e8 c4 fe ff ff       	call   401ed3 <notify_server>
  40200f:	eb a9                	jmp    401fba <validate+0x3f>
  402011:	0f be 15 0c 45 00 00 	movsbl 0x450c(%rip),%edx        # 406524 <target_prefix>
  402018:	89 fe                	mov    %edi,%esi
  40201a:	48 8d 3d f7 14 00 00 	lea    0x14f7(%rip),%rdi        # 403518 <_IO_stdin_used+0x518>
  402021:	b8 00 00 00 00       	mov    $0x0,%eax
  402026:	e8 95 f0 ff ff       	call   4010c0 <printf@plt>
  40202b:	89 de                	mov    %ebx,%esi
  40202d:	bf 01 00 00 00       	mov    $0x1,%edi
  402032:	e8 9c fe ff ff       	call   401ed3 <notify_server>
  402037:	eb 81                	jmp    401fba <validate+0x3f>

0000000000402039 <fail>:
  402039:	48 83 ec 08          	sub    $0x8,%rsp
  40203d:	83 3d f4 44 00 00 00 	cmpl   $0x0,0x44f4(%rip)        # 406538 <is_checker>
  402044:	75 11                	jne    402057 <fail+0x1e>
  402046:	89 fe                	mov    %edi,%esi
  402048:	bf 00 00 00 00       	mov    $0x0,%edi
  40204d:	e8 81 fe ff ff       	call   401ed3 <notify_server>
  402052:	48 83 c4 08          	add    $0x8,%rsp
  402056:	c3                   	ret    
  402057:	b8 00 00 00 00       	mov    $0x0,%eax
  40205c:	e8 ed fd ff ff       	call   401e4e <check_fail>

0000000000402061 <bushandler>:
  402061:	48 83 ec 08          	sub    $0x8,%rsp
  402065:	83 3d cc 44 00 00 00 	cmpl   $0x0,0x44cc(%rip)        # 406538 <is_checker>
  40206c:	74 16                	je     402084 <bushandler+0x23>
  40206e:	48 8d 3d d5 13 00 00 	lea    0x13d5(%rip),%rdi        # 40344a <_IO_stdin_used+0x44a>
  402075:	e8 06 f0 ff ff       	call   401080 <puts@plt>
  40207a:	b8 00 00 00 00       	mov    $0x0,%eax
  40207f:	e8 ca fd ff ff       	call   401e4e <check_fail>
  402084:	48 8d 3d c5 14 00 00 	lea    0x14c5(%rip),%rdi        # 403550 <_IO_stdin_used+0x550>
  40208b:	e8 f0 ef ff ff       	call   401080 <puts@plt>
  402090:	48 8d 3d bd 13 00 00 	lea    0x13bd(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  402097:	e8 e4 ef ff ff       	call   401080 <puts@plt>
  40209c:	be 00 00 00 00       	mov    $0x0,%esi
  4020a1:	bf 00 00 00 00       	mov    $0x0,%edi
  4020a6:	e8 28 fe ff ff       	call   401ed3 <notify_server>
  4020ab:	bf 01 00 00 00       	mov    $0x1,%edi
  4020b0:	e8 4b f1 ff ff       	call   401200 <exit@plt>

00000000004020b5 <seghandler>:
  4020b5:	48 83 ec 08          	sub    $0x8,%rsp
  4020b9:	83 3d 78 44 00 00 00 	cmpl   $0x0,0x4478(%rip)        # 406538 <is_checker>
  4020c0:	74 16                	je     4020d8 <seghandler+0x23>
  4020c2:	48 8d 3d a1 13 00 00 	lea    0x13a1(%rip),%rdi        # 40346a <_IO_stdin_used+0x46a>
  4020c9:	e8 b2 ef ff ff       	call   401080 <puts@plt>
  4020ce:	b8 00 00 00 00       	mov    $0x0,%eax
  4020d3:	e8 76 fd ff ff       	call   401e4e <check_fail>
  4020d8:	48 8d 3d 91 14 00 00 	lea    0x1491(%rip),%rdi        # 403570 <_IO_stdin_used+0x570>
  4020df:	e8 9c ef ff ff       	call   401080 <puts@plt>
  4020e4:	48 8d 3d 69 13 00 00 	lea    0x1369(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  4020eb:	e8 90 ef ff ff       	call   401080 <puts@plt>
  4020f0:	be 00 00 00 00       	mov    $0x0,%esi
  4020f5:	bf 00 00 00 00       	mov    $0x0,%edi
  4020fa:	e8 d4 fd ff ff       	call   401ed3 <notify_server>
  4020ff:	bf 01 00 00 00       	mov    $0x1,%edi
  402104:	e8 f7 f0 ff ff       	call   401200 <exit@plt>

0000000000402109 <illegalhandler>:
  402109:	48 83 ec 08          	sub    $0x8,%rsp
  40210d:	83 3d 24 44 00 00 00 	cmpl   $0x0,0x4424(%rip)        # 406538 <is_checker>
  402114:	74 16                	je     40212c <illegalhandler+0x23>
  402116:	48 8d 3d 60 13 00 00 	lea    0x1360(%rip),%rdi        # 40347d <_IO_stdin_used+0x47d>
  40211d:	e8 5e ef ff ff       	call   401080 <puts@plt>
  402122:	b8 00 00 00 00       	mov    $0x0,%eax
  402127:	e8 22 fd ff ff       	call   401e4e <check_fail>
  40212c:	48 8d 3d 65 14 00 00 	lea    0x1465(%rip),%rdi        # 403598 <_IO_stdin_used+0x598>
  402133:	e8 48 ef ff ff       	call   401080 <puts@plt>
  402138:	48 8d 3d 15 13 00 00 	lea    0x1315(%rip),%rdi        # 403454 <_IO_stdin_used+0x454>
  40213f:	e8 3c ef ff ff       	call   401080 <puts@plt>
  402144:	be 00 00 00 00       	mov    $0x0,%esi
  402149:	bf 00 00 00 00       	mov    $0x0,%edi
  40214e:	e8 80 fd ff ff       	call   401ed3 <notify_server>
  402153:	bf 01 00 00 00       	mov    $0x1,%edi
  402158:	e8 a3 f0 ff ff       	call   401200 <exit@plt>

000000000040215d <sigalrmhandler>:
  40215d:	48 83 ec 08          	sub    $0x8,%rsp
  402161:	83 3d d0 43 00 00 00 	cmpl   $0x0,0x43d0(%rip)        # 406538 <is_checker>
  402168:	74 16                	je     402180 <sigalrmhandler+0x23>
  40216a:	48 8d 3d 20 13 00 00 	lea    0x1320(%rip),%rdi        # 403491 <_IO_stdin_used+0x491>
  402171:	e8 0a ef ff ff       	call   401080 <puts@plt>
  402176:	b8 00 00 00 00       	mov    $0x0,%eax
  40217b:	e8 ce fc ff ff       	call   401e4e <check_fail>
  402180:	be 05 00 00 00       	mov    $0x5,%esi
  402185:	48 8d 3d 3c 14 00 00 	lea    0x143c(%rip),%rdi        # 4035c8 <_IO_stdin_used+0x5c8>
  40218c:	b8 00 00 00 00       	mov    $0x0,%eax
  402191:	e8 2a ef ff ff       	call   4010c0 <printf@plt>
  402196:	be 00 00 00 00       	mov    $0x0,%esi
  40219b:	bf 00 00 00 00       	mov    $0x0,%edi
  4021a0:	e8 2e fd ff ff       	call   401ed3 <notify_server>
  4021a5:	bf 01 00 00 00       	mov    $0x1,%edi
  4021aa:	e8 51 f0 ff ff       	call   401200 <exit@plt>

00000000004021af <launch>:
  4021af:	55                   	push   %rbp
  4021b0:	48 89 e5             	mov    %rsp,%rbp
  4021b3:	48 89 fa             	mov    %rdi,%rdx
  4021b6:	48 8d 47 17          	lea    0x17(%rdi),%rax
  4021ba:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  4021be:	48 29 c4             	sub    %rax,%rsp
  4021c1:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  4021c6:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  4021ca:	be f4 00 00 00       	mov    $0xf4,%esi
  4021cf:	e8 fc ee ff ff       	call   4010d0 <memset@plt>
  4021d4:	48 8b 05 c5 42 00 00 	mov    0x42c5(%rip),%rax        # 4064a0 <stdin@GLIBC_2.2.5>
  4021db:	48 39 05 36 43 00 00 	cmp    %rax,0x4336(%rip)        # 406518 <infile>
  4021e2:	74 2b                	je     40220f <launch+0x60>
  4021e4:	c7 05 3e 43 00 00 00 	movl   $0x0,0x433e(%rip)        # 40652c <vlevel>
  4021eb:	00 00 00 
  4021ee:	b8 00 00 00 00       	mov    $0x0,%eax
  4021f3:	e8 a2 fa ff ff       	call   401c9a <test>
  4021f8:	83 3d 39 43 00 00 00 	cmpl   $0x0,0x4339(%rip)        # 406538 <is_checker>
  4021ff:	75 21                	jne    402222 <launch+0x73>
  402201:	48 8d 3d a9 12 00 00 	lea    0x12a9(%rip),%rdi        # 4034b1 <_IO_stdin_used+0x4b1>
  402208:	e8 73 ee ff ff       	call   401080 <puts@plt>
  40220d:	c9                   	leave  
  40220e:	c3                   	ret    
  40220f:	48 8d 3d 83 12 00 00 	lea    0x1283(%rip),%rdi        # 403499 <_IO_stdin_used+0x499>
  402216:	b8 00 00 00 00       	mov    $0x0,%eax
  40221b:	e8 a0 ee ff ff       	call   4010c0 <printf@plt>
  402220:	eb c2                	jmp    4021e4 <launch+0x35>
  402222:	48 8d 3d 7d 12 00 00 	lea    0x127d(%rip),%rdi        # 4034a6 <_IO_stdin_used+0x4a6>
  402229:	e8 52 ee ff ff       	call   401080 <puts@plt>
  40222e:	b8 00 00 00 00       	mov    $0x0,%eax
  402233:	e8 16 fc ff ff       	call   401e4e <check_fail>

0000000000402238 <stable_launch>:
  402238:	53                   	push   %rbx
  402239:	48 89 3d d0 42 00 00 	mov    %rdi,0x42d0(%rip)        # 406510 <global_offset>
  402240:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  402246:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  40224c:	b9 32 01 00 00       	mov    $0x132,%ecx
  402251:	ba 07 00 00 00       	mov    $0x7,%edx
  402256:	be 00 00 10 00       	mov    $0x100000,%esi
  40225b:	bf 00 60 58 55       	mov    $0x55586000,%edi
  402260:	e8 4b ee ff ff       	call   4010b0 <mmap@plt>
  402265:	48 89 c3             	mov    %rax,%rbx
  402268:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  40226e:	75 43                	jne    4022b3 <stable_launch+0x7b>
  402270:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  402277:	48 89 15 8a 42 00 00 	mov    %rdx,0x428a(%rip)        # 406508 <stack_top>
  40227e:	48 89 e0             	mov    %rsp,%rax
  402281:	48 89 d4             	mov    %rdx,%rsp
  402284:	48 89 c2             	mov    %rax,%rdx
  402287:	48 89 15 72 42 00 00 	mov    %rdx,0x4272(%rip)        # 406500 <global_save_stack>
  40228e:	48 8b 3d 7b 42 00 00 	mov    0x427b(%rip),%rdi        # 406510 <global_offset>
  402295:	e8 15 ff ff ff       	call   4021af <launch>
  40229a:	48 8b 05 5f 42 00 00 	mov    0x425f(%rip),%rax        # 406500 <global_save_stack>
  4022a1:	48 89 c4             	mov    %rax,%rsp
  4022a4:	be 00 00 10 00       	mov    $0x100000,%esi
  4022a9:	48 89 df             	mov    %rbx,%rdi
  4022ac:	e8 df ee ff ff       	call   401190 <munmap@plt>
  4022b1:	5b                   	pop    %rbx
  4022b2:	c3                   	ret    
  4022b3:	be 00 00 10 00       	mov    $0x100000,%esi
  4022b8:	48 89 c7             	mov    %rax,%rdi
  4022bb:	e8 d0 ee ff ff       	call   401190 <munmap@plt>
  4022c0:	ba 00 60 58 55       	mov    $0x55586000,%edx
  4022c5:	48 8d 35 34 13 00 00 	lea    0x1334(%rip),%rsi        # 403600 <_IO_stdin_used+0x600>
  4022cc:	48 8b 3d 0d 42 00 00 	mov    0x420d(%rip),%rdi        # 4064e0 <stderr@GLIBC_2.2.5>
  4022d3:	b8 00 00 00 00       	mov    $0x0,%eax
  4022d8:	e8 53 ee ff ff       	call   401130 <fprintf@plt>
  4022dd:	bf 01 00 00 00       	mov    $0x1,%edi
  4022e2:	e8 19 ef ff ff       	call   401200 <exit@plt>

00000000004022e7 <rio_readinitb>:
  4022e7:	89 37                	mov    %esi,(%rdi)
  4022e9:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  4022f0:	48 8d 47 10          	lea    0x10(%rdi),%rax
  4022f4:	48 89 47 08          	mov    %rax,0x8(%rdi)
  4022f8:	c3                   	ret    

00000000004022f9 <sigalrm_handler>:
  4022f9:	48 83 ec 08          	sub    $0x8,%rsp
  4022fd:	ba 00 00 00 00       	mov    $0x0,%edx
  402302:	48 8d 35 37 13 00 00 	lea    0x1337(%rip),%rsi        # 403640 <trans_char+0x10>
  402309:	48 8b 3d d0 41 00 00 	mov    0x41d0(%rip),%rdi        # 4064e0 <stderr@GLIBC_2.2.5>
  402310:	b8 00 00 00 00       	mov    $0x0,%eax
  402315:	e8 16 ee ff ff       	call   401130 <fprintf@plt>
  40231a:	bf 01 00 00 00       	mov    $0x1,%edi
  40231f:	e8 dc ee ff ff       	call   401200 <exit@plt>

0000000000402324 <urlencode>:
  402324:	41 54                	push   %r12
  402326:	55                   	push   %rbp
  402327:	53                   	push   %rbx
  402328:	48 83 ec 10          	sub    $0x10,%rsp
  40232c:	48 89 fb             	mov    %rdi,%rbx
  40232f:	48 89 f5             	mov    %rsi,%rbp
  402332:	e8 69 ed ff ff       	call   4010a0 <strlen@plt>
  402337:	eb 0e                	jmp    402347 <urlencode+0x23>
  402339:	88 55 00             	mov    %dl,0x0(%rbp)
  40233c:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402340:	48 83 c3 01          	add    $0x1,%rbx
  402344:	44 89 e0             	mov    %r12d,%eax
  402347:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  40234b:	85 c0                	test   %eax,%eax
  40234d:	0f 84 95 00 00 00    	je     4023e8 <urlencode+0xc4>
  402353:	0f b6 13             	movzbl (%rbx),%edx
  402356:	80 fa 2a             	cmp    $0x2a,%dl
  402359:	0f 94 c1             	sete   %cl
  40235c:	80 fa 2d             	cmp    $0x2d,%dl
  40235f:	0f 94 c0             	sete   %al
  402362:	08 c1                	or     %al,%cl
  402364:	75 d3                	jne    402339 <urlencode+0x15>
  402366:	80 fa 2e             	cmp    $0x2e,%dl
  402369:	74 ce                	je     402339 <urlencode+0x15>
  40236b:	80 fa 5f             	cmp    $0x5f,%dl
  40236e:	74 c9                	je     402339 <urlencode+0x15>
  402370:	8d 42 d0             	lea    -0x30(%rdx),%eax
  402373:	3c 09                	cmp    $0x9,%al
  402375:	76 c2                	jbe    402339 <urlencode+0x15>
  402377:	8d 42 bf             	lea    -0x41(%rdx),%eax
  40237a:	3c 19                	cmp    $0x19,%al
  40237c:	76 bb                	jbe    402339 <urlencode+0x15>
  40237e:	8d 42 9f             	lea    -0x61(%rdx),%eax
  402381:	3c 19                	cmp    $0x19,%al
  402383:	76 b4                	jbe    402339 <urlencode+0x15>
  402385:	80 fa 20             	cmp    $0x20,%dl
  402388:	74 4c                	je     4023d6 <urlencode+0xb2>
  40238a:	8d 42 e0             	lea    -0x20(%rdx),%eax
  40238d:	3c 5f                	cmp    $0x5f,%al
  40238f:	0f 96 c1             	setbe  %cl
  402392:	80 fa 09             	cmp    $0x9,%dl
  402395:	0f 94 c0             	sete   %al
  402398:	08 c1                	or     %al,%cl
  40239a:	74 47                	je     4023e3 <urlencode+0xbf>
  40239c:	0f b6 d2             	movzbl %dl,%edx
  40239f:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  4023a4:	48 8d 35 2a 13 00 00 	lea    0x132a(%rip),%rsi        # 4036d5 <trans_char+0xa5>
  4023ab:	b8 00 00 00 00       	mov    $0x0,%eax
  4023b0:	e8 3b ee ff ff       	call   4011f0 <sprintf@plt>
  4023b5:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  4023ba:	88 45 00             	mov    %al,0x0(%rbp)
  4023bd:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  4023c2:	88 45 01             	mov    %al,0x1(%rbp)
  4023c5:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  4023ca:	88 45 02             	mov    %al,0x2(%rbp)
  4023cd:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4023d1:	e9 6a ff ff ff       	jmp    402340 <urlencode+0x1c>
  4023d6:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4023da:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4023de:	e9 5d ff ff ff       	jmp    402340 <urlencode+0x1c>
  4023e3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023e8:	48 83 c4 10          	add    $0x10,%rsp
  4023ec:	5b                   	pop    %rbx
  4023ed:	5d                   	pop    %rbp
  4023ee:	41 5c                	pop    %r12
  4023f0:	c3                   	ret    

00000000004023f1 <rio_writen>:
  4023f1:	41 55                	push   %r13
  4023f3:	41 54                	push   %r12
  4023f5:	55                   	push   %rbp
  4023f6:	53                   	push   %rbx
  4023f7:	48 83 ec 08          	sub    $0x8,%rsp
  4023fb:	41 89 fc             	mov    %edi,%r12d
  4023fe:	48 89 f5             	mov    %rsi,%rbp
  402401:	49 89 d5             	mov    %rdx,%r13
  402404:	48 89 d3             	mov    %rdx,%rbx
  402407:	eb 06                	jmp    40240f <rio_writen+0x1e>
  402409:	48 29 c3             	sub    %rax,%rbx
  40240c:	48 01 c5             	add    %rax,%rbp
  40240f:	48 85 db             	test   %rbx,%rbx
  402412:	74 24                	je     402438 <rio_writen+0x47>
  402414:	48 89 da             	mov    %rbx,%rdx
  402417:	48 89 ee             	mov    %rbp,%rsi
  40241a:	44 89 e7             	mov    %r12d,%edi
  40241d:	e8 6e ec ff ff       	call   401090 <write@plt>
  402422:	48 85 c0             	test   %rax,%rax
  402425:	7f e2                	jg     402409 <rio_writen+0x18>
  402427:	e8 14 ec ff ff       	call   401040 <__errno_location@plt>
  40242c:	83 38 04             	cmpl   $0x4,(%rax)
  40242f:	75 15                	jne    402446 <rio_writen+0x55>
  402431:	b8 00 00 00 00       	mov    $0x0,%eax
  402436:	eb d1                	jmp    402409 <rio_writen+0x18>
  402438:	4c 89 e8             	mov    %r13,%rax
  40243b:	48 83 c4 08          	add    $0x8,%rsp
  40243f:	5b                   	pop    %rbx
  402440:	5d                   	pop    %rbp
  402441:	41 5c                	pop    %r12
  402443:	41 5d                	pop    %r13
  402445:	c3                   	ret    
  402446:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40244d:	eb ec                	jmp    40243b <rio_writen+0x4a>

000000000040244f <rio_read>:
  40244f:	41 55                	push   %r13
  402451:	41 54                	push   %r12
  402453:	55                   	push   %rbp
  402454:	53                   	push   %rbx
  402455:	48 83 ec 08          	sub    $0x8,%rsp
  402459:	48 89 fb             	mov    %rdi,%rbx
  40245c:	49 89 f5             	mov    %rsi,%r13
  40245f:	49 89 d4             	mov    %rdx,%r12
  402462:	eb 0a                	jmp    40246e <rio_read+0x1f>
  402464:	e8 d7 eb ff ff       	call   401040 <__errno_location@plt>
  402469:	83 38 04             	cmpl   $0x4,(%rax)
  40246c:	75 5a                	jne    4024c8 <rio_read+0x79>
  40246e:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402471:	85 ed                	test   %ebp,%ebp
  402473:	7f 22                	jg     402497 <rio_read+0x48>
  402475:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  402479:	ba 00 20 00 00       	mov    $0x2000,%edx
  40247e:	48 89 ee             	mov    %rbp,%rsi
  402481:	8b 3b                	mov    (%rbx),%edi
  402483:	e8 78 ec ff ff       	call   401100 <read@plt>
  402488:	89 43 04             	mov    %eax,0x4(%rbx)
  40248b:	85 c0                	test   %eax,%eax
  40248d:	78 d5                	js     402464 <rio_read+0x15>
  40248f:	74 40                	je     4024d1 <rio_read+0x82>
  402491:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  402495:	eb d7                	jmp    40246e <rio_read+0x1f>
  402497:	89 e8                	mov    %ebp,%eax
  402499:	4c 39 e0             	cmp    %r12,%rax
  40249c:	72 03                	jb     4024a1 <rio_read+0x52>
  40249e:	44 89 e5             	mov    %r12d,%ebp
  4024a1:	4c 63 e5             	movslq %ebp,%r12
  4024a4:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  4024a8:	4c 89 e2             	mov    %r12,%rdx
  4024ab:	4c 89 ef             	mov    %r13,%rdi
  4024ae:	e8 9d ec ff ff       	call   401150 <memcpy@plt>
  4024b3:	4c 01 63 08          	add    %r12,0x8(%rbx)
  4024b7:	29 6b 04             	sub    %ebp,0x4(%rbx)
  4024ba:	4c 89 e0             	mov    %r12,%rax
  4024bd:	48 83 c4 08          	add    $0x8,%rsp
  4024c1:	5b                   	pop    %rbx
  4024c2:	5d                   	pop    %rbp
  4024c3:	41 5c                	pop    %r12
  4024c5:	41 5d                	pop    %r13
  4024c7:	c3                   	ret    
  4024c8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4024cf:	eb ec                	jmp    4024bd <rio_read+0x6e>
  4024d1:	b8 00 00 00 00       	mov    $0x0,%eax
  4024d6:	eb e5                	jmp    4024bd <rio_read+0x6e>

00000000004024d8 <rio_readlineb>:
  4024d8:	41 55                	push   %r13
  4024da:	41 54                	push   %r12
  4024dc:	55                   	push   %rbp
  4024dd:	53                   	push   %rbx
  4024de:	48 83 ec 18          	sub    $0x18,%rsp
  4024e2:	49 89 fd             	mov    %rdi,%r13
  4024e5:	48 89 f5             	mov    %rsi,%rbp
  4024e8:	49 89 d4             	mov    %rdx,%r12
  4024eb:	bb 01 00 00 00       	mov    $0x1,%ebx
  4024f0:	eb 18                	jmp    40250a <rio_readlineb+0x32>
  4024f2:	85 c0                	test   %eax,%eax
  4024f4:	75 55                	jne    40254b <rio_readlineb+0x73>
  4024f6:	48 83 fb 01          	cmp    $0x1,%rbx
  4024fa:	75 3d                	jne    402539 <rio_readlineb+0x61>
  4024fc:	b8 00 00 00 00       	mov    $0x0,%eax
  402501:	eb 3d                	jmp    402540 <rio_readlineb+0x68>
  402503:	48 83 c3 01          	add    $0x1,%rbx
  402507:	48 89 d5             	mov    %rdx,%rbp
  40250a:	4c 39 e3             	cmp    %r12,%rbx
  40250d:	73 2a                	jae    402539 <rio_readlineb+0x61>
  40250f:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  402514:	ba 01 00 00 00       	mov    $0x1,%edx
  402519:	4c 89 ef             	mov    %r13,%rdi
  40251c:	e8 2e ff ff ff       	call   40244f <rio_read>
  402521:	83 f8 01             	cmp    $0x1,%eax
  402524:	75 cc                	jne    4024f2 <rio_readlineb+0x1a>
  402526:	48 8d 55 01          	lea    0x1(%rbp),%rdx
  40252a:	0f b6 44 24 0f       	movzbl 0xf(%rsp),%eax
  40252f:	88 45 00             	mov    %al,0x0(%rbp)
  402532:	3c 0a                	cmp    $0xa,%al
  402534:	75 cd                	jne    402503 <rio_readlineb+0x2b>
  402536:	48 89 d5             	mov    %rdx,%rbp
  402539:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  40253d:	48 89 d8             	mov    %rbx,%rax
  402540:	48 83 c4 18          	add    $0x18,%rsp
  402544:	5b                   	pop    %rbx
  402545:	5d                   	pop    %rbp
  402546:	41 5c                	pop    %r12
  402548:	41 5d                	pop    %r13
  40254a:	c3                   	ret    
  40254b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402552:	eb ec                	jmp    402540 <rio_readlineb+0x68>

0000000000402554 <submitr>:
  402554:	41 57                	push   %r15
  402556:	41 56                	push   %r14
  402558:	41 55                	push   %r13
  40255a:	41 54                	push   %r12
  40255c:	55                   	push   %rbp
  40255d:	53                   	push   %rbx
  40255e:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  402565:	49 89 fc             	mov    %rdi,%r12
  402568:	89 74 24 10          	mov    %esi,0x10(%rsp)
  40256c:	49 89 d6             	mov    %rdx,%r14
  40256f:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  402574:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  402579:	4d 89 cd             	mov    %r9,%r13
  40257c:	48 8b ac 24 90 a0 00 	mov    0xa090(%rsp),%rbp
  402583:	00 
  402584:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  40258b:	00 00 00 00 
  40258f:	ba 00 00 00 00       	mov    $0x0,%edx
  402594:	be 01 00 00 00       	mov    $0x1,%esi
  402599:	bf 02 00 00 00       	mov    $0x2,%edi
  40259e:	e8 8d ec ff ff       	call   401230 <socket@plt>
  4025a3:	85 c0                	test   %eax,%eax
  4025a5:	0f 88 6c 02 00 00    	js     402817 <submitr+0x2c3>
  4025ab:	89 c3                	mov    %eax,%ebx
  4025ad:	4c 89 e7             	mov    %r12,%rdi
  4025b0:	e8 6b eb ff ff       	call   401120 <gethostbyname@plt>
  4025b5:	48 85 c0             	test   %rax,%rax
  4025b8:	0f 84 a5 02 00 00    	je     402863 <submitr+0x30f>
  4025be:	4c 8d bc 24 40 a0 00 	lea    0xa040(%rsp),%r15
  4025c5:	00 
  4025c6:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  4025cd:	00 00 00 00 00 
  4025d2:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  4025d9:	00 00 00 00 00 
  4025de:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  4025e5:	00 02 00 
  4025e8:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4025ec:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4025f0:	48 8d bc 24 44 a0 00 	lea    0xa044(%rsp),%rdi
  4025f7:	00 
  4025f8:	48 8b 31             	mov    (%rcx),%rsi
  4025fb:	e8 a0 eb ff ff       	call   4011a0 <memmove@plt>
  402600:	0f b7 74 24 10       	movzwl 0x10(%rsp),%esi
  402605:	66 c1 c6 08          	rol    $0x8,%si
  402609:	66 89 b4 24 42 a0 00 	mov    %si,0xa042(%rsp)
  402610:	00 
  402611:	ba 10 00 00 00       	mov    $0x10,%edx
  402616:	4c 89 fe             	mov    %r15,%rsi
  402619:	89 df                	mov    %ebx,%edi
  40261b:	e8 f0 eb ff ff       	call   401210 <connect@plt>
  402620:	85 c0                	test   %eax,%eax
  402622:	0f 88 a3 02 00 00    	js     4028cb <submitr+0x377>
  402628:	4c 89 ef             	mov    %r13,%rdi
  40262b:	e8 70 ea ff ff       	call   4010a0 <strlen@plt>
  402630:	49 89 c7             	mov    %rax,%r15
  402633:	4c 89 f7             	mov    %r14,%rdi
  402636:	e8 65 ea ff ff       	call   4010a0 <strlen@plt>
  40263b:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402640:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402645:	e8 56 ea ff ff       	call   4010a0 <strlen@plt>
  40264a:	48 03 44 24 10       	add    0x10(%rsp),%rax
  40264f:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
  402654:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402659:	e8 42 ea ff ff       	call   4010a0 <strlen@plt>
  40265e:	48 03 44 24 10       	add    0x10(%rsp),%rax
  402663:	4b 8d 14 7f          	lea    (%r15,%r15,2),%rdx
  402667:	48 8d 84 10 80 00 00 	lea    0x80(%rax,%rdx,1),%rax
  40266e:	00 
  40266f:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402675:	0f 87 aa 02 00 00    	ja     402925 <submitr+0x3d1>
  40267b:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  402682:	00 
  402683:	b9 00 04 00 00       	mov    $0x400,%ecx
  402688:	b8 00 00 00 00       	mov    $0x0,%eax
  40268d:	48 89 f7             	mov    %rsi,%rdi
  402690:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402693:	4c 89 ef             	mov    %r13,%rdi
  402696:	e8 89 fc ff ff       	call   402324 <urlencode>
  40269b:	85 c0                	test   %eax,%eax
  40269d:	0f 88 f5 02 00 00    	js     402998 <submitr+0x444>
  4026a3:	4c 8d ac 24 30 60 00 	lea    0x6030(%rsp),%r13
  4026aa:	00 
  4026ab:	4d 89 e1             	mov    %r12,%r9
  4026ae:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  4026b5:	00 
  4026b6:	4c 89 f1             	mov    %r14,%rcx
  4026b9:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  4026be:	48 8d 35 a3 0f 00 00 	lea    0xfa3(%rip),%rsi        # 403668 <trans_char+0x38>
  4026c5:	4c 89 ef             	mov    %r13,%rdi
  4026c8:	b8 00 00 00 00       	mov    $0x0,%eax
  4026cd:	e8 1e eb ff ff       	call   4011f0 <sprintf@plt>
  4026d2:	4c 89 ef             	mov    %r13,%rdi
  4026d5:	e8 c6 e9 ff ff       	call   4010a0 <strlen@plt>
  4026da:	48 89 c2             	mov    %rax,%rdx
  4026dd:	4c 89 ee             	mov    %r13,%rsi
  4026e0:	89 df                	mov    %ebx,%edi
  4026e2:	e8 0a fd ff ff       	call   4023f1 <rio_writen>
  4026e7:	48 85 c0             	test   %rax,%rax
  4026ea:	0f 88 33 03 00 00    	js     402a23 <submitr+0x4cf>
  4026f0:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  4026f7:	00 
  4026f8:	89 de                	mov    %ebx,%esi
  4026fa:	4c 89 e7             	mov    %r12,%rdi
  4026fd:	e8 e5 fb ff ff       	call   4022e7 <rio_readinitb>
  402702:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402709:	00 
  40270a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40270f:	4c 89 e7             	mov    %r12,%rdi
  402712:	e8 c1 fd ff ff       	call   4024d8 <rio_readlineb>
  402717:	48 85 c0             	test   %rax,%rax
  40271a:	0f 8e 72 03 00 00    	jle    402a92 <submitr+0x53e>
  402720:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402727:	00 
  402728:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  40272f:	00 
  402730:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402737:	00 
  402738:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  40273d:	48 8d 35 98 0f 00 00 	lea    0xf98(%rip),%rsi        # 4036dc <trans_char+0xac>
  402744:	b8 00 00 00 00       	mov    $0x0,%eax
  402749:	e8 32 ea ff ff       	call   401180 <__isoc99_sscanf@plt>
  40274e:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402755:	00 
  402756:	b9 03 00 00 00       	mov    $0x3,%ecx
  40275b:	48 8d 3d 91 0f 00 00 	lea    0xf91(%rip),%rdi        # 4036f3 <trans_char+0xc3>
  402762:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402764:	0f 97 c0             	seta   %al
  402767:	1c 00                	sbb    $0x0,%al
  402769:	84 c0                	test   %al,%al
  40276b:	0f 84 9f 03 00 00    	je     402b10 <submitr+0x5bc>
  402771:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402778:	00 
  402779:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402780:	00 
  402781:	ba 00 20 00 00       	mov    $0x2000,%edx
  402786:	e8 4d fd ff ff       	call   4024d8 <rio_readlineb>
  40278b:	48 85 c0             	test   %rax,%rax
  40278e:	7f be                	jg     40274e <submitr+0x1fa>
  402790:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402797:	3a 20 43 
  40279a:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  4027a1:	20 75 6e 
  4027a4:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4027a8:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4027ac:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027b3:	74 6f 20 
  4027b6:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
  4027bd:	68 65 61 
  4027c0:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4027c4:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4027c8:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  4027cf:	66 72 6f 
  4027d2:	48 ba 6d 20 74 68 65 	movabs $0x657220656874206d,%rdx
  4027d9:	20 72 65 
  4027dc:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4027e0:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4027e4:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  4027eb:	73 65 72 
  4027ee:	48 89 45 30          	mov    %rax,0x30(%rbp)
  4027f2:	c7 45 38 76 65 72 00 	movl   $0x726576,0x38(%rbp)
  4027f9:	89 df                	mov    %ebx,%edi
  4027fb:	e8 f0 e8 ff ff       	call   4010f0 <close@plt>
  402800:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402805:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  40280c:	5b                   	pop    %rbx
  40280d:	5d                   	pop    %rbp
  40280e:	41 5c                	pop    %r12
  402810:	41 5d                	pop    %r13
  402812:	41 5e                	pop    %r14
  402814:	41 5f                	pop    %r15
  402816:	c3                   	ret    
  402817:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40281e:	3a 20 43 
  402821:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402828:	20 75 6e 
  40282b:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40282f:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402833:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40283a:	74 6f 20 
  40283d:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402844:	65 20 73 
  402847:	48 89 45 10          	mov    %rax,0x10(%rbp)
  40284b:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40284f:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402856:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40285c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402861:	eb a2                	jmp    402805 <submitr+0x2b1>
  402863:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40286a:	3a 20 44 
  40286d:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402874:	20 75 6e 
  402877:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40287b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  40287f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402886:	74 6f 20 
  402889:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402890:	76 65 20 
  402893:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402897:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40289b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4028a2:	72 20 61 
  4028a5:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4028a9:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4028b0:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4028b6:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4028ba:	89 df                	mov    %ebx,%edi
  4028bc:	e8 2f e8 ff ff       	call   4010f0 <close@plt>
  4028c1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4028c6:	e9 3a ff ff ff       	jmp    402805 <submitr+0x2b1>
  4028cb:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4028d2:	3a 20 55 
  4028d5:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  4028dc:	20 74 6f 
  4028df:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4028e3:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4028e7:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  4028ee:	65 63 74 
  4028f1:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
  4028f8:	68 65 20 
  4028fb:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4028ff:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402903:	c7 45 20 73 65 72 76 	movl   $0x76726573,0x20(%rbp)
  40290a:	66 c7 45 24 65 72    	movw   $0x7265,0x24(%rbp)
  402910:	c6 45 26 00          	movb   $0x0,0x26(%rbp)
  402914:	89 df                	mov    %ebx,%edi
  402916:	e8 d5 e7 ff ff       	call   4010f0 <close@plt>
  40291b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402920:	e9 e0 fe ff ff       	jmp    402805 <submitr+0x2b1>
  402925:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40292c:	3a 20 52 
  40292f:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  402936:	20 73 74 
  402939:	48 89 45 00          	mov    %rax,0x0(%rbp)
  40293d:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402941:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  402948:	74 6f 6f 
  40294b:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
  402952:	65 2e 20 
  402955:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402959:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  40295d:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402964:	61 73 65 
  402967:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
  40296e:	49 54 52 
  402971:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402975:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402979:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402980:	55 46 00 
  402983:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402987:	89 df                	mov    %ebx,%edi
  402989:	e8 62 e7 ff ff       	call   4010f0 <close@plt>
  40298e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402993:	e9 6d fe ff ff       	jmp    402805 <submitr+0x2b1>
  402998:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40299f:	3a 20 52 
  4029a2:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
  4029a9:	20 73 74 
  4029ac:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4029b0:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  4029b4:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4029bb:	63 6f 6e 
  4029be:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
  4029c5:	20 61 6e 
  4029c8:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029cc:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  4029d0:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4029d7:	67 61 6c 
  4029da:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
  4029e1:	6e 70 72 
  4029e4:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4029e8:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  4029ec:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4029f3:	6c 65 20 
  4029f6:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
  4029fd:	63 74 65 
  402a00:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402a04:	48 89 55 38          	mov    %rdx,0x38(%rbp)
  402a08:	66 c7 45 40 72 2e    	movw   $0x2e72,0x40(%rbp)
  402a0e:	c6 45 42 00          	movb   $0x0,0x42(%rbp)
  402a12:	89 df                	mov    %ebx,%edi
  402a14:	e8 d7 e6 ff ff       	call   4010f0 <close@plt>
  402a19:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a1e:	e9 e2 fd ff ff       	jmp    402805 <submitr+0x2b1>
  402a23:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a2a:	3a 20 43 
  402a2d:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402a34:	20 75 6e 
  402a37:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a3b:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402a3f:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402a46:	74 6f 20 
  402a49:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
  402a50:	20 74 6f 
  402a53:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a57:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402a5b:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402a62:	72 65 73 
  402a65:	48 ba 75 6c 74 20 73 	movabs $0x7672657320746c75,%rdx
  402a6c:	65 72 76 
  402a6f:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402a73:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402a77:	66 c7 45 30 65 72    	movw   $0x7265,0x30(%rbp)
  402a7d:	c6 45 32 00          	movb   $0x0,0x32(%rbp)
  402a81:	89 df                	mov    %ebx,%edi
  402a83:	e8 68 e6 ff ff       	call   4010f0 <close@plt>
  402a88:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a8d:	e9 73 fd ff ff       	jmp    402805 <submitr+0x2b1>
  402a92:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402a99:	3a 20 43 
  402a9c:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402aa3:	20 75 6e 
  402aa6:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402aaa:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402aae:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402ab5:	74 6f 20 
  402ab8:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
  402abf:	66 69 72 
  402ac2:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ac6:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402aca:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402ad1:	61 64 65 
  402ad4:	48 ba 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rdx
  402adb:	6d 20 72 
  402ade:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402ae2:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402ae6:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402aed:	20 73 65 
  402af0:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402af4:	c7 45 38 72 76 65 72 	movl   $0x72657672,0x38(%rbp)
  402afb:	c6 45 3c 00          	movb   $0x0,0x3c(%rbp)
  402aff:	89 df                	mov    %ebx,%edi
  402b01:	e8 ea e5 ff ff       	call   4010f0 <close@plt>
  402b06:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b0b:	e9 f5 fc ff ff       	jmp    402805 <submitr+0x2b1>
  402b10:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402b17:	00 
  402b18:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402b1f:	00 
  402b20:	ba 00 20 00 00       	mov    $0x2000,%edx
  402b25:	e8 ae f9 ff ff       	call   4024d8 <rio_readlineb>
  402b2a:	48 85 c0             	test   %rax,%rax
  402b2d:	0f 8e 97 00 00 00    	jle    402bca <submitr+0x676>
  402b33:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402b3a:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402b40:	0f 85 08 01 00 00    	jne    402c4e <submitr+0x6fa>
  402b46:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402b4d:	00 
  402b4e:	48 89 ef             	mov    %rbp,%rdi
  402b51:	e8 1a e5 ff ff       	call   401070 <strcpy@plt>
  402b56:	89 df                	mov    %ebx,%edi
  402b58:	e8 93 e5 ff ff       	call   4010f0 <close@plt>
  402b5d:	b9 04 00 00 00       	mov    $0x4,%ecx
  402b62:	48 8d 3d 84 0b 00 00 	lea    0xb84(%rip),%rdi        # 4036ed <trans_char+0xbd>
  402b69:	48 89 ee             	mov    %rbp,%rsi
  402b6c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402b6e:	0f 97 c0             	seta   %al
  402b71:	1c 00                	sbb    $0x0,%al
  402b73:	0f be c0             	movsbl %al,%eax
  402b76:	85 c0                	test   %eax,%eax
  402b78:	0f 84 87 fc ff ff    	je     402805 <submitr+0x2b1>
  402b7e:	b9 05 00 00 00       	mov    $0x5,%ecx
  402b83:	48 8d 3d 67 0b 00 00 	lea    0xb67(%rip),%rdi        # 4036f1 <trans_char+0xc1>
  402b8a:	48 89 ee             	mov    %rbp,%rsi
  402b8d:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402b8f:	0f 97 c0             	seta   %al
  402b92:	1c 00                	sbb    $0x0,%al
  402b94:	0f be c0             	movsbl %al,%eax
  402b97:	85 c0                	test   %eax,%eax
  402b99:	0f 84 66 fc ff ff    	je     402805 <submitr+0x2b1>
  402b9f:	b9 03 00 00 00       	mov    $0x3,%ecx
  402ba4:	48 8d 3d 4b 0b 00 00 	lea    0xb4b(%rip),%rdi        # 4036f6 <trans_char+0xc6>
  402bab:	48 89 ee             	mov    %rbp,%rsi
  402bae:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402bb0:	0f 97 c0             	seta   %al
  402bb3:	1c 00                	sbb    $0x0,%al
  402bb5:	0f be c0             	movsbl %al,%eax
  402bb8:	85 c0                	test   %eax,%eax
  402bba:	0f 84 45 fc ff ff    	je     402805 <submitr+0x2b1>
  402bc0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bc5:	e9 3b fc ff ff       	jmp    402805 <submitr+0x2b1>
  402bca:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402bd1:	3a 20 43 
  402bd4:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402bdb:	20 75 6e 
  402bde:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402be2:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402be6:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402bed:	74 6f 20 
  402bf0:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
  402bf7:	73 74 61 
  402bfa:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402bfe:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402c02:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  402c09:	65 73 73 
  402c0c:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
  402c13:	72 6f 6d 
  402c16:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402c1a:	48 89 55 28          	mov    %rdx,0x28(%rbp)
  402c1e:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  402c25:	6c 74 20 
  402c28:	48 89 45 30          	mov    %rax,0x30(%rbp)
  402c2c:	c7 45 38 73 65 72 76 	movl   $0x76726573,0x38(%rbp)
  402c33:	66 c7 45 3c 65 72    	movw   $0x7265,0x3c(%rbp)
  402c39:	c6 45 3e 00          	movb   $0x0,0x3e(%rbp)
  402c3d:	89 df                	mov    %ebx,%edi
  402c3f:	e8 ac e4 ff ff       	call   4010f0 <close@plt>
  402c44:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c49:	e9 b7 fb ff ff       	jmp    402805 <submitr+0x2b1>
  402c4e:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402c53:	48 8d 35 4e 0a 00 00 	lea    0xa4e(%rip),%rsi        # 4036a8 <trans_char+0x78>
  402c5a:	48 89 ef             	mov    %rbp,%rdi
  402c5d:	b8 00 00 00 00       	mov    $0x0,%eax
  402c62:	e8 89 e5 ff ff       	call   4011f0 <sprintf@plt>
  402c67:	89 df                	mov    %ebx,%edi
  402c69:	e8 82 e4 ff ff       	call   4010f0 <close@plt>
  402c6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402c73:	e9 8d fb ff ff       	jmp    402805 <submitr+0x2b1>

0000000000402c78 <init_timeout>:
  402c78:	85 ff                	test   %edi,%edi
  402c7a:	74 26                	je     402ca2 <init_timeout+0x2a>
  402c7c:	53                   	push   %rbx
  402c7d:	89 fb                	mov    %edi,%ebx
  402c7f:	78 1a                	js     402c9b <init_timeout+0x23>
  402c81:	48 8d 35 71 f6 ff ff 	lea    -0x98f(%rip),%rsi        # 4022f9 <sigalrm_handler>
  402c88:	bf 0e 00 00 00       	mov    $0xe,%edi
  402c8d:	e8 7e e4 ff ff       	call   401110 <signal@plt>
  402c92:	89 df                	mov    %ebx,%edi
  402c94:	e8 47 e4 ff ff       	call   4010e0 <alarm@plt>
  402c99:	5b                   	pop    %rbx
  402c9a:	c3                   	ret    
  402c9b:	bb 00 00 00 00       	mov    $0x0,%ebx
  402ca0:	eb df                	jmp    402c81 <init_timeout+0x9>
  402ca2:	c3                   	ret    

0000000000402ca3 <init_driver>:
  402ca3:	41 54                	push   %r12
  402ca5:	55                   	push   %rbp
  402ca6:	53                   	push   %rbx
  402ca7:	48 83 ec 10          	sub    $0x10,%rsp
  402cab:	48 89 fd             	mov    %rdi,%rbp
  402cae:	be 01 00 00 00       	mov    $0x1,%esi
  402cb3:	bf 0d 00 00 00       	mov    $0xd,%edi
  402cb8:	e8 53 e4 ff ff       	call   401110 <signal@plt>
  402cbd:	be 01 00 00 00       	mov    $0x1,%esi
  402cc2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402cc7:	e8 44 e4 ff ff       	call   401110 <signal@plt>
  402ccc:	be 01 00 00 00       	mov    $0x1,%esi
  402cd1:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402cd6:	e8 35 e4 ff ff       	call   401110 <signal@plt>
  402cdb:	ba 00 00 00 00       	mov    $0x0,%edx
  402ce0:	be 01 00 00 00       	mov    $0x1,%esi
  402ce5:	bf 02 00 00 00       	mov    $0x2,%edi
  402cea:	e8 41 e5 ff ff       	call   401230 <socket@plt>
  402cef:	85 c0                	test   %eax,%eax
  402cf1:	0f 88 83 00 00 00    	js     402d7a <init_driver+0xd7>
  402cf7:	89 c3                	mov    %eax,%ebx
  402cf9:	48 8d 3d f9 09 00 00 	lea    0x9f9(%rip),%rdi        # 4036f9 <trans_char+0xc9>
  402d00:	e8 1b e4 ff ff       	call   401120 <gethostbyname@plt>
  402d05:	48 85 c0             	test   %rax,%rax
  402d08:	0f 84 b8 00 00 00    	je     402dc6 <init_driver+0x123>
  402d0e:	49 89 e4             	mov    %rsp,%r12
  402d11:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402d18:	00 
  402d19:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402d20:	00 00 
  402d22:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402d28:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402d2c:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402d30:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402d35:	48 8b 31             	mov    (%rcx),%rsi
  402d38:	e8 63 e4 ff ff       	call   4011a0 <memmove@plt>
  402d3d:	66 c7 44 24 02 3c 9a 	movw   $0x9a3c,0x2(%rsp)
  402d44:	ba 10 00 00 00       	mov    $0x10,%edx
  402d49:	4c 89 e6             	mov    %r12,%rsi
  402d4c:	89 df                	mov    %ebx,%edi
  402d4e:	e8 bd e4 ff ff       	call   401210 <connect@plt>
  402d53:	85 c0                	test   %eax,%eax
  402d55:	0f 88 d3 00 00 00    	js     402e2e <init_driver+0x18b>
  402d5b:	89 df                	mov    %ebx,%edi
  402d5d:	e8 8e e3 ff ff       	call   4010f0 <close@plt>
  402d62:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402d68:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402d6c:	b8 00 00 00 00       	mov    $0x0,%eax
  402d71:	48 83 c4 10          	add    $0x10,%rsp
  402d75:	5b                   	pop    %rbx
  402d76:	5d                   	pop    %rbp
  402d77:	41 5c                	pop    %r12
  402d79:	c3                   	ret    
  402d7a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402d81:	3a 20 43 
  402d84:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
  402d8b:	20 75 6e 
  402d8e:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402d92:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402d96:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402d9d:	74 6f 20 
  402da0:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
  402da7:	65 20 73 
  402daa:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402dae:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402db2:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402db9:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402dbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402dc4:	eb ab                	jmp    402d71 <init_driver+0xce>
  402dc6:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402dcd:	3a 20 44 
  402dd0:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
  402dd7:	20 75 6e 
  402dda:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402dde:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402de2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402de9:	74 6f 20 
  402dec:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
  402df3:	76 65 20 
  402df6:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402dfa:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402dfe:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402e05:	72 20 61 
  402e08:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402e0c:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402e13:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402e19:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402e1d:	89 df                	mov    %ebx,%edi
  402e1f:	e8 cc e2 ff ff       	call   4010f0 <close@plt>
  402e24:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402e29:	e9 43 ff ff ff       	jmp    402d71 <init_driver+0xce>
  402e2e:	48 b8 63 68 61 6e 67 	movabs $0x656d65676e616863,%rax
  402e35:	65 6d 65 
  402e38:	48 ba 2e 79 6f 75 72 	movabs $0x68637372756f792e,%rdx
  402e3f:	73 63 68 
  402e42:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e46:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402e4a:	48 b8 6f 6f 6c 2e 65 	movabs $0x7564652e6c6f6f,%rax
  402e51:	64 75 00 
  402e54:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e58:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402e5f:	3a 20 55 
  402e62:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
  402e69:	20 74 6f 
  402e6c:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402e70:	48 89 55 08          	mov    %rdx,0x8(%rbp)
  402e74:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402e7b:	65 63 74 
  402e7e:	48 ba 20 74 6f 20 73 	movabs $0x76726573206f7420,%rdx
  402e85:	65 72 76 
  402e88:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402e8c:	48 89 55 18          	mov    %rdx,0x18(%rbp)
  402e90:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402e96:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402e9a:	89 df                	mov    %ebx,%edi
  402e9c:	e8 4f e2 ff ff       	call   4010f0 <close@plt>
  402ea1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402ea6:	e9 c6 fe ff ff       	jmp    402d71 <init_driver+0xce>

0000000000402eab <driver_post>:
  402eab:	53                   	push   %rbx
  402eac:	4c 89 cb             	mov    %r9,%rbx
  402eaf:	45 85 c0             	test   %r8d,%r8d
  402eb2:	75 18                	jne    402ecc <driver_post+0x21>
  402eb4:	48 85 ff             	test   %rdi,%rdi
  402eb7:	74 05                	je     402ebe <driver_post+0x13>
  402eb9:	80 3f 00             	cmpb   $0x0,(%rdi)
  402ebc:	75 32                	jne    402ef0 <driver_post+0x45>
  402ebe:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402ec3:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ec7:	44 89 c0             	mov    %r8d,%eax
  402eca:	5b                   	pop    %rbx
  402ecb:	c3                   	ret    
  402ecc:	48 89 ce             	mov    %rcx,%rsi
  402ecf:	48 8d 3d 3b 08 00 00 	lea    0x83b(%rip),%rdi        # 403711 <trans_char+0xe1>
  402ed6:	b8 00 00 00 00       	mov    $0x0,%eax
  402edb:	e8 e0 e1 ff ff       	call   4010c0 <printf@plt>
  402ee0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402ee5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402ee9:	b8 00 00 00 00       	mov    $0x0,%eax
  402eee:	eb da                	jmp    402eca <driver_post+0x1f>
  402ef0:	48 83 ec 08          	sub    $0x8,%rsp
  402ef4:	41 51                	push   %r9
  402ef6:	49 89 c9             	mov    %rcx,%r9
  402ef9:	49 89 d0             	mov    %rdx,%r8
  402efc:	48 89 f9             	mov    %rdi,%rcx
  402eff:	48 89 f2             	mov    %rsi,%rdx
  402f02:	be 9a 3c 00 00       	mov    $0x3c9a,%esi
  402f07:	48 8d 3d eb 07 00 00 	lea    0x7eb(%rip),%rdi        # 4036f9 <trans_char+0xc9>
  402f0e:	e8 41 f6 ff ff       	call   402554 <submitr>
  402f13:	48 83 c4 10          	add    $0x10,%rsp
  402f17:	eb b1                	jmp    402eca <driver_post+0x1f>

0000000000402f19 <check>:
  402f19:	89 f8                	mov    %edi,%eax
  402f1b:	c1 e8 1c             	shr    $0x1c,%eax
  402f1e:	74 1d                	je     402f3d <check+0x24>
  402f20:	b9 00 00 00 00       	mov    $0x0,%ecx
  402f25:	83 f9 1f             	cmp    $0x1f,%ecx
  402f28:	7f 0d                	jg     402f37 <check+0x1e>
  402f2a:	89 f8                	mov    %edi,%eax
  402f2c:	d3 e8                	shr    %cl,%eax
  402f2e:	3c 0a                	cmp    $0xa,%al
  402f30:	74 11                	je     402f43 <check+0x2a>
  402f32:	83 c1 08             	add    $0x8,%ecx
  402f35:	eb ee                	jmp    402f25 <check+0xc>
  402f37:	b8 01 00 00 00       	mov    $0x1,%eax
  402f3c:	c3                   	ret    
  402f3d:	b8 00 00 00 00       	mov    $0x0,%eax
  402f42:	c3                   	ret    
  402f43:	b8 00 00 00 00       	mov    $0x0,%eax
  402f48:	c3                   	ret    

0000000000402f49 <gencookie>:
  402f49:	53                   	push   %rbx
  402f4a:	83 c7 01             	add    $0x1,%edi
  402f4d:	e8 fe e0 ff ff       	call   401050 <srandom@plt>
  402f52:	e8 19 e2 ff ff       	call   401170 <random@plt>
  402f57:	48 89 c7             	mov    %rax,%rdi
  402f5a:	89 c3                	mov    %eax,%ebx
  402f5c:	e8 b8 ff ff ff       	call   402f19 <check>
  402f61:	85 c0                	test   %eax,%eax
  402f63:	74 ed                	je     402f52 <gencookie+0x9>
  402f65:	89 d8                	mov    %ebx,%eax
  402f67:	5b                   	pop    %rbx
  402f68:	c3                   	ret    
  402f69:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000402f70 <__libc_csu_init>:
  402f70:	41 57                	push   %r15
  402f72:	4c 8d 3d 97 2e 00 00 	lea    0x2e97(%rip),%r15        # 405e10 <__frame_dummy_init_array_entry>
  402f79:	41 56                	push   %r14
  402f7b:	49 89 d6             	mov    %rdx,%r14
  402f7e:	41 55                	push   %r13
  402f80:	49 89 f5             	mov    %rsi,%r13
  402f83:	41 54                	push   %r12
  402f85:	41 89 fc             	mov    %edi,%r12d
  402f88:	55                   	push   %rbp
  402f89:	48 8d 2d 88 2e 00 00 	lea    0x2e88(%rip),%rbp        # 405e18 <__do_global_dtors_aux_fini_array_entry>
  402f90:	53                   	push   %rbx
  402f91:	4c 29 fd             	sub    %r15,%rbp
  402f94:	48 83 ec 08          	sub    $0x8,%rsp
  402f98:	e8 63 e0 ff ff       	call   401000 <_init>
  402f9d:	48 c1 fd 03          	sar    $0x3,%rbp
  402fa1:	74 1b                	je     402fbe <__libc_csu_init+0x4e>
  402fa3:	31 db                	xor    %ebx,%ebx
  402fa5:	0f 1f 00             	nopl   (%rax)
  402fa8:	4c 89 f2             	mov    %r14,%rdx
  402fab:	4c 89 ee             	mov    %r13,%rsi
  402fae:	44 89 e7             	mov    %r12d,%edi
  402fb1:	41 ff 14 df          	call   *(%r15,%rbx,8)
  402fb5:	48 83 c3 01          	add    $0x1,%rbx
  402fb9:	48 39 dd             	cmp    %rbx,%rbp
  402fbc:	75 ea                	jne    402fa8 <__libc_csu_init+0x38>
  402fbe:	48 83 c4 08          	add    $0x8,%rsp
  402fc2:	5b                   	pop    %rbx
  402fc3:	5d                   	pop    %rbp
  402fc4:	41 5c                	pop    %r12
  402fc6:	41 5d                	pop    %r13
  402fc8:	41 5e                	pop    %r14
  402fca:	41 5f                	pop    %r15
  402fcc:	c3                   	ret    
  402fcd:	0f 1f 00             	nopl   (%rax)

0000000000402fd0 <__libc_csu_fini>:
  402fd0:	c3                   	ret    

Disassembly of section .fini:

0000000000402fd4 <_fini>:
  402fd4:	48 83 ec 08          	sub    $0x8,%rsp
  402fd8:	48 83 c4 08          	add    $0x8,%rsp
  402fdc:	c3                   	ret    
