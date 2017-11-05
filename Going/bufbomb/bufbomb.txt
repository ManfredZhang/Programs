
bufbomb：     文件格式 elf32-i386


Disassembly of section .init:

08048524 <_init>:
 8048524:	53                   	push   %ebx
 8048525:	83 ec 08             	sub    $0x8,%esp
 8048528:	e8 93 01 00 00       	call   80486c0 <__x86.get_pc_thunk.bx>
 804852d:	81 c3 cb 1b 00 00    	add    $0x1bcb,%ebx
 8048533:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048539:	85 c0                	test   %eax,%eax
 804853b:	74 05                	je     8048542 <_init+0x1e>
 804853d:	e8 9e 00 00 00       	call   80485e0 <__gmon_start__@plt>
 8048542:	83 c4 08             	add    $0x8,%esp
 8048545:	5b                   	pop    %ebx
 8048546:	c3                   	ret    

Disassembly of section .plt:

08048550 <.plt>:
 8048550:	ff 35 fc a0 04 08    	pushl  0x804a0fc
 8048556:	ff 25 00 a1 04 08    	jmp    *0x804a100
 804855c:	00 00                	add    %al,(%eax)
	...

08048560 <srandom@plt>:
 8048560:	ff 25 04 a1 04 08    	jmp    *0x804a104
 8048566:	68 00 00 00 00       	push   $0x0
 804856b:	e9 e0 ff ff ff       	jmp    8048550 <.plt>

08048570 <printf@plt>:
 8048570:	ff 25 08 a1 04 08    	jmp    *0x804a108
 8048576:	68 08 00 00 00       	push   $0x8
 804857b:	e9 d0 ff ff ff       	jmp    8048550 <.plt>

08048580 <strdup@plt>:
 8048580:	ff 25 0c a1 04 08    	jmp    *0x804a10c
 8048586:	68 10 00 00 00       	push   $0x10
 804858b:	e9 c0 ff ff ff       	jmp    8048550 <.plt>

08048590 <signal@plt>:
 8048590:	ff 25 10 a1 04 08    	jmp    *0x804a110
 8048596:	68 18 00 00 00       	push   $0x18
 804859b:	e9 b0 ff ff ff       	jmp    8048550 <.plt>

080485a0 <_IO_getc@plt>:
 80485a0:	ff 25 14 a1 04 08    	jmp    *0x804a114
 80485a6:	68 20 00 00 00       	push   $0x20
 80485ab:	e9 a0 ff ff ff       	jmp    8048550 <.plt>

080485b0 <fwrite@plt>:
 80485b0:	ff 25 18 a1 04 08    	jmp    *0x804a118
 80485b6:	68 28 00 00 00       	push   $0x28
 80485bb:	e9 90 ff ff ff       	jmp    8048550 <.plt>

080485c0 <getpid@plt>:
 80485c0:	ff 25 1c a1 04 08    	jmp    *0x804a11c
 80485c6:	68 30 00 00 00       	push   $0x30
 80485cb:	e9 80 ff ff ff       	jmp    8048550 <.plt>

080485d0 <puts@plt>:
 80485d0:	ff 25 20 a1 04 08    	jmp    *0x804a120
 80485d6:	68 38 00 00 00       	push   $0x38
 80485db:	e9 70 ff ff ff       	jmp    8048550 <.plt>

080485e0 <__gmon_start__@plt>:
 80485e0:	ff 25 24 a1 04 08    	jmp    *0x804a124
 80485e6:	68 40 00 00 00       	push   $0x40
 80485eb:	e9 60 ff ff ff       	jmp    8048550 <.plt>

080485f0 <exit@plt>:
 80485f0:	ff 25 28 a1 04 08    	jmp    *0x804a128
 80485f6:	68 48 00 00 00       	push   $0x48
 80485fb:	e9 50 ff ff ff       	jmp    8048550 <.plt>

08048600 <srand@plt>:
 8048600:	ff 25 2c a1 04 08    	jmp    *0x804a12c
 8048606:	68 50 00 00 00       	push   $0x50
 804860b:	e9 40 ff ff ff       	jmp    8048550 <.plt>

08048610 <mmap@plt>:
 8048610:	ff 25 30 a1 04 08    	jmp    *0x804a130
 8048616:	68 58 00 00 00       	push   $0x58
 804861b:	e9 30 ff ff ff       	jmp    8048550 <.plt>

08048620 <__libc_start_main@plt>:
 8048620:	ff 25 34 a1 04 08    	jmp    *0x804a134
 8048626:	68 60 00 00 00       	push   $0x60
 804862b:	e9 20 ff ff ff       	jmp    8048550 <.plt>

08048630 <getopt@plt>:
 8048630:	ff 25 38 a1 04 08    	jmp    *0x804a138
 8048636:	68 68 00 00 00       	push   $0x68
 804863b:	e9 10 ff ff ff       	jmp    8048550 <.plt>

08048640 <memset@plt>:
 8048640:	ff 25 3c a1 04 08    	jmp    *0x804a13c
 8048646:	68 70 00 00 00       	push   $0x70
 804864b:	e9 00 ff ff ff       	jmp    8048550 <.plt>

08048650 <rand@plt>:
 8048650:	ff 25 40 a1 04 08    	jmp    *0x804a140
 8048656:	68 78 00 00 00       	push   $0x78
 804865b:	e9 f0 fe ff ff       	jmp    8048550 <.plt>

08048660 <munmap@plt>:
 8048660:	ff 25 44 a1 04 08    	jmp    *0x804a144
 8048666:	68 80 00 00 00       	push   $0x80
 804866b:	e9 e0 fe ff ff       	jmp    8048550 <.plt>

08048670 <random@plt>:
 8048670:	ff 25 48 a1 04 08    	jmp    *0x804a148
 8048676:	68 88 00 00 00       	push   $0x88
 804867b:	e9 d0 fe ff ff       	jmp    8048550 <.plt>

08048680 <calloc@plt>:
 8048680:	ff 25 4c a1 04 08    	jmp    *0x804a14c
 8048686:	68 90 00 00 00       	push   $0x90
 804868b:	e9 c0 fe ff ff       	jmp    8048550 <.plt>

Disassembly of section .text:

08048690 <_start>:
 8048690:	31 ed                	xor    %ebp,%ebp
 8048692:	5e                   	pop    %esi
 8048693:	89 e1                	mov    %esp,%ecx
 8048695:	83 e4 f0             	and    $0xfffffff0,%esp
 8048698:	50                   	push   %eax
 8048699:	54                   	push   %esp
 804869a:	52                   	push   %edx
 804869b:	68 50 91 04 08       	push   $0x8049150
 80486a0:	68 e0 90 04 08       	push   $0x80490e0
 80486a5:	51                   	push   %ecx
 80486a6:	56                   	push   %esi
 80486a7:	68 14 8d 04 08       	push   $0x8048d14
 80486ac:	e8 6f ff ff ff       	call   8048620 <__libc_start_main@plt>
 80486b1:	f4                   	hlt    
 80486b2:	66 90                	xchg   %ax,%ax
 80486b4:	66 90                	xchg   %ax,%ax
 80486b6:	66 90                	xchg   %ax,%ax
 80486b8:	66 90                	xchg   %ax,%ax
 80486ba:	66 90                	xchg   %ax,%ax
 80486bc:	66 90                	xchg   %ax,%ax
 80486be:	66 90                	xchg   %ax,%ax

080486c0 <__x86.get_pc_thunk.bx>:
 80486c0:	8b 1c 24             	mov    (%esp),%ebx
 80486c3:	c3                   	ret    
 80486c4:	66 90                	xchg   %ax,%ax
 80486c6:	66 90                	xchg   %ax,%ax
 80486c8:	66 90                	xchg   %ax,%ax
 80486ca:	66 90                	xchg   %ax,%ax
 80486cc:	66 90                	xchg   %ax,%ax
 80486ce:	66 90                	xchg   %ax,%ax

