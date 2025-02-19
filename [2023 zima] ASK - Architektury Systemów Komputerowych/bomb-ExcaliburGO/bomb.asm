
./bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 dd 3f 00 00 	mov    0x3fdd(%rip),%rax        # 4fe8 <__gmon_start__>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret    

Disassembly of section .plt:

0000000000001020 <.plt>:
    1020:	ff 35 e2 3f 00 00    	push   0x3fe2(%rip)        # 5008 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 e4 3f 00 00    	jmp    *0x3fe4(%rip)        # 5010 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <getenv@plt>:
    1030:	ff 25 e2 3f 00 00    	jmp    *0x3fe2(%rip)        # 5018 <getenv@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <.plt>

0000000000001040 <__errno_location@plt>:
    1040:	ff 25 da 3f 00 00    	jmp    *0x3fda(%rip)        # 5020 <__errno_location@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <.plt>

0000000000001050 <strcpy@plt>:
    1050:	ff 25 d2 3f 00 00    	jmp    *0x3fd2(%rip)        # 5028 <strcpy@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <.plt>

0000000000001060 <puts@plt>:
    1060:	ff 25 ca 3f 00 00    	jmp    *0x3fca(%rip)        # 5030 <puts@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <.plt>

0000000000001070 <write@plt>:
    1070:	ff 25 c2 3f 00 00    	jmp    *0x3fc2(%rip)        # 5038 <write@GLIBC_2.2.5>
    1076:	68 04 00 00 00       	push   $0x4
    107b:	e9 a0 ff ff ff       	jmp    1020 <.plt>

0000000000001080 <strlen@plt>:
    1080:	ff 25 ba 3f 00 00    	jmp    *0x3fba(%rip)        # 5040 <strlen@GLIBC_2.2.5>
    1086:	68 05 00 00 00       	push   $0x5
    108b:	e9 90 ff ff ff       	jmp    1020 <.plt>

0000000000001090 <printf@plt>:
    1090:	ff 25 b2 3f 00 00    	jmp    *0x3fb2(%rip)        # 5048 <printf@GLIBC_2.2.5>
    1096:	68 06 00 00 00       	push   $0x6
    109b:	e9 80 ff ff ff       	jmp    1020 <.plt>

00000000000010a0 <snprintf@plt>:
    10a0:	ff 25 aa 3f 00 00    	jmp    *0x3faa(%rip)        # 5050 <snprintf@GLIBC_2.2.5>
    10a6:	68 07 00 00 00       	push   $0x7
    10ab:	e9 70 ff ff ff       	jmp    1020 <.plt>

00000000000010b0 <alarm@plt>:
    10b0:	ff 25 a2 3f 00 00    	jmp    *0x3fa2(%rip)        # 5058 <alarm@GLIBC_2.2.5>
    10b6:	68 08 00 00 00       	push   $0x8
    10bb:	e9 60 ff ff ff       	jmp    1020 <.plt>

00000000000010c0 <close@plt>:
    10c0:	ff 25 9a 3f 00 00    	jmp    *0x3f9a(%rip)        # 5060 <close@GLIBC_2.2.5>
    10c6:	68 09 00 00 00       	push   $0x9
    10cb:	e9 50 ff ff ff       	jmp    1020 <.plt>

00000000000010d0 <read@plt>:
    10d0:	ff 25 92 3f 00 00    	jmp    *0x3f92(%rip)        # 5068 <read@GLIBC_2.2.5>
    10d6:	68 0a 00 00 00       	push   $0xa
    10db:	e9 40 ff ff ff       	jmp    1020 <.plt>

00000000000010e0 <fgets@plt>:
    10e0:	ff 25 8a 3f 00 00    	jmp    *0x3f8a(%rip)        # 5070 <fgets@GLIBC_2.2.5>
    10e6:	68 0b 00 00 00       	push   $0xb
    10eb:	e9 30 ff ff ff       	jmp    1020 <.plt>

00000000000010f0 <signal@plt>:
    10f0:	ff 25 82 3f 00 00    	jmp    *0x3f82(%rip)        # 5078 <signal@GLIBC_2.2.5>
    10f6:	68 0c 00 00 00       	push   $0xc
    10fb:	e9 20 ff ff ff       	jmp    1020 <.plt>

0000000000001100 <gethostbyname@plt>:
    1100:	ff 25 7a 3f 00 00    	jmp    *0x3f7a(%rip)        # 5080 <gethostbyname@GLIBC_2.2.5>
    1106:	68 0d 00 00 00       	push   $0xd
    110b:	e9 10 ff ff ff       	jmp    1020 <.plt>

0000000000001110 <fprintf@plt>:
    1110:	ff 25 72 3f 00 00    	jmp    *0x3f72(%rip)        # 5088 <fprintf@GLIBC_2.2.5>
    1116:	68 0e 00 00 00       	push   $0xe
    111b:	e9 00 ff ff ff       	jmp    1020 <.plt>

0000000000001120 <strtol@plt>:
    1120:	ff 25 6a 3f 00 00    	jmp    *0x3f6a(%rip)        # 5090 <strtol@GLIBC_2.2.5>
    1126:	68 0f 00 00 00       	push   $0xf
    112b:	e9 f0 fe ff ff       	jmp    1020 <.plt>

0000000000001130 <fflush@plt>:
    1130:	ff 25 62 3f 00 00    	jmp    *0x3f62(%rip)        # 5098 <fflush@GLIBC_2.2.5>
    1136:	68 10 00 00 00       	push   $0x10
    113b:	e9 e0 fe ff ff       	jmp    1020 <.plt>

0000000000001140 <__isoc99_sscanf@plt>:
    1140:	ff 25 5a 3f 00 00    	jmp    *0x3f5a(%rip)        # 50a0 <__isoc99_sscanf@GLIBC_2.7>
    1146:	68 11 00 00 00       	push   $0x11
    114b:	e9 d0 fe ff ff       	jmp    1020 <.plt>

0000000000001150 <memmove@plt>:
    1150:	ff 25 52 3f 00 00    	jmp    *0x3f52(%rip)        # 50a8 <memmove@GLIBC_2.2.5>
    1156:	68 12 00 00 00       	push   $0x12
    115b:	e9 c0 fe ff ff       	jmp    1020 <.plt>

0000000000001160 <fopen@plt>:
    1160:	ff 25 4a 3f 00 00    	jmp    *0x3f4a(%rip)        # 50b0 <fopen@GLIBC_2.2.5>
    1166:	68 13 00 00 00       	push   $0x13
    116b:	e9 b0 fe ff ff       	jmp    1020 <.plt>

0000000000001170 <sprintf@plt>:
    1170:	ff 25 42 3f 00 00    	jmp    *0x3f42(%rip)        # 50b8 <sprintf@GLIBC_2.2.5>
    1176:	68 14 00 00 00       	push   $0x14
    117b:	e9 a0 fe ff ff       	jmp    1020 <.plt>

0000000000001180 <exit@plt>:
    1180:	ff 25 3a 3f 00 00    	jmp    *0x3f3a(%rip)        # 50c0 <exit@GLIBC_2.2.5>
    1186:	68 15 00 00 00       	push   $0x15
    118b:	e9 90 fe ff ff       	jmp    1020 <.plt>

0000000000001190 <connect@plt>:
    1190:	ff 25 32 3f 00 00    	jmp    *0x3f32(%rip)        # 50c8 <connect@GLIBC_2.2.5>
    1196:	68 16 00 00 00       	push   $0x16
    119b:	e9 80 fe ff ff       	jmp    1020 <.plt>

00000000000011a0 <sleep@plt>:
    11a0:	ff 25 2a 3f 00 00    	jmp    *0x3f2a(%rip)        # 50d0 <sleep@GLIBC_2.2.5>
    11a6:	68 17 00 00 00       	push   $0x17
    11ab:	e9 70 fe ff ff       	jmp    1020 <.plt>

00000000000011b0 <__ctype_b_loc@plt>:
    11b0:	ff 25 22 3f 00 00    	jmp    *0x3f22(%rip)        # 50d8 <__ctype_b_loc@GLIBC_2.3>
    11b6:	68 18 00 00 00       	push   $0x18
    11bb:	e9 60 fe ff ff       	jmp    1020 <.plt>

00000000000011c0 <socket@plt>:
    11c0:	ff 25 1a 3f 00 00    	jmp    *0x3f1a(%rip)        # 50e0 <socket@GLIBC_2.2.5>
    11c6:	68 19 00 00 00       	push   $0x19
    11cb:	e9 50 fe ff ff       	jmp    1020 <.plt>

Disassembly of section .plt.got:

