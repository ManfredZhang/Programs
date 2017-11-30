
linkbomb:     file format elf32-i386


Disassembly of section .init:

080482c8 <_init>:
 80482c8:	53                   	push   %ebx
 80482c9:	83 ec 08             	sub    $0x8,%esp
 80482cc:	e8 9f 00 00 00       	call   8048370 <__x86.get_pc_thunk.bx>
 80482d1:	81 c3 2f 1d 00 00    	add    $0x1d2f,%ebx
 80482d7:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80482dd:	85 c0                	test   %eax,%eax
 80482df:	74 05                	je     80482e6 <_init+0x1e>
 80482e1:	e8 4a 00 00 00       	call   8048330 <atoi@plt+0x10>
 80482e6:	83 c4 08             	add    $0x8,%esp
 80482e9:	5b                   	pop    %ebx
 80482ea:	c3                   	ret    

Disassembly of section .plt:

080482f0 <puts@plt-0x10>:
 80482f0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80482f6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80482fc:	00 00                	add    %al,(%eax)
	...

08048300 <puts@plt>:
 8048300:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048306:	68 00 00 00 00       	push   $0x0
 804830b:	e9 e0 ff ff ff       	jmp    80482f0 <_init+0x28>

08048310 <__libc_start_main@plt>:
 8048310:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048316:	68 08 00 00 00       	push   $0x8
 804831b:	e9 d0 ff ff ff       	jmp    80482f0 <_init+0x28>