080486d0 <deregister_tm_clones>:
 80486d0:	b8 77 a3 04 08       	mov    $0x804a377,%eax
 80486d5:	2d 74 a3 04 08       	sub    $0x804a374,%eax
 80486da:	83 f8 06             	cmp    $0x6,%eax
 80486dd:	76 1a                	jbe    80486f9 <deregister_tm_clones+0x29>
 80486df:	b8 00 00 00 00       	mov    $0x0,%eax
 80486e4:	85 c0                	test   %eax,%eax
 80486e6:	74 11                	je     80486f9 <deregister_tm_clones+0x29>
 80486e8:	55                   	push   %ebp
 80486e9:	89 e5                	mov    %esp,%ebp
 80486eb:	83 ec 14             	sub    $0x14,%esp
 80486ee:	68 74 a3 04 08       	push   $0x804a374
 80486f3:	ff d0                	call   *%eax
 80486f5:	83 c4 10             	add    $0x10,%esp
 80486f8:	c9                   	leave  
 80486f9:	f3 c3                	repz ret 
 80486fb:	90                   	nop
 80486fc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

08048700 <register_tm_clones>:
 8048700:	b8 74 a3 04 08       	mov    $0x804a374,%eax
 8048705:	2d 74 a3 04 08       	sub    $0x804a374,%eax
 804870a:	c1 f8 02             	sar    $0x2,%eax
 804870d:	89 c2                	mov    %eax,%edx
 804870f:	c1 ea 1f             	shr    $0x1f,%edx
 8048712:	01 d0                	add    %edx,%eax
 8048714:	d1 f8                	sar    %eax
 8048716:	74 1b                	je     8048733 <register_tm_clones+0x33>
 8048718:	ba 00 00 00 00       	mov    $0x0,%edx
 804871d:	85 d2                	test   %edx,%edx
 804871f:	74 12                	je     8048733 <register_tm_clones+0x33>
 8048721:	55                   	push   %ebp
 8048722:	89 e5                	mov    %esp,%ebp
 8048724:	83 ec 10             	sub    $0x10,%esp
 8048727:	50                   	push   %eax
 8048728:	68 74 a3 04 08       	push   $0x804a374
 804872d:	ff d2                	call   *%edx
 804872f:	83 c4 10             	add    $0x10,%esp
 8048732:	c9                   	leave  
 8048733:	f3 c3                	repz ret 
 8048735:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048739:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048740 <__do_global_dtors_aux>:
 8048740:	80 3d 8c a3 04 08 00 	cmpb   $0x0,0x804a38c
 8048747:	75 13                	jne    804875c <__do_global_dtors_aux+0x1c>
 8048749:	55                   	push   %ebp
 804874a:	89 e5                	mov    %esp,%ebp
 804874c:	83 ec 08             	sub    $0x8,%esp
 804874f:	e8 7c ff ff ff       	call   80486d0 <deregister_tm_clones>
 8048754:	c6 05 8c a3 04 08 01 	movb   $0x1,0x804a38c
 804875b:	c9                   	leave  
 804875c:	f3 c3                	repz ret 
 804875e:	66 90                	xchg   %ax,%ax

08048760 <frame_dummy>:
 8048760:	b8 08 a0 04 08       	mov    $0x804a008,%eax
 8048765:	8b 10                	mov    (%eax),%edx
 8048767:	85 d2                	test   %edx,%edx
 8048769:	75 05                	jne    8048770 <frame_dummy+0x10>
 804876b:	eb 93                	jmp    8048700 <register_tm_clones>
 804876d:	8d 76 00             	lea    0x0(%esi),%esi
 8048770:	ba 00 00 00 00       	mov    $0x0,%edx
 8048775:	85 d2                	test   %edx,%edx
 8048777:	74 f2                	je     804876b <frame_dummy+0xb>
 8048779:	55                   	push   %ebp
 804877a:	89 e5                	mov    %esp,%ebp
 804877c:	83 ec 14             	sub    $0x14,%esp
 804877f:	50                   	push   %eax
 8048780:	ff d2                	call   *%edx
 8048782:	83 c4 10             	add    $0x10,%esp
 8048785:	c9                   	leave  
 8048786:	e9 75 ff ff ff       	jmp    8048700 <register_tm_clones>

0804878b <IkEiyEMbXf>:
 804878b:	55                   	push   %ebp
 804878c:	89 e5                	mov    %esp,%ebp
 804878e:	53                   	push   %ebx
 804878f:	90                   	nop
 8048790:	90                   	nop
 8048791:	90                   	nop
 8048792:	90                   	nop
 8048793:	90                   	nop
 8048794:	90                   	nop
 8048795:	90                   	nop
 8048796:	90                   	nop
 8048797:	90                   	nop
 8048798:	90                   	nop
 8048799:	90                   	nop
 804879a:	90                   	nop
 804879b:	90                   	nop
 804879c:	90                   	nop
 804879d:	90                   	nop
 804879e:	90                   	nop
 804879f:	90                   	nop
 80487a0:	90                   	nop
 80487a1:	90                   	nop
 80487a2:	90                   	nop
 80487a3:	90                   	nop
 80487a4:	90                   	nop
 80487a5:	90                   	nop
 80487a6:	90                   	nop
 80487a7:	90                   	nop
 80487a8:	90                   	nop
 80487a9:	90                   	nop
 80487aa:	90                   	nop
 80487ab:	90                   	nop
 80487ac:	90                   	nop
 80487ad:	90                   	nop
 80487ae:	90                   	nop
 80487af:	90                   	nop
 80487b0:	90                   	nop
 80487b1:	90                   	nop
 80487b2:	90                   	nop
 80487b3:	90                   	nop
 80487b4:	90                   	nop
 80487b5:	90                   	nop
 80487b6:	90                   	nop
 80487b7:	90                   	nop
 80487b8:	90                   	nop
 80487b9:	90                   	nop
 80487ba:	90                   	nop
 80487bb:	90                   	nop
 80487bc:	90                   	nop
 80487bd:	90                   	nop
 80487be:	90                   	nop
 80487bf:	8b 55 08             	mov    0x8(%ebp),%edx
 80487c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 80487c5:	01 c2                	add    %eax,%edx
 80487c7:	8b 45 10             	mov    0x10(%ebp),%eax
 80487ca:	8d 0c 02             	lea    (%edx,%eax,1),%ecx
 80487cd:	8b 45 08             	mov    0x8(%ebp),%eax
 80487d0:	2b 45 0c             	sub    0xc(%ebp),%eax
 80487d3:	2b 45 10             	sub    0x10(%ebp),%eax
 80487d6:	89 c3                	mov    %eax,%ebx
 80487d8:	89 c8                	mov    %ecx,%eax
 80487da:	99                   	cltd   
 80487db:	f7 fb                	idiv   %ebx
 80487dd:	5b                   	pop    %ebx
 80487de:	5d                   	pop    %ebp
 80487df:	c3                   	ret    

080487e0 <smoke>:
 80487e0:	55                   	push   %ebp
 80487e1:	89 e5                	mov    %esp,%ebp
 80487e3:	83 ec 08             	sub    $0x8,%esp
 80487e6:	83 ec 0c             	sub    $0xc,%esp
 80487e9:	68 c9 91 04 08       	push   $0x80491c9
 80487ee:	e8 dd fd ff ff       	call   80485d0 <puts@plt>
 80487f3:	83 c4 10             	add    $0x10,%esp
 80487f6:	83 ec 0c             	sub    $0xc,%esp
 80487f9:	6a 00                	push   $0x0
 80487fb:	e8 7d 07 00 00       	call   8048f7d <validate>
 8048800:	83 c4 10             	add    $0x10,%esp
 8048803:	83 ec 0c             	sub    $0xc,%esp
 8048806:	6a 00                	push   $0x0
 8048808:	e8 e3 fd ff ff       	call   80485f0 <exit@plt>

