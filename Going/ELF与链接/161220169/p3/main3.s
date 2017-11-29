
linkbomb:     file format elf32-i386


Disassembly of section .init:

080482cc <_init>:
 80482cc:	53                   	push   %ebx
 80482cd:	83 ec 08             	sub    $0x8,%esp
 80482d0:	e8 9b 00 00 00       	call   8048370 <__x86.get_pc_thunk.bx>
 80482d5:	81 c3 2b 1d 00 00    	add    $0x1d2b,%ebx
 80482db:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80482e1:	85 c0                	test   %eax,%eax
 80482e3:	74 05                	je     80482ea <_init+0x1e>
 80482e5:	e8 46 00 00 00       	call   8048330 <putchar@plt+0x10>
 80482ea:	83 c4 08             	add    $0x8,%esp
 80482ed:	5b                   	pop    %ebx
 80482ee:	c3                   	ret    

Disassembly of section .plt:

080482f0 <puts@plt-0x10>:
 80482f0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80482f6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80482fc:	00 00                	add    %al,(%eax)
	...

08048300 <puts@plt>:
 8048300:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048306:	68 00 00 00 00       	push   $0x0
 804830b:	e9 e0 ff ff ff       	jmp    80482f0 <_init+0x24>

08048310 <__libc_start_main@plt>:
 8048310:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048316:	68 08 00 00 00       	push   $0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <_init+0x24>

08048320 <putchar@plt>:
 8048320:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048326:	68 10 00 00 00       	push   $0x10
 804832b:	e9 c0 ff ff ff       	jmp    80482f0 <_init+0x24>

Disassembly of section .plt.got:

08048330 <.plt.got>:
 8048330:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048336:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048340 <_start>:
 8048340:	31 ed                	xor    %ebp,%ebp
 8048342:	5e                   	pop    %esi
 8048343:	89 e1                	mov    %esp,%ecx
 8048345:	83 e4 f0             	and    $0xfffffff0,%esp
 8048348:	50                   	push   %eax
 8048349:	54                   	push   %esp
 804834a:	52                   	push   %edx
 804834b:	68 40 85 04 08       	push   $0x8048540
 8048350:	68 e0 84 04 08       	push   $0x80484e0
 8048355:	51                   	push   %ecx
 8048356:	56                   	push   %esi
 8048357:	68 3b 84 04 08       	push   $0x804843b
 804835c:	e8 af ff ff ff       	call   8048310 <__libc_start_main@plt>
 8048361:	f4                   	hlt    
 8048362:	66 90                	xchg   %ax,%ax
 8048364:	66 90                	xchg   %ax,%ax
 8048366:	66 90                	xchg   %ax,%ax
 8048368:	66 90                	xchg   %ax,%ax
 804836a:	66 90                	xchg   %ax,%ax
 804836c:	66 90                	xchg   %ax,%ax
 804836e:	66 90                	xchg   %ax,%ax

08048370 <__x86.get_pc_thunk.bx>:
 8048370:	8b 1c 24             	mov    (%esp),%ebx
 8048373:	c3                   	ret    
 8048374:	66 90                	xchg   %ax,%ax
 8048376:	66 90                	xchg   %ax,%ax
 8048378:	66 90                	xchg   %ax,%ax
 804837a:	66 90                	xchg   %ax,%ax
 804837c:	66 90                	xchg   %ax,%ax
 804837e:	66 90                	xchg   %ax,%ax