08048320 <atoi@plt>:
 8048320:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048326:	68 10 00 00 00       	push   $0x10
 804832b:	e9 c0 ff ff ff       	jmp    80482f0 <_init+0x28>

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
 804834b:	68 40 86 04 08       	push   $0x8048640
 8048350:	68 e0 85 04 08       	push   $0x80485e0
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
 8048380:	b8 d3 a1 04 08       	mov    $0x804a1d3,%eax
 8048385:	2d d0 a1 04 08       	sub    $0x804a1d0,%eax
 804838a:	83 f8 06             	cmp    $0x6,%eax
 804838d:	76 1a                	jbe    80483a9 <deregister_tm_clones+0x29>
 804838f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048394:	85 c0                	test   %eax,%eax
 8048396:	74 11                	je     80483a9 <deregister_tm_clones+0x29>
 8048398:	55                   	push   %ebp
 8048399:	89 e5                	mov    %esp,%ebp
 804839b:	83 ec 14             	sub    $0x14,%esp
 804839e:	68 d0 a1 04 08       	push   $0x804a1d0
 80483a3:	ff d0                	call   *%eax
 80483a5:	83 c4 10             	add    $0x10,%esp
 80483a8:	c9                   	leave  
 80483a9:	f3 c3                	repz ret 
 80483ab:	90                   	nop
 80483ac:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080483b0 <register_tm_clones>:
 80483b0:	b8 d0 a1 04 08       	mov    $0x804a1d0,%eax
 80483b5:	2d d0 a1 04 08       	sub    $0x804a1d0,%eax
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
 80483d8:	68 d0 a1 04 08       	push   $0x804a1d0
 80483dd:	ff d2                	call   *%edx
 80483df:	83 c4 10             	add    $0x10,%esp
 80483e2:	c9                   	leave  
 80483e3:	f3 c3                	repz ret 
 80483e5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483e9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483f0 <__do_global_dtors_aux>:
 80483f0:	80 3d d0 a1 04 08 00 	cmpb   $0x0,0x804a1d0
 80483f7:	75 13                	jne    804840c <__do_global_dtors_aux+0x1c>
 80483f9:	55                   	push   %ebp
 80483fa:	89 e5                	mov    %esp,%ebp
 80483fc:	83 ec 08             	sub    $0x8,%esp
 80483ff:	e8 7c ff ff ff       	call   8048380 <deregister_tm_clones>
 8048404:	c6 05 d0 a1 04 08 01 	movb   $0x1,0x804a1d0
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
 804844c:	89 c8                	mov    %ecx,%eax
 804844e:	83 38 02             	cmpl   $0x2,(%eax)
 8048451:	74 16                	je     8048469 <main+0x2e>
 8048453:	83 ec 0c             	sub    $0xc,%esp
 8048456:	68 60 87 04 08       	push   $0x8048760
 804845b:	e8 a0 fe ff ff       	call   8048300 <puts@plt>
 8048460:	83 c4 10             	add    $0x10,%esp
 8048463:	90                   	nop
 8048464:	e9 e0 00 00 00       	jmp    8048549 <main+0x10e>
 8048469:	8b 40 04             	mov    0x4(%eax),%eax
 804846c:	83 c0 04             	add    $0x4,%eax
 804846f:	8b 00                	mov    (%eax),%eax
 8048471:	83 ec 0c             	sub    $0xc,%esp
 8048474:	50                   	push   %eax
 8048475:	e8 a6 fe ff ff       	call   8048320 <atoi@plt>
 804847a:	83 c4 10             	add    $0x10,%esp
 804847d:	83 f8 02             	cmp    $0x2,%eax
 8048480:	74 45                	je     80484c7 <main+0x8c>
 8048482:	83 f8 02             	cmp    $0x2,%eax
 8048485:	7f 0a                	jg     8048491 <main+0x56>
 8048487:	83 f8 01             	cmp    $0x1,%eax
 804848a:	74 14                	je     80484a0 <main+0x65>
 804848c:	e9 a2 00 00 00       	jmp    8048533 <main+0xf8>
 8048491:	83 f8 03             	cmp    $0x3,%eax
 8048494:	74 55                	je     80484eb <main+0xb0>
 8048496:	83 f8 04             	cmp    $0x4,%eax
 8048499:	74 74                	je     804850f <main+0xd4>
 804849b:	e9 93 00 00 00       	jmp    8048533 <main+0xf8>
 80484a0:	a1 c8 a1 04 08       	mov    0x804a1c8,%eax
 80484a5:	85 c0                	test   %eax,%eax
 80484a7:	74 0c                	je     80484b5 <main+0x7a>
 80484a9:	a1 c8 a1 04 08       	mov    0x804a1c8,%eax
 80484ae:	ff d0                	call   *%eax
 80484b0:	e9 8f 00 00 00       	jmp    8048544 <main+0x109>
 80484b5:	83 ec 0c             	sub    $0xc,%esp
 80484b8:	68 18 88 04 08       	push   $0x8048818
 80484bd:	e8 3e fe ff ff       	call   8048300 <puts@plt>
 80484c2:	83 c4 10             	add    $0x10,%esp
 80484c5:	eb 7d                	jmp    8048544 <main+0x109>
 80484c7:	a1 cc a1 04 08       	mov    0x804a1cc,%eax
 80484cc:	85 c0                	test   %eax,%eax
 80484ce:	74 09                	je     80484d9 <main+0x9e>
 80484d0:	a1 cc a1 04 08       	mov    0x804a1cc,%eax
 80484d5:	ff d0                	call   *%eax
 80484d7:	eb 6b                	jmp    8048544 <main+0x109>
 80484d9:	83 ec 0c             	sub    $0xc,%esp
 80484dc:	68 58 88 04 08       	push   $0x8048858
 80484e1:	e8 1a fe ff ff       	call   8048300 <puts@plt>
 80484e6:	83 c4 10             	add    $0x10,%esp
 80484e9:	eb 59                	jmp    8048544 <main+0x109>
 80484eb:	a1 d4 a1 04 08       	mov    0x804a1d4,%eax
 80484f0:	85 c0                	test   %eax,%eax
 80484f2:	74 09                	je     80484fd <main+0xc2>
 80484f4:	a1 d4 a1 04 08       	mov    0x804a1d4,%eax
 80484f9:	ff d0                	call   *%eax
 80484fb:	eb 47                	jmp    8048544 <main+0x109>
 80484fd:	83 ec 0c             	sub    $0xc,%esp
 8048500:	68 98 88 04 08       	push   $0x8048898
 8048505:	e8 f6 fd ff ff       	call   8048300 <puts@plt>
 804850a:	83 c4 10             	add    $0x10,%esp
 804850d:	eb 35                	jmp    8048544 <main+0x109>
 804850f:	a1 d8 a1 04 08       	mov    0x804a1d8,%eax
 8048514:	85 c0                	test   %eax,%eax
 8048516:	74 09                	je     8048521 <main+0xe6>
 8048518:	a1 d8 a1 04 08       	mov    0x804a1d8,%eax
 804851d:	ff d0                	call   *%eax
 804851f:	eb 23                	jmp    8048544 <main+0x109>
 8048521:	83 ec 0c             	sub    $0xc,%esp
 8048524:	68 d8 88 04 08       	push   $0x80488d8
 8048529:	e8 d2 fd ff ff       	call   8048300 <puts@plt>
 804852e:	83 c4 10             	add    $0x10,%esp
 8048531:	eb 11                	jmp    8048544 <main+0x109>
 8048533:	83 ec 0c             	sub    $0xc,%esp
 8048536:	68 18 89 04 08       	push   $0x8048918
 804853b:	e8 c0 fd ff ff       	call   8048300 <puts@plt>
 8048540:	83 c4 10             	add    $0x10,%esp
 8048543:	90                   	nop
 8048544:	b8 00 00 00 00       	mov    $0x0,%eax
 8048549:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 804854c:	c9                   	leave  
 804854d:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048550:	c3                   	ret    