00000000000011d0 <__cxa_finalize@plt>:
    11d0:	ff 25 22 3e 00 00    	jmp    *0x3e22(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    11d6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

00000000000011e0 <_start>:
    11e0:	31 ed                	xor    %ebp,%ebp
    11e2:	49 89 d1             	mov    %rdx,%r9
    11e5:	5e                   	pop    %rsi
    11e6:	48 89 e2             	mov    %rsp,%rdx
    11e9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    11ed:	50                   	push   %rax
    11ee:	54                   	push   %rsp
    11ef:	4c 8d 05 9a 15 00 00 	lea    0x159a(%rip),%r8        # 2790 <__libc_csu_fini>
    11f6:	48 8d 0d 33 15 00 00 	lea    0x1533(%rip),%rcx        # 2730 <__libc_csu_init>
    11fd:	48 8d 3d c1 00 00 00 	lea    0xc1(%rip),%rdi        # 12c5 <main>
    1204:	ff 15 d6 3d 00 00    	call   *0x3dd6(%rip)        # 4fe0 <__libc_start_main@GLIBC_2.2.5>
    120a:	f4                   	hlt    
    120b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000001210 <deregister_tm_clones>:
    1210:	48 8d 3d 39 41 00 00 	lea    0x4139(%rip),%rdi        # 5350 <__TMC_END__>
    1217:	48 8d 05 32 41 00 00 	lea    0x4132(%rip),%rax        # 5350 <__TMC_END__>
    121e:	48 39 f8             	cmp    %rdi,%rax
    1221:	74 15                	je     1238 <deregister_tm_clones+0x28>
    1223:	48 8b 05 ae 3d 00 00 	mov    0x3dae(%rip),%rax        # 4fd8 <_ITM_deregisterTMCloneTable>
    122a:	48 85 c0             	test   %rax,%rax
    122d:	74 09                	je     1238 <deregister_tm_clones+0x28>
    122f:	ff e0                	jmp    *%rax
    1231:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    1238:	c3                   	ret    
    1239:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001240 <register_tm_clones>:
    1240:	48 8d 3d 09 41 00 00 	lea    0x4109(%rip),%rdi        # 5350 <__TMC_END__>
    1247:	48 8d 35 02 41 00 00 	lea    0x4102(%rip),%rsi        # 5350 <__TMC_END__>
    124e:	48 29 fe             	sub    %rdi,%rsi
    1251:	48 89 f0             	mov    %rsi,%rax
    1254:	48 c1 ee 3f          	shr    $0x3f,%rsi
    1258:	48 c1 f8 03          	sar    $0x3,%rax
    125c:	48 01 c6             	add    %rax,%rsi
    125f:	48 d1 fe             	sar    %rsi
    1262:	74 14                	je     1278 <register_tm_clones+0x38>
    1264:	48 8b 05 85 3d 00 00 	mov    0x3d85(%rip),%rax        # 4ff0 <_ITM_registerTMCloneTable>
    126b:	48 85 c0             	test   %rax,%rax
    126e:	74 08                	je     1278 <register_tm_clones+0x38>
    1270:	ff e0                	jmp    *%rax
    1272:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1278:	c3                   	ret    
    1279:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001280 <__do_global_dtors_aux>:
    1280:	80 3d 01 41 00 00 00 	cmpb   $0x0,0x4101(%rip)        # 5388 <completed.0>
    1287:	75 2f                	jne    12b8 <__do_global_dtors_aux+0x38>
    1289:	55                   	push   %rbp
    128a:	48 83 3d 66 3d 00 00 	cmpq   $0x0,0x3d66(%rip)        # 4ff8 <__cxa_finalize@GLIBC_2.2.5>
    1291:	00 
    1292:	48 89 e5             	mov    %rsp,%rbp
    1295:	74 0c                	je     12a3 <__do_global_dtors_aux+0x23>
    1297:	48 8b 3d 5a 3e 00 00 	mov    0x3e5a(%rip),%rdi        # 50f8 <__dso_handle>
    129e:	e8 2d ff ff ff       	call   11d0 <__cxa_finalize@plt>
    12a3:	e8 68 ff ff ff       	call   1210 <deregister_tm_clones>
    12a8:	c6 05 d9 40 00 00 01 	movb   $0x1,0x40d9(%rip)        # 5388 <completed.0>
    12af:	5d                   	pop    %rbp
    12b0:	c3                   	ret    
    12b1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    12b8:	c3                   	ret    
    12b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000012c0 <frame_dummy>:
    12c0:	e9 7b ff ff ff       	jmp    1240 <register_tm_clones>

00000000000012c5 <main>:
    12c5:	53                   	push   %rbx
    12c6:	83 ff 01             	cmp    $0x1,%edi
    12c9:	0f 84 f8 00 00 00    	je     13c7 <main+0x102>
    12cf:	48 89 f3             	mov    %rsi,%rbx
    12d2:	83 ff 02             	cmp    $0x2,%edi
    12d5:	0f 85 1c 01 00 00    	jne    13f7 <main+0x132>
    12db:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    12df:	48 8d 35 1e 1d 00 00 	lea    0x1d1e(%rip),%rsi        # 3004 <_IO_stdin_used+0x4>
    12e6:	e8 75 fe ff ff       	call   1160 <fopen@plt>
    12eb:	48 89 05 9e 40 00 00 	mov    %rax,0x409e(%rip)        # 5390 <infile>
    12f2:	48 85 c0             	test   %rax,%rax
    12f5:	0f 84 df 00 00 00    	je     13da <main+0x115>
    12fb:	e8 61 06 00 00       	call   1961 <initialize_bomb>
    1300:	48 8d 3d 81 1d 00 00 	lea    0x1d81(%rip),%rdi        # 3088 <_IO_stdin_used+0x88>
    1307:	e8 54 fd ff ff       	call   1060 <puts@plt>
    130c:	48 8d 3d b5 1d 00 00 	lea    0x1db5(%rip),%rdi        # 30c8 <_IO_stdin_used+0xc8>
    1313:	e8 48 fd ff ff       	call   1060 <puts@plt>
    1318:	e8 4f 07 00 00       	call   1a6c <read_line>
    131d:	48 89 c7             	mov    %rax,%rdi
    1320:	e8 f0 00 00 00       	call   1415 <phase_1>
    1325:	e8 79 08 00 00       	call   1ba3 <phase_defused>
    132a:	48 8d 3d c7 1d 00 00 	lea    0x1dc7(%rip),%rdi        # 30f8 <_IO_stdin_used+0xf8>
    1331:	e8 2a fd ff ff       	call   1060 <puts@plt>
    1336:	e8 31 07 00 00       	call   1a6c <read_line>
    133b:	48 89 c7             	mov    %rax,%rdi
    133e:	e8 f2 00 00 00       	call   1435 <phase_2>
    1343:	e8 5b 08 00 00       	call   1ba3 <phase_defused>
    1348:	48 8d 3d ee 1c 00 00 	lea    0x1cee(%rip),%rdi        # 303d <_IO_stdin_used+0x3d>
    134f:	e8 0c fd ff ff       	call   1060 <puts@plt>
    1354:	e8 13 07 00 00       	call   1a6c <read_line>
    1359:	48 89 c7             	mov    %rax,%rdi
    135c:	e8 19 01 00 00       	call   147a <phase_3>
    1361:	e8 3d 08 00 00       	call   1ba3 <phase_defused>
    1366:	48 8d 3d ee 1c 00 00 	lea    0x1cee(%rip),%rdi        # 305b <_IO_stdin_used+0x5b>
    136d:	e8 ee fc ff ff       	call   1060 <puts@plt>
    1372:	e8 f5 06 00 00       	call   1a6c <read_line>
    1377:	48 89 c7             	mov    %rax,%rdi
    137a:	e8 89 02 00 00       	call   1608 <phase_4>
    137f:	e8 1f 08 00 00       	call   1ba3 <phase_defused>
    1384:	48 8d 3d 9d 1d 00 00 	lea    0x1d9d(%rip),%rdi        # 3128 <_IO_stdin_used+0x128>
    138b:	e8 d0 fc ff ff       	call   1060 <puts@plt>
    1390:	e8 d7 06 00 00       	call   1a6c <read_line>
    1395:	48 89 c7             	mov    %rax,%rdi
    1398:	e8 c4 02 00 00       	call   1661 <phase_5>
    139d:	e8 01 08 00 00       	call   1ba3 <phase_defused>
    13a2:	48 8d 3d c1 1c 00 00 	lea    0x1cc1(%rip),%rdi        # 306a <_IO_stdin_used+0x6a>
    13a9:	e8 b2 fc ff ff       	call   1060 <puts@plt>
    13ae:	e8 b9 06 00 00       	call   1a6c <read_line>
    13b3:	48 89 c7             	mov    %rax,%rdi
    13b6:	e8 1e 03 00 00       	call   16d9 <phase_6>
    13bb:	e8 e3 07 00 00       	call   1ba3 <phase_defused>
    13c0:	b8 00 00 00 00       	mov    $0x0,%eax
    13c5:	5b                   	pop    %rbx
    13c6:	c3                   	ret    
    13c7:	48 8b 05 a2 3f 00 00 	mov    0x3fa2(%rip),%rax        # 5370 <stdin@GLIBC_2.2.5>
    13ce:	48 89 05 bb 3f 00 00 	mov    %rax,0x3fbb(%rip)        # 5390 <infile>
    13d5:	e9 21 ff ff ff       	jmp    12fb <main+0x36>
    13da:	48 8b 53 08          	mov    0x8(%rbx),%rdx
    13de:	48 8b 33             	mov    (%rbx),%rsi
    13e1:	48 8d 3d 1e 1c 00 00 	lea    0x1c1e(%rip),%rdi        # 3006 <_IO_stdin_used+0x6>
    13e8:	e8 a3 fc ff ff       	call   1090 <printf@plt>
    13ed:	bf 08 00 00 00       	mov    $0x8,%edi
    13f2:	e8 89 fd ff ff       	call   1180 <exit@plt>
    13f7:	48 8b 36             	mov    (%rsi),%rsi
    13fa:	48 8d 3d 22 1c 00 00 	lea    0x1c22(%rip),%rdi        # 3023 <_IO_stdin_used+0x23>
    1401:	b8 00 00 00 00       	mov    $0x0,%eax
    1406:	e8 85 fc ff ff       	call   1090 <printf@plt>
    140b:	bf 08 00 00 00       	mov    $0x8,%edi
    1410:	e8 6b fd ff ff       	call   1180 <exit@plt>

0000000000001415 <phase_1>:
    1415:	48 83 ec 08          	sub    $0x8,%rsp
    1419:	48 8d 35 2c 1d 00 00 	lea    0x1d2c(%rip),%rsi        # 314c <_IO_stdin_used+0x14c>
    1420:	e8 e0 04 00 00       	call   1905 <strings_not_equal>
    1425:	85 c0                	test   %eax,%eax
    1427:	75 05                	jne    142e <phase_1+0x19>
    1429:	48 83 c4 08          	add    $0x8,%rsp
    142d:	c3                   	ret    
    142e:	e8 d2 05 00 00       	call   1a05 <explode_bomb>
    1433:	eb f4                	jmp    1429 <phase_1+0x14>

0000000000001435 <phase_2>:
    1435:	55                   	push   %rbp
    1436:	53                   	push   %rbx
    1437:	48 83 ec 28          	sub    $0x28,%rsp
    143b:	48 89 e6             	mov    %rsp,%rsi
    143e:	e8 e8 05 00 00       	call   1a2b <read_six_numbers>
    1443:	83 3c 24 01          	cmpl   $0x1,(%rsp)
    1447:	75 0a                	jne    1453 <phase_2+0x1e>
    1449:	48 89 e3             	mov    %rsp,%rbx
    144c:	48 8d 6c 24 14       	lea    0x14(%rsp),%rbp
    1451:	eb 10                	jmp    1463 <phase_2+0x2e>
    1453:	e8 ad 05 00 00       	call   1a05 <explode_bomb>
    1458:	eb ef                	jmp    1449 <phase_2+0x14>
    145a:	48 83 c3 04          	add    $0x4,%rbx
    145e:	48 39 eb             	cmp    %rbp,%rbx
    1461:	74 10                	je     1473 <phase_2+0x3e>
    1463:	8b 03                	mov    (%rbx),%eax
    1465:	01 c0                	add    %eax,%eax
    1467:	39 43 04             	cmp    %eax,0x4(%rbx)
    146a:	74 ee                	je     145a <phase_2+0x25>
    146c:	e8 94 05 00 00       	call   1a05 <explode_bomb>
    1471:	eb e7                	jmp    145a <phase_2+0x25>
    1473:	48 83 c4 28          	add    $0x28,%rsp
    1477:	5b                   	pop    %rbx
    1478:	5d                   	pop    %rbp
    1479:	c3                   	ret    

000000000000147a <phase_3>:
    147a:	48 83 ec 18          	sub    $0x18,%rsp
    147e:	48 8d 4c 24 07       	lea    0x7(%rsp),%rcx
    1483:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1488:	4c 8d 44 24 08       	lea    0x8(%rsp),%r8
    148d:	48 8d 35 d5 1c 00 00 	lea    0x1cd5(%rip),%rsi        # 3169 <_IO_stdin_used+0x169>
    1494:	b8 00 00 00 00       	mov    $0x0,%eax
    1499:	e8 a2 fc ff ff       	call   1140 <__isoc99_sscanf@plt>
    149e:	83 f8 02             	cmp    $0x2,%eax
    14a1:	7e 1f                	jle    14c2 <phase_3+0x48>
    14a3:	83 7c 24 0c 07       	cmpl   $0x7,0xc(%rsp)
    14a8:	0f 87 0c 01 00 00    	ja     15ba <phase_3+0x140>
    14ae:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    14b2:	48 8d 15 c7 1c 00 00 	lea    0x1cc7(%rip),%rdx        # 3180 <_IO_stdin_used+0x180>
    14b9:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
    14bd:	48 01 d0             	add    %rdx,%rax
    14c0:	ff e0                	jmp    *%rax
    14c2:	e8 3e 05 00 00       	call   1a05 <explode_bomb>
    14c7:	eb da                	jmp    14a3 <phase_3+0x29>
    14c9:	b8 75 00 00 00       	mov    $0x75,%eax
    14ce:	81 7c 24 08 38 01 00 	cmpl   $0x138,0x8(%rsp)
    14d5:	00 
    14d6:	0f 84 e8 00 00 00    	je     15c4 <phase_3+0x14a>
    14dc:	e8 24 05 00 00       	call   1a05 <explode_bomb>
    14e1:	b8 75 00 00 00       	mov    $0x75,%eax
    14e6:	e9 d9 00 00 00       	jmp    15c4 <phase_3+0x14a>
    14eb:	b8 6c 00 00 00       	mov    $0x6c,%eax
    14f0:	81 7c 24 08 5d 01 00 	cmpl   $0x15d,0x8(%rsp)
    14f7:	00 
    14f8:	0f 84 c6 00 00 00    	je     15c4 <phase_3+0x14a>
    14fe:	e8 02 05 00 00       	call   1a05 <explode_bomb>
    1503:	b8 6c 00 00 00       	mov    $0x6c,%eax
    1508:	e9 b7 00 00 00       	jmp    15c4 <phase_3+0x14a>
    150d:	b8 69 00 00 00       	mov    $0x69,%eax
    1512:	81 7c 24 08 8a 00 00 	cmpl   $0x8a,0x8(%rsp)
    1519:	00 
    151a:	0f 84 a4 00 00 00    	je     15c4 <phase_3+0x14a>
    1520:	e8 e0 04 00 00       	call   1a05 <explode_bomb>
    1525:	b8 69 00 00 00       	mov    $0x69,%eax
    152a:	e9 95 00 00 00       	jmp    15c4 <phase_3+0x14a>
    152f:	b8 76 00 00 00       	mov    $0x76,%eax
    1534:	81 7c 24 08 27 03 00 	cmpl   $0x327,0x8(%rsp)
    153b:	00 
    153c:	0f 84 82 00 00 00    	je     15c4 <phase_3+0x14a>
    1542:	e8 be 04 00 00       	call   1a05 <explode_bomb>
    1547:	b8 76 00 00 00       	mov    $0x76,%eax
    154c:	eb 76                	jmp    15c4 <phase_3+0x14a>
    154e:	b8 6c 00 00 00       	mov    $0x6c,%eax
    1553:	81 7c 24 08 d5 02 00 	cmpl   $0x2d5,0x8(%rsp)
    155a:	00 
    155b:	74 67                	je     15c4 <phase_3+0x14a>
    155d:	e8 a3 04 00 00       	call   1a05 <explode_bomb>
    1562:	b8 6c 00 00 00       	mov    $0x6c,%eax
    1567:	eb 5b                	jmp    15c4 <phase_3+0x14a>
    1569:	b8 75 00 00 00       	mov    $0x75,%eax
    156e:	81 7c 24 08 05 03 00 	cmpl   $0x305,0x8(%rsp)
    1575:	00 
    1576:	74 4c                	je     15c4 <phase_3+0x14a>
    1578:	e8 88 04 00 00       	call   1a05 <explode_bomb>
    157d:	b8 75 00 00 00       	mov    $0x75,%eax
    1582:	eb 40                	jmp    15c4 <phase_3+0x14a>
    1584:	b8 6f 00 00 00       	mov    $0x6f,%eax
    1589:	81 7c 24 08 c7 00 00 	cmpl   $0xc7,0x8(%rsp)
    1590:	00 
    1591:	74 31                	je     15c4 <phase_3+0x14a>
    1593:	e8 6d 04 00 00       	call   1a05 <explode_bomb>
    1598:	b8 6f 00 00 00       	mov    $0x6f,%eax
    159d:	eb 25                	jmp    15c4 <phase_3+0x14a>
    159f:	b8 75 00 00 00       	mov    $0x75,%eax
    15a4:	81 7c 24 08 b9 02 00 	cmpl   $0x2b9,0x8(%rsp)
    15ab:	00 
    15ac:	74 16                	je     15c4 <phase_3+0x14a>
    15ae:	e8 52 04 00 00       	call   1a05 <explode_bomb>
    15b3:	b8 75 00 00 00       	mov    $0x75,%eax
    15b8:	eb 0a                	jmp    15c4 <phase_3+0x14a>
    15ba:	e8 46 04 00 00       	call   1a05 <explode_bomb>
    15bf:	b8 61 00 00 00       	mov    $0x61,%eax
    15c4:	38 44 24 07          	cmp    %al,0x7(%rsp)
    15c8:	75 05                	jne    15cf <phase_3+0x155>
    15ca:	48 83 c4 18          	add    $0x18,%rsp
    15ce:	c3                   	ret    
    15cf:	e8 31 04 00 00       	call   1a05 <explode_bomb>
    15d4:	eb f4                	jmp    15ca <phase_3+0x150>

00000000000015d6 <func4>:
    15d6:	53                   	push   %rbx
    15d7:	89 d0                	mov    %edx,%eax
    15d9:	29 f0                	sub    %esi,%eax
    15db:	89 c3                	mov    %eax,%ebx
    15dd:	c1 eb 1f             	shr    $0x1f,%ebx
    15e0:	01 c3                	add    %eax,%ebx
    15e2:	d1 fb                	sar    %ebx
    15e4:	01 f3                	add    %esi,%ebx
    15e6:	39 fb                	cmp    %edi,%ebx
    15e8:	7f 06                	jg     15f0 <func4+0x1a>
    15ea:	7c 10                	jl     15fc <func4+0x26>
    15ec:	89 d8                	mov    %ebx,%eax
    15ee:	5b                   	pop    %rbx
    15ef:	c3                   	ret    
    15f0:	8d 53 ff             	lea    -0x1(%rbx),%edx
    15f3:	e8 de ff ff ff       	call   15d6 <func4>
    15f8:	01 c3                	add    %eax,%ebx
    15fa:	eb f0                	jmp    15ec <func4+0x16>
    15fc:	8d 73 01             	lea    0x1(%rbx),%esi
    15ff:	e8 d2 ff ff ff       	call   15d6 <func4>
    1604:	01 c3                	add    %eax,%ebx
    1606:	eb e4                	jmp    15ec <func4+0x16>

0000000000001608 <phase_4>:
    1608:	48 83 ec 18          	sub    $0x18,%rsp
    160c:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1611:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1616:	48 8d 35 fa 1c 00 00 	lea    0x1cfa(%rip),%rsi        # 3317 <array.0+0x177>
    161d:	b8 00 00 00 00       	mov    $0x0,%eax
    1622:	e8 19 fb ff ff       	call   1140 <__isoc99_sscanf@plt>
    1627:	83 f8 02             	cmp    $0x2,%eax
    162a:	75 07                	jne    1633 <phase_4+0x2b>
    162c:	83 7c 24 0c 0e       	cmpl   $0xe,0xc(%rsp)
    1631:	76 05                	jbe    1638 <phase_4+0x30>
    1633:	e8 cd 03 00 00       	call   1a05 <explode_bomb>
    1638:	ba 0e 00 00 00       	mov    $0xe,%edx
    163d:	be 00 00 00 00       	mov    $0x0,%esi
    1642:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    1646:	e8 8b ff ff ff       	call   15d6 <func4>
    164b:	83 f8 07             	cmp    $0x7,%eax
    164e:	75 07                	jne    1657 <phase_4+0x4f>
    1650:	83 7c 24 08 07       	cmpl   $0x7,0x8(%rsp)
    1655:	74 05                	je     165c <phase_4+0x54>
    1657:	e8 a9 03 00 00       	call   1a05 <explode_bomb>
    165c:	48 83 c4 18          	add    $0x18,%rsp
    1660:	c3                   	ret    


# rax/eax - i - początkowo na pierwszą liczbę, potem wrzucony 
0000000000001661 <phase_5>:
    1661:	48 83 ec 18          	sub    $0x18,%rsp
    1665:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    166a:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    166f:	48 8d 35 a1 1c 00 00 	lea    0x1ca1(%rip),%rsi        # 3317 <array.0+0x177>
    1676:	b8 00 00 00 00       	mov    $0x0,%eax
    167b:	e8 c0 fa ff ff       	call   1140 <__isoc99_sscanf@plt>
    1680:	83 f8 01             	cmp    $0x1,%eax
    1683:	7e 4d                	jle    16d2 <phase_5+0x71>
    1685:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    1689:	83 e0 0f             	and    $0xf,%eax
    168c:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    1690:	83 f8 0f             	cmp    $0xf,%eax
    1693:	74 33                	je     16c8 <phase_5+0x67>
    1695:	b9 00 00 00 00       	mov    $0x0,%ecx
    169a:	ba 00 00 00 00       	mov    $0x0,%edx
    169f:	48 8d 35 fa 1a 00 00 	lea    0x1afa(%rip),%rsi        # 31a0 <array.0>
    16a6:	83 c2 01             	add    $0x1,%edx
    16a9:	48 98                	cltq   
    16ab:	8b 04 86             	mov    (%rsi,%rax,4),%eax
    16ae:	01 c1                	add    %eax,%ecx
    16b0:	83 f8 0f             	cmp    $0xf,%eax
    16b3:	75 f1                	jne    16a6 <phase_5+0x45>
    16b5:	c7 44 24 0c 0f 00 00 	movl   $0xf,0xc(%rsp)
    16bc:	00 
    16bd:	83 fa 0f             	cmp    $0xf,%edx
    16c0:	75 06                	jne    16c8 <phase_5+0x67>
    16c2:	39 4c 24 08          	cmp    %ecx,0x8(%rsp)
    16c6:	74 05                	je     16cd <phase_5+0x6c>
    16c8:	e8 38 03 00 00       	call   1a05 <explode_bomb>
    16cd:	48 83 c4 18          	add    $0x18,%rsp
    16d1:	c3                   	ret    
    16d2:	e8 2e 03 00 00       	call   1a05 <explode_bomb>
    16d7:	eb ac                	jmp    1685 <phase_5+0x24>

00000000000016d9 <phase_6>:
    16d9:	41 56                	push   %r14
    16db:	41 55                	push   %r13
    16dd:	41 54                	push   %r12
    16df:	55                   	push   %rbp
    16e0:	53                   	push   %rbx
    16e1:	48 83 ec 50          	sub    $0x50,%rsp
    16e5:	4c 8d 6c 24 30       	lea    0x30(%rsp),%r13
    16ea:	4c 89 ee             	mov    %r13,%rsi
    16ed:	e8 39 03 00 00       	call   1a2b <read_six_numbers>
    16f2:	41 be 01 00 00 00    	mov    $0x1,%r14d
    16f8:	4d 89 ec             	mov    %r13,%r12
    16fb:	eb 28                	jmp    1725 <phase_6+0x4c>
    16fd:	e8 03 03 00 00       	call   1a05 <explode_bomb>
    1702:	eb 30                	jmp    1734 <phase_6+0x5b>
    1704:	48 83 c3 01          	add    $0x1,%rbx
    1708:	83 fb 05             	cmp    $0x5,%ebx
    170b:	7f 10                	jg     171d <phase_6+0x44>
    170d:	41 8b 04 9c          	mov    (%r12,%rbx,4),%eax
    1711:	39 45 00             	cmp    %eax,0x0(%rbp)
    1714:	75 ee                	jne    1704 <phase_6+0x2b>
    1716:	e8 ea 02 00 00       	call   1a05 <explode_bomb>
    171b:	eb e7                	jmp    1704 <phase_6+0x2b>
    171d:	49 83 c6 01          	add    $0x1,%r14
    1721:	49 83 c5 04          	add    $0x4,%r13
    1725:	4c 89 ed             	mov    %r13,%rbp
    1728:	41 8b 45 00          	mov    0x0(%r13),%eax
    172c:	83 e8 01             	sub    $0x1,%eax
    172f:	83 f8 05             	cmp    $0x5,%eax
    1732:	77 c9                	ja     16fd <phase_6+0x24>
    1734:	41 83 fe 05          	cmp    $0x5,%r14d
    1738:	7f 05                	jg     173f <phase_6+0x66>
    173a:	4c 89 f3             	mov    %r14,%rbx
    173d:	eb ce                	jmp    170d <phase_6+0x34>
    173f:	be 00 00 00 00       	mov    $0x0,%esi
    1744:	8b 4c b4 30          	mov    0x30(%rsp,%rsi,4),%ecx
    1748:	b8 01 00 00 00       	mov    $0x1,%eax
    174d:	48 8d 15 ac 3b 00 00 	lea    0x3bac(%rip),%rdx        # 5300 <node1>
    1754:	83 f9 01             	cmp    $0x1,%ecx
    1757:	7e 0b                	jle    1764 <phase_6+0x8b>
    1759:	48 8b 52 08          	mov    0x8(%rdx),%rdx
    175d:	83 c0 01             	add    $0x1,%eax
    1760:	39 c8                	cmp    %ecx,%eax
    1762:	75 f5                	jne    1759 <phase_6+0x80>
    1764:	48 89 14 f4          	mov    %rdx,(%rsp,%rsi,8)
    1768:	48 83 c6 01          	add    $0x1,%rsi
    176c:	48 83 fe 06          	cmp    $0x6,%rsi
    1770:	75 d2                	jne    1744 <phase_6+0x6b>
    1772:	48 8b 1c 24          	mov    (%rsp),%rbx
    1776:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    177b:	48 89 43 08          	mov    %rax,0x8(%rbx)
    177f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
    1784:	48 89 50 08          	mov    %rdx,0x8(%rax)
    1788:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    178d:	48 89 42 08          	mov    %rax,0x8(%rdx)
    1791:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    1796:	48 89 50 08          	mov    %rdx,0x8(%rax)
    179a:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    179f:	48 89 42 08          	mov    %rax,0x8(%rdx)
    17a3:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
    17aa:	00 
    17ab:	bd 05 00 00 00       	mov    $0x5,%ebp
    17b0:	eb 09                	jmp    17bb <phase_6+0xe2>
    17b2:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
    17b6:	83 ed 01             	sub    $0x1,%ebp
    17b9:	74 11                	je     17cc <phase_6+0xf3>
    17bb:	48 8b 43 08          	mov    0x8(%rbx),%rax
    17bf:	8b 00                	mov    (%rax),%eax
    17c1:	39 03                	cmp    %eax,(%rbx)
    17c3:	7d ed                	jge    17b2 <phase_6+0xd9>
    17c5:	e8 3b 02 00 00       	call   1a05 <explode_bomb>
    17ca:	eb e6                	jmp    17b2 <phase_6+0xd9>
    17cc:	48 83 c4 50          	add    $0x50,%rsp
    17d0:	5b                   	pop    %rbx
    17d1:	5d                   	pop    %rbp
    17d2:	41 5c                	pop    %r12
    17d4:	41 5d                	pop    %r13
    17d6:	41 5e                	pop    %r14
    17d8:	c3                   	ret    

00000000000017d9 <fun7>:
    17d9:	48 85 ff             	test   %rdi,%rdi
    17dc:	74 32                	je     1810 <fun7+0x37>
    17de:	48 83 ec 08          	sub    $0x8,%rsp
    17e2:	8b 17                	mov    (%rdi),%edx
    17e4:	39 f2                	cmp    %esi,%edx
    17e6:	7f 0c                	jg     17f4 <fun7+0x1b>
    17e8:	b8 00 00 00 00       	mov    $0x0,%eax
    17ed:	75 12                	jne    1801 <fun7+0x28>
    17ef:	48 83 c4 08          	add    $0x8,%rsp
    17f3:	c3                   	ret    
    17f4:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
    17f8:	e8 dc ff ff ff       	call   17d9 <fun7>
    17fd:	01 c0                	add    %eax,%eax
    17ff:	eb ee                	jmp    17ef <fun7+0x16>
    1801:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
    1805:	e8 cf ff ff ff       	call   17d9 <fun7>
    180a:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
    180e:	eb df                	jmp    17ef <fun7+0x16>
    1810:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1815:	c3                   	ret    

0000000000001816 <secret_phase>:
    1816:	53                   	push   %rbx
    1817:	e8 50 02 00 00       	call   1a6c <read_line>
    181c:	48 89 c7             	mov    %rax,%rdi
    181f:	ba 0a 00 00 00       	mov    $0xa,%edx
    1824:	be 00 00 00 00       	mov    $0x0,%esi
    1829:	e8 f2 f8 ff ff       	call   1120 <strtol@plt>
    182e:	48 89 c3             	mov    %rax,%rbx
    1831:	8d 40 ff             	lea    -0x1(%rax),%eax
    1834:	3d e8 03 00 00       	cmp    $0x3e8,%eax
    1839:	77 26                	ja     1861 <secret_phase+0x4b>
    183b:	89 de                	mov    %ebx,%esi
    183d:	48 8d 3d dc 39 00 00 	lea    0x39dc(%rip),%rdi        # 5220 <n1>
    1844:	e8 90 ff ff ff       	call   17d9 <fun7>
    1849:	83 f8 01             	cmp    $0x1,%eax
    184c:	75 1a                	jne    1868 <secret_phase+0x52>
    184e:	48 8d 3d 8b 19 00 00 	lea    0x198b(%rip),%rdi        # 31e0 <array.0+0x40>
    1855:	e8 06 f8 ff ff       	call   1060 <puts@plt>
    185a:	e8 44 03 00 00       	call   1ba3 <phase_defused>
    185f:	5b                   	pop    %rbx
    1860:	c3                   	ret    
    1861:	e8 9f 01 00 00       	call   1a05 <explode_bomb>
    1866:	eb d3                	jmp    183b <secret_phase+0x25>
    1868:	e8 98 01 00 00       	call   1a05 <explode_bomb>
    186d:	eb df                	jmp    184e <secret_phase+0x38>

000000000000186f <sig_handler>:
    186f:	48 83 ec 08          	sub    $0x8,%rsp
    1873:	48 8d 3d 8e 19 00 00 	lea    0x198e(%rip),%rdi        # 3208 <array.0+0x68>
    187a:	e8 e1 f7 ff ff       	call   1060 <puts@plt>
    187f:	bf 03 00 00 00       	mov    $0x3,%edi
    1884:	e8 17 f9 ff ff       	call   11a0 <sleep@plt>
    1889:	48 8d 3d 3a 1a 00 00 	lea    0x1a3a(%rip),%rdi        # 32ca <array.0+0x12a>
    1890:	b8 00 00 00 00       	mov    $0x0,%eax
    1895:	e8 f6 f7 ff ff       	call   1090 <printf@plt>
    189a:	48 8b 3d bf 3a 00 00 	mov    0x3abf(%rip),%rdi        # 5360 <stdout@GLIBC_2.2.5>
    18a1:	e8 8a f8 ff ff       	call   1130 <fflush@plt>
    18a6:	bf 01 00 00 00       	mov    $0x1,%edi
    18ab:	e8 f0 f8 ff ff       	call   11a0 <sleep@plt>
    18b0:	48 8d 3d 1b 1a 00 00 	lea    0x1a1b(%rip),%rdi        # 32d2 <array.0+0x132>
    18b7:	e8 a4 f7 ff ff       	call   1060 <puts@plt>
    18bc:	bf 10 00 00 00       	mov    $0x10,%edi
    18c1:	e8 ba f8 ff ff       	call   1180 <exit@plt>

00000000000018c6 <invalid_phase>:
    18c6:	48 83 ec 08          	sub    $0x8,%rsp
    18ca:	48 89 fe             	mov    %rdi,%rsi
    18cd:	48 8d 3d 06 1a 00 00 	lea    0x1a06(%rip),%rdi        # 32da <array.0+0x13a>
    18d4:	b8 00 00 00 00       	mov    $0x0,%eax
    18d9:	e8 b2 f7 ff ff       	call   1090 <printf@plt>
    18de:	bf 08 00 00 00       	mov    $0x8,%edi
    18e3:	e8 98 f8 ff ff       	call   1180 <exit@plt>

00000000000018e8 <string_length>:
    18e8:	80 3f 00             	cmpb   $0x0,(%rdi)
    18eb:	74 12                	je     18ff <string_length+0x17>
    18ed:	b8 00 00 00 00       	mov    $0x0,%eax
    18f2:	48 83 c7 01          	add    $0x1,%rdi
    18f6:	83 c0 01             	add    $0x1,%eax
    18f9:	80 3f 00             	cmpb   $0x0,(%rdi)
    18fc:	75 f4                	jne    18f2 <string_length+0xa>
    18fe:	c3                   	ret    
    18ff:	b8 00 00 00 00       	mov    $0x0,%eax
    1904:	c3                   	ret    

0000000000001905 <strings_not_equal>:
    1905:	41 54                	push   %r12
    1907:	55                   	push   %rbp
    1908:	53                   	push   %rbx
    1909:	48 89 fb             	mov    %rdi,%rbx
    190c:	48 89 f5             	mov    %rsi,%rbp
    190f:	e8 d4 ff ff ff       	call   18e8 <string_length>
    1914:	41 89 c4             	mov    %eax,%r12d
    1917:	48 89 ef             	mov    %rbp,%rdi
    191a:	e8 c9 ff ff ff       	call   18e8 <string_length>
    191f:	89 c2                	mov    %eax,%edx
    1921:	b8 01 00 00 00       	mov    $0x1,%eax
    1926:	41 39 d4             	cmp    %edx,%r12d
    1929:	75 31                	jne    195c <strings_not_equal+0x57>
    192b:	0f b6 13             	movzbl (%rbx),%edx
    192e:	84 d2                	test   %dl,%dl
    1930:	74 1e                	je     1950 <strings_not_equal+0x4b>
    1932:	b8 00 00 00 00       	mov    $0x0,%eax
    1937:	38 54 05 00          	cmp    %dl,0x0(%rbp,%rax,1)
    193b:	75 1a                	jne    1957 <strings_not_equal+0x52>
    193d:	48 83 c0 01          	add    $0x1,%rax
    1941:	0f b6 14 03          	movzbl (%rbx,%rax,1),%edx
    1945:	84 d2                	test   %dl,%dl
    1947:	75 ee                	jne    1937 <strings_not_equal+0x32>
    1949:	b8 00 00 00 00       	mov    $0x0,%eax
    194e:	eb 0c                	jmp    195c <strings_not_equal+0x57>
    1950:	b8 00 00 00 00       	mov    $0x0,%eax
    1955:	eb 05                	jmp    195c <strings_not_equal+0x57>
    1957:	b8 01 00 00 00       	mov    $0x1,%eax
    195c:	5b                   	pop    %rbx
    195d:	5d                   	pop    %rbp
    195e:	41 5c                	pop    %r12
    1960:	c3                   	ret    

0000000000001961 <initialize_bomb>:
    1961:	48 83 ec 08          	sub    $0x8,%rsp
    1965:	48 8d 35 03 ff ff ff 	lea    -0xfd(%rip),%rsi        # 186f <sig_handler>
    196c:	bf 02 00 00 00       	mov    $0x2,%edi
    1971:	e8 7a f7 ff ff       	call   10f0 <signal@plt>
    1976:	48 83 c4 08          	add    $0x8,%rsp
    197a:	c3                   	ret    

000000000000197b <initialize_bomb_solve>:
    197b:	c3                   	ret    

000000000000197c <blank_line>:
    197c:	55                   	push   %rbp
    197d:	53                   	push   %rbx
    197e:	48 83 ec 08          	sub    $0x8,%rsp
    1982:	48 89 fd             	mov    %rdi,%rbp
    1985:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
    1989:	84 db                	test   %bl,%bl
    198b:	74 1e                	je     19ab <blank_line+0x2f>
    198d:	e8 1e f8 ff ff       	call   11b0 <__ctype_b_loc@plt>
    1992:	48 83 c5 01          	add    $0x1,%rbp
    1996:	48 0f be db          	movsbq %bl,%rbx
    199a:	48 8b 00             	mov    (%rax),%rax
    199d:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
    19a2:	75 e1                	jne    1985 <blank_line+0x9>
    19a4:	b8 00 00 00 00       	mov    $0x0,%eax
    19a9:	eb 05                	jmp    19b0 <blank_line+0x34>
    19ab:	b8 01 00 00 00       	mov    $0x1,%eax
    19b0:	48 83 c4 08          	add    $0x8,%rsp
    19b4:	5b                   	pop    %rbx
    19b5:	5d                   	pop    %rbp
    19b6:	c3                   	ret    

00000000000019b7 <skip>:
    19b7:	55                   	push   %rbp
    19b8:	53                   	push   %rbx
    19b9:	48 83 ec 08          	sub    $0x8,%rsp
    19bd:	48 8d 2d 3c 3a 00 00 	lea    0x3a3c(%rip),%rbp        # 5400 <input_strings>
    19c4:	48 63 05 25 3a 00 00 	movslq 0x3a25(%rip),%rax        # 53f0 <num_input_strings>
    19cb:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
    19cf:	48 c1 e7 04          	shl    $0x4,%rdi
    19d3:	48 01 ef             	add    %rbp,%rdi
    19d6:	48 8b 15 b3 39 00 00 	mov    0x39b3(%rip),%rdx        # 5390 <infile>
    19dd:	be 50 00 00 00       	mov    $0x50,%esi
    19e2:	e8 f9 f6 ff ff       	call   10e0 <fgets@plt>
    19e7:	48 89 c3             	mov    %rax,%rbx
    19ea:	48 85 c0             	test   %rax,%rax
    19ed:	74 0c                	je     19fb <skip+0x44>
    19ef:	48 89 c7             	mov    %rax,%rdi
    19f2:	e8 85 ff ff ff       	call   197c <blank_line>
    19f7:	85 c0                	test   %eax,%eax
    19f9:	75 c9                	jne    19c4 <skip+0xd>
    19fb:	48 89 d8             	mov    %rbx,%rax
    19fe:	48 83 c4 08          	add    $0x8,%rsp
    1a02:	5b                   	pop    %rbx
    1a03:	5d                   	pop    %rbp
    1a04:	c3                   	ret    

0000000000001a05 <explode_bomb>:
    1a05:	48 83 ec 08          	sub    $0x8,%rsp
    1a09:	48 8d 3d db 18 00 00 	lea    0x18db(%rip),%rdi        # 32eb <array.0+0x14b>
    1a10:	e8 4b f6 ff ff       	call   1060 <puts@plt>
    1a15:	48 8d 3d d8 18 00 00 	lea    0x18d8(%rip),%rdi        # 32f4 <array.0+0x154>
    1a1c:	e8 3f f6 ff ff       	call   1060 <puts@plt>
    1a21:	bf 08 00 00 00       	mov    $0x8,%edi
    1a26:	e8 55 f7 ff ff       	call   1180 <exit@plt>

0000000000001a2b <read_six_numbers>:
    1a2b:	48 83 ec 08          	sub    $0x8,%rsp
    1a2f:	48 89 f2             	mov    %rsi,%rdx
    1a32:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
    1a36:	48 8d 46 14          	lea    0x14(%rsi),%rax
    1a3a:	50                   	push   %rax
    1a3b:	48 8d 46 10          	lea    0x10(%rsi),%rax
    1a3f:	50                   	push   %rax
    1a40:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
    1a44:	4c 8d 46 08          	lea    0x8(%rsi),%r8
    1a48:	48 8d 35 bc 18 00 00 	lea    0x18bc(%rip),%rsi        # 330b <array.0+0x16b>
    1a4f:	b8 00 00 00 00       	mov    $0x0,%eax
    1a54:	e8 e7 f6 ff ff       	call   1140 <__isoc99_sscanf@plt>
    1a59:	48 83 c4 10          	add    $0x10,%rsp
    1a5d:	83 f8 05             	cmp    $0x5,%eax
    1a60:	7e 05                	jle    1a67 <read_six_numbers+0x3c>
    1a62:	48 83 c4 08          	add    $0x8,%rsp
    1a66:	c3                   	ret    
    1a67:	e8 99 ff ff ff       	call   1a05 <explode_bomb>

0000000000001a6c <read_line>:
    1a6c:	55                   	push   %rbp
    1a6d:	53                   	push   %rbx
    1a6e:	48 83 ec 08          	sub    $0x8,%rsp
    1a72:	b8 00 00 00 00       	mov    $0x0,%eax
    1a77:	e8 3b ff ff ff       	call   19b7 <skip>
    1a7c:	48 85 c0             	test   %rax,%rax
    1a7f:	74 60                	je     1ae1 <read_line+0x75>
    1a81:	8b 2d 69 39 00 00    	mov    0x3969(%rip),%ebp        # 53f0 <num_input_strings>
    1a87:	48 63 c5             	movslq %ebp,%rax
    1a8a:	48 8d 1c 80          	lea    (%rax,%rax,4),%rbx
    1a8e:	48 c1 e3 04          	shl    $0x4,%rbx
    1a92:	48 8d 05 67 39 00 00 	lea    0x3967(%rip),%rax        # 5400 <input_strings>
    1a99:	48 01 c3             	add    %rax,%rbx
    1a9c:	48 89 df             	mov    %rbx,%rdi
    1a9f:	e8 dc f5 ff ff       	call   1080 <strlen@plt>
    1aa4:	83 f8 4e             	cmp    $0x4e,%eax
    1aa7:	0f 8f ac 00 00 00    	jg     1b59 <read_line+0xed>
    1aad:	83 e8 01             	sub    $0x1,%eax
    1ab0:	48 98                	cltq   
    1ab2:	48 63 d5             	movslq %ebp,%rdx
    1ab5:	48 8d 14 92          	lea    (%rdx,%rdx,4),%rdx
    1ab9:	48 89 d1             	mov    %rdx,%rcx
    1abc:	48 c1 e1 04          	shl    $0x4,%rcx
    1ac0:	48 8d 15 39 39 00 00 	lea    0x3939(%rip),%rdx        # 5400 <input_strings>
    1ac7:	48 01 ca             	add    %rcx,%rdx
    1aca:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    1ace:	83 c5 01             	add    $0x1,%ebp
    1ad1:	89 2d 19 39 00 00    	mov    %ebp,0x3919(%rip)        # 53f0 <num_input_strings>
    1ad7:	48 89 d8             	mov    %rbx,%rax
    1ada:	48 83 c4 08          	add    $0x8,%rsp
    1ade:	5b                   	pop    %rbx
    1adf:	5d                   	pop    %rbp
    1ae0:	c3                   	ret    
    1ae1:	48 8b 05 88 38 00 00 	mov    0x3888(%rip),%rax        # 5370 <stdin@GLIBC_2.2.5>
    1ae8:	48 39 05 a1 38 00 00 	cmp    %rax,0x38a1(%rip)        # 5390 <infile>
    1aef:	74 1b                	je     1b0c <read_line+0xa0>
    1af1:	48 8d 3d 43 18 00 00 	lea    0x1843(%rip),%rdi        # 333b <array.0+0x19b>
    1af8:	e8 33 f5 ff ff       	call   1030 <getenv@plt>
    1afd:	48 85 c0             	test   %rax,%rax
    1b00:	74 20                	je     1b22 <read_line+0xb6>
    1b02:	bf 00 00 00 00       	mov    $0x0,%edi
    1b07:	e8 74 f6 ff ff       	call   1180 <exit@plt>
    1b0c:	48 8d 3d 0a 18 00 00 	lea    0x180a(%rip),%rdi        # 331d <array.0+0x17d>
    1b13:	e8 48 f5 ff ff       	call   1060 <puts@plt>
    1b18:	bf 08 00 00 00       	mov    $0x8,%edi
    1b1d:	e8 5e f6 ff ff       	call   1180 <exit@plt>
    1b22:	48 8b 05 47 38 00 00 	mov    0x3847(%rip),%rax        # 5370 <stdin@GLIBC_2.2.5>
    1b29:	48 89 05 60 38 00 00 	mov    %rax,0x3860(%rip)        # 5390 <infile>
    1b30:	b8 00 00 00 00       	mov    $0x0,%eax
    1b35:	e8 7d fe ff ff       	call   19b7 <skip>
    1b3a:	48 85 c0             	test   %rax,%rax
    1b3d:	0f 85 3e ff ff ff    	jne    1a81 <read_line+0x15>
    1b43:	48 8d 3d d3 17 00 00 	lea    0x17d3(%rip),%rdi        # 331d <array.0+0x17d>
    1b4a:	e8 11 f5 ff ff       	call   1060 <puts@plt>
    1b4f:	bf 00 00 00 00       	mov    $0x0,%edi
    1b54:	e8 27 f6 ff ff       	call   1180 <exit@plt>
    1b59:	48 8d 3d e6 17 00 00 	lea    0x17e6(%rip),%rdi        # 3346 <array.0+0x1a6>
    1b60:	e8 fb f4 ff ff       	call   1060 <puts@plt>
    1b65:	8b 05 85 38 00 00    	mov    0x3885(%rip),%eax        # 53f0 <num_input_strings>
    1b6b:	8d 50 01             	lea    0x1(%rax),%edx
    1b6e:	89 15 7c 38 00 00    	mov    %edx,0x387c(%rip)        # 53f0 <num_input_strings>
    1b74:	48 98                	cltq   
    1b76:	48 6b c0 50          	imul   $0x50,%rax,%rax
    1b7a:	48 8d 15 7f 38 00 00 	lea    0x387f(%rip),%rdx        # 5400 <input_strings>
    1b81:	48 be 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rsi
    1b88:	75 6e 63 
    1b8b:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
    1b92:	2a 2a 00 
    1b95:	48 89 34 02          	mov    %rsi,(%rdx,%rax,1)
    1b99:	48 89 7c 02 08       	mov    %rdi,0x8(%rdx,%rax,1)
    1b9e:	e8 62 fe ff ff       	call   1a05 <explode_bomb>

0000000000001ba3 <phase_defused>:
    1ba3:	83 3d 46 38 00 00 06 	cmpl   $0x6,0x3846(%rip)        # 53f0 <num_input_strings>
    1baa:	74 01                	je     1bad <phase_defused+0xa>
    1bac:	c3                   	ret    
    1bad:	48 83 ec 68          	sub    $0x68,%rsp
    1bb1:	48 8d 4c 24 08       	lea    0x8(%rsp),%rcx
    1bb6:	48 8d 54 24 0c       	lea    0xc(%rsp),%rdx
    1bbb:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
    1bc0:	48 8d 35 9a 17 00 00 	lea    0x179a(%rip),%rsi        # 3361 <array.0+0x1c1>
    1bc7:	48 8d 3d 22 39 00 00 	lea    0x3922(%rip),%rdi        # 54f0 <input_strings+0xf0>
    1bce:	b8 00 00 00 00       	mov    $0x0,%eax
    1bd3:	e8 68 f5 ff ff       	call   1140 <__isoc99_sscanf@plt>
    1bd8:	83 f8 03             	cmp    $0x3,%eax
    1bdb:	74 11                	je     1bee <phase_defused+0x4b>
    1bdd:	48 8d 3d bc 16 00 00 	lea    0x16bc(%rip),%rdi        # 32a0 <array.0+0x100>
    1be4:	e8 77 f4 ff ff       	call   1060 <puts@plt>
    1be9:	48 83 c4 68          	add    $0x68,%rsp
    1bed:	c3                   	ret    
    1bee:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
    1bf3:	48 8d 35 70 17 00 00 	lea    0x1770(%rip),%rsi        # 336a <array.0+0x1ca>
    1bfa:	e8 06 fd ff ff       	call   1905 <strings_not_equal>
    1bff:	85 c0                	test   %eax,%eax
    1c01:	75 da                	jne    1bdd <phase_defused+0x3a>
    1c03:	48 8d 3d 36 16 00 00 	lea    0x1636(%rip),%rdi        # 3240 <array.0+0xa0>
    1c0a:	e8 51 f4 ff ff       	call   1060 <puts@plt>
    1c0f:	48 8d 3d 52 16 00 00 	lea    0x1652(%rip),%rdi        # 3268 <array.0+0xc8>
    1c16:	e8 45 f4 ff ff       	call   1060 <puts@plt>
    1c1b:	b8 00 00 00 00       	mov    $0x0,%eax
    1c20:	e8 f1 fb ff ff       	call   1816 <secret_phase>
    1c25:	eb b6                	jmp    1bdd <phase_defused+0x3a>

0000000000001c27 <sigalrm_handler>:
    1c27:	48 83 ec 08          	sub    $0x8,%rsp
    1c2b:	ba 00 00 00 00       	mov    $0x0,%edx
    1c30:	48 8d 35 41 17 00 00 	lea    0x1741(%rip),%rsi        # 3378 <array.0+0x1d8>
    1c37:	48 8b 3d 42 37 00 00 	mov    0x3742(%rip),%rdi        # 5380 <stderr@GLIBC_2.2.5>
    1c3e:	b8 00 00 00 00       	mov    $0x0,%eax
    1c43:	e8 c8 f4 ff ff       	call   1110 <fprintf@plt>
    1c48:	bf 01 00 00 00       	mov    $0x1,%edi
    1c4d:	e8 2e f5 ff ff       	call   1180 <exit@plt>

0000000000001c52 <rio_readlineb>:
    1c52:	41 56                	push   %r14
    1c54:	41 55                	push   %r13
    1c56:	41 54                	push   %r12
    1c58:	55                   	push   %rbp
    1c59:	53                   	push   %rbx
    1c5a:	49 89 f4             	mov    %rsi,%r12
    1c5d:	48 83 fa 01          	cmp    $0x1,%rdx
    1c61:	0f 86 92 00 00 00    	jbe    1cf9 <rio_readlineb+0xa7>
    1c67:	48 89 fb             	mov    %rdi,%rbx
    1c6a:	4c 8d 74 16 ff       	lea    -0x1(%rsi,%rdx,1),%r14
    1c6f:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1c75:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
    1c79:	eb 56                	jmp    1cd1 <rio_readlineb+0x7f>
    1c7b:	e8 c0 f3 ff ff       	call   1040 <__errno_location@plt>
    1c80:	83 38 04             	cmpl   $0x4,(%rax)
    1c83:	75 55                	jne    1cda <rio_readlineb+0x88>
    1c85:	ba 00 20 00 00       	mov    $0x2000,%edx
    1c8a:	48 89 ee             	mov    %rbp,%rsi
    1c8d:	8b 3b                	mov    (%rbx),%edi
    1c8f:	e8 3c f4 ff ff       	call   10d0 <read@plt>
    1c94:	89 c2                	mov    %eax,%edx
    1c96:	89 43 04             	mov    %eax,0x4(%rbx)
    1c99:	85 c0                	test   %eax,%eax
    1c9b:	78 de                	js     1c7b <rio_readlineb+0x29>
    1c9d:	85 c0                	test   %eax,%eax
    1c9f:	74 42                	je     1ce3 <rio_readlineb+0x91>
    1ca1:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
    1ca5:	48 8b 43 08          	mov    0x8(%rbx),%rax
    1ca9:	0f b6 08             	movzbl (%rax),%ecx
    1cac:	48 83 c0 01          	add    $0x1,%rax
    1cb0:	48 89 43 08          	mov    %rax,0x8(%rbx)
    1cb4:	83 ea 01             	sub    $0x1,%edx
    1cb7:	89 53 04             	mov    %edx,0x4(%rbx)
    1cba:	49 83 c4 01          	add    $0x1,%r12
    1cbe:	41 88 4c 24 ff       	mov    %cl,-0x1(%r12)
    1cc3:	80 f9 0a             	cmp    $0xa,%cl
    1cc6:	74 3c                	je     1d04 <rio_readlineb+0xb2>
    1cc8:	41 83 c5 01          	add    $0x1,%r13d
    1ccc:	4d 39 f4             	cmp    %r14,%r12
    1ccf:	74 30                	je     1d01 <rio_readlineb+0xaf>
    1cd1:	8b 53 04             	mov    0x4(%rbx),%edx
    1cd4:	85 d2                	test   %edx,%edx
    1cd6:	7e ad                	jle    1c85 <rio_readlineb+0x33>
    1cd8:	eb cb                	jmp    1ca5 <rio_readlineb+0x53>
    1cda:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1ce1:	eb 05                	jmp    1ce8 <rio_readlineb+0x96>
    1ce3:	b8 00 00 00 00       	mov    $0x0,%eax
    1ce8:	85 c0                	test   %eax,%eax
    1cea:	75 29                	jne    1d15 <rio_readlineb+0xc3>
    1cec:	b8 00 00 00 00       	mov    $0x0,%eax
    1cf1:	41 83 fd 01          	cmp    $0x1,%r13d
    1cf5:	75 0d                	jne    1d04 <rio_readlineb+0xb2>
    1cf7:	eb 13                	jmp    1d0c <rio_readlineb+0xba>
    1cf9:	41 bd 01 00 00 00    	mov    $0x1,%r13d
    1cff:	eb 03                	jmp    1d04 <rio_readlineb+0xb2>
    1d01:	4d 89 f4             	mov    %r14,%r12
    1d04:	41 c6 04 24 00       	movb   $0x0,(%r12)
    1d09:	49 63 c5             	movslq %r13d,%rax
    1d0c:	5b                   	pop    %rbx
    1d0d:	5d                   	pop    %rbp
    1d0e:	41 5c                	pop    %r12
    1d10:	41 5d                	pop    %r13
    1d12:	41 5e                	pop    %r14
    1d14:	c3                   	ret    
    1d15:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
    1d1c:	eb ee                	jmp    1d0c <rio_readlineb+0xba>

0000000000001d1e <submitr>:
    1d1e:	41 57                	push   %r15
    1d20:	41 56                	push   %r14
    1d22:	41 55                	push   %r13
    1d24:	41 54                	push   %r12
    1d26:	55                   	push   %rbp
    1d27:	53                   	push   %rbx
    1d28:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
    1d2f:	48 89 fd             	mov    %rdi,%rbp
    1d32:	41 89 f5             	mov    %esi,%r13d
    1d35:	48 89 14 24          	mov    %rdx,(%rsp)
    1d39:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    1d3e:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
    1d43:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
    1d48:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
    1d4f:	00 
    1d50:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
    1d57:	00 
    1d58:	c7 84 24 3c 20 00 00 	movl   $0x0,0x203c(%rsp)
    1d5f:	00 00 00 00 
    1d63:	ba 00 00 00 00       	mov    $0x0,%edx
    1d68:	be 01 00 00 00       	mov    $0x1,%esi
    1d6d:	bf 02 00 00 00       	mov    $0x2,%edi
    1d72:	e8 49 f4 ff ff       	call   11c0 <socket@plt>
    1d77:	85 c0                	test   %eax,%eax
    1d79:	0f 88 13 01 00 00    	js     1e92 <submitr+0x174>
    1d7f:	41 89 c4             	mov    %eax,%r12d
    1d82:	48 89 ef             	mov    %rbp,%rdi
    1d85:	e8 76 f3 ff ff       	call   1100 <gethostbyname@plt>
    1d8a:	48 85 c0             	test   %rax,%rax
    1d8d:	0f 84 4f 01 00 00    	je     1ee2 <submitr+0x1c4>
    1d93:	48 8d ac 24 50 a0 00 	lea    0xa050(%rsp),%rbp
    1d9a:	00 
    1d9b:	48 c7 84 24 50 a0 00 	movq   $0x0,0xa050(%rsp)
    1da2:	00 00 00 00 00 
    1da7:	48 c7 84 24 58 a0 00 	movq   $0x0,0xa058(%rsp)
    1dae:	00 00 00 00 00 
    1db3:	66 c7 84 24 50 a0 00 	movw   $0x2,0xa050(%rsp)
    1dba:	00 02 00 
    1dbd:	48 63 50 14          	movslq 0x14(%rax),%rdx
    1dc1:	48 8b 40 18          	mov    0x18(%rax),%rax
    1dc5:	48 8d bc 24 54 a0 00 	lea    0xa054(%rsp),%rdi
    1dcc:	00 
    1dcd:	48 8b 30             	mov    (%rax),%rsi
    1dd0:	e8 7b f3 ff ff       	call   1150 <memmove@plt>
    1dd5:	66 41 c1 c5 08       	rol    $0x8,%r13w
    1dda:	66 44 89 ac 24 52 a0 	mov    %r13w,0xa052(%rsp)
    1de1:	00 00 
    1de3:	ba 10 00 00 00       	mov    $0x10,%edx
    1de8:	48 89 ee             	mov    %rbp,%rsi
    1deb:	44 89 e7             	mov    %r12d,%edi
    1dee:	e8 9d f3 ff ff       	call   1190 <connect@plt>
    1df3:	85 c0                	test   %eax,%eax
    1df5:	0f 88 52 01 00 00    	js     1f4d <submitr+0x22f>
    1dfb:	48 89 df             	mov    %rbx,%rdi
    1dfe:	e8 7d f2 ff ff       	call   1080 <strlen@plt>
    1e03:	48 89 c5             	mov    %rax,%rbp
    1e06:	48 8b 3c 24          	mov    (%rsp),%rdi
    1e0a:	e8 71 f2 ff ff       	call   1080 <strlen@plt>
    1e0f:	49 89 c6             	mov    %rax,%r14
    1e12:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    1e17:	e8 64 f2 ff ff       	call   1080 <strlen@plt>
    1e1c:	49 89 c5             	mov    %rax,%r13
    1e1f:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    1e24:	e8 57 f2 ff ff       	call   1080 <strlen@plt>
    1e29:	48 89 c2             	mov    %rax,%rdx
    1e2c:	4b 8d 84 2e 80 00 00 	lea    0x80(%r14,%r13,1),%rax
    1e33:	00 
    1e34:	48 01 d0             	add    %rdx,%rax
    1e37:	48 8d 54 6d 00       	lea    0x0(%rbp,%rbp,2),%rdx
    1e3c:	48 01 d0             	add    %rdx,%rax
    1e3f:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
    1e45:	0f 87 5f 01 00 00    	ja     1faa <submitr+0x28c>
    1e4b:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
    1e52:	00 
    1e53:	b9 00 04 00 00       	mov    $0x400,%ecx
    1e58:	b8 00 00 00 00       	mov    $0x0,%eax
    1e5d:	48 89 d7             	mov    %rdx,%rdi
    1e60:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    1e63:	48 89 df             	mov    %rbx,%rdi
    1e66:	e8 15 f2 ff ff       	call   1080 <strlen@plt>
    1e6b:	85 c0                	test   %eax,%eax
    1e6d:	0f 84 c8 04 00 00    	je     233b <submitr+0x61d>
    1e73:	8d 40 ff             	lea    -0x1(%rax),%eax
    1e76:	4c 8d 6c 03 01       	lea    0x1(%rbx,%rax,1),%r13
    1e7b:	48 8d ac 24 40 40 00 	lea    0x4040(%rsp),%rbp
    1e82:	00 
    1e83:	49 be d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r14
    1e8a:	00 20 00 
    1e8d:	e9 a5 01 00 00       	jmp    2037 <submitr+0x319>
    1e92:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    1e99:	3a 20 43 
    1e9c:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    1ea3:	20 75 6e 
    1ea6:	49 89 07             	mov    %rax,(%r15)
    1ea9:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1ead:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1eb4:	74 6f 20 
    1eb7:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    1ebe:	65 20 73 
    1ec1:	49 89 47 10          	mov    %rax,0x10(%r15)
    1ec5:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1ec9:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
    1ed0:	65 
    1ed1:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
    1ed8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1edd:	e9 e8 02 00 00       	jmp    21ca <submitr+0x4ac>
    1ee2:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    1ee9:	3a 20 44 
    1eec:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    1ef3:	20 75 6e 
    1ef6:	49 89 07             	mov    %rax,(%r15)
    1ef9:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1efd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    1f04:	74 6f 20 
    1f07:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    1f0e:	76 65 20 
    1f11:	49 89 47 10          	mov    %rax,0x10(%r15)
    1f15:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1f19:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    1f20:	72 20 61 
    1f23:	49 89 47 20          	mov    %rax,0x20(%r15)
    1f27:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
    1f2e:	65 
    1f2f:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
    1f36:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
    1f3b:	44 89 e7             	mov    %r12d,%edi
    1f3e:	e8 7d f1 ff ff       	call   10c0 <close@plt>
    1f43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1f48:	e9 7d 02 00 00       	jmp    21ca <submitr+0x4ac>
    1f4d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
    1f54:	3a 20 55 
    1f57:	48 ba 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rdx
    1f5e:	20 74 6f 
    1f61:	49 89 07             	mov    %rax,(%r15)
    1f64:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1f68:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
    1f6f:	65 63 74 
    1f72:	48 ba 20 74 6f 20 74 	movabs $0x20656874206f7420,%rdx
    1f79:	68 65 20 
    1f7c:	49 89 47 10          	mov    %rax,0x10(%r15)
    1f80:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1f84:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
    1f8b:	76 
    1f8c:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
    1f93:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
    1f98:	44 89 e7             	mov    %r12d,%edi
    1f9b:	e8 20 f1 ff ff       	call   10c0 <close@plt>
    1fa0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    1fa5:	e9 20 02 00 00       	jmp    21ca <submitr+0x4ac>
    1faa:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    1fb1:	3a 20 52 
    1fb4:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    1fbb:	20 73 74 
    1fbe:	49 89 07             	mov    %rax,(%r15)
    1fc1:	49 89 57 08          	mov    %rdx,0x8(%r15)
    1fc5:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
    1fcc:	74 6f 6f 
    1fcf:	48 ba 20 6c 61 72 67 	movabs $0x202e656772616c20,%rdx
    1fd6:	65 2e 20 
    1fd9:	49 89 47 10          	mov    %rax,0x10(%r15)
    1fdd:	49 89 57 18          	mov    %rdx,0x18(%r15)
    1fe1:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
    1fe8:	61 73 65 
    1feb:	48 ba 20 53 55 42 4d 	movabs $0x5254494d42555320,%rdx
    1ff2:	49 54 52 
    1ff5:	49 89 47 20          	mov    %rax,0x20(%r15)
    1ff9:	49 89 57 28          	mov    %rdx,0x28(%r15)
    1ffd:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
    2004:	55 46 00 
    2007:	49 89 47 30          	mov    %rax,0x30(%r15)
    200b:	44 89 e7             	mov    %r12d,%edi
    200e:	e8 ad f0 ff ff       	call   10c0 <close@plt>
    2013:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2018:	e9 ad 01 00 00       	jmp    21ca <submitr+0x4ac>
    201d:	49 0f a3 c6          	bt     %rax,%r14
    2021:	73 1e                	jae    2041 <submitr+0x323>
    2023:	88 4d 00             	mov    %cl,0x0(%rbp)
    2026:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    202a:	48 83 c3 01          	add    $0x1,%rbx
    202e:	4c 39 eb             	cmp    %r13,%rbx
    2031:	0f 84 04 03 00 00    	je     233b <submitr+0x61d>
    2037:	0f b6 0b             	movzbl (%rbx),%ecx
    203a:	8d 41 d6             	lea    -0x2a(%rcx),%eax
    203d:	3c 35                	cmp    $0x35,%al
    203f:	76 dc                	jbe    201d <submitr+0x2ff>
    2041:	89 c8                	mov    %ecx,%eax
    2043:	83 e0 df             	and    $0xffffffdf,%eax
    2046:	83 e8 41             	sub    $0x41,%eax
    2049:	3c 19                	cmp    $0x19,%al
    204b:	76 d6                	jbe    2023 <submitr+0x305>
    204d:	80 f9 20             	cmp    $0x20,%cl
    2050:	74 4c                	je     209e <submitr+0x380>
    2052:	8d 41 e0             	lea    -0x20(%rcx),%eax
    2055:	3c 5f                	cmp    $0x5f,%al
    2057:	76 09                	jbe    2062 <submitr+0x344>
    2059:	80 f9 09             	cmp    $0x9,%cl
    205c:	0f 85 4c 02 00 00    	jne    22ae <submitr+0x590>
    2062:	0f b6 c9             	movzbl %cl,%ecx
    2065:	48 8d 7c 24 28       	lea    0x28(%rsp),%rdi
    206a:	48 8d 15 dd 13 00 00 	lea    0x13dd(%rip),%rdx        # 344e <array.0+0x2ae>
    2071:	be 08 00 00 00       	mov    $0x8,%esi
    2076:	b8 00 00 00 00       	mov    $0x0,%eax
    207b:	e8 20 f0 ff ff       	call   10a0 <snprintf@plt>
    2080:	0f b6 44 24 28       	movzbl 0x28(%rsp),%eax
    2085:	88 45 00             	mov    %al,0x0(%rbp)
    2088:	0f b6 44 24 29       	movzbl 0x29(%rsp),%eax
    208d:	88 45 01             	mov    %al,0x1(%rbp)
    2090:	0f b6 44 24 2a       	movzbl 0x2a(%rsp),%eax
    2095:	88 45 02             	mov    %al,0x2(%rbp)
    2098:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
    209c:	eb 8c                	jmp    202a <submitr+0x30c>
    209e:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
    20a2:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
    20a6:	eb 82                	jmp    202a <submitr+0x30c>
    20a8:	48 01 c5             	add    %rax,%rbp
    20ab:	48 29 c3             	sub    %rax,%rbx
    20ae:	0f 84 ea 02 00 00    	je     239e <submitr+0x680>
    20b4:	48 89 da             	mov    %rbx,%rdx
    20b7:	48 89 ee             	mov    %rbp,%rsi
    20ba:	44 89 e7             	mov    %r12d,%edi
    20bd:	e8 ae ef ff ff       	call   1070 <write@plt>
    20c2:	48 85 c0             	test   %rax,%rax
    20c5:	7f e1                	jg     20a8 <submitr+0x38a>
    20c7:	e8 74 ef ff ff       	call   1040 <__errno_location@plt>
    20cc:	83 38 04             	cmpl   $0x4,(%rax)
    20cf:	0f 85 7a 01 00 00    	jne    224f <submitr+0x531>
    20d5:	4c 89 e8             	mov    %r13,%rax
    20d8:	eb ce                	jmp    20a8 <submitr+0x38a>
    20da:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    20e1:	3a 20 43 
    20e4:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    20eb:	20 75 6e 
    20ee:	49 89 07             	mov    %rax,(%r15)
    20f1:	49 89 57 08          	mov    %rdx,0x8(%r15)
    20f5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    20fc:	74 6f 20 
    20ff:	48 ba 72 65 61 64 20 	movabs $0x7269662064616572,%rdx
    2106:	66 69 72 
    2109:	49 89 47 10          	mov    %rax,0x10(%r15)
    210d:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2111:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
    2118:	61 64 65 
    211b:	48 ba 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rdx
    2122:	6d 20 73 
    2125:	49 89 47 20          	mov    %rax,0x20(%r15)
    2129:	49 89 57 28          	mov    %rdx,0x28(%r15)
    212d:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
    2134:	65 
    2135:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
    213c:	44 89 e7             	mov    %r12d,%edi
    213f:	e8 7c ef ff ff       	call   10c0 <close@plt>
    2144:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2149:	eb 7f                	jmp    21ca <submitr+0x4ac>
    214b:	48 8d 4c 24 30       	lea    0x30(%rsp),%rcx
    2150:	48 8d 35 49 12 00 00 	lea    0x1249(%rip),%rsi        # 33a0 <array.0+0x200>
    2157:	4c 89 ff             	mov    %r15,%rdi
    215a:	b8 00 00 00 00       	mov    $0x0,%eax
    215f:	e8 0c f0 ff ff       	call   1170 <sprintf@plt>
    2164:	44 89 e7             	mov    %r12d,%edi
    2167:	e8 54 ef ff ff       	call   10c0 <close@plt>
    216c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2171:	eb 57                	jmp    21ca <submitr+0x4ac>
    2173:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    217a:	00 
    217b:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    2182:	00 
    2183:	ba 00 20 00 00       	mov    $0x2000,%edx
    2188:	e8 c5 fa ff ff       	call   1c52 <rio_readlineb>
    218d:	48 85 c0             	test   %rax,%rax
    2190:	7e 4a                	jle    21dc <submitr+0x4be>
    2192:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2199:	00 
    219a:	4c 89 ff             	mov    %r15,%rdi
    219d:	e8 ae ee ff ff       	call   1050 <strcpy@plt>
    21a2:	44 89 e7             	mov    %r12d,%edi
    21a5:	e8 16 ef ff ff       	call   10c0 <close@plt>
    21aa:	b9 03 00 00 00       	mov    $0x3,%ecx
    21af:	48 8d 3d b3 12 00 00 	lea    0x12b3(%rip),%rdi        # 3469 <array.0+0x2c9>
    21b6:	4c 89 fe             	mov    %r15,%rsi
    21b9:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    21bb:	0f 97 c0             	seta   %al
    21be:	1c 00                	sbb    $0x0,%al
    21c0:	84 c0                	test   %al,%al
    21c2:	0f 95 c0             	setne  %al
    21c5:	0f b6 c0             	movzbl %al,%eax
    21c8:	f7 d8                	neg    %eax
    21ca:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
    21d1:	5b                   	pop    %rbx
    21d2:	5d                   	pop    %rbp
    21d3:	41 5c                	pop    %r12
    21d5:	41 5d                	pop    %r13
    21d7:	41 5e                	pop    %r14
    21d9:	41 5f                	pop    %r15
    21db:	c3                   	ret    
    21dc:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    21e3:	3a 20 43 
    21e6:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    21ed:	20 75 6e 
    21f0:	49 89 07             	mov    %rax,(%r15)
    21f3:	49 89 57 08          	mov    %rdx,0x8(%r15)
    21f7:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    21fe:	74 6f 20 
    2201:	48 ba 72 65 61 64 20 	movabs $0x6174732064616572,%rdx
    2208:	73 74 61 
    220b:	49 89 47 10          	mov    %rax,0x10(%r15)
    220f:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2213:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
    221a:	65 73 73 
    221d:	48 ba 61 67 65 20 66 	movabs $0x6d6f726620656761,%rdx
    2224:	72 6f 6d 
    2227:	49 89 47 20          	mov    %rax,0x20(%r15)
    222b:	49 89 57 28          	mov    %rdx,0x28(%r15)
    222f:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
    2236:	65 72 00 
    2239:	49 89 47 30          	mov    %rax,0x30(%r15)
    223d:	44 89 e7             	mov    %r12d,%edi
    2240:	e8 7b ee ff ff       	call   10c0 <close@plt>
    2245:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    224a:	e9 7b ff ff ff       	jmp    21ca <submitr+0x4ac>
    224f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2256:	3a 20 43 
    2259:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    2260:	20 75 6e 
    2263:	49 89 07             	mov    %rax,(%r15)
    2266:	49 89 57 08          	mov    %rdx,0x8(%r15)
    226a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2271:	74 6f 20 
    2274:	48 ba 77 72 69 74 65 	movabs $0x6f74206574697277,%rdx
    227b:	20 74 6f 
    227e:	49 89 47 10          	mov    %rax,0x10(%r15)
    2282:	49 89 57 18          	mov    %rdx,0x18(%r15)
    2286:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
    228d:	73 65 72 
    2290:	49 89 47 20          	mov    %rax,0x20(%r15)
    2294:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
    229b:	00 
    229c:	44 89 e7             	mov    %r12d,%edi
    229f:	e8 1c ee ff ff       	call   10c0 <close@plt>
    22a4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    22a9:	e9 1c ff ff ff       	jmp    21ca <submitr+0x4ac>
    22ae:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
    22b5:	3a 20 52 
    22b8:	48 ba 65 73 75 6c 74 	movabs $0x747320746c757365,%rdx
    22bf:	20 73 74 
    22c2:	49 89 07             	mov    %rax,(%r15)
    22c5:	49 89 57 08          	mov    %rdx,0x8(%r15)
    22c9:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
    22d0:	63 6f 6e 
    22d3:	48 ba 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rdx
    22da:	20 61 6e 
    22dd:	49 89 47 10          	mov    %rax,0x10(%r15)
    22e1:	49 89 57 18          	mov    %rdx,0x18(%r15)
    22e5:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
    22ec:	67 61 6c 
    22ef:	48 ba 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rdx
    22f6:	6e 70 72 
    22f9:	49 89 47 20          	mov    %rax,0x20(%r15)
    22fd:	49 89 57 28          	mov    %rdx,0x28(%r15)
    2301:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
    2308:	6c 65 20 
    230b:	48 ba 63 68 61 72 61 	movabs $0x6574636172616863,%rdx
    2312:	63 74 65 
    2315:	49 89 47 30          	mov    %rax,0x30(%r15)
    2319:	49 89 57 38          	mov    %rdx,0x38(%r15)
    231d:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
    2324:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
    2329:	44 89 e7             	mov    %r12d,%edi
    232c:	e8 8f ed ff ff       	call   10c0 <close@plt>
    2331:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2336:	e9 8f fe ff ff       	jmp    21ca <submitr+0x4ac>
    233b:	48 8d 9c 24 40 60 00 	lea    0x6040(%rsp),%rbx
    2342:	00 
    2343:	48 8d 84 24 40 40 00 	lea    0x4040(%rsp),%rax
    234a:	00 
    234b:	50                   	push   %rax
    234c:	ff 74 24 18          	push   0x18(%rsp)
    2350:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
    2355:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    235a:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    235f:	48 8d 15 6a 10 00 00 	lea    0x106a(%rip),%rdx        # 33d0 <array.0+0x230>
    2366:	be 00 20 00 00       	mov    $0x2000,%esi
    236b:	48 89 df             	mov    %rbx,%rdi
    236e:	b8 00 00 00 00       	mov    $0x0,%eax
    2373:	e8 28 ed ff ff       	call   10a0 <snprintf@plt>
    2378:	48 89 df             	mov    %rbx,%rdi
    237b:	e8 00 ed ff ff       	call   1080 <strlen@plt>
    2380:	48 89 c3             	mov    %rax,%rbx
    2383:	48 83 c4 10          	add    $0x10,%rsp
    2387:	48 8d ac 24 40 60 00 	lea    0x6040(%rsp),%rbp
    238e:	00 
    238f:	41 bd 00 00 00 00    	mov    $0x0,%r13d
    2395:	48 85 c0             	test   %rax,%rax
    2398:	0f 85 16 fd ff ff    	jne    20b4 <submitr+0x396>
    239e:	44 89 a4 24 40 80 00 	mov    %r12d,0x8040(%rsp)
    23a5:	00 
    23a6:	c7 84 24 44 80 00 00 	movl   $0x0,0x8044(%rsp)
    23ad:	00 00 00 00 
    23b1:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    23b8:	00 
    23b9:	48 8d 84 24 50 80 00 	lea    0x8050(%rsp),%rax
    23c0:	00 
    23c1:	48 89 84 24 48 80 00 	mov    %rax,0x8048(%rsp)
    23c8:	00 
    23c9:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    23d0:	00 
    23d1:	ba 00 20 00 00       	mov    $0x2000,%edx
    23d6:	e8 77 f8 ff ff       	call   1c52 <rio_readlineb>
    23db:	48 85 c0             	test   %rax,%rax
    23de:	0f 8e f6 fc ff ff    	jle    20da <submitr+0x3bc>
    23e4:	48 8d 8c 24 3c 20 00 	lea    0x203c(%rsp),%rcx
    23eb:	00 
    23ec:	48 8d 94 24 40 20 00 	lea    0x2040(%rsp),%rdx
    23f3:	00 
    23f4:	48 8d bc 24 40 60 00 	lea    0x6040(%rsp),%rdi
    23fb:	00 
    23fc:	4c 8d 44 24 30       	lea    0x30(%rsp),%r8
    2401:	48 8d 35 4d 10 00 00 	lea    0x104d(%rip),%rsi        # 3455 <array.0+0x2b5>
    2408:	b8 00 00 00 00       	mov    $0x0,%eax
    240d:	e8 2e ed ff ff       	call   1140 <__isoc99_sscanf@plt>
    2412:	8b 94 24 3c 20 00 00 	mov    0x203c(%rsp),%edx
    2419:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
    241f:	0f 85 26 fd ff ff    	jne    214b <submitr+0x42d>
    2425:	48 8d 1d 3a 10 00 00 	lea    0x103a(%rip),%rbx        # 3466 <array.0+0x2c6>
    242c:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2433:	00 
    2434:	b9 03 00 00 00       	mov    $0x3,%ecx
    2439:	48 89 df             	mov    %rbx,%rdi
    243c:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
    243e:	0f 97 c0             	seta   %al
    2441:	1c 00                	sbb    $0x0,%al
    2443:	84 c0                	test   %al,%al
    2445:	0f 84 28 fd ff ff    	je     2173 <submitr+0x455>
    244b:	48 8d b4 24 40 60 00 	lea    0x6040(%rsp),%rsi
    2452:	00 
    2453:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
    245a:	00 
    245b:	ba 00 20 00 00       	mov    $0x2000,%edx
    2460:	e8 ed f7 ff ff       	call   1c52 <rio_readlineb>
    2465:	48 85 c0             	test   %rax,%rax
    2468:	7f c2                	jg     242c <submitr+0x70e>
    246a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    2471:	3a 20 43 
    2474:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    247b:	20 75 6e 
    247e:	49 89 07             	mov    %rax,(%r15)
    2481:	49 89 57 08          	mov    %rdx,0x8(%r15)
    2485:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    248c:	74 6f 20 
    248f:	48 ba 72 65 61 64 20 	movabs $0x6165682064616572,%rdx
    2496:	68 65 61 
    2499:	49 89 47 10          	mov    %rax,0x10(%r15)
    249d:	49 89 57 18          	mov    %rdx,0x18(%r15)
    24a1:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
    24a8:	66 72 6f 
    24ab:	48 ba 6d 20 73 65 72 	movabs $0x726576726573206d,%rdx
    24b2:	76 65 72 
    24b5:	49 89 47 20          	mov    %rax,0x20(%r15)
    24b9:	49 89 57 28          	mov    %rdx,0x28(%r15)
    24bd:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
    24c2:	44 89 e7             	mov    %r12d,%edi
    24c5:	e8 f6 eb ff ff       	call   10c0 <close@plt>
    24ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    24cf:	e9 f6 fc ff ff       	jmp    21ca <submitr+0x4ac>

00000000000024d4 <init_timeout>:
    24d4:	85 ff                	test   %edi,%edi
    24d6:	75 01                	jne    24d9 <init_timeout+0x5>
    24d8:	c3                   	ret    
    24d9:	53                   	push   %rbx
    24da:	89 fb                	mov    %edi,%ebx
    24dc:	48 8d 35 44 f7 ff ff 	lea    -0x8bc(%rip),%rsi        # 1c27 <sigalrm_handler>
    24e3:	bf 0e 00 00 00       	mov    $0xe,%edi
    24e8:	e8 03 ec ff ff       	call   10f0 <signal@plt>
    24ed:	85 db                	test   %ebx,%ebx
    24ef:	bf 00 00 00 00       	mov    $0x0,%edi
    24f4:	0f 49 fb             	cmovns %ebx,%edi
    24f7:	e8 b4 eb ff ff       	call   10b0 <alarm@plt>
    24fc:	5b                   	pop    %rbx
    24fd:	c3                   	ret    

00000000000024fe <init_driver>:
    24fe:	41 54                	push   %r12
    2500:	55                   	push   %rbp
    2501:	53                   	push   %rbx
    2502:	48 83 ec 10          	sub    $0x10,%rsp
    2506:	48 89 fd             	mov    %rdi,%rbp
    2509:	be 01 00 00 00       	mov    $0x1,%esi
    250e:	bf 0d 00 00 00       	mov    $0xd,%edi
    2513:	e8 d8 eb ff ff       	call   10f0 <signal@plt>
    2518:	be 01 00 00 00       	mov    $0x1,%esi
    251d:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2522:	e8 c9 eb ff ff       	call   10f0 <signal@plt>
    2527:	be 01 00 00 00       	mov    $0x1,%esi
    252c:	bf 1d 00 00 00       	mov    $0x1d,%edi
    2531:	e8 ba eb ff ff       	call   10f0 <signal@plt>
    2536:	ba 00 00 00 00       	mov    $0x0,%edx
    253b:	be 01 00 00 00       	mov    $0x1,%esi
    2540:	bf 02 00 00 00       	mov    $0x2,%edi
    2545:	e8 76 ec ff ff       	call   11c0 <socket@plt>
    254a:	85 c0                	test   %eax,%eax
    254c:	0f 88 83 00 00 00    	js     25d5 <init_driver+0xd7>
    2552:	89 c3                	mov    %eax,%ebx
    2554:	48 8d 3d 11 0f 00 00 	lea    0xf11(%rip),%rdi        # 346c <array.0+0x2cc>
    255b:	e8 a0 eb ff ff       	call   1100 <gethostbyname@plt>
    2560:	48 85 c0             	test   %rax,%rax
    2563:	0f 84 b8 00 00 00    	je     2621 <init_driver+0x123>
    2569:	49 89 e4             	mov    %rsp,%r12
    256c:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
    2573:	00 
    2574:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
    257b:	00 00 
    257d:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
    2583:	48 63 50 14          	movslq 0x14(%rax),%rdx
    2587:	48 8b 40 18          	mov    0x18(%rax),%rax
    258b:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
    2590:	48 8b 30             	mov    (%rax),%rsi
    2593:	e8 b8 eb ff ff       	call   1150 <memmove@plt>
    2598:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
    259f:	ba 10 00 00 00       	mov    $0x10,%edx
    25a4:	4c 89 e6             	mov    %r12,%rsi
    25a7:	89 df                	mov    %ebx,%edi
    25a9:	e8 e2 eb ff ff       	call   1190 <connect@plt>
    25ae:	85 c0                	test   %eax,%eax
    25b0:	0f 88 d3 00 00 00    	js     2689 <init_driver+0x18b>
    25b6:	89 df                	mov    %ebx,%edi
    25b8:	e8 03 eb ff ff       	call   10c0 <close@plt>
    25bd:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
    25c3:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
    25c7:	b8 00 00 00 00       	mov    $0x0,%eax
    25cc:	48 83 c4 10          	add    $0x10,%rsp
    25d0:	5b                   	pop    %rbx
    25d1:	5d                   	pop    %rbp
    25d2:	41 5c                	pop    %r12
    25d4:	c3                   	ret    
    25d5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
    25dc:	3a 20 43 
    25df:	48 ba 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rdx
    25e6:	20 75 6e 
    25e9:	48 89 45 00          	mov    %rax,0x0(%rbp)
    25ed:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    25f1:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    25f8:	74 6f 20 
    25fb:	48 ba 63 72 65 61 74 	movabs $0x7320657461657263,%rdx
    2602:	65 20 73 
    2605:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2609:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    260d:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
    2614:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
    261a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    261f:	eb ab                	jmp    25cc <init_driver+0xce>
    2621:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
    2628:	3a 20 44 
    262b:	48 ba 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rdx
    2632:	20 75 6e 
    2635:	48 89 45 00          	mov    %rax,0x0(%rbp)
    2639:	48 89 55 08          	mov    %rdx,0x8(%rbp)
    263d:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
    2644:	74 6f 20 
    2647:	48 ba 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rdx
    264e:	76 65 20 
    2651:	48 89 45 10          	mov    %rax,0x10(%rbp)
    2655:	48 89 55 18          	mov    %rdx,0x18(%rbp)
    2659:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
    2660:	72 20 61 
    2663:	48 89 45 20          	mov    %rax,0x20(%rbp)
    2667:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
    266e:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
    2674:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
    2678:	89 df                	mov    %ebx,%edi
    267a:	e8 41 ea ff ff       	call   10c0 <close@plt>
    267f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    2684:	e9 43 ff ff ff       	jmp    25cc <init_driver+0xce>
    2689:	48 8d 15 dc 0d 00 00 	lea    0xddc(%rip),%rdx        # 346c <array.0+0x2cc>
    2690:	48 8d 35 91 0d 00 00 	lea    0xd91(%rip),%rsi        # 3428 <array.0+0x288>
    2697:	48 89 ef             	mov    %rbp,%rdi
    269a:	b8 00 00 00 00       	mov    $0x0,%eax
    269f:	e8 cc ea ff ff       	call   1170 <sprintf@plt>
    26a4:	89 df                	mov    %ebx,%edi
    26a6:	e8 15 ea ff ff       	call   10c0 <close@plt>
    26ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    26b0:	e9 17 ff ff ff       	jmp    25cc <init_driver+0xce>

00000000000026b5 <driver_post>:
    26b5:	53                   	push   %rbx
    26b6:	4c 89 c3             	mov    %r8,%rbx
    26b9:	85 c9                	test   %ecx,%ecx
    26bb:	75 17                	jne    26d4 <driver_post+0x1f>
    26bd:	48 85 ff             	test   %rdi,%rdi
    26c0:	74 05                	je     26c7 <driver_post+0x12>
    26c2:	80 3f 00             	cmpb   $0x0,(%rdi)
    26c5:	75 31                	jne    26f8 <driver_post+0x43>
    26c7:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    26cc:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    26d0:	89 c8                	mov    %ecx,%eax
    26d2:	5b                   	pop    %rbx
    26d3:	c3                   	ret    
    26d4:	48 89 d6             	mov    %rdx,%rsi
    26d7:	48 8d 3d a6 0d 00 00 	lea    0xda6(%rip),%rdi        # 3484 <array.0+0x2e4>
    26de:	b8 00 00 00 00       	mov    $0x0,%eax
    26e3:	e8 a8 e9 ff ff       	call   1090 <printf@plt>
    26e8:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
    26ed:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
    26f1:	b8 00 00 00 00       	mov    $0x0,%eax
    26f6:	eb da                	jmp    26d2 <driver_post+0x1d>
    26f8:	41 50                	push   %r8
    26fa:	52                   	push   %rdx
    26fb:	4c 8d 0d 99 0d 00 00 	lea    0xd99(%rip),%r9        # 349b <array.0+0x2fb>
    2702:	49 89 f0             	mov    %rsi,%r8
    2705:	48 89 f9             	mov    %rdi,%rcx
    2708:	48 8d 15 94 0d 00 00 	lea    0xd94(%rip),%rdx        # 34a3 <array.0+0x303>
    270f:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
    2714:	48 8d 3d 51 0d 00 00 	lea    0xd51(%rip),%rdi        # 346c <array.0+0x2cc>
    271b:	e8 fe f5 ff ff       	call   1d1e <submitr>
    2720:	48 83 c4 10          	add    $0x10,%rsp
    2724:	eb ac                	jmp    26d2 <driver_post+0x1d>
    2726:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    272d:	00 00 00 

0000000000002730 <__libc_csu_init>:
    2730:	41 57                	push   %r15
    2732:	4c 8d 3d af 26 00 00 	lea    0x26af(%rip),%r15        # 4de8 <__frame_dummy_init_array_entry>
    2739:	41 56                	push   %r14
    273b:	49 89 d6             	mov    %rdx,%r14
    273e:	41 55                	push   %r13
    2740:	49 89 f5             	mov    %rsi,%r13
    2743:	41 54                	push   %r12
    2745:	41 89 fc             	mov    %edi,%r12d
    2748:	55                   	push   %rbp
    2749:	48 8d 2d a0 26 00 00 	lea    0x26a0(%rip),%rbp        # 4df0 <__do_global_dtors_aux_fini_array_entry>
    2750:	53                   	push   %rbx
    2751:	4c 29 fd             	sub    %r15,%rbp
    2754:	48 83 ec 08          	sub    $0x8,%rsp
    2758:	e8 a3 e8 ff ff       	call   1000 <_init>
    275d:	48 c1 fd 03          	sar    $0x3,%rbp
    2761:	74 1b                	je     277e <__libc_csu_init+0x4e>
    2763:	31 db                	xor    %ebx,%ebx
    2765:	0f 1f 00             	nopl   (%rax)
    2768:	4c 89 f2             	mov    %r14,%rdx
    276b:	4c 89 ee             	mov    %r13,%rsi
    276e:	44 89 e7             	mov    %r12d,%edi
    2771:	41 ff 14 df          	call   *(%r15,%rbx,8)
    2775:	48 83 c3 01          	add    $0x1,%rbx
    2779:	48 39 dd             	cmp    %rbx,%rbp
    277c:	75 ea                	jne    2768 <__libc_csu_init+0x38>
    277e:	48 83 c4 08          	add    $0x8,%rsp
    2782:	5b                   	pop    %rbx
    2783:	5d                   	pop    %rbp
    2784:	41 5c                	pop    %r12
    2786:	41 5d                	pop    %r13
    2788:	41 5e                	pop    %r14
    278a:	41 5f                	pop    %r15
    278c:	c3                   	ret    
    278d:	0f 1f 00             	nopl   (%rax)

0000000000002790 <__libc_csu_fini>:
    2790:	c3                   	ret    

Disassembly of section .fini:

0000000000002794 <_fini>:
    2794:	48 83 ec 08          	sub    $0x8,%rsp
    2798:	48 83 c4 08          	add    $0x8,%rsp
    279c:	c3                   	ret    