0804880d <fizz>:
 804880d:	55                   	push   %ebp
 804880e:	89 e5                	mov    %esp,%ebp
 8048810:	83 ec 08             	sub    $0x8,%esp
 8048813:	8b 55 08             	mov    0x8(%ebp),%edx
 8048816:	a1 98 a3 04 08       	mov    0x804a398,%eax
 804881b:	39 c2                	cmp    %eax,%edx
 804881d:	75 22                	jne    8048841 <fizz+0x34>
 804881f:	83 ec 08             	sub    $0x8,%esp
 8048822:	ff 75 08             	pushl  0x8(%ebp)
 8048825:	68 e4 91 04 08       	push   $0x80491e4
 804882a:	e8 41 fd ff ff       	call   8048570 <printf@plt>
 804882f:	83 c4 10             	add    $0x10,%esp
 8048832:	83 ec 0c             	sub    $0xc,%esp
 8048835:	6a 01                	push   $0x1
 8048837:	e8 41 07 00 00       	call   8048f7d <validate>
 804883c:	83 c4 10             	add    $0x10,%esp
 804883f:	eb 13                	jmp    8048854 <fizz+0x47>
 8048841:	83 ec 08             	sub    $0x8,%esp
 8048844:	ff 75 08             	pushl  0x8(%ebp)
 8048847:	68 04 92 04 08       	push   $0x8049204
 804884c:	e8 1f fd ff ff       	call   8048570 <printf@plt>
 8048851:	83 c4 10             	add    $0x10,%esp
 8048854:	83 ec 0c             	sub    $0xc,%esp
 8048857:	6a 00                	push   $0x0
 8048859:	e8 92 fd ff ff       	call   80485f0 <exit@plt>

0804885e <bang>:
 804885e:	55                   	push   %ebp
 804885f:	89 e5                	mov    %esp,%ebp
 8048861:	83 ec 08             	sub    $0x8,%esp
 8048864:	a1 a0 a3 04 08       	mov    0x804a3a0,%eax
 8048869:	89 c2                	mov    %eax,%edx
 804886b:	a1 98 a3 04 08       	mov    0x804a398,%eax
 8048870:	39 c2                	cmp    %eax,%edx
 8048872:	75 25                	jne    8048899 <bang+0x3b>
 8048874:	a1 a0 a3 04 08       	mov    0x804a3a0,%eax
 8048879:	83 ec 08             	sub    $0x8,%esp
 804887c:	50                   	push   %eax
 804887d:	68 24 92 04 08       	push   $0x8049224
 8048882:	e8 e9 fc ff ff       	call   8048570 <printf@plt>
 8048887:	83 c4 10             	add    $0x10,%esp
 804888a:	83 ec 0c             	sub    $0xc,%esp
 804888d:	6a 02                	push   $0x2
 804888f:	e8 e9 06 00 00       	call   8048f7d <validate>
 8048894:	83 c4 10             	add    $0x10,%esp
 8048897:	eb 16                	jmp    80488af <bang+0x51>
 8048899:	a1 a0 a3 04 08       	mov    0x804a3a0,%eax
 804889e:	83 ec 08             	sub    $0x8,%esp
 80488a1:	50                   	push   %eax
 80488a2:	68 49 92 04 08       	push   $0x8049249
 80488a7:	e8 c4 fc ff ff       	call   8048570 <printf@plt>
 80488ac:	83 c4 10             	add    $0x10,%esp
 80488af:	83 ec 0c             	sub    $0xc,%esp
 80488b2:	6a 00                	push   $0x0
 80488b4:	e8 37 fd ff ff       	call   80485f0 <exit@plt>

080488b9 <test>:
 80488b9:	55                   	push   %ebp
 80488ba:	89 e5                	mov    %esp,%ebp
 80488bc:	83 ec 18             	sub    $0x18,%esp
 80488bf:	e8 32 04 00 00       	call   8048cf6 <uniqueval>
 80488c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80488c7:	e8 6e 06 00 00       	call   8048f3a <getbuf>
 80488cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80488cf:	e8 22 04 00 00       	call   8048cf6 <uniqueval>
 80488d4:	89 c2                	mov    %eax,%edx
 80488d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80488d9:	39 c2                	cmp    %eax,%edx
 80488db:	74 12                	je     80488ef <test+0x36>
 80488dd:	83 ec 0c             	sub    $0xc,%esp
 80488e0:	68 68 92 04 08       	push   $0x8049268
 80488e5:	e8 e6 fc ff ff       	call   80485d0 <puts@plt>
 80488ea:	83 c4 10             	add    $0x10,%esp
 80488ed:	eb 41                	jmp    8048930 <test+0x77>
 80488ef:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80488f2:	a1 98 a3 04 08       	mov    0x804a398,%eax
 80488f7:	39 c2                	cmp    %eax,%edx
 80488f9:	75 22                	jne    804891d <test+0x64>
 80488fb:	83 ec 08             	sub    $0x8,%esp
 80488fe:	ff 75 f4             	pushl  -0xc(%ebp)
 8048901:	68 91 92 04 08       	push   $0x8049291
 8048906:	e8 65 fc ff ff       	call   8048570 <printf@plt>
 804890b:	83 c4 10             	add    $0x10,%esp
 804890e:	83 ec 0c             	sub    $0xc,%esp
 8048911:	6a 03                	push   $0x3
 8048913:	e8 65 06 00 00       	call   8048f7d <validate>
 8048918:	83 c4 10             	add    $0x10,%esp
 804891b:	eb 13                	jmp    8048930 <test+0x77>
 804891d:	83 ec 08             	sub    $0x8,%esp
 8048920:	ff 75 f4             	pushl  -0xc(%ebp)
 8048923:	68 ae 92 04 08       	push   $0x80492ae
 8048928:	e8 43 fc ff ff       	call   8048570 <printf@plt>
 804892d:	83 c4 10             	add    $0x10,%esp
 8048930:	c9                   	leave  
 8048931:	c3                   	ret    

08048932 <testn>:
 8048932:	55                   	push   %ebp
 8048933:	89 e5                	mov    %esp,%ebp
 8048935:	83 ec 18             	sub    $0x18,%esp
 8048938:	e8 b9 03 00 00       	call   8048cf6 <uniqueval>
 804893d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048940:	e8 11 06 00 00       	call   8048f56 <getbufn>
 8048945:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048948:	e8 a9 03 00 00       	call   8048cf6 <uniqueval>
 804894d:	89 c2                	mov    %eax,%edx
 804894f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048952:	39 c2                	cmp    %eax,%edx
 8048954:	74 12                	je     8048968 <testn+0x36>
 8048956:	83 ec 0c             	sub    $0xc,%esp
 8048959:	68 68 92 04 08       	push   $0x8049268
 804895e:	e8 6d fc ff ff       	call   80485d0 <puts@plt>
 8048963:	83 c4 10             	add    $0x10,%esp
 8048966:	eb 41                	jmp    80489a9 <testn+0x77>
 8048968:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804896b:	a1 98 a3 04 08       	mov    0x804a398,%eax
 8048970:	39 c2                	cmp    %eax,%edx
 8048972:	75 22                	jne    8048996 <testn+0x64>
 8048974:	83 ec 08             	sub    $0x8,%esp
 8048977:	ff 75 f4             	pushl  -0xc(%ebp)
 804897a:	68 cc 92 04 08       	push   $0x80492cc
 804897f:	e8 ec fb ff ff       	call   8048570 <printf@plt>
 8048984:	83 c4 10             	add    $0x10,%esp
 8048987:	83 ec 0c             	sub    $0xc,%esp
 804898a:	6a 04                	push   $0x4
 804898c:	e8 ec 05 00 00       	call   8048f7d <validate>
 8048991:	83 c4 10             	add    $0x10,%esp
 8048994:	eb 13                	jmp    80489a9 <testn+0x77>
 8048996:	83 ec 08             	sub    $0x8,%esp
 8048999:	ff 75 f4             	pushl  -0xc(%ebp)
 804899c:	68 ec 92 04 08       	push   $0x80492ec
 80489a1:	e8 ca fb ff ff       	call   8048570 <printf@plt>
 80489a6:	83 c4 10             	add    $0x10,%esp
 80489a9:	c9                   	leave  
 80489aa:	c3                   	ret    