08048551 <do_phase_1>:
 8048551:	55                   	push   %ebp
 8048552:	89 e5                	mov    %esp,%ebp
 8048554:	83 ec 08             	sub    $0x8,%esp
 8048557:	83 ec 0c             	sub    $0xc,%esp
 804855a:	68 40 a1 04 08       	push   $0x804a140
 804855f:	e8 9c fd ff ff       	call   8048300 <puts@plt>
 8048564:	83 c4 10             	add    $0x10,%esp
 8048567:	c9                   	leave  
 8048568:	c3                   	ret    

08048569 <helper>:
 8048569:	55                   	push   %ebp
 804856a:	89 e5                	mov    %esp,%ebp
 804856c:	90                   	nop
 804856d:	90                   	nop
 804856e:	90                   	nop
 804856f:	90                   	nop
 8048570:	90                   	nop
 8048571:	90                   	nop
 8048572:	90                   	nop
 8048573:	90                   	nop
 8048574:	90                   	nop
 8048575:	90                   	nop
 8048576:	90                   	nop
 8048577:	90                   	nop
 8048578:	90                   	nop
 8048579:	90                   	nop
 804857a:	90                   	nop
 804857b:	90                   	nop
 804857c:	90                   	nop
 804857d:	90                   	nop
 804857e:	90                   	nop
 804857f:	90                   	nop
 8048580:	90                   	nop
 8048581:	90                   	nop
 8048582:	90                   	nop
 8048583:	90                   	nop
 8048584:	90                   	nop
 8048585:	90                   	nop
 8048586:	90                   	nop
 8048587:	90                   	nop
 8048588:	90                   	nop
 8048589:	90                   	nop
 804858a:	b8 e7 00 00 00       	mov    $0xe7,%eax
 804858f:	5d                   	pop    %ebp
 8048590:	c3                   	ret    

