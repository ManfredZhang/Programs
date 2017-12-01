
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
 80482e5:	e8 46 00 00 00       	call   8048330 <__libc_start_main@plt+0x10>
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

08048310 <strlen@plt>:
 8048310:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048316:	68 08 00 00 00       	push   $0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <_init+0x24>

08048320 <__libc_start_main@plt>:
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
 804834b:	68 b0 86 04 08       	push   $0x80486b0
 8048350:	68 50 86 04 08       	push   $0x8048650
 8048355:	51                   	push   %ecx
 8048356:	56                   	push   %esi
 8048357:	68 3b 84 04 08       	push   $0x804843b
 804835c:	e8 bf ff ff ff       	call   8048320 <__libc_start_main@plt>
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
 8048380:	b8 13 a1 04 08       	mov    $0x804a113,%eax
 8048385:	2d 10 a1 04 08       	sub    $0x804a110,%eax
 804838a:	83 f8 06             	cmp    $0x6,%eax
 804838d:	76 1a                	jbe    80483a9 <deregister_tm_clones+0x29>
 804838f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048394:	85 c0                	test   %eax,%eax
 8048396:	74 11                	je     80483a9 <deregister_tm_clones+0x29>
 8048398:	55                   	push   %ebp
 8048399:	89 e5                	mov    %esp,%ebp
 804839b:	83 ec 14             	sub    $0x14,%esp
 804839e:	68 10 a1 04 08       	push   $0x804a110
 80483a3:	ff d0                	call   *%eax
 80483a5:	83 c4 10             	add    $0x10,%esp
 80483a8:	c9                   	leave  
 80483a9:	f3 c3                	repz ret 
 80483ab:	90                   	nop
 80483ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080483b0 <register_tm_clones>:
 80483b0:	b8 10 a1 04 08       	mov    $0x804a110,%eax
 80483b5:	2d 10 a1 04 08       	sub    $0x804a110,%eax
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
 80483d8:	68 10 a1 04 08       	push   $0x804a110
 80483dd:	ff d2                	call   *%edx
 80483df:	83 c4 10             	add    $0x10,%esp
 80483e2:	c9                   	leave  
 80483e3:	f3 c3                	repz ret 
 80483e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483f0 <__do_global_dtors_aux>:
 80483f0:	80 3d 10 a1 04 08 00 	cmpb   $0x0,0x804a110
 80483f7:	75 13                	jne    804840c <__do_global_dtors_aux+0x1c>
 80483f9:	55                   	push   %ebp
 80483fa:	89 e5                	mov    %esp,%ebp
 80483fc:	83 ec 08             	sub    $0x8,%esp
 80483ff:	e8 7c ff ff ff       	call   8048380 <deregister_tm_clones>
 8048404:	c6 05 10 a1 04 08 01 	movb   $0x1,0x804a110
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
 804844c:	a1 0c a1 04 08       	mov    0x804a10c,%eax
 8048451:	85 c0                	test   %eax,%eax
 8048453:	74 09                	je     804845e <main+0x23>
 8048455:	a1 0c a1 04 08       	mov    0x804a10c,%eax
 804845a:	ff d0                	call   *%eax
 804845c:	eb 10                	jmp    804846e <main+0x33>
 804845e:	83 ec 0c             	sub    $0xc,%esp
 8048461:	68 f8 87 04 08       	push   $0x80487f8
 8048466:	e8 95 fe ff ff       	call   8048300 <puts@plt>
 804846b:	83 c4 10             	add    $0x10,%esp
 804846e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048473:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048476:	c9                   	leave  
 8048477:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804847a:	c3                   	ret    

0804847b <qXFHGFZxHg>:
 804847b:	55                   	push   %ebp
 804847c:	89 e5                	mov    %esp,%ebp
 804847e:	83 ec 20             	sub    $0x20,%esp
 8048481:	c7 45 ec 46 61 56 73 	movl   $0x73566146,-0x14(%ebp)
 8048488:	c7 45 f0 56 64 63 76 	movl   $0x76636456,-0x10(%ebp)
 804848f:	c7 45 f4 50 4f 47 56 	movl   $0x56474f50,-0xc(%ebp)
 8048496:	c7 45 f8 4f 50 6f 00 	movl   $0x6f504f,-0x8(%ebp)
 804849d:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%ebp)
 80484a4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80484a8:	78 15                	js     80484bf <qXFHGFZxHg+0x44>
 80484aa:	8b 45 08             	mov    0x8(%ebp),%eax
 80484ad:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80484b0:	7d 0d                	jge    80484bf <qXFHGFZxHg+0x44>
 80484b2:	8d 55 ec             	lea    -0x14(%ebp),%edx
 80484b5:	8b 45 08             	mov    0x8(%ebp),%eax
 80484b8:	01 d0                	add    %edx,%eax
 80484ba:	0f b6 00             	movzbl (%eax),%eax
 80484bd:	eb 05                	jmp    80484c4 <qXFHGFZxHg+0x49>
 80484bf:	b8 00 00 00 00       	mov    $0x0,%eax
 80484c4:	c9                   	leave  
 80484c5:	c3                   	ret    