080489ab <save_char>:
 80489ab:	55                   	push   %ebp
 80489ac:	89 e5                	mov    %esp,%ebp
 80489ae:	83 ec 04             	sub    $0x4,%esp
 80489b1:	8b 45 08             	mov    0x8(%ebp),%eax
 80489b4:	88 45 fc             	mov    %al,-0x4(%ebp)
 80489b7:	a1 a4 a3 04 08       	mov    0x804a3a4,%eax
 80489bc:	3d ff 03 00 00       	cmp    $0x3ff,%eax
 80489c1:	7f 6c                	jg     8048a2f <save_char+0x84>
 80489c3:	8b 15 a4 a3 04 08    	mov    0x804a3a4,%edx
 80489c9:	89 d0                	mov    %edx,%eax
 80489cb:	01 c0                	add    %eax,%eax
 80489cd:	01 c2                	add    %eax,%edx
 80489cf:	0f b6 45 fc          	movzbl -0x4(%ebp),%eax
 80489d3:	c0 f8 04             	sar    $0x4,%al
 80489d6:	0f be c0             	movsbl %al,%eax
 80489d9:	83 e0 0f             	and    $0xf,%eax
 80489dc:	0f b6 80 50 a3 04 08 	movzbl 0x804a350(%eax),%eax
 80489e3:	88 82 00 a4 04 08    	mov    %al,0x804a400(%edx)
 80489e9:	8b 15 a4 a3 04 08    	mov    0x804a3a4,%edx
 80489ef:	89 d0                	mov    %edx,%eax
 80489f1:	01 c0                	add    %eax,%eax
 80489f3:	01 d0                	add    %edx,%eax
 80489f5:	8d 50 01             	lea    0x1(%eax),%edx
 80489f8:	0f be 45 fc          	movsbl -0x4(%ebp),%eax
 80489fc:	83 e0 0f             	and    $0xf,%eax
 80489ff:	0f b6 80 50 a3 04 08 	movzbl 0x804a350(%eax),%eax
 8048a06:	88 82 00 a4 04 08    	mov    %al,0x804a400(%edx)
 8048a0c:	8b 15 a4 a3 04 08    	mov    0x804a3a4,%edx
 8048a12:	89 d0                	mov    %edx,%eax
 8048a14:	01 c0                	add    %eax,%eax
 8048a16:	01 d0                	add    %edx,%eax
 8048a18:	83 c0 02             	add    $0x2,%eax
 8048a1b:	c6 80 00 a4 04 08 20 	movb   $0x20,0x804a400(%eax)
 8048a22:	a1 a4 a3 04 08       	mov    0x804a3a4,%eax
 8048a27:	83 c0 01             	add    $0x1,%eax
 8048a2a:	a3 a4 a3 04 08       	mov    %eax,0x804a3a4
 8048a2f:	c9                   	leave  
 8048a30:	c3                   	ret    

08048a31 <save_term>:
 8048a31:	55                   	push   %ebp
 8048a32:	89 e5                	mov    %esp,%ebp
 8048a34:	8b 15 a4 a3 04 08    	mov    0x804a3a4,%edx
 8048a3a:	89 d0                	mov    %edx,%eax
 8048a3c:	01 c0                	add    %eax,%eax
 8048a3e:	01 d0                	add    %edx,%eax
 8048a40:	c6 80 00 a4 04 08 00 	movb   $0x0,0x804a400(%eax)
 8048a47:	5d                   	pop    %ebp
 8048a48:	c3                   	ret    

08048a49 <Gets>:
 8048a49:	55                   	push   %ebp
 8048a4a:	89 e5                	mov    %esp,%ebp
 8048a4c:	83 ec 18             	sub    $0x18,%esp
 8048a4f:	8b 45 08             	mov    0x8(%ebp),%eax
 8048a52:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048a55:	c7 05 a4 a3 04 08 00 	movl   $0x0,0x804a3a4
 8048a5c:	00 00 00 
 8048a5f:	eb 1d                	jmp    8048a7e <Gets+0x35>
 8048a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048a64:	8d 50 01             	lea    0x1(%eax),%edx
 8048a67:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048a6a:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8048a6d:	88 10                	mov    %dl,(%eax)
 8048a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048a72:	0f be c0             	movsbl %al,%eax
 8048a75:	50                   	push   %eax
 8048a76:	e8 30 ff ff ff       	call   80489ab <save_char>
 8048a7b:	83 c4 04             	add    $0x4,%esp
 8048a7e:	a1 94 a3 04 08       	mov    0x804a394,%eax
 8048a83:	83 ec 0c             	sub    $0xc,%esp
 8048a86:	50                   	push   %eax
 8048a87:	e8 14 fb ff ff       	call   80485a0 <_IO_getc@plt>
 8048a8c:	83 c4 10             	add    $0x10,%esp
 8048a8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048a92:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 8048a96:	74 06                	je     8048a9e <Gets+0x55>
 8048a98:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
 8048a9c:	75 c3                	jne    8048a61 <Gets+0x18>
 8048a9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048aa1:	8d 50 01             	lea    0x1(%eax),%edx
 8048aa4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 8048aa7:	c6 00 00             	movb   $0x0,(%eax)
 8048aaa:	e8 82 ff ff ff       	call   8048a31 <save_term>
 8048aaf:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ab2:	c9                   	leave  
 8048ab3:	c3                   	ret    

08048ab4 <usage>:
 8048ab4:	55                   	push   %ebp
 8048ab5:	89 e5                	mov    %esp,%ebp
 8048ab7:	83 ec 08             	sub    $0x8,%esp
 8048aba:	83 ec 08             	sub    $0x8,%esp
 8048abd:	ff 75 08             	pushl  0x8(%ebp)
 8048ac0:	68 08 93 04 08       	push   $0x8049308
 8048ac5:	e8 a6 fa ff ff       	call   8048570 <printf@plt>
 8048aca:	83 c4 10             	add    $0x10,%esp
 8048acd:	83 ec 0c             	sub    $0xc,%esp
 8048ad0:	68 26 93 04 08       	push   $0x8049326
 8048ad5:	e8 f6 fa ff ff       	call   80485d0 <puts@plt>
 8048ada:	83 c4 10             	add    $0x10,%esp
 8048add:	83 ec 0c             	sub    $0xc,%esp
 8048ae0:	68 3c 93 04 08       	push   $0x804933c
 8048ae5:	e8 e6 fa ff ff       	call   80485d0 <puts@plt>
 8048aea:	83 c4 10             	add    $0x10,%esp
 8048aed:	83 ec 0c             	sub    $0xc,%esp
 8048af0:	68 58 93 04 08       	push   $0x8049358
 8048af5:	e8 d6 fa ff ff       	call   80485d0 <puts@plt>
 8048afa:	83 c4 10             	add    $0x10,%esp
 8048afd:	83 ec 0c             	sub    $0xc,%esp
 8048b00:	6a 00                	push   $0x0
 8048b02:	e8 e9 fa ff ff       	call   80485f0 <exit@plt>

08048b07 <bushandler>:
 8048b07:	55                   	push   %ebp
 8048b08:	89 e5                	mov    %esp,%ebp
 8048b0a:	83 ec 08             	sub    $0x8,%esp
 8048b0d:	83 ec 0c             	sub    $0xc,%esp
 8048b10:	68 80 93 04 08       	push   $0x8049380
 8048b15:	e8 b6 fa ff ff       	call   80485d0 <puts@plt>
 8048b1a:	83 c4 10             	add    $0x10,%esp
 8048b1d:	83 ec 0c             	sub    $0xc,%esp
 8048b20:	68 a0 93 04 08       	push   $0x80493a0
 8048b25:	e8 a6 fa ff ff       	call   80485d0 <puts@plt>
 8048b2a:	83 c4 10             	add    $0x10,%esp
 8048b2d:	83 ec 0c             	sub    $0xc,%esp
 8048b30:	6a 00                	push   $0x0
 8048b32:	e8 b9 fa ff ff       	call   80485f0 <exit@plt>

