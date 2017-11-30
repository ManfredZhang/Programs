
linkbomb:     file format elf32-i386


Disassembly of section .init:

080482a8 <_init>:
 80482a8:	53                   	push   %ebx
 80482a9:	83 ec 08             	sub    $0x8,%esp
 80482ac:	e8 8f 00 00 00       	call   8048340 <__x86.get_pc_thunk.bx>
 80482b1:	81 c3 4f 1d 00 00    	add    $0x1d4f,%ebx
 80482b7:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 80482bd:	85 c0                	test   %eax,%eax
 80482bf:	74 05                	je     80482c6 <_init+0x1e>
 80482c1:	e8 3a 00 00 00       	call   8048300 <__libc_start_main@plt+0x10>
 80482c6:	83 c4 08             	add    $0x8,%esp
 80482c9:	5b                   	pop    %ebx
 80482ca:	c3                   	ret    

Disassembly of section .plt:

080482d0 <puts@plt-0x10>:
 80482d0:	ff 35 04 a0 04 08    	pushl  0x804a004
 80482d6:	ff 25 08 a0 04 08    	jmp    *0x804a008
 80482dc:	00 00                	add    %al,(%eax)
	...

080482e0 <puts@plt>:
 80482e0:	ff 25 0c a0 04 08    	jmp    *0x804a00c
 80482e6:	68 00 00 00 00       	push   $0x0
 80482eb:	e9 e0 ff ff ff       	jmp    80482d0 <_init+0x28>

080482f0 <__libc_start_main@plt>:
 80482f0:	ff 25 10 a0 04 08    	jmp    *0x804a010
 80482f6:	68 08 00 00 00       	push   $0x8
 80482fb:	e9 d0 ff ff ff       	jmp    80482d0 <_init+0x28>

Disassembly of section .plt.got:

08048300 <.plt.got>:
 8048300:	ff 25 fc 9f 04 08    	jmp    *0x8049ffc
 8048306:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

08048310 <_start>:
 8048310:	31 ed                	xor    %ebp,%ebp
 8048312:	5e                   	pop    %esi
 8048313:	89 e1                	mov    %esp,%ecx
 8048315:	83 e4 f0             	and    $0xfffffff0,%esp
 8048318:	50                   	push   %eax
 8048319:	54                   	push   %esp
 804831a:	52                   	push   %edx
 804831b:	68 00 86 04 08       	push   $0x8048600
 8048320:	68 a0 85 04 08       	push   $0x80485a0
 8048325:	51                   	push   %ecx
 8048326:	56                   	push   %esi
 8048327:	68 0b 84 04 08       	push   $0x804840b
 804832c:	e8 bf ff ff ff       	call   80482f0 <__libc_start_main@plt>
 8048331:	f4                   	hlt    
 8048332:	66 90                	xchg   %ax,%ax
 8048334:	66 90                	xchg   %ax,%ax
 8048336:	66 90                	xchg   %ax,%ax
 8048338:	66 90                	xchg   %ax,%ax
 804833a:	66 90                	xchg   %ax,%ax
 804833c:	66 90                	xchg   %ax,%ax
 804833e:	66 90                	xchg   %ax,%ax

08048340 <__x86.get_pc_thunk.bx>:
 8048340:	8b 1c 24             	mov    (%esp),%ebx
 8048343:	c3                   	ret    
 8048344:	66 90                	xchg   %ax,%ax
 8048346:	66 90                	xchg   %ax,%ax
 8048348:	66 90                	xchg   %ax,%ax
 804834a:	66 90                	xchg   %ax,%ax
 804834c:	66 90                	xchg   %ax,%ax
 804834e:	66 90                	xchg   %ax,%ax