08048591 <ciSTtWkC>:
 8048591:	55                   	push   %ebp
 8048592:	89 e5                	mov    %esp,%ebp
 8048594:	83 ec 08             	sub    $0x8,%esp
 8048597:	83 ec 0c             	sub    $0xc,%esp
 804859a:	68 5a 89 04 08       	push   $0x804895a
 804859f:	e8 7c fd ff ff       	call   8048320 <atoi@plt>
 80485a4:	83 c4 10             	add    $0x10,%esp
 80485a7:	3b 45 08             	cmp    0x8(%ebp),%eax
 80485aa:	74 02                	je     80485ae <ciSTtWkC+0x1d>
 80485ac:	eb 10                	jmp    80485be <ciSTtWkC+0x2d>
 80485ae:	83 ec 0c             	sub    $0xc,%esp
 80485b1:	68 40 a1 04 08       	push   $0x804a140
 80485b6:	e8 45 fd ff ff       	call   8048300 <puts@plt>
 80485bb:	83 c4 10             	add    $0x10,%esp
 80485be:	c9                   	leave  
 80485bf:	c3                   	ret    

080485c0 <do_phase_2>:
 80485c0:	55                   	push   %ebp
 80485c1:	89 e5                	mov    %esp,%ebp
 80485c3:	68 a3 6f 03 09       	push   $0x9036fa3
 80485c8:	e8 c4 ff ff ff       	call   8048591 <ciSTtWkC>
 80485cd:	83 c4 04             	add    $0x4,%esp
 80485d0:	90                   	nop
 80485d1:	90                   	nop
 80485d2:	90                   	nop
 80485d3:	90                   	nop
 80485d4:	90                   	nop
 80485d5:	90                   	nop
 80485d6:	90                   	nop
 80485d7:	90                   	nop
 80485d8:	90                   	nop
 80485d9:	90                   	nop
 80485da:	90                   	nop
 80485db:	5d                   	pop    %ebp
 80485dc:	c3                   	ret    
 80485dd:	66 90                	xchg   %ax,%ax
 80485df:	90                   	nop

080485e0 <__libc_csu_init>:
 80485e0:	55                   	push   %ebp
 80485e1:	57                   	push   %edi
 80485e2:	56                   	push   %esi
 80485e3:	53                   	push   %ebx
 80485e4:	e8 87 fd ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 80485e9:	81 c3 17 1a 00 00    	add    $0x1a17,%ebx
 80485ef:	83 ec 0c             	sub    $0xc,%esp
 80485f2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80485f6:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80485fc:	e8 c7 fc ff ff       	call   80482c8 <_init>
 8048601:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8048607:	29 c6                	sub    %eax,%esi
 8048609:	c1 fe 02             	sar    $0x2,%esi
 804860c:	85 f6                	test   %esi,%esi
 804860e:	74 25                	je     8048635 <__libc_csu_init+0x55>
 8048610:	31 ff                	xor    %edi,%edi
 8048612:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048618:	83 ec 04             	sub    $0x4,%esp
 804861b:	ff 74 24 2c          	pushl  0x2c(%esp)
 804861f:	ff 74 24 2c          	pushl  0x2c(%esp)
 8048623:	55                   	push   %ebp
 8048624:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 804862b:	83 c7 01             	add    $0x1,%edi
 804862e:	83 c4 10             	add    $0x10,%esp
 8048631:	39 f7                	cmp    %esi,%edi
 8048633:	75 e3                	jne    8048618 <__libc_csu_init+0x38>
 8048635:	83 c4 0c             	add    $0xc,%esp
 8048638:	5b                   	pop    %ebx
 8048639:	5e                   	pop    %esi
 804863a:	5f                   	pop    %edi
 804863b:	5d                   	pop    %ebp
 804863c:	c3                   	ret    
 804863d:	8d 76 00             	lea    0x0(%esi),%esi

08048640 <__libc_csu_fini>:
 8048640:	f3 c3                	repz ret 

Disassembly of section .fini:

08048644 <_fini>:
 8048644:	53                   	push   %ebx
 8048645:	83 ec 08             	sub    $0x8,%esp
 8048648:	e8 23 fd ff ff       	call   8048370 <__x86.get_pc_thunk.bx>
 804864d:	81 c3 b3 19 00 00    	add    $0x19b3,%ebx
 8048653:	83 c4 08             	add    $0x8,%esp
 8048656:	5b                   	pop    %ebx
 8048657:	c3                   	ret    
