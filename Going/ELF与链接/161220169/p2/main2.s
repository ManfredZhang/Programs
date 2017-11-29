
linkbomb:     file format elf32-i386


Disassembly of section .init:

080482ec <_init>:
 80482ec:	53                   	push   %ebx
 80482ed:	83 ec 08             	sub    $0x8,%esp
 80482f0:	e8 ab 00 00 00       	call   80483a0 <__x86.get_pc_thunk.bx>
 80482f5:	81 c3 0b 1d 00 00    	add    $0x1d0b,%ebx
 80482fb:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048301:	85 c0                	test   %eax,%eax
 8048303:	74 05                	je     804830a <_init+0x1e>
 8048305:	e8 56 00 00 00       	call   8048360 <__libc_start_main@plt+0x10>
 804830a:	83 c4 08             	add    $0x8,%esp
 804830d:	5b                   	pop    %ebx
 804830e:	c3                   	ret    

Disassembly of section .plt:

08048310 <strcmp@plt-0x10>:
 8048310:	ff 35 04 a0 04 08    	pushl  0x804a004
 8048316:	ff 25 08 a0 04 08    	jmp    *0x804a008
 804831c:	00 00                	add    %al,(%eax)
	...

08048320 <strcmp@plt>:
 8048320:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 8048326:	68 00 00 00 00       	push   $0x0
 804832b:	e9 e0 ff ff ff       	jmp    8048310 <_init+0x24>

08048330 <puts@plt>:
 8048330:	ff 25 10 a0 04 08    	jmp    *0x804a010
 8048336:	68 08 00 00 00       	push   $0x8
 804833b:	e9 d0 ff ff ff       	jmp    8048310 <_init+0x24>

08048340 <strlen@plt>:
 8048340:	ff 25 14 a0 04 08    	jmp    *0x804a014
 8048346:	68 10 00 00 00       	push   $0x10
 804834b:	e9 c0 ff ff ff       	jmp    8048310 <_init+0x24>

08048350 <__libc_start_main@plt>:
 8048350:	ff 25 18 a0 04 08    	jmp    *0x804a018
 8048356:	68 18 00 00 00       	push   $0x18
 804835b:	e9 b0 ff ff ff       	jmp    8048310 <_init+0x24>

Disassembly of section .plt.got:

08048360 <.plt.got>:
 8048360:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048366:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048370 <_start>:
 8048370:	31 ed                	xor    %ebp,%ebp
 8048372:	5e                   	pop    %esi
 8048373:	89 e1                	mov    %esp,%ecx
 8048375:	83 e4 f0             	and    $0xfffffff0,%esp
 8048378:	50                   	push   %eax
 8048379:	54                   	push   %esp
 804837a:	52                   	push   %edx
 804837b:	68 40 86 04 08       	push   $0x8048640
 8048380:	68 e0 85 04 08       	push   $0x80485e0
 8048385:	51                   	push   %ecx
 8048386:	56                   	push   %esi
 8048387:	68 6b 84 04 08       	push   $0x804846b
 804838c:	e8 bf ff ff ff       	call   8048350 <__libc_start_main@plt>
 8048391:	f4                   	hlt    
 8048392:	66 90                	xchg   %ax,%ax
 8048394:	66 90                	xchg   %ax,%ax
 8048396:	66 90                	xchg   %ax,%ax
 8048398:	66 90                	xchg   %ax,%ax
 804839a:	66 90                	xchg   %ax,%ax
 804839c:	66 90                	xchg   %ax,%ax
 804839e:	66 90                	xchg   %ax,%ax

080483a0 <__x86.get_pc_thunk.bx>:
 80483a0:	8b 1c 24             	mov    (%esp),%ebx
 80483a3:	c3                   	ret    
 80483a4:	66 90                	xchg   %ax,%ax
 80483a6:	66 90                	xchg   %ax,%ax
 80483a8:	66 90                	xchg   %ax,%ax
 80483aa:	66 90                	xchg   %ax,%ax
 80483ac:	66 90                	xchg   %ax,%ax
 80483ae:	66 90                	xchg   %ax,%ax