08048b37 <seghandler>:
 8048b37:	55                   	push   %ebp
 8048b38:	89 e5                	mov    %esp,%ebp
 8048b3a:	83 ec 08             	sub    $0x8,%esp
 8048b3d:	83 ec 0c             	sub    $0xc,%esp
 8048b40:	68 b8 93 04 08       	push   $0x80493b8
 8048b45:	e8 86 fa ff ff       	call   80485d0 <puts@plt>
 8048b4a:	83 c4 10             	add    $0x10,%esp
 8048b4d:	83 ec 0c             	sub    $0xc,%esp
 8048b50:	68 a0 93 04 08       	push   $0x80493a0
 8048b55:	e8 76 fa ff ff       	call   80485d0 <puts@plt>
 8048b5a:	83 c4 10             	add    $0x10,%esp
 8048b5d:	83 ec 0c             	sub    $0xc,%esp
 8048b60:	6a 00                	push   $0x0
 8048b62:	e8 89 fa ff ff       	call   80485f0 <exit@plt>

08048b67 <illegalhandler>:
 8048b67:	55                   	push   %ebp
 8048b68:	89 e5                	mov    %esp,%ebp
 8048b6a:	83 ec 08             	sub    $0x8,%esp
 8048b6d:	83 ec 0c             	sub    $0xc,%esp
 8048b70:	68 e0 93 04 08       	push   $0x80493e0
 8048b75:	e8 56 fa ff ff       	call   80485d0 <puts@plt>
 8048b7a:	83 c4 10             	add    $0x10,%esp
 8048b7d:	83 ec 0c             	sub    $0xc,%esp
 8048b80:	68 a0 93 04 08       	push   $0x80493a0
 8048b85:	e8 46 fa ff ff       	call   80485d0 <puts@plt>
 8048b8a:	83 c4 10             	add    $0x10,%esp
 8048b8d:	83 ec 0c             	sub    $0xc,%esp
 8048b90:	6a 00                	push   $0x0
 8048b92:	e8 59 fa ff ff       	call   80485f0 <exit@plt>

08048b97 <launch>:
 8048b97:	55                   	push   %ebp
 8048b98:	89 e5                	mov    %esp,%ebp
 8048b9a:	83 ec 58             	sub    $0x58,%esp
 8048b9d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048ba4:	8d 45 b0             	lea    -0x50(%ebp),%eax
 8048ba7:	25 f0 3f 00 00       	and    $0x3ff0,%eax
 8048bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048baf:	8b 55 0c             	mov    0xc(%ebp),%edx
 8048bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048bb5:	01 d0                	add    %edx,%eax
 8048bb7:	8d 50 0f             	lea    0xf(%eax),%edx
 8048bba:	b8 10 00 00 00       	mov    $0x10,%eax
 8048bbf:	83 e8 01             	sub    $0x1,%eax
 8048bc2:	01 d0                	add    %edx,%eax
 8048bc4:	b9 10 00 00 00       	mov    $0x10,%ecx
 8048bc9:	ba 00 00 00 00       	mov    $0x0,%edx
 8048bce:	f7 f1                	div    %ecx
 8048bd0:	6b c0 10             	imul   $0x10,%eax,%eax
 8048bd3:	29 c4                	sub    %eax,%esp
 8048bd5:	89 e0                	mov    %esp,%eax
 8048bd7:	83 c0 0f             	add    $0xf,%eax
 8048bda:	c1 e8 04             	shr    $0x4,%eax
 8048bdd:	c1 e0 04             	shl    $0x4,%eax
 8048be0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8048be3:	83 ec 04             	sub    $0x4,%esp
 8048be6:	ff 75 f4             	pushl  -0xc(%ebp)
 8048be9:	68 f4 00 00 00       	push   $0xf4
 8048bee:	ff 75 f0             	pushl  -0x10(%ebp)
 8048bf1:	e8 4a fa ff ff       	call   8048640 <memset@plt>
 8048bf6:	83 c4 10             	add    $0x10,%esp
 8048bf9:	83 ec 0c             	sub    $0xc,%esp
 8048bfc:	68 0b 94 04 08       	push   $0x804940b
 8048c01:	e8 6a f9 ff ff       	call   8048570 <printf@plt>
 8048c06:	83 c4 10             	add    $0x10,%esp
 8048c09:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048c0d:	74 07                	je     8048c16 <launch+0x7f>
 8048c0f:	e8 1e fd ff ff       	call   8048932 <testn>
 8048c14:	eb 05                	jmp    8048c1b <launch+0x84>
 8048c16:	e8 9e fc ff ff       	call   80488b9 <test>
 8048c1b:	a1 9c a3 04 08       	mov    0x804a39c,%eax
 8048c20:	85 c0                	test   %eax,%eax
 8048c22:	75 1a                	jne    8048c3e <launch+0xa7>
 8048c24:	83 ec 0c             	sub    $0xc,%esp
 8048c27:	68 a0 93 04 08       	push   $0x80493a0
 8048c2c:	e8 9f f9 ff ff       	call   80485d0 <puts@plt>
 8048c31:	83 c4 10             	add    $0x10,%esp
 8048c34:	c7 05 9c a3 04 08 00 	movl   $0x0,0x804a39c
 8048c3b:	00 00 00 
 8048c3e:	c9                   	leave  
 8048c3f:	c3                   	ret    

08048c40 <launcher>:
 8048c40:	55                   	push   %ebp
 8048c41:	89 e5                	mov    %esp,%ebp
 8048c43:	83 ec 18             	sub    $0x18,%esp
 8048c46:	8b 45 08             	mov    0x8(%ebp),%eax
 8048c49:	a3 a8 a3 04 08       	mov    %eax,0x804a3a8
 8048c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048c51:	a3 ac a3 04 08       	mov    %eax,0x804a3ac
 8048c56:	83 ec 08             	sub    $0x8,%esp
 8048c59:	6a 00                	push   $0x0
 8048c5b:	6a 00                	push   $0x0
 8048c5d:	68 32 01 00 00       	push   $0x132
 8048c62:	6a 07                	push   $0x7
 8048c64:	68 00 00 10 00       	push   $0x100000
 8048c69:	68 00 50 5b 55       	push   $0x555b5000
 8048c6e:	e8 9d f9 ff ff       	call   8048610 <mmap@plt>
 8048c73:	83 c4 20             	add    $0x20,%esp
 8048c76:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048c79:	81 7d f4 00 50 5b 55 	cmpl   $0x555b5000,-0xc(%ebp)
 8048c80:	74 21                	je     8048ca3 <launcher+0x63>
 8048c82:	a1 80 a3 04 08       	mov    0x804a380,%eax
 8048c87:	50                   	push   %eax
 8048c88:	6a 47                	push   $0x47
 8048c8a:	6a 01                	push   $0x1
 8048c8c:	68 18 94 04 08       	push   $0x8049418
 8048c91:	e8 1a f9 ff ff       	call   80485b0 <fwrite@plt>
 8048c96:	83 c4 10             	add    $0x10,%esp
 8048c99:	83 ec 0c             	sub    $0xc,%esp
 8048c9c:	6a 01                	push   $0x1
 8048c9e:	e8 4d f9 ff ff       	call   80485f0 <exit@plt>
 8048ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048ca6:	05 f8 ff 0f 00       	add    $0xffff8,%eax
 8048cab:	a3 c0 a3 04 08       	mov    %eax,0x804a3c0
 8048cb0:	8b 15 c0 a3 04 08    	mov    0x804a3c0,%edx
 8048cb6:	89 e0                	mov    %esp,%eax
 8048cb8:	89 d4                	mov    %edx,%esp
 8048cba:	89 c2                	mov    %eax,%edx
 8048cbc:	89 15 b0 a3 04 08    	mov    %edx,0x804a3b0
 8048cc2:	8b 15 ac a3 04 08    	mov    0x804a3ac,%edx
 8048cc8:	a1 a8 a3 04 08       	mov    0x804a3a8,%eax
 8048ccd:	83 ec 08             	sub    $0x8,%esp
 8048cd0:	52                   	push   %edx
 8048cd1:	50                   	push   %eax
 8048cd2:	e8 c0 fe ff ff       	call   8048b97 <launch>
 8048cd7:	83 c4 10             	add    $0x10,%esp
 8048cda:	a1 b0 a3 04 08       	mov    0x804a3b0,%eax
 8048cdf:	89 c4                	mov    %eax,%esp
 8048ce1:	83 ec 08             	sub    $0x8,%esp
 8048ce4:	68 00 00 10 00       	push   $0x100000
 8048ce9:	ff 75 f4             	pushl  -0xc(%ebp)
 8048cec:	e8 6f f9 ff ff       	call   8048660 <munmap@plt>
 8048cf1:	83 c4 10             	add    $0x10,%esp
 8048cf4:	c9                   	leave  
 8048cf5:	c3                   	ret    