08048350 <deregister_tm_clones>:
 8048350:	b8 e7 a0 04 08       	mov    $0x804a0e7,%eax
 8048355:	2d e4 a0 04 08       	sub    $0x804a0e4,%eax
 804835a:	83 f8 06             	cmp    $0x6,%eax
 804835d:	76 1a                	jbe    8048379 <deregister_tm_clones+0x29>
 804835f:	b8 00 00 00 00       	mov    $0x0,%eax
 8048364:	85 c0                	test   %eax,%eax
 8048366:	74 11                	je     8048379 <deregister_tm_clones+0x29>
 8048368:	55                   	push   %ebp
 8048369:	89 e5                	mov    %esp,%ebp
 804836b:	83 ec 14             	sub    $0x14,%esp
 804836e:	68 e4 a0 04 08       	push   $0x804a0e4
 8048373:	ff d0                	call   *%eax
 8048375:	83 c4 10             	add    $0x10,%esp
 8048378:	c9                   	leave  
 8048379:	f3 c3                	repz ret 
 804837b:	90                   	nop
 804837c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048380 <register_tm_clones>:
 8048380:	b8 e4 a0 04 08       	mov    $0x804a0e4,%eax
 8048385:	2d e4 a0 04 08       	sub    $0x804a0e4,%eax
 804838a:	c1 f8 02             	sar    $0x2,%eax
 804838d:	89 c2                	mov    %eax,%edx
 804838f:	c1 ea 1f             	shr    $0x1f,%edx
 8048392:	01 d0                	add    %edx,%eax
 8048394:	d1 f8                	sar    %eax
 8048396:	74 1b                	je     80483b3 <register_tm_clones+0x33>
 8048398:	ba 00 00 00 00       	mov    $0x0,%edx
 804839d:	85 d2                	test   %edx,%edx
 804839f:	74 12                	je     80483b3 <register_tm_clones+0x33>
 80483a1:	55                   	push   %ebp
 80483a2:	89 e5                	mov    %esp,%ebp
 80483a4:	83 ec 10             	sub    $0x10,%esp
 80483a7:	50                   	push   %eax
 80483a8:	68 e4 a0 04 08       	push   $0x804a0e4
 80483ad:	ff d2                	call   *%edx
 80483af:	83 c4 10             	add    $0x10,%esp
 80483b2:	c9                   	leave  
 80483b3:	f3 c3                	repz ret 
 80483b5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 80483b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

080483c0 <__do_global_dtors_aux>:
 80483c0:	80 3d e4 a0 04 08 00 	cmpb   $0x0,0x804a0e4
 80483c7:	75 13                	jne    80483dc <__do_global_dtors_aux+0x1c>
 80483c9:	55                   	push   %ebp
 80483ca:	89 e5                	mov    %esp,%ebp
 80483cc:	83 ec 08             	sub    $0x8,%esp
 80483cf:	e8 7c ff ff ff       	call   8048350 <deregister_tm_clones>
 80483d4:	c6 05 e4 a0 04 08 01 	movb   $0x1,0x804a0e4
 80483db:	c9                   	leave  
 80483dc:	f3 c3                	repz ret 
 80483de:	66 90                	xchg   %ax,%ax

080483e0 <frame_dummy>:
 80483e0:	b8 10 9f 04 08       	mov    $0x8049f10,%eax
 80483e5:	8b 10                	mov    (%eax),%edx
 80483e7:	85 d2                	test   %edx,%edx
 80483e9:	75 05                	jne    80483f0 <frame_dummy+0x10>
 80483eb:	eb 93                	jmp    8048380 <register_tm_clones>
 80483ed:	8d 76 00             	lea    0x0(%esi),%esi
 80483f0:	ba 00 00 00 00       	mov    $0x0,%edx
 80483f5:	85 d2                	test   %edx,%edx
 80483f7:	74 f2                	je     80483eb <frame_dummy+0xb>
 80483f9:	55                   	push   %ebp
 80483fa:	89 e5                	mov    %esp,%ebp
 80483fc:	83 ec 14             	sub    $0x14,%esp
 80483ff:	50                   	push   %eax
 8048400:	ff d2                	call   *%edx
 8048402:	83 c4 10             	add    $0x10,%esp
 8048405:	c9                   	leave  
 8048406:	e9 75 ff ff ff       	jmp    8048380 <register_tm_clones>