080483b0 <deregister_tm_clones>:
 80483b0:	b8 e7 a0 04 08       	mov    $0x804a0e7,%eax
 80483b5:	2d e4 a0 04 08       	sub    $0x804a0e4,%eax
 80483ba:	83 f8 06             	cmp    $0x6,%eax
 80483bd:	76 1a                	jbe    80483d9 <deregister_tm_clones+0x29>
 80483bf:	b8 00 00 00 00       	mov    $0x0,%eax
 80483c4:	85 c0                	test   %eax,%eax
 80483c6:	74 11                	je     80483d9 <deregister_tm_clones+0x29>
 80483c8:	55                   	push   %ebp
 80483c9:	89 e5                	mov    %esp,%ebp
 80483cb:	83 ec 14             	sub    $0x14,%esp
 80483ce:	68 e4 a0 04 08       	push   $0x804a0e4
 80483d3:	ff d0                	call   *%eax
 80483d5:	83 c4 10             	add    $0x10,%esp
 80483d8:	c9                   	leave  
 80483d9:	f3 c3                	repz ret 
 80483db:	90                   	nop
 80483dc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

080483e0 <register_tm_clones>:
 80483e0:	b8 e4 a0 04 08       	mov    $0x804a0e4,%eax
 80483e5:	2d e4 a0 04 08       	sub    $0x804a0e4,%eax
 80483ea:	c1 f8 02             	sar    $0x2,%eax
 80483ed:	89 c2                	mov    %eax,%edx
 80483ef:	c1 ea 1f             	shr    $0x1f,%edx
 80483f2:	01 d0                	add    %edx,%eax
 80483f4:	d1 f8                	sar    %eax
 80483f6:	74 1b                	je     8048413 <register_tm_clones+0x33>
 80483f8:	ba 00 00 00 00       	mov    $0x0,%edx
 80483fd:	85 d2                	test   %edx,%edx
 80483ff:	74 12                	je     8048413 <register_tm_clones+0x33>
 8048401:	55                   	push   %ebp
 8048402:	89 e5                	mov    %esp,%ebp
 8048404:	83 ec 10             	sub    $0x10,%esp
 8048407:	50                   	push   %eax
 8048408:	68 e4 a0 04 08       	push   $0x804a0e4
 804840d:	ff d2                	call   *%edx
 804840f:	83 c4 10             	add    $0x10,%esp
 8048412:	c9                   	leave  
 8048413:	f3 c3                	repz ret 
 8048415:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048419:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048420 <__do_global_dtors_aux>:
 8048420:	80 3d e4 a0 04 08 00 	cmpb   $0x0,0x804a0e4
 8048427:	75 13                	jne    804843c <__do_global_dtors_aux+0x1c>
 8048429:	55                   	push   %ebp
 804842a:	89 e5                	mov    %esp,%ebp
 804842c:	83 ec 08             	sub    $0x8,%esp
 804842f:	e8 7c ff ff ff       	call   80483b0 <deregister_tm_clones>
 8048434:	c6 05 e4 a0 04 08 01 	movb   $0x1,0x804a0e4
 804843b:	c9                   	leave  
 804843c:	f3 c3                	repz ret 
 804843e:	66 90                	xchg   %ax,%ax

08048440 <frame_dummy>:
 8048440:	b8 10 9f 04 08       	mov    $0x8049f10,%eax
 8048445:	8b 10                	mov    (%eax),%edx
 8048447:	85 d2                	test   %edx,%edx
 8048449:	75 05                	jne    8048450 <frame_dummy+0x10>
 804844b:	eb 93                	jmp    80483e0 <register_tm_clones>
 804844d:	8d 76 00             	lea    0x0(%esi),%esi
 8048450:	ba 00 00 00 00       	mov    $0x0,%edx
 8048455:	85 d2                	test   %edx,%edx
 8048457:	74 f2                	je     804844b <frame_dummy+0xb>
 8048459:	55                   	push   %ebp
 804845a:	89 e5                	mov    %esp,%ebp
 804845c:	83 ec 14             	sub    $0x14,%esp
 804845f:	50                   	push   %eax
 8048460:	ff d2                	call   *%edx
 8048462:	83 c4 10             	add    $0x10,%esp
 8048465:	c9                   	leave  
 8048466:	e9 75 ff ff ff       	jmp    80483e0 <register_tm_clones>

0804846b <main>:
 804846b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804846f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048472:	ff 71 fc             	pushl  -0x4(%ecx)
 8048475:	55                   	push   %ebp
 8048476:	89 e5                	mov    %esp,%ebp
 8048478:	51                   	push   %ecx
 8048479:	83 ec 04             	sub    $0x4,%esp
 804847c:	a1 e0 a0 04 08       	mov    0x804a0e0,%eax
 8048481:	85 c0                	test   %eax,%eax
 8048483:	74 09                	je     804848e <main+0x23>
 8048485:	a1 e0 a0 04 08       	mov    0x804a0e0,%eax
 804848a:	ff d0                	call   *%eax
 804848c:	eb 10                	jmp    804849e <main+0x33>
 804848e:	83 ec 0c             	sub    $0xc,%esp
 8048491:	68 78 87 04 08       	push   $0x8048778
 8048496:	e8 95 fe ff ff       	call   8048330 <puts@plt>
 804849b:	83 c4 10             	add    $0x10,%esp
 804849e:	b8 00 00 00 00       	mov    $0x0,%eax
 80484a3:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 80484a6:	c9                   	leave  
 80484a7:	8d 61 fc             	lea    -0x4(%ecx),%esp
 80484aa:	c3                   	ret    

