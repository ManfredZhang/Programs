
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
 804834b:	68 d0 86 04 08       	push   $0x80486d0
 8048350:	68 70 86 04 08       	push   $0x8048670
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
 8048380:	b8 03 a1 04 08       	mov    $0x804a103,%eax
 8048385:	2d 00 a1 04 08       	sub    $0x804a100,%eax
 804838a:	83 f8 06             	cmp    $0x6,%eax
 804838d:	76 1a                	jbe    80483a9 <deregister_tm_clones+0x29>
 804838f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048394:	85 c0                	test   %eax,%eax
 8048396:	74 11                	je     80483a9 <deregister_tm_clones+0x29>
 8048398:	55                   	push   %ebp
 8048399:	89 e5                	mov    %esp,%ebp
 804839b:	83 ec 14             	sub    $0x14,%esp
 804839e:	68 00 a1 04 08       	push   $0x804a100
 80483a3:	ff d0                	call   *%eax
 80483a5:	83 c4 10             	add    $0x10,%esp
 80483a8:	c9                   	leave  
 80483a9:	f3 c3                	repz ret 
 80483ab:	90                   	nop
 80483ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080483b0 <register_tm_clones>:
 80483b0:	b8 00 a1 04 08       	mov    $0x804a100,%eax
 80483b5:	2d 00 a1 04 08       	sub    $0x804a100,%eax
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
 80483d8:	68 00 a1 04 08       	push   $0x804a100
 80483dd:	ff d2                	call   *%edx
 80483df:	83 c4 10             	add    $0x10,%esp
 80483e2:	c9                   	leave  
 80483e3:	f3 c3                	repz ret 
 80483e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483f0 <__do_global_dtors_aux>:
 80483f0:	80 3d 00 a1 04 08 00 	cmpb   $0x0,0x804a100
 80483f7:	75 13                	jne    804840c <__do_global_dtors_aux+0x1c>
 80483f9:	55                   	push   %ebp
 80483fa:	89 e5                	mov    %esp,%ebp
 80483fc:	83 ec 08             	sub    $0x8,%esp
 80483ff:	e8 7c ff ff ff       	call   8048380 <deregister_tm_clones>
 8048404:	c6 05 00 a1 04 08 01 	movb   $0x1,0x804a100
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
 804844c:	a1 fc a0 04 08       	mov    0x804a0fc,%eax
 8048451:	85 c0                	test   %eax,%eax
 8048453:	74 09                	je     804845e <main+0x23>
 8048455:	a1 fc a0 04 08       	mov    0x804a0fc,%eax
 804845a:	ff d0                	call   *%eax
 804845c:	eb 10                	jmp    804846e <main+0x33>
 804845e:	83 ec 0c             	sub    $0xc,%esp
 8048461:	68 18 88 04 08       	push   $0x8048818
 8048466:	e8 95 fe ff ff       	call   8048300 <puts@plt>
 804846b:	83 c4 10             	add    $0x10,%esp
 804846e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048473:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048476:	c9                   	leave  
 8048477:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804847a:	c3                   	ret    

0804847b <SnLHPJDszf>:
 804847b:	55                   	push   %ebp
 804847c:	89 e5                	mov    %esp,%ebp
 804847e:	83 ec 30             	sub    $0x30,%esp
 8048481:	c7 45 dd 63 53 69 55 	movl   $0x55695363,-0x23(%ebp)
 8048488:	c7 45 e1 6e 69 75 55 	movl   $0x5575696e,-0x1f(%ebp)
 804848f:	c7 45 e5 4d 71 76 4b 	movl   $0x4b76714d,-0x1b(%ebp)
 8048496:	c7 45 e9 71 63 48 4d 	movl   $0x4d486371,-0x17(%ebp)
 804849d:	c7 45 ed 41 6e 59 71 	movl   $0x71596e41,-0x13(%ebp)
 80484a4:	c7 45 f1 42 55 50 78 	movl   $0x78505542,-0xf(%ebp)
 80484ab:	c7 45 f5 48 6f 44 52 	movl   $0x52446f48,-0xb(%ebp)
 80484b2:	66 c7 45 f9 77 41    	movw   $0x4177,-0x7(%ebp)
 80484b8:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
 80484bc:	c7 45 fc 1f 00 00 00 	movl   $0x1f,-0x4(%ebp)
 80484c3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80484c7:	78 15                	js     80484de <SnLHPJDszf+0x63>
 80484c9:	8b 45 08             	mov    0x8(%ebp),%eax
 80484cc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 80484cf:	7d 0d                	jge    80484de <SnLHPJDszf+0x63>
 80484d1:	8d 55 dd             	lea    -0x23(%ebp),%edx
 80484d4:	8b 45 08             	mov    0x8(%ebp),%eax
 80484d7:	01 d0                	add    %edx,%eax
 80484d9:	0f b6 00             	movzbl (%eax),%eax
 80484dc:	eb 05                	jmp    80484e3 <SnLHPJDszf+0x68>
 80484de:	b8 00 00 00 00       	mov    $0x0,%eax
 80484e3:	c9                   	leave  
 80484e4:	c3                   	ret    