08048cf6 <uniqueval>:
 8048cf6:	55                   	push   %ebp
 8048cf7:	89 e5                	mov    %esp,%ebp
 8048cf9:	83 ec 08             	sub    $0x8,%esp
 8048cfc:	e8 bf f8 ff ff       	call   80485c0 <getpid@plt>
 8048d01:	83 ec 0c             	sub    $0xc,%esp
 8048d04:	50                   	push   %eax
 8048d05:	e8 56 f8 ff ff       	call   8048560 <srandom@plt>
 8048d0a:	83 c4 10             	add    $0x10,%esp
 8048d0d:	e8 5e f9 ff ff       	call   8048670 <random@plt>
 8048d12:	c9                   	leave  
 8048d13:	c3                   	ret    

08048d14 <main>:
 8048d14:	8d 4c 24 04          	lea    0x4(%esp),%ecx
 8048d18:	83 e4 f0             	and    $0xfffffff0,%esp
 8048d1b:	ff 71 fc             	pushl  -0x4(%ecx)
 8048d1e:	55                   	push   %ebp
 8048d1f:	89 e5                	mov    %esp,%ebp
 8048d21:	53                   	push   %ebx
 8048d22:	51                   	push   %ecx
 8048d23:	83 ec 20             	sub    $0x20,%esp
 8048d26:	89 cb                	mov    %ecx,%ebx
 8048d28:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 8048d2f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8048d36:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
 8048d3d:	83 ec 08             	sub    $0x8,%esp
 8048d40:	68 37 8b 04 08       	push   $0x8048b37
 8048d45:	6a 0b                	push   $0xb
 8048d47:	e8 44 f8 ff ff       	call   8048590 <signal@plt>
 8048d4c:	83 c4 10             	add    $0x10,%esp
 8048d4f:	83 ec 08             	sub    $0x8,%esp
 8048d52:	68 07 8b 04 08       	push   $0x8048b07
 8048d57:	6a 07                	push   $0x7
 8048d59:	e8 32 f8 ff ff       	call   8048590 <signal@plt>
 8048d5e:	83 c4 10             	add    $0x10,%esp
 8048d61:	83 ec 08             	sub    $0x8,%esp
 8048d64:	68 67 8b 04 08       	push   $0x8048b67
 8048d69:	6a 04                	push   $0x4
 8048d6b:	e8 20 f8 ff ff       	call   8048590 <signal@plt>
 8048d70:	83 c4 10             	add    $0x10,%esp
 8048d73:	a1 84 a3 04 08       	mov    0x804a384,%eax
 8048d78:	a3 94 a3 04 08       	mov    %eax,0x804a394
 8048d7d:	eb 75                	jmp    8048df4 <main+0xe0>
 8048d7f:	0f be 45 e7          	movsbl -0x19(%ebp),%eax
 8048d83:	83 f8 6e             	cmp    $0x6e,%eax
 8048d86:	74 1d                	je     8048da5 <main+0x91>
 8048d88:	83 f8 75             	cmp    $0x75,%eax
 8048d8b:	74 28                	je     8048db5 <main+0xa1>
 8048d8d:	83 f8 68             	cmp    $0x68,%eax
 8048d90:	75 51                	jne    8048de3 <main+0xcf>
 8048d92:	8b 43 04             	mov    0x4(%ebx),%eax
 8048d95:	8b 00                	mov    (%eax),%eax
 8048d97:	83 ec 0c             	sub    $0xc,%esp
 8048d9a:	50                   	push   %eax
 8048d9b:	e8 14 fd ff ff       	call   8048ab4 <usage>
 8048da0:	83 c4 10             	add    $0x10,%esp
 8048da3:	eb 4f                	jmp    8048df4 <main+0xe0>
 8048da5:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
 8048dac:	c7 45 ec 05 00 00 00 	movl   $0x5,-0x14(%ebp)
 8048db3:	eb 3f                	jmp    8048df4 <main+0xe0>
 8048db5:	a1 88 a3 04 08       	mov    0x804a388,%eax
 8048dba:	83 ec 0c             	sub    $0xc,%esp
 8048dbd:	50                   	push   %eax
 8048dbe:	e8 bd f7 ff ff       	call   8048580 <strdup@plt>
 8048dc3:	83 c4 10             	add    $0x10,%esp
 8048dc6:	a3 90 a3 04 08       	mov    %eax,0x804a390
 8048dcb:	a1 90 a3 04 08       	mov    0x804a390,%eax
 8048dd0:	83 ec 0c             	sub    $0xc,%esp
 8048dd3:	50                   	push   %eax
 8048dd4:	e8 ca 02 00 00       	call   80490a3 <gencookie>
 8048dd9:	83 c4 10             	add    $0x10,%esp
 8048ddc:	a3 98 a3 04 08       	mov    %eax,0x804a398
 8048de1:	eb 11                	jmp    8048df4 <main+0xe0>
 8048de3:	8b 43 04             	mov    0x4(%ebx),%eax
 8048de6:	8b 00                	mov    (%eax),%eax
 8048de8:	83 ec 0c             	sub    $0xc,%esp
 8048deb:	50                   	push   %eax
 8048dec:	e8 c3 fc ff ff       	call   8048ab4 <usage>
 8048df1:	83 c4 10             	add    $0x10,%esp
 8048df4:	83 ec 04             	sub    $0x4,%esp
 8048df7:	68 60 94 04 08       	push   $0x8049460
 8048dfc:	ff 73 04             	pushl  0x4(%ebx)
 8048dff:	ff 33                	pushl  (%ebx)
 8048e01:	e8 2a f8 ff ff       	call   8048630 <getopt@plt>
 8048e06:	83 c4 10             	add    $0x10,%esp
 8048e09:	88 45 e7             	mov    %al,-0x19(%ebp)
 8048e0c:	80 7d e7 ff          	cmpb   $0xff,-0x19(%ebp)
 8048e10:	0f 85 69 ff ff ff    	jne    8048d7f <main+0x6b>
 8048e16:	a1 90 a3 04 08       	mov    0x804a390,%eax
 8048e1b:	85 c0                	test   %eax,%eax
 8048e1d:	75 27                	jne    8048e46 <main+0x132>
 8048e1f:	8b 43 04             	mov    0x4(%ebx),%eax
 8048e22:	8b 00                	mov    (%eax),%eax
 8048e24:	83 ec 08             	sub    $0x8,%esp
 8048e27:	50                   	push   %eax
 8048e28:	68 68 94 04 08       	push   $0x8049468
 8048e2d:	e8 3e f7 ff ff       	call   8048570 <printf@plt>
 8048e32:	83 c4 10             	add    $0x10,%esp
 8048e35:	8b 43 04             	mov    0x4(%ebx),%eax
 8048e38:	8b 00                	mov    (%eax),%eax
 8048e3a:	83 ec 0c             	sub    $0xc,%esp
 8048e3d:	50                   	push   %eax
 8048e3e:	e8 71 fc ff ff       	call   8048ab4 <usage>
 8048e43:	83 c4 10             	add    $0x10,%esp
 8048e46:	e8 2d 01 00 00       	call   8048f78 <initialize_bomb>
 8048e4b:	a1 90 a3 04 08       	mov    0x804a390,%eax
 8048e50:	83 ec 08             	sub    $0x8,%esp
 8048e53:	50                   	push   %eax
 8048e54:	68 94 94 04 08       	push   $0x8049494
 8048e59:	e8 12 f7 ff ff       	call   8048570 <printf@plt>
 8048e5e:	83 c4 10             	add    $0x10,%esp
 8048e61:	a1 98 a3 04 08       	mov    0x804a398,%eax
 8048e66:	83 ec 08             	sub    $0x8,%esp
 8048e69:	50                   	push   %eax
 8048e6a:	68 a0 94 04 08       	push   $0x80494a0
 8048e6f:	e8 fc f6 ff ff       	call   8048570 <printf@plt>
 8048e74:	83 c4 10             	add    $0x10,%esp
 8048e77:	a1 98 a3 04 08       	mov    0x804a398,%eax
 8048e7c:	83 ec 0c             	sub    $0xc,%esp
 8048e7f:	50                   	push   %eax
 8048e80:	e8 db f6 ff ff       	call   8048560 <srandom@plt>
 8048e85:	83 c4 10             	add    $0x10,%esp
 8048e88:	e8 e3 f7 ff ff       	call   8048670 <random@plt>
 8048e8d:	25 f0 0f 00 00       	and    $0xff0,%eax
 8048e92:	05 00 01 00 00       	add    $0x100,%eax
 8048e97:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8048e9a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8048e9d:	83 ec 08             	sub    $0x8,%esp
 8048ea0:	6a 04                	push   $0x4
 8048ea2:	50                   	push   %eax
 8048ea3:	e8 d8 f7 ff ff       	call   8048680 <calloc@plt>
 8048ea8:	83 c4 10             	add    $0x10,%esp
 8048eab:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8048eae:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048eb1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 8048eb7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 8048ebe:	eb 29                	jmp    8048ee9 <main+0x1d5>
 8048ec0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048ec3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048eca:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048ecd:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 8048ed0:	e8 9b f7 ff ff       	call   8048670 <random@plt>
 8048ed5:	25 f0 00 00 00       	and    $0xf0,%eax
 8048eda:	ba 80 00 00 00       	mov    $0x80,%edx
 8048edf:	29 c2                	sub    %eax,%edx
 8048ee1:	89 d0                	mov    %edx,%eax
 8048ee3:	89 03                	mov    %eax,(%ebx)
 8048ee5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048ee9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048eec:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8048eef:	7c cf                	jl     8048ec0 <main+0x1ac>
 8048ef1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8048ef8:	eb 29                	jmp    8048f23 <main+0x20f>
 8048efa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048efd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 8048f04:	8b 45 e0             	mov    -0x20(%ebp),%eax
 8048f07:	01 d0                	add    %edx,%eax
 8048f09:	8b 10                	mov    (%eax),%edx
 8048f0b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8048f0e:	01 d0                	add    %edx,%eax
 8048f10:	83 ec 08             	sub    $0x8,%esp
 8048f13:	50                   	push   %eax
 8048f14:	ff 75 f4             	pushl  -0xc(%ebp)
 8048f17:	e8 24 fd ff ff       	call   8048c40 <launcher>
 8048f1c:	83 c4 10             	add    $0x10,%esp
 8048f1f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8048f23:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8048f26:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8048f29:	7c cf                	jl     8048efa <main+0x1e6>
 8048f2b:	b8 00 00 00 00       	mov    $0x0,%eax
 8048f30:	8d 65 f8             	lea    -0x8(%ebp),%esp
 8048f33:	59                   	pop    %ecx
 8048f34:	5b                   	pop    %ebx
 8048f35:	5d                   	pop    %ebp
 8048f36:	8d 61 fc             	lea    -0x4(%ecx),%esp
 8048f39:	c3                   	ret    