080484ab <vrjqLgNJjW>:
 80484ab:	55                   	push   %ebp
 80484ac:	89 e5                	mov    %esp,%ebp
 80484ae:	90                   	nop
 80484af:	90                   	nop
 80484b0:	90                   	nop
 80484b1:	90                   	nop
 80484b2:	90                   	nop
 80484b3:	90                   	nop
 80484b4:	90                   	nop
 80484b5:	90                   	nop
 80484b6:	90                   	nop
 80484b7:	90                   	nop
 80484b8:	90                   	nop
 80484b9:	90                   	nop
 80484ba:	90                   	nop
 80484bb:	90                   	nop
 80484bc:	90                   	nop
 80484bd:	90                   	nop
 80484be:	90                   	nop
 80484bf:	90                   	nop
 80484c0:	90                   	nop
 80484c1:	90                   	nop
 80484c2:	90                   	nop
 80484c3:	90                   	nop
 80484c4:	90                   	nop
 80484c5:	90                   	nop
 80484c6:	90                   	nop
 80484c7:	90                   	nop
 80484c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80484cd:	5d                   	pop    %ebp
 80484ce:	c3                   	ret    

080484cf <SnLHPJDszf>:
 80484cf:	55                   	push   %ebp
 80484d0:	89 e5                	mov    %esp,%ebp
 80484d2:	83 ec 38             	sub    $0x38,%esp
 80484d5:	c7 45 ce 76 76 59 32 	movl   $0x32597676,-0x32(%ebp)
 80484dc:	c7 45 d2 34 69 51 30 	movl   $0x30516934,-0x2e(%ebp)
 80484e3:	c7 45 d6 49 59 4b 76 	movl   $0x764b5949,-0x2a(%ebp)
 80484ea:	c7 45 da 48 62 6d 37 	movl   $0x376d6248,-0x26(%ebp)
 80484f1:	c7 45 de 46 41 6a 71 	movl   $0x716a4146,-0x22(%ebp)
 80484f8:	c7 45 e2 49 66 6a 78 	movl   $0x786a6649,-0x1e(%ebp)
 80484ff:	c7 45 e6 34 30 41 49 	movl   $0x49413034,-0x1a(%ebp)
 8048506:	c7 45 ea 6a 30 37 65 	movl   $0x6537306a,-0x16(%ebp)
 804850d:	c7 45 ee 74 68 7a 36 	movl   $0x367a6874,-0x12(%ebp)
 8048514:	66 c7 45 f2 53 00    	movw   $0x53,-0xe(%ebp)
 804851a:	83 ec 0c             	sub    $0xc,%esp
 804851d:	8d 45 ce             	lea    -0x32(%ebp),%eax
 8048520:	50                   	push   %eax
 8048521:	e8 1a fe ff ff       	call   8048340 <strlen@plt>
 8048526:	83 c4 10             	add    $0x10,%esp
 8048529:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804852c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048530:	78 15                	js     8048547 <SnLHPJDszf+0x78>
 8048532:	8b 45 08             	mov    0x8(%ebp),%eax
 8048535:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8048538:	7d 0d                	jge    8048547 <SnLHPJDszf+0x78>
 804853a:	8d 55 ce             	lea    -0x32(%ebp),%edx
 804853d:	8b 45 08             	mov    0x8(%ebp),%eax
 8048540:	01 d0                	add    %edx,%eax
 8048542:	0f b6 00             	movzbl (%eax),%eax
 8048545:	eb 05                	jmp    804854c <SnLHPJDszf+0x7d>
 8048547:	b8 00 00 00 00       	mov    $0x0,%eax
 804854c:	c9                   	leave  
 804854d:	c3                   	ret    