080484e5 <transform_code>:
 80484e5:	55                   	push   %ebp
 80484e6:	89 e5                	mov    %esp,%ebp
 80484e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 80484eb:	8b 04 85 a0 88 04 08 	mov    0x80488a0(,%eax,4),%eax
 80484f2:	83 e0 07             	and    $0x7,%eax
 80484f5:	83 f8 07             	cmp    $0x7,%eax
 80484f8:	77 74                	ja     804856e <transform_code+0x89>
 80484fa:	8b 04 85 24 00 00 00 	mov    0x24(,%eax,4),%eax
 8048501:	ff e0                	jmp    *%eax
 8048503:	f7 55 08             	notl   0x8(%ebp)
 8048506:	eb 6a                	jmp    8048572 <transform_code+0x8d>
 8048508:	8b 45 0c             	mov    0xc(%ebp),%eax
 804850b:	8b 04 85 a0 88 04 08 	mov    0x80488a0(,%eax,4),%eax
 8048512:	83 e0 03             	and    $0x3,%eax
 8048515:	89 c1                	mov    %eax,%ecx
 8048517:	d3 7d 08             	sarl   %cl,0x8(%ebp)
 804851a:	eb 56                	jmp    8048572 <transform_code+0x8d>
 804851c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804851f:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
 8048526:	f7 d0                	not    %eax
 8048528:	21 45 08             	and    %eax,0x8(%ebp)
 804852b:	eb 45                	jmp    8048572 <transform_code+0x8d>
 804852d:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048530:	8b 04 85 a0 88 04 08 	mov    0x80488a0(,%eax,4),%eax
 8048537:	c1 e0 08             	shl    $0x8,%eax
 804853a:	09 45 08             	or     %eax,0x8(%ebp)
 804853d:	eb 33                	jmp    8048572 <transform_code+0x8d>
 804853f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048542:	8b 04 85 a0 88 04 08 	mov    0x80488a0(,%eax,4),%eax
 8048549:	31 45 08             	xor    %eax,0x8(%ebp)
 804854c:	eb 24                	jmp    8048572 <transform_code+0x8d>
 804854e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048551:	8b 04 85 a0 88 04 08 	mov    0x80488a0(,%eax,4),%eax
 8048558:	f7 d0                	not    %eax
 804855a:	09 45 08             	or     %eax,0x8(%ebp)
 804855d:	eb 13                	jmp    8048572 <transform_code+0x8d>
 804855f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048562:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
 8048569:	01 45 08             	add    %eax,0x8(%ebp)
 804856c:	eb 04                	jmp    8048572 <transform_code+0x8d>
 804856e:	f7 5d 08             	negl   0x8(%ebp)
 8048571:	90                   	nop
 8048572:	8b 45 08             	mov    0x8(%ebp),%eax
 8048575:	5d                   	pop    %ebp
 8048576:	c3                   	ret    

08048577 <generate_code>:
 8048577:	55                   	push   %ebp
 8048578:	89 e5                	mov    %esp,%ebp
 804857a:	83 ec 10             	sub    $0x10,%esp
 804857d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048580:	a3 f4 a0 04 08       	mov    %eax,0x804a0f4
 8048585:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804858c:	eb 1a                	jmp    80485a8 <generate_code+0x31>
 804858e:	a1 f4 a0 04 08       	mov    0x804a0f4,%eax
 8048593:	ff 75 fc             	pushl  -0x4(%ebp)
 8048596:	50                   	push   %eax
 8048597:	e8 49 ff ff ff       	call   80484e5 <transform_code>
 804859c:	83 c4 08             	add    $0x8,%esp
 804859f:	a3 b4 00 00 00       	mov    %eax,0xb4
 80485a4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 80485a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80485ab:	83 f8 08             	cmp    $0x8,%eax
 80485ae:	76 de                	jbe    804858e <generate_code+0x17>
 80485b0:	90                   	nop
 80485b1:	c9                   	leave  
 80485b2:	c3                   	ret    