080484c6 <transform_code>:
 80484c6:	55                   	push   %ebp
 80484c7:	89 e5                	mov    %esp,%ebp
 80484c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484cc:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 80484d3:	83 e0 07             	and    $0x7,%eax
 80484d6:	83 f8 07             	cmp    $0x7,%eax
 80484d9:	77 74                	ja     804854f <transform_code+0x89>
 80484db:	8b 04 85 bc 88 04 08 	mov    0x80488bc(,%eax,4),%eax
 80484e2:	ff e0                	jmp    *%eax
 80484e4:	f7 55 08             	notl   0x8(%ebp)
 80484e7:	eb 6a                	jmp    8048553 <transform_code+0x8d>
 80484e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484ec:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 80484f3:	83 e0 03             	and    $0x3,%eax
 80484f6:	89 c1                	mov    %eax,%ecx
 80484f8:	d3 7d 08             	sarl   %cl,0x8(%ebp)
 80484fb:	eb 56                	jmp    8048553 <transform_code+0x8d>
 80484fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048500:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 8048507:	f7 d0                	not    %eax
 8048509:	21 45 08             	and    %eax,0x8(%ebp)
 804850c:	eb 45                	jmp    8048553 <transform_code+0x8d>
 804850e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048511:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 8048518:	c1 e0 08             	shl    $0x8,%eax
 804851b:	09 45 08             	or     %eax,0x8(%ebp)
 804851e:	eb 33                	jmp    8048553 <transform_code+0x8d>
 8048520:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048523:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 804852a:	31 45 08             	xor    %eax,0x8(%ebp)
 804852d:	eb 24                	jmp    8048553 <transform_code+0x8d>
 804852f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048532:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 8048539:	f7 d0                	not    %eax
 804853b:	09 45 08             	or     %eax,0x8(%ebp)
 804853e:	eb 13                	jmp    8048553 <transform_code+0x8d>
 8048540:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048543:	8b 04 85 80 88 04 08 	mov    0x8048880(,%eax,4),%eax
 804854a:	01 45 08             	add    %eax,0x8(%ebp)
 804854d:	eb 04                	jmp    8048553 <transform_code+0x8d>
 804854f:	f7 5d 08             	negl   0x8(%ebp)
 8048552:	90                   	nop
 8048553:	8b 45 08             	mov    0x8(%ebp),%eax
 8048556:	5d                   	pop    %ebp
 8048557:	c3                   	ret    

08048558 <generate_code>:
 8048558:	55                   	push   %ebp
 8048559:	89 e5                	mov    %esp,%ebp
 804855b:	83 ec 10             	sub    $0x10,%esp
 804855e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048561:	a3 04 a1 04 08       	mov    %eax,0x804a104
 8048566:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804856d:	eb 1a                	jmp    8048589 <generate_code+0x31>
 804856f:	a1 04 a1 04 08       	mov    0x804a104,%eax
 8048574:	ff 75 fc             	pushl  -0x4(%ebp)
 8048577:	50                   	push   %eax
 8048578:	e8 49 ff ff ff       	call   80484c6 <transform_code>
 804857d:	83 c4 08             	add    $0x8,%esp
 8048580:	a3 04 a1 04 08       	mov    %eax,0x804a104
 8048585:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 8048589:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804858c:	83 f8 0e             	cmp    $0xe,%eax
 804858f:	76 de                	jbe    804856f <generate_code+0x17>
 8048591:	90                   	nop
 8048592:	c9                   	leave  
 8048593:	c3                   	ret    