0804854e <QvrqHyZu>:
 804854e:	55                   	push   %ebp
 804854f:	89 e5                	mov    %esp,%ebp
 8048551:	83 ec 18             	sub    $0x18,%esp
 8048554:	c7 45 ee 31 36 31 32 	movl   $0x32313631,-0x12(%ebp)
 804855b:	c7 45 f2 32 30 31 36 	movl   $0x36313032,-0xe(%ebp)
 8048562:	66 c7 45 f6 39 00    	movw   $0x39,-0xa(%ebp)
 8048568:	83 ec 08             	sub    $0x8,%esp
 804856b:	8d 45 ee             	lea    -0x12(%ebp),%eax
 804856e:	50                   	push   %eax
 804856f:	ff 75 08             	pushl  0x8(%ebp)
 8048572:	e8 a9 fd ff ff       	call   8048320 <strcmp@plt>
 8048577:	83 c4 10             	add    $0x10,%esp
 804857a:	85 c0                	test   %eax,%eax
 804857c:	75 10                	jne    804858e <QvrqHyZu+0x40>
 804857e:	83 ec 0c             	sub    $0xc,%esp
 8048581:	ff 75 08             	pushl  0x8(%ebp)
 8048584:	e8 a7 fd ff ff       	call   8048330 <puts@plt>
 8048589:	83 c4 10             	add    $0x10,%esp
 804858c:	eb 01                	jmp    804858f <QvrqHyZu+0x41>
 804858e:	90                   	nop
 804858f:	c9                   	leave  
 8048590:	c3                   	ret    

08048591 <do_phase>:
 8048591:	55                   	push   %ebp
 8048592:	89 e5                	mov    %esp,%ebp
 8048594:	89 e8                	mov    %ebp,%eax
 8048596:	29 05 1e 00 00 00    	sub    %eax,0x1e
 804859c:	50                   	push   %eax
 804859d:	90                   	nop
 804859e:	90                   	nop
 804859f:	90                   	nop
 80485a0:	90                   	nop
 80485a1:	e8 a8 ff ff ff       	call   804854e <QvrqHyZu>
 80485a6:	83 c4 04             	add    $0x4,%esp
 80485a9:	90                   	nop
 80485aa:	90                   	nop
 80485ab:	90                   	nop
 80485ac:	90                   	nop
 80485ad:	90                   	nop
 80485ae:	90                   	nop
 80485af:	90                   	nop
 80485b0:	90                   	nop
 80485b1:	90                   	nop
 80485b2:	90                   	nop
 80485b3:	90                   	nop
 80485b4:	90                   	nop
 80485b5:	90                   	nop
 80485b6:	90                   	nop
 80485b7:	90                   	nop
 80485b8:	90                   	nop
 80485b9:	90                   	nop
 80485ba:	90                   	nop
 80485bb:	90                   	nop
 80485bc:	90                   	nop
 80485bd:	90                   	nop
 80485be:	90                   	nop
 80485bf:	90                   	nop
 80485c0:	90                   	nop
 80485c1:	90                   	nop
 80485c2:	90                   	nop
 80485c3:	90                   	nop
 80485c4:	90                   	nop
 80485c5:	90                   	nop
 80485c6:	90                   	nop
 80485c7:	90                   	nop
 80485c8:	90                   	nop
 80485c9:	90                   	nop
 80485ca:	90                   	nop
 80485cb:	90                   	nop
 80485cc:	90                   	nop
 80485cd:	90                   	nop
 80485ce:	90                   	nop
 80485cf:	90                   	nop
 80485d0:	90                   	nop
 80485d1:	90                   	nop
 80485d2:	90                   	nop
 80485d3:	90                   	nop
 80485d4:	90                   	nop
 80485d5:	5d                   	pop    %ebp
 80485d6:	c3                   	ret    
 80485d7:	66 90                	xchg   %ax,%ax
 80485d9:	66 90                	xchg   %ax,%ax
 80485db:	66 90                	xchg   %ax,%ax
 80485dd:	66 90                	xchg   %ax,%ax
 80485df:	90                   	nop

080485e0 <__libc_csu_init>:
 80485e0:	55                   	push   %ebp
 80485e1:	57                   	push   %edi
 80485e2:	56                   	push   %esi
 80485e3:	53                   	push   %ebx
 80485e4:	e8 b7 fd ff ff       	call   80483a0 <__x86.get_pc_thunk.bx>
 80485e9:	81 c3 17 1a 00 00    	add    $0x1a17,%ebx
 80485ef:	83 ec 0c             	sub    $0xc,%esp
 80485f2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80485f6:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80485fc:	e8 eb fc ff ff       	call   80482ec <_init>
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
 8048648:	e8 53 fd ff ff       	call   80483a0 <__x86.get_pc_thunk.bx>
 804864d:	81 c3 b3 19 00 00    	add    $0x19b3,%ebx
 8048653:	83 c4 08             	add    $0x8,%esp
 8048656:	5b                   	pop    %ebx
 8048657:	c3                   	ret    