0804840b <main>:
 804840b:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 804840f:	83 e4 f0             	and    $0xfffffff0,%esp
 8048412:	ff 71 fc             	pushl  -0x4(%ecx)
 8048415:	55                   	push   %ebp
 8048416:	89 e5                	mov    %esp,%ebp
 8048418:	51                   	push   %ecx
 8048419:	83 ec 04             	sub    $0x4,%esp
 804841c:	a1 e0 a0 04 08       	mov    0x804a0e0,%eax
 8048421:	85 c0                	test   %eax,%eax
 8048423:	74 09                	je     804842e <main+0x23>
 8048425:	a1 e0 a0 04 08       	mov    0x804a0e0,%eax
 804842a:	ff d0                	call   *%eax
 804842c:	eb 10                	jmp    804843e <main+0x33>
 804842e:	83 ec 0c             	sub    $0xc,%esp
 8048431:	68 38 87 04 08       	push   $0x8048738
 8048436:	e8 a5 fe ff ff       	call   80482e0 <puts@plt>
 804843b:	83 c4 10             	add    $0x10,%esp
 804843e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048443:	8b 4d fc             	mov    -0x4(%ebp),%ecx
 8048446:	c9                   	leave  
 8048447:	8d 61 fc             	lea    -0x4(%ecx),%esp
 804844a:	c3                   	ret    

0804844b <czvrykivxh>:
 804844b:	55                   	push   %ebp
 804844c:	89 e5                	mov    %esp,%ebp
 804844e:	90                   	nop
 804844f:	90                   	nop
 8048450:	90                   	nop
 8048451:	90                   	nop
 8048452:	90                   	nop
 8048453:	90                   	nop
 8048454:	90                   	nop
 8048455:	90                   	nop
 8048456:	90                   	nop
 8048457:	90                   	nop
 8048458:	90                   	nop
 8048459:	90                   	nop
 804845a:	90                   	nop
 804845b:	90                   	nop
 804845c:	90                   	nop
 804845d:	90                   	nop
 804845e:	90                   	nop
 804845f:	90                   	nop
 8048460:	90                   	nop
 8048461:	90                   	nop
 8048462:	90                   	nop
 8048463:	90                   	nop
 8048464:	90                   	nop
 8048465:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804846a:	5d                   	pop    %ebp
 804846b:	c3                   	ret    