08048f3a <getbuf>:
 8048f3a:	55                   	push   %ebp
 8048f3b:	89 e5                	mov    %esp,%ebp
 8048f3d:	83 ec 58             	sub    $0x58,%esp
 8048f40:	83 ec 0c             	sub    $0xc,%esp
 8048f43:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 8048f46:	50                   	push   %eax
 8048f47:	e8 fd fa ff ff       	call   8048a49 <Gets>
 8048f4c:	83 c4 10             	add    $0x10,%esp
 8048f4f:	b8 01 00 00 00       	mov    $0x1,%eax
 8048f54:	c9                   	leave  
 8048f55:	c3                   	ret    

08048f56 <getbufn>:
 8048f56:	55                   	push   %ebp
 8048f57:	89 e5                	mov    %esp,%ebp
 8048f59:	81 ec 68 02 00 00    	sub    $0x268,%esp
 8048f5f:	83 ec 0c             	sub    $0xc,%esp
 8048f62:	8d 85 9b fd ff ff    	lea    -0x265(%ebp),%eax
 8048f68:	50                   	push   %eax
 8048f69:	e8 db fa ff ff       	call   8048a49 <Gets>
 8048f6e:	83 c4 10             	add    $0x10,%esp
 8048f71:	b8 01 00 00 00       	mov    $0x1,%eax
 8048f76:	c9                   	leave  
 8048f77:	c3                   	ret    

08048f78 <initialize_bomb>:
 8048f78:	55                   	push   %ebp
 8048f79:	89 e5                	mov    %esp,%ebp
 8048f7b:	5d                   	pop    %ebp
 8048f7c:	c3                   	ret    

08048f7d <validate>:
 8048f7d:	55                   	push   %ebp
 8048f7e:	89 e5                	mov    %esp,%ebp
 8048f80:	83 ec 08             	sub    $0x8,%esp
 8048f83:	a1 90 a3 04 08       	mov    0x804a390,%eax
 8048f88:	85 c0                	test   %eax,%eax
 8048f8a:	75 12                	jne    8048f9e <validate+0x21>
 8048f8c:	83 ec 0c             	sub    $0xc,%esp
 8048f8f:	68 b0 94 04 08       	push   $0x80494b0
 8048f94:	e8 37 f6 ff ff       	call   80485d0 <puts@plt>
 8048f99:	83 c4 10             	add    $0x10,%esp
 8048f9c:	eb 7f                	jmp    804901d <validate+0xa0>
 8048f9e:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8048fa2:	78 06                	js     8048faa <validate+0x2d>
 8048fa4:	83 7d 08 04          	cmpl   $0x4,0x8(%ebp)
 8048fa8:	7e 12                	jle    8048fbc <validate+0x3f>
 8048faa:	83 ec 0c             	sub    $0xc,%esp
 8048fad:	68 dc 94 04 08       	push   $0x80494dc
 8048fb2:	e8 19 f6 ff ff       	call   80485d0 <puts@plt>
 8048fb7:	83 c4 10             	add    $0x10,%esp
 8048fba:	eb 61                	jmp    804901d <validate+0xa0>
 8048fbc:	c7 05 9c a3 04 08 01 	movl   $0x1,0x804a39c
 8048fc3:	00 00 00 
 8048fc6:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fc9:	8b 04 85 60 a3 04 08 	mov    0x804a360(,%eax,4),%eax
 8048fd0:	8d 50 ff             	lea    -0x1(%eax),%edx
 8048fd3:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fd6:	89 14 85 60 a3 04 08 	mov    %edx,0x804a360(,%eax,4)
 8048fdd:	8b 45 08             	mov    0x8(%ebp),%eax
 8048fe0:	8b 04 85 60 a3 04 08 	mov    0x804a360(,%eax,4),%eax
 8048fe7:	85 c0                	test   %eax,%eax
 8048fe9:	7e 12                	jle    8048ffd <validate+0x80>
 8048feb:	83 ec 0c             	sub    $0xc,%esp
 8048fee:	68 02 95 04 08       	push   $0x8049502
 8048ff3:	e8 d8 f5 ff ff       	call   80485d0 <puts@plt>
 8048ff8:	83 c4 10             	add    $0x10,%esp
 8048ffb:	eb 20                	jmp    804901d <validate+0xa0>
 8048ffd:	83 ec 0c             	sub    $0xc,%esp
 8049000:	68 0d 95 04 08       	push   $0x804950d
 8049005:	e8 c6 f5 ff ff       	call   80485d0 <puts@plt>
 804900a:	83 c4 10             	add    $0x10,%esp
 804900d:	83 ec 0c             	sub    $0xc,%esp
 8049010:	68 13 95 04 08       	push   $0x8049513
 8049015:	e8 b6 f5 ff ff       	call   80485d0 <puts@plt>
 804901a:	83 c4 10             	add    $0x10,%esp
 804901d:	c9                   	leave  
 804901e:	c3                   	ret    