08048380 <deregister_tm_clones>:
 8048380:	b8 63 a1 04 08       	mov    $0x804a163,%eax
 8048385:	2d 60 a1 04 08       	sub    $0x804a160,%eax
 804838a:	83 f8 06             	cmp    $0x6,%eax
 804838d:	76 1a                	jbe    80483a9 <deregister_tm_clones+0x29>
 804838f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048394:	85 c0                	test   %eax,%eax
 8048396:	74 11                	je     80483a9 <deregister_tm_clones+0x29>
 8048398:	55                   	push   %ebp
 8048399:	89 e5                	mov    %esp,%ebp
 804839b:	83 ec 14             	sub    $0x14,%esp
 804839e:	68 60 a1 04 08       	push   $0x804a160
 80483a3:	ff d0                	call   *%eax
 80483a5:	83 c4 10             	add    $0x10,%esp
 80483a8:	c9                   	leave  
 80483a9:	f3 c3                	repz ret 
 80483ab:	90                   	nop
 80483ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080483b0 <register_tm_clones>:
 80483b0:	b8 60 a1 04 08       	mov    $0x804a160,%eax
 80483b5:	2d 60 a1 04 08       	sub    $0x804a160,%eax
 80483ba:	c1 f8 02             	sar    $0x2,%eax
 80483bd:	89 c2                	mov    %eax,%edx
 80483bf:	c1 ea 1f             	shr    $0x1f,%edx
 80483c2:	01 d0                	add    %edx,%eax
 80483c4:	d1 f8                	sar    %eax
 80483c6:	74 1b                	je     80483e3 <register_tm_clones+0x33>
 80483c8:	ba 00 00 00 00       	mov    $0x0,%edx
 80483cd:	85 d2                	test   %edx,%edx
 80483cf:	74 12                	je     80483e3 <register_tm_clones+0x33>
 80483d1:	55                   	push   %ebp
 80483d2:	89 e5                	mov    %esp,%ebp
 80483d4:	83 ec 10             	sub    $0x10,%esp
 80483d7:	50                   	push   %eax
 80483d8:	68 60 a1 04 08       	push   $0x804a160
 80483dd:	ff d2                	call   *%edx
 80483df:	83 c4 10             	add    $0x10,%esp
 80483e2:	c9                   	leave  
 80483e3:	f3 c3                	repz ret 
 80483e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483f0 <__do_global_dtors_aux>:
 80483f0:	80 3d 60 a1 04 08 00 	cmpb   $0x0,0x804a160
 80483f7:	75 13                	jne    804840c <__do_global_dtors_aux+0x1c>
 80483f9:	55                   	push   %ebp
 80483fa:	89 e5                	mov    %esp,%ebp
 80483fc:	83 ec 08             	sub    $0x8,%esp
 80483ff:	e8 7c ff ff ff       	call   8048380 <deregister_tm_clones>
 8048404:	c6 05 60 a1 04 08 01 	movb   $0x1,0x804a160
 804840b:	c9                   	leave  
 804840c:	f3 c3                	repz ret 
 804840e:	66 90                	xchg   %ax,%ax

08048410 <frame_dummy>:
 8048410:	b8 10 9f 04 08       	mov    $0x8049f10,%eax
 8048415:	8b 10                	mov    (%eax),%edx
 8048417:	85 d2                	test   %edx,%edx
 8048419:	75 05                	jne    8048420 <frame_dummy+0x10>
 804841b:	eb 93                	jmp    80483b0 <register_tm_clones>
 804841d:	8d 76 00             	lea    0x0(%esi),%esi
 8048420:	ba 00 00 00 00       	mov    $0x0,%edx
 8048425:	85 d2                	test   %edx,%edx
 8048427:	74 f2                	je     804841b <frame_dummy+0xb>
 8048429:	55                   	push   %ebp
 804842a:	89 e5                	mov    %esp,%ebp
 804842c:	83 ec 14             	sub    $0x14,%esp
 804842f:	50                   	push   %eax
 8048430:	ff d2                	call   *%edx
 8048432:	83 c4 10             	add    $0x10,%esp
 8048435:	c9                   	leave  
 8048436:	e9 75 ff ff ff       	jmp    80483b0 <register_tm_clones>

0804843b <main>:
 804843b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804843f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048442:	ff 71 fc             	pushl  -0x4(%ecx)
 8048445:	55                   	push   %ebp
 8048446:	89 e5                	mov    %esp,%ebp
 8048448:	51                   	push   %ecx
 8048449:	83 ec 04             	sub    $0x4,%esp
 804844c:	a1 28 a0 04 08       	mov    0x804a028,%eax
 8048451:	85 c0                	test   %eax,%eax
 8048453:	74 09                	je     804845e <main+0x23>
 8048455:	a1 28 a0 04 08       	mov    0x804a028,%eax
 804845a:	ff d0                	call   *%eax
 804845c:	eb 10                	jmp    804846e <main+0x33>
 804845e:	83 ec 0c             	sub    $0xc,%esp
 8048461:	68 78 86 04 08       	push   $0x8048678
 8048466:	e8 95 fe ff ff       	call   8048300 <puts@plt>
 804846b:	83 c4 10             	add    $0x10,%esp
 804846e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048473:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048476:	c9                   	leave  
 8048477:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804847a:	c3                   	ret    