0804846c <do_phase>:
 804846c:	55                   	push   %ebp
 804846d:	89 e5                	mov    %esp,%ebp
 804846f:	83 ec 28             	sub    $0x28,%esp
 8048472:	c7 45 e6 4a 4e 51 47 	movl   $0x47514e4a,-0x1a(%ebp)
 8048479:	c7 45 ea 45 46 52 4c 	movl   $0x4c524645,-0x16(%ebp)
 8048480:	66 c7 45 ee 59 00    	movw   $0x59,-0x12(%ebp)
 8048486:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804848d:	e9 e0 00 00 00       	jmp    8048572 <do_phase+0x106>
 8048492:	8d 55 e6             	lea    -0x1a(%ebp),%edx
 8048495:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048498:	01 d0                	add    %edx,%eax
 804849a:	0f b6 00             	movzbl (%eax),%eax
 804849d:	88 45 f7             	mov    %al,-0x9(%ebp)
 80484a0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
 80484a4:	83 e8 41             	sub    $0x41,%eax
 80484a7:	83 f8 19             	cmp    $0x19,%eax
 80484aa:	0f 87 b0 00 00 00    	ja     8048560 <do_phase+0xf4>
 80484b0:	8b 04 85 ac 87 04 08 	mov    0x80487ac(,%eax,4),%eax
 80484b7:	ff e0                	jmp    *%eax
 80484b9:	c6 45 f7 47          	movb   $0x47,-0x9(%ebp)
 80484bd:	e9 9e 00 00 00       	jmp    8048560 <do_phase+0xf4>
 80484c2:	c6 45 f7 56          	movb   $0x56,-0x9(%ebp)
 80484c6:	e9 95 00 00 00       	jmp    8048560 <do_phase+0xf4>
 80484cb:	c6 45 f7 33          	movb   $0x33,-0x9(%ebp)
 80484cf:	e9 8c 00 00 00       	jmp    8048560 <do_phase+0xf4>
 80484d4:	c6 45 f7 5a          	movb   $0x5a,-0x9(%ebp)
 80484d8:	e9 83 00 00 00       	jmp    8048560 <do_phase+0xf4>
 80484dd:	c6 45 f7 31          	movb   $0x31,-0x9(%ebp)
 80484e1:	eb 7d                	jmp    8048560 <do_phase+0xf4>
 80484e3:	c6 45 f7 3d          	movb   $0x3d,-0x9(%ebp)
 80484e7:	eb 77                	jmp    8048560 <do_phase+0xf4>
 80484e9:	c6 45 f7 7b          	movb   $0x7b,-0x9(%ebp)
 80484ed:	eb 71                	jmp    8048560 <do_phase+0xf4>
 80484ef:	c6 45 f7 76          	movb   $0x76,-0x9(%ebp)
 80484f3:	eb 6b                	jmp    8048560 <do_phase+0xf4>
 80484f5:	c6 45 f7 32          	movb   $0x32,-0x9(%ebp)
 80484f9:	eb 65                	jmp    8048560 <do_phase+0xf4>
 80484fb:	c6 45 f7 6a          	movb   $0x6a,-0x9(%ebp)
 80484ff:	eb 5f                	jmp    8048560 <do_phase+0xf4>
 8048501:	c6 45 f7 55          	movb   $0x55,-0x9(%ebp)
 8048505:	eb 59                	jmp    8048560 <do_phase+0xf4>
 8048507:	c6 45 f7 35          	movb   $0x35,-0x9(%ebp)
 804850b:	eb 53                	jmp    8048560 <do_phase+0xf4>
 804850d:	c6 45 f7 52          	movb   $0x52,-0x9(%ebp)
 8048511:	eb 4d                	jmp    8048560 <do_phase+0xf4>
 8048513:	c6 45 f7 4e          	movb   $0x4e,-0x9(%ebp)
 8048517:	eb 47                	jmp    8048560 <do_phase+0xf4>
 8048519:	c6 45 f7 66          	movb   $0x66,-0x9(%ebp)
 804851d:	eb 41                	jmp    8048560 <do_phase+0xf4>
 804851f:	c6 45 f7 36          	movb   $0x36,-0x9(%ebp)
 8048523:	eb 3b                	jmp    8048560 <do_phase+0xf4>
 8048525:	c6 45 f7 7c          	movb   $0x7c,-0x9(%ebp)
 8048529:	eb 35                	jmp    8048560 <do_phase+0xf4>
 804852b:	c6 45 f7 67          	movb   $0x67,-0x9(%ebp)
 804852f:	eb 2f                	jmp    8048560 <do_phase+0xf4>
 8048531:	c6 45 f7 3c          	movb   $0x3c,-0x9(%ebp)
 8048535:	eb 29                	jmp    8048560 <do_phase+0xf4>
 8048537:	c6 45 f7 38          	movb   $0x38,-0x9(%ebp)
 804853b:	eb 23                	jmp    8048560 <do_phase+0xf4>
 804853d:	c6 45 f7 37          	movb   $0x37,-0x9(%ebp)
 8048541:	eb 1d                	jmp    8048560 <do_phase+0xf4>
 8048543:	c6 45 f7 34          	movb   $0x34,-0x9(%ebp)
 8048547:	eb 17                	jmp    8048560 <do_phase+0xf4>
 8048549:	c6 45 f7 69          	movb   $0x69,-0x9(%ebp)
 804854d:	eb 11                	jmp    8048560 <do_phase+0xf4>
 804854f:	c6 45 f7 5d          	movb   $0x5d,-0x9(%ebp)
 8048553:	eb 0b                	jmp    8048560 <do_phase+0xf4>
 8048555:	c6 45 f7 39          	movb   $0x39,-0x9(%ebp)
 8048559:	eb 05                	jmp    8048560 <do_phase+0xf4>
 804855b:	c6 45 f7 30          	movb   $0x30,-0x9(%ebp)
 804855f:	90                   	nop
 8048560:	8d 55 dc             	lea    -0x24(%ebp),%edx
 8048563:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048566:	01 c2                	add    %eax,%edx
 8048568:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 804856c:	88 02                	mov    %al,(%edx)
 804856e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048572:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048575:	83 f8 08             	cmp    $0x8,%eax
 8048578:	0f 86 14 ff ff ff    	jbe    8048492 <do_phase+0x26>
 804857e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 8048581:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048584:	01 d0                	add    %edx,%eax
 8048586:	c6 00 00             	movb   $0x0,(%eax)
 8048589:	83 ec 0c             	sub    $0xc,%esp
 804858c:	8d 45 dc             	lea    -0x24(%ebp),%eax
 804858f:	50                   	push   %eax
 8048590:	e8 4b fd ff ff       	call   80482e0 <puts@plt>
 8048595:	83 c4 10             	add    $0x10,%esp
 8048598:	90                   	nop
 8048599:	c9                   	leave  
 804859a:	c3                   	ret    
 804859b:	66 90                	xchg   %ax,%ax
 804859d:	66 90                	xchg   %ax,%ax
 804859f:	90                   	nop