0804901f <hash>:
 804901f:	55                   	push   %ebp
 8049020:	89 e5                	mov    %esp,%ebp
 8049022:	83 ec 10             	sub    $0x10,%esp
 8049025:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 804902c:	eb 1a                	jmp    8049048 <hash+0x29>
 804902e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049031:	6b c8 67             	imul   $0x67,%eax,%ecx
 8049034:	8b 45 08             	mov    0x8(%ebp),%eax
 8049037:	8d 50 01             	lea    0x1(%eax),%edx
 804903a:	89 55 08             	mov    %edx,0x8(%ebp)
 804903d:	0f b6 00             	movzbl (%eax),%eax
 8049040:	0f be c0             	movsbl %al,%eax
 8049043:	01 c8                	add    %ecx,%eax
 8049045:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8049048:	8b 45 08             	mov    0x8(%ebp),%eax
 804904b:	0f b6 00             	movzbl (%eax),%eax
 804904e:	84 c0                	test   %al,%al
 8049050:	75 dc                	jne    804902e <hash+0xf>
 8049052:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8049055:	c9                   	leave  
 8049056:	c3                   	ret    

08049057 <check>:
 8049057:	55                   	push   %ebp
 8049058:	89 e5                	mov    %esp,%ebp
 804905a:	83 ec 10             	sub    $0x10,%esp
 804905d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049060:	c1 e8 1c             	shr    $0x1c,%eax
 8049063:	85 c0                	test   %eax,%eax
 8049065:	75 07                	jne    804906e <check+0x17>
 8049067:	b8 00 00 00 00       	mov    $0x0,%eax
 804906c:	eb 33                	jmp    80490a1 <check+0x4a>
 804906e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049075:	eb 1f                	jmp    8049096 <check+0x3f>
 8049077:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804907a:	8b 55 08             	mov    0x8(%ebp),%edx
 804907d:	89 c1                	mov    %eax,%ecx
 804907f:	d3 ea                	shr    %cl,%edx
 8049081:	89 d0                	mov    %edx,%eax
 8049083:	0f b6 c0             	movzbl %al,%eax
 8049086:	83 f8 0a             	cmp    $0xa,%eax
 8049089:	75 07                	jne    8049092 <check+0x3b>
 804908b:	b8 00 00 00 00       	mov    $0x0,%eax
 8049090:	eb 0f                	jmp    80490a1 <check+0x4a>
 8049092:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 8049096:	83 7d fc 1f          	cmpl   $0x1f,-0x4(%ebp)
 804909a:	7e db                	jle    8049077 <check+0x20>
 804909c:	b8 01 00 00 00       	mov    $0x1,%eax
 80490a1:	c9                   	leave  
 80490a2:	c3                   	ret    

080490a3 <gencookie>:
 80490a3:	55                   	push   %ebp
 80490a4:	89 e5                	mov    %esp,%ebp
 80490a6:	83 ec 18             	sub    $0x18,%esp
 80490a9:	ff 75 08             	pushl  0x8(%ebp)
 80490ac:	e8 6e ff ff ff       	call   804901f <hash>
 80490b1:	83 c4 04             	add    $0x4,%esp
 80490b4:	83 ec 0c             	sub    $0xc,%esp
 80490b7:	50                   	push   %eax
 80490b8:	e8 43 f5 ff ff       	call   8048600 <srand@plt>
 80490bd:	83 c4 10             	add    $0x10,%esp
 80490c0:	e8 8b f5 ff ff       	call   8048650 <rand@plt>
 80490c5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80490c8:	83 ec 0c             	sub    $0xc,%esp
 80490cb:	ff 75 f4             	pushl  -0xc(%ebp)
 80490ce:	e8 84 ff ff ff       	call   8049057 <check>
 80490d3:	83 c4 10             	add    $0x10,%esp
 80490d6:	85 c0                	test   %eax,%eax
 80490d8:	74 e6                	je     80490c0 <gencookie+0x1d>
 80490da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80490dd:	c9                   	leave  
 80490de:	c3                   	ret    
 80490df:	90                   	nop

080490e0 <__libc_csu_init>:
 80490e0:	55                   	push   %ebp
 80490e1:	57                   	push   %edi
 80490e2:	31 ff                	xor    %edi,%edi
 80490e4:	56                   	push   %esi
 80490e5:	53                   	push   %ebx
 80490e6:	e8 d5 f5 ff ff       	call   80486c0 <__x86.get_pc_thunk.bx>
 80490eb:	81 c3 0d 10 00 00    	add    $0x100d,%ebx
 80490f1:	83 ec 1c             	sub    $0x1c,%esp
 80490f4:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 80490f8:	8d b3 0c ff ff ff    	lea    -0xf4(%ebx),%esi
 80490fe:	e8 21 f4 ff ff       	call   8048524 <_init>
 8049103:	8d 83 08 ff ff ff    	lea    -0xf8(%ebx),%eax
 8049109:	29 c6                	sub    %eax,%esi
 804910b:	c1 fe 02             	sar    $0x2,%esi
 804910e:	85 f6                	test   %esi,%esi
 8049110:	74 27                	je     8049139 <__libc_csu_init+0x59>
 8049112:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8049118:	8b 44 24 38          	mov    0x38(%esp),%eax
 804911c:	89 2c 24             	mov    %ebp,(%esp)
 804911f:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049123:	8b 44 24 34          	mov    0x34(%esp),%eax
 8049127:	89 44 24 04          	mov    %eax,0x4(%esp)
 804912b:	ff 94 bb 08 ff ff ff 	call   *-0xf8(%ebx,%edi,4)
 8049132:	83 c7 01             	add    $0x1,%edi
 8049135:	39 f7                	cmp    %esi,%edi
 8049137:	75 df                	jne    8049118 <__libc_csu_init+0x38>
 8049139:	83 c4 1c             	add    $0x1c,%esp
 804913c:	5b                   	pop    %ebx
 804913d:	5e                   	pop    %esi
 804913e:	5f                   	pop    %edi
 804913f:	5d                   	pop    %ebp
 8049140:	c3                   	ret    
 8049141:	eb 0d                	jmp    8049150 <__libc_csu_fini>
 8049143:	90                   	nop
 8049144:	90                   	nop
 8049145:	90                   	nop
 8049146:	90                   	nop
 8049147:	90                   	nop
 8049148:	90                   	nop
 8049149:	90                   	nop
 804914a:	90                   	nop
 804914b:	90                   	nop
 804914c:	90                   	nop
 804914d:	90                   	nop
 804914e:	90                   	nop
 804914f:	90                   	nop

08049150 <__libc_csu_fini>:
 8049150:	f3 c3                	repz ret 

Disassembly of section .fini:

08049154 <_fini>:
 8049154:	53                   	push   %ebx
 8049155:	83 ec 08             	sub    $0x8,%esp
 8049158:	e8 63 f5 ff ff       	call   80486c0 <__x86.get_pc_thunk.bx>
 804915d:	81 c3 9b 0f 00 00    	add    $0xf9b,%ebx
 8049163:	83 c4 08             	add    $0x8,%esp
 8049166:	5b                   	pop    %ebx
 8049167:	c3                   	ret    