08048594 <encode_1>:
 8048594:	55                   	push   %ebp
 8048595:	89 e5                	mov    %esp,%ebp
 8048597:	83 ec 18             	sub    $0x18,%esp
 804859a:	83 ec 0c             	sub    $0xc,%esp
 804859d:	ff 75 08             	pushl  0x8(%ebp)
 80485a0:	e8 6b fd ff ff       	call   8048310 <strlen@plt>
 80485a5:	83 c4 10             	add    $0x10,%esp
 80485a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80485ab:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80485b2:	eb 56                	jmp    804860a <encode_1+0x76>
 80485b4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485b7:	8b 45 08             	mov    0x8(%ebp),%eax
 80485ba:	01 c2                	add    %eax,%edx
 80485bc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80485bf:	8b 45 08             	mov    0x8(%ebp),%eax
 80485c2:	01 c8                	add    %ecx,%eax
 80485c4:	0f b6 00             	movzbl (%eax),%eax
 80485c7:	0f be c0             	movsbl %al,%eax
 80485ca:	0f b6 88 e0 88 04 08 	movzbl 0x80488e0(%eax),%ecx
 80485d1:	a1 04 a1 04 08       	mov    0x804a104,%eax
 80485d6:	31 c8                	xor    %ecx,%eax
 80485d8:	83 e0 7f             	and    $0x7f,%eax
 80485db:	88 02                	mov    %al,(%edx)
 80485dd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485e0:	8b 45 08             	mov    0x8(%ebp),%eax
 80485e3:	01 d0                	add    %edx,%eax
 80485e5:	0f b6 00             	movzbl (%eax),%eax
 80485e8:	3c 1f                	cmp    $0x1f,%al
 80485ea:	7e 0f                	jle    80485fb <encode_1+0x67>
 80485ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485ef:	8b 45 08             	mov    0x8(%ebp),%eax
 80485f2:	01 d0                	add    %edx,%eax
 80485f4:	0f b6 00             	movzbl (%eax),%eax
 80485f7:	3c 7f                	cmp    $0x7f,%al
 80485f9:	75 0b                	jne    8048606 <encode_1+0x72>
 80485fb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485fe:	8b 45 08             	mov    0x8(%ebp),%eax
 8048601:	01 d0                	add    %edx,%eax
 8048603:	c6 00 20             	movb   $0x20,(%eax)
 8048606:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804860a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804860d:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8048610:	7c a2                	jl     80485b4 <encode_1+0x20>
 8048612:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048615:	c9                   	leave  
 8048616:	c3                   	ret    

08048617 <do_phase>:
 8048617:	55                   	push   %ebp
 8048618:	89 e5                	mov    %esp,%ebp
 804861a:	83 ec 08             	sub    $0x8,%esp
 804861d:	68 82 00 00 00       	push   $0x82
 8048622:	e8 31 ff ff ff       	call   8048558 <generate_code>
 8048627:	83 c4 04             	add    $0x4,%esp
 804862a:	a1 08 a1 04 08       	mov    0x804a108,%eax
 804862f:	83 ec 0c             	sub    $0xc,%esp
 8048632:	68 f8 a0 04 08       	push   $0x804a0f8
 8048637:	ff d0                	call   *%eax
 8048639:	83 c4 10             	add    $0x10,%esp
 804863c:	83 ec 0c             	sub    $0xc,%esp
 804863f:	68 f8 a0 04 08       	push   $0x804a0f8
 8048644:	e8 b7 fc ff ff       	call   8048300 <puts@plt>
 8048649:	83 c4 10             	add    $0x10,%esp
 804864c:	90                   	nop
 804864d:	c9                   	leave  
 804864e:	c3                   	ret    
 804864f:	90                   	nop

08048650 <__libc_csu_init>:
 8048650:	55                   	push   %ebp
 8048651:	57                   	push   %edi
 8048652:	56                   	push   %esi
 8048653:	53                   	push   %ebx
 8048654:	e8 17 fd ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 8048659:	81 c3 a7 19 00 00    	add    $0x19a7,%ebx
 804865f:	83 ec 0c             	sub    $0xc,%esp
 8048662:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8048666:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804866c:	e8 5b fc ff ff       	call   80482cc <_init>
 8048671:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048677:	29 c6                	sub    %eax,%esi
 8048679:	c1 fe 02             	sar    $0x2,%esi
 804867c:	85 f6                	test   %esi,%esi
 804867e:	74 25                	je     80486a5 <__libc_csu_init+0x55>
 8048680:	31 ff                	xor    %edi,%edi
 8048682:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048688:	83 ec 04             	sub    $0x4,%esp
 804868b:	ff 74 24 2c          	pushl  0x2c(%esp)
 804868f:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048693:	55                   	push   %ebp
 8048694:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804869b:	83 c7 01             	add    $0x1,%edi
 804869e:	83 c4 10             	add    $0x10,%esp
 80486a1:	39 f7                	cmp    %esi,%edi
 80486a3:	75 e3                	jne    8048688 <__libc_csu_init+0x38>
 80486a5:	83 c4 0c             	add    $0xc,%esp
 80486a8:	5b                   	pop    %ebx
 80486a9:	5e                   	pop    %esi
 80486aa:	5f                   	pop    %edi
 80486ab:	5d                   	pop    %ebp
 80486ac:	c3                   	ret    
 80486ad:	8d 76 00             	lea    0x0(%esi),%esi

080486b0 <__libc_csu_fini>:
 80486b0:	f3 c3                	repz ret 

Disassembly of section .fini:

080486b4 <_fini>:
 80486b4:	53                   	push   %ebx
 80486b5:	83 ec 08             	sub    $0x8,%esp
 80486b8:	e8 b3 fc ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 80486bd:	81 c3 43 19 00 00    	add    $0x1943,%ebx
 80486c3:	83 c4 08             	add    $0x8,%esp
 80486c6:	5b                   	pop    %ebx
 80486c7:	c3                   	ret    