080485a0 <__libc_csu_init>:
 80485a0:	55                   	push   %ebp
 80485a1:	57                   	push   %edi
 80485a2:	56                   	push   %esi
 80485a3:	53                   	push   %ebx
 80485a4:	e8 97 fd ff ff       	call   8048340 <__x86.get_pc_thunk.bx>
 80485a9:	81 c3 57 1a 00 00    	add    $0x1a57,%ebx
 80485af:	83 ec 0c             	sub    $0xc,%esp
 80485b2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
 80485b6:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80485bc:	e8 e7 fc ff ff       	call   80482a8 <_init>
 80485c1:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 80485c7:	29 c6                	sub    %eax,%esi
 80485c9:	c1 fe 02             	sar    $0x2,%esi
 80485cc:	85 f6                	test   %esi,%esi
 80485ce:	74 25                	je     80485f5 <__libc_csu_init+0x55>
 80485d0:	31 ff                	xor    %edi,%edi
 80485d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 80485d8:	83 ec 04             	sub    $0x4,%esp
 80485db:	ff 74 24 2c          	pushl  0x2c(%esp)
 80485df:	ff 74 24 2c          	pushl  0x2c(%esp)
 80485e3:	55                   	push   %ebp
 80485e4:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 80485eb:	83 c7 01             	add    $0x1,%edi
 80485ee:	83 c4 10             	add    $0x10,%esp
 80485f1:	39 f7                	cmp    %esi,%edi
 80485f3:	75 e3                	jne    80485d8 <__libc_csu_init+0x38>
 80485f5:	83 c4 0c             	add    $0xc,%esp
 80485f8:	5b                   	pop    %ebx
 80485f9:	5e                   	pop    %esi
 80485fa:	5f                   	pop    %edi
 80485fb:	5d                   	pop    %ebp
 80485fc:	c3                   	ret    
 80485fd:	8d 76 00             	lea    0x0(%esi),%esi

08048600 <__libc_csu_fini>:
 8048600:	f3 c3                	repz ret 

Disassembly of section .fini:

08048604 <_fini>:
 8048604:	53                   	push   %ebx
 8048605:	83 ec 08             	sub    $0x8,%esp
 8048608:	e8 33 fd ff ff       	call   8048340 <__x86.get_pc_thunk.bx>
 804860d:	81 c3 f3 19 00 00    	add    $0x19f3,%ebx
 8048613:	83 c4 08             	add    $0x8,%esp
 8048616:	5b                   	pop    %ebx
 8048617:	c3                   	ret    