0804847b <do_phase>:
 804847b:	55                   	push   %ebp
 804847c:	89 e5                	mov    %esp,%ebp
 804847e:	83 ec 18             	sub    $0x18,%esp
 8048481:	c7 45 ea 7a 69 77 64 	movl   $0x6477697a,-0x16(%ebp)
 8048488:	c7 45 ee 6e 72 6f 73 	movl   $0x736f726e,-0x12(%ebp)
 804848f:	66 c7 45 f2 78 00    	movw   $0x78,-0xe(%ebp)
 8048495:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804849c:	eb 28                	jmp    80484c6 <do_phase+0x4b>
 804849e:	8d 55 ea             	lea    -0x16(%ebp),%edx
 80484a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484a4:	01 d0                	add    %edx,%eax
 80484a6:	0f b6 00             	movzbl (%eax),%eax
 80484a9:	0f b6 c0             	movzbl %al,%eax
 80484ac:	0f b6 80 80 a1 04 08 	movzbl 0x804a180(%eax),%eax
 80484b3:	0f be c0             	movsbl %al,%eax
 80484b6:	83 ec 0c             	sub    $0xc,%esp
 80484b9:	50                   	push   %eax
 80484ba:	e8 61 fe ff ff       	call   8048320 <putchar@plt>
 80484bf:	83 c4 10             	add    $0x10,%esp
 80484c2:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 80484c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80484c9:	83 f8 08             	cmp    $0x8,%eax
 80484cc:	76 d0                	jbe    804849e <do_phase+0x23>
 80484ce:	83 ec 0c             	sub    $0xc,%esp
 80484d1:	6a 0a                	push   $0xa
 80484d3:	e8 48 fe ff ff       	call   8048320 <putchar@plt>
 80484d8:	83 c4 10             	add    $0x10,%esp
 80484db:	90                   	nop
 80484dc:	c9                   	leave  
 80484dd:	c3                   	ret    
 80484de:	66 90                	xchg   %ax,%ax

080484e0 <__libc_csu_init>:
 80484e0:	55                   	push   %ebp
 80484e1:	57                   	push   %edi
 80484e2:	56                   	push   %esi
 80484e3:	53                   	push   %ebx
 80484e4:	e8 87 fe ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 80484e9:	81 c3 17 1b 00 00    	add    $0x1b17,%ebx
 80484ef:	83 ec 0c             	sub    $0xc,%esp
 80484f2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80484f6:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80484fc:	e8 cb fd ff ff       	call   80482cc <_init>
 8048501:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048507:	29 c6                	sub    %eax,%esi
 8048509:	c1 fe 02             	sar    $0x2,%esi
 804850c:	85 f6                	test   %esi,%esi
 804850e:	74 25                	je     8048535 <__libc_csu_init+0x55>
 8048510:	31 ff                	xor    %edi,%edi
 8048512:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048518:	83 ec 04             	sub    $0x4,%esp
 804851b:	ff 74 24 2c          	pushl  0x2c(%esp)
 804851f:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048523:	55                   	push   %ebp
 8048524:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804852b:	83 c7 01             	add    $0x1,%edi
 804852e:	83 c4 10             	add    $0x10,%esp
 8048531:	39 f7                	cmp    %esi,%edi
 8048533:	75 e3                	jne    8048518 <__libc_csu_init+0x38>
 8048535:	83 c4 0c             	add    $0xc,%esp
 8048538:	5b                   	pop    %ebx
 8048539:	5e                   	pop    %esi
 804853a:	5f                   	pop    %edi
 804853b:	5d                   	pop    %ebp
 804853c:	c3                   	ret    
 804853d:	8d 76 00             	lea    0x0(%esi),%esi

08048540 <__libc_csu_fini>:
 8048540:	f3 c3                	repz ret 

Disassembly of section .fini:

08048544 <_fini>:
 8048544:	53                   	push   %ebx
 8048545:	83 ec 08             	sub    $0x8,%esp
 8048548:	e8 23 fe ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 804854d:	81 c3 b3 1a 00 00    	add    $0x1ab3,%ebx
 8048553:	83 c4 08             	add    $0x8,%esp
 8048556:	5b                   	pop    %ebx
 8048557:	c3                   	ret    