080485b3 <encode_1>:
 80485b3:	55                   	push   %ebp
 80485b4:	89 e5                	mov    %esp,%ebp
 80485b6:	83 ec 18             	sub    $0x18,%esp
 80485b9:	83 ec 0c             	sub    $0xc,%esp
 80485bc:	ff 75 08             	pushl  0x8(%ebp)
 80485bf:	e8 4c fd ff ff       	call   8048310 <strlen@plt>
 80485c4:	83 c4 10             	add    $0x10,%esp
 80485c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80485ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80485d1:	eb 56                	jmp    8048629 <encode_1+0x76>
 80485d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485d6:	8b 45 08             	mov    0x8(%ebp),%eax
 80485d9:	01 c2                	add    %eax,%edx
 80485db:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 80485de:	8b 45 08             	mov    0x8(%ebp),%eax
 80485e1:	01 c8                	add    %ecx,%eax
 80485e3:	0f b6 00             	movzbl (%eax),%eax
 80485e6:	0f be c0             	movsbl %al,%eax
 80485e9:	0f b6 88 60 00 00 00 	movzbl 0x60(%eax),%ecx
 80485f0:	a1 f4 a0 04 08       	mov    0x804a0f4,%eax
 80485f5:	31 c8                	xor    %ecx,%eax
 80485f7:	83 e0 7f             	and    $0x7f,%eax
 80485fa:	88 02                	mov    %al,(%edx)
 80485fc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80485ff:	8b 45 08             	mov    0x8(%ebp),%eax
 8048602:	01 d0                	add    %edx,%eax
 8048604:	0f b6 00             	movzbl (%eax),%eax
 8048607:	3c 1f                	cmp    $0x1f,%al
 8048609:	7e 0f                	jle    804861a <encode_1+0x67>
 804860b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804860e:	8b 45 08             	mov    0x8(%ebp),%eax
 8048611:	01 d0                	add    %edx,%eax
 8048613:	0f b6 00             	movzbl (%eax),%eax
 8048616:	3c 7f                	cmp    $0x7f,%al
 8048618:	75 0b                	jne    8048625 <encode_1+0x72>
 804861a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804861d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048620:	01 d0                	add    %edx,%eax
 8048622:	c6 00 20             	movb   $0x20,(%eax)
 8048625:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8048629:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804862c:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 804862f:	7c a2                	jl     80485d3 <encode_1+0x20>
 8048631:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048634:	c9                   	leave  
 8048635:	c3                   	ret    

08048636 <do_phase>:
 8048636:	55                   	push   %ebp
 8048637:	89 e5                	mov    %esp,%ebp
 8048639:	83 ec 08             	sub    $0x8,%esp
 804863c:	68 99 00 00 00       	push   $0x99
 8048641:	e8 fc ff ff ff       	call   8048642 <do_phase+0xc>
 8048646:	83 c4 04             	add    $0x4,%esp
 8048649:	a1 b8 00 00 00       	mov    0xb8,%eax
 804864e:	83 ec 0c             	sub    $0xc,%esp
 8048651:	68 e8 a0 04 08       	push   $0x804a0e8
 8048656:	ff d0                	call   *%eax
 8048658:	83 c4 10             	add    $0x10,%esp
 804865b:	83 ec 0c             	sub    $0xc,%esp
 804865e:	68 e8 a0 04 08       	push   $0x804a0e8
 8048663:	e8 98 fc ff ff       	call   8048300 <puts@plt>
 8048668:	83 c4 10             	add    $0x10,%esp
 804866b:	90                   	nop
 804866c:	c9                   	leave  
 804866d:	c3                   	ret    
 804866e:	66 90                	xchg   %ax,%ax

08048670 <__libc_csu_init>:
 8048670:	55                   	push   %ebp
 8048671:	57                   	push   %edi
 8048672:	56                   	push   %esi
 8048673:	53                   	push   %ebx
 8048674:	e8 f7 fc ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 8048679:	81 c3 87 19 00 00    	add    $0x1987,%ebx
 804867f:	83 ec 0c             	sub    $0xc,%esp
 8048682:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 8048686:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 804868c:	e8 3b fc ff ff       	call   80482cc <_init>
 8048691:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048697:	29 c6                	sub    %eax,%esi
 8048699:	c1 fe 02             	sar    $0x2,%esi
 804869c:	85 f6                	test   %esi,%esi
 804869e:	74 25                	je     80486c5 <__libc_csu_init+0x55>
 80486a0:	31 ff                	xor    %edi,%edi
 80486a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80486a8:	83 ec 04             	sub    $0x4,%esp
 80486ab:	ff 74 24 2c          	pushl  0x2c(%esp)
 80486af:	ff 74 24 2c          	pushl  0x2c(%esp)
 80486b3:	55                   	push   %ebp
 80486b4:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 80486bb:	83 c7 01             	add    $0x1,%edi
 80486be:	83 c4 10             	add    $0x10,%esp
 80486c1:	39 f7                	cmp    %esi,%edi
 80486c3:	75 e3                	jne    80486a8 <__libc_csu_init+0x38>
 80486c5:	83 c4 0c             	add    $0xc,%esp
 80486c8:	5b                   	pop    %ebx
 80486c9:	5e                   	pop    %esi
 80486ca:	5f                   	pop    %edi
 80486cb:	5d                   	pop    %ebp
 80486cc:	c3                   	ret    
 80486cd:	8d 76 00             	lea    0x0(%esi),%esi

080486d0 <__libc_csu_fini>:
 80486d0:	f3 c3                	repz ret 

Disassembly of section .fini:

080486d4 <_fini>:
 80486d4:	53                   	push   %ebx
 80486d5:	83 ec 08             	sub    $0x8,%esp
 80486d8:	e8 93 fc ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 80486dd:	81 c3 23 19 00 00    	add    $0x1923,%ebx
 80486e3:	83 c4 08             	add    $0x8,%esp
 80486e6:	5b                   	pop    %ebx
 80486e7:	c3                   	ret    
