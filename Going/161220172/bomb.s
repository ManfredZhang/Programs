
bomb:     file format elf32-i386


Disassembly of section .init:

000006a8 <_init>:
 6a8:	53                   	push   %ebx
 6a9:	83 ec 08             	sub    $0x8,%esp
 6ac:	e8 6f 01 00 00       	call   820 <__x86.get_pc_thunk.bx>
 6b1:	81 c3 4f 39 00 00    	add    $0x394f,%ebx
 6b7:	8b 83 e8 ff ff ff    	mov    -0x18(%ebx),%eax
 6bd:	85 c0                	test   %eax,%eax
 6bf:	74 05                	je     6c6 <_init+0x1e>
 6c1:	e8 12 01 00 00       	call   7d8 <__ctype_b_loc@plt+0x18>
 6c6:	83 c4 08             	add    $0x8,%esp
 6c9:	5b                   	pop    %ebx
 6ca:	c3                   	ret    

Disassembly of section .plt:

000006d0 <printf@plt-0x10>:
 6d0:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 6d6:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 6dc:	00 00                	add    %al,(%eax)
	...

000006e0 <printf@plt>:
 6e0:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 6e6:	68 00 00 00 00       	push   $0x0
 6eb:	e9 e0 ff ff ff       	jmp    6d0 <_init+0x28>

000006f0 <fflush@plt>:
 6f0:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 6f6:	68 08 00 00 00       	push   $0x8
 6fb:	e9 d0 ff ff ff       	jmp    6d0 <_init+0x28>

00000700 <fgets@plt>:
 700:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
 706:	68 10 00 00 00       	push   $0x10
 70b:	e9 c0 ff ff ff       	jmp    6d0 <_init+0x28>

00000710 <signal@plt>:
 710:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 716:	68 18 00 00 00       	push   $0x18
 71b:	e9 b0 ff ff ff       	jmp    6d0 <_init+0x28>

00000720 <sleep@plt>:
 720:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 726:	68 20 00 00 00       	push   $0x20
 72b:	e9 a0 ff ff ff       	jmp    6d0 <_init+0x28>

00000730 <getenv@plt>:
 730:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
 736:	68 28 00 00 00       	push   $0x28
 73b:	e9 90 ff ff ff       	jmp    6d0 <_init+0x28>

00000740 <puts@plt>:
 740:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
 746:	68 30 00 00 00       	push   $0x30
 74b:	e9 80 ff ff ff       	jmp    6d0 <_init+0x28>

00000750 <exit@plt>:
 750:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
 756:	68 38 00 00 00       	push   $0x38
 75b:	e9 70 ff ff ff       	jmp    6d0 <_init+0x28>

00000760 <strlen@plt>:
 760:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
 766:	68 40 00 00 00       	push   $0x40
 76b:	e9 60 ff ff ff       	jmp    6d0 <_init+0x28>

00000770 <__libc_start_main@plt>:
 770:	ff a3 30 00 00 00    	jmp    *0x30(%ebx)
 776:	68 48 00 00 00       	push   $0x48
 77b:	e9 50 ff ff ff       	jmp    6d0 <_init+0x28>

00000780 <__isoc99_sscanf@plt>:
 780:	ff a3 34 00 00 00    	jmp    *0x34(%ebx)
 786:	68 50 00 00 00       	push   $0x50
 78b:	e9 40 ff ff ff       	jmp    6d0 <_init+0x28>

00000790 <fopen@plt>:
 790:	ff a3 38 00 00 00    	jmp    *0x38(%ebx)
 796:	68 58 00 00 00       	push   $0x58
 79b:	e9 30 ff ff ff       	jmp    6d0 <_init+0x28>

000007a0 <strtok@plt>:
 7a0:	ff a3 3c 00 00 00    	jmp    *0x3c(%ebx)
 7a6:	68 60 00 00 00       	push   $0x60
 7ab:	e9 20 ff ff ff       	jmp    6d0 <_init+0x28>

000007b0 <atoi@plt>:
 7b0:	ff a3 40 00 00 00    	jmp    *0x40(%ebx)
 7b6:	68 68 00 00 00       	push   $0x68
 7bb:	e9 10 ff ff ff       	jmp    6d0 <_init+0x28>

000007c0 <__ctype_b_loc@plt>:
 7c0:	ff a3 44 00 00 00    	jmp    *0x44(%ebx)
 7c6:	68 70 00 00 00       	push   $0x70
 7cb:	e9 00 ff ff ff       	jmp    6d0 <_init+0x28>

Disassembly of section .plt.got:

000007d0 <.plt.got>:
 7d0:	ff a3 e4 ff ff ff    	jmp    *-0x1c(%ebx)
 7d6:	66 90                	xchg   %ax,%ax
 7d8:	ff a3 e8 ff ff ff    	jmp    *-0x18(%ebx)
 7de:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

000007e0 <_start>:
     7e0:	31 ed                	xor    %ebp,%ebp
     7e2:	5e                   	pop    %esi
     7e3:	89 e1                	mov    %esp,%ecx
     7e5:	83 e4 f0             	and    $0xfffffff0,%esp
     7e8:	50                   	push   %eax
     7e9:	54                   	push   %esp
     7ea:	52                   	push   %edx
     7eb:	e8 22 00 00 00       	call   812 <_start+0x32>
     7f0:	81 c3 10 38 00 00    	add    $0x3810,%ebx
     7f6:	8d 83 10 d8 ff ff    	lea    -0x27f0(%ebx),%eax
     7fc:	50                   	push   %eax
     7fd:	8d 83 b0 d7 ff ff    	lea    -0x2850(%ebx),%eax
     803:	50                   	push   %eax
     804:	51                   	push   %ecx
     805:	56                   	push   %esi
     806:	ff b3 f4 ff ff ff    	pushl  -0xc(%ebx)
     80c:	e8 5f ff ff ff       	call   770 <__libc_start_main@plt>
     811:	f4                   	hlt    
     812:	8b 1c 24             	mov    (%esp),%ebx
     815:	c3                   	ret    
     816:	66 90                	xchg   %ax,%ax
     818:	66 90                	xchg   %ax,%ax
     81a:	66 90                	xchg   %ax,%ax
     81c:	66 90                	xchg   %ax,%ax
     81e:	66 90                	xchg   %ax,%ax

00000820 <__x86.get_pc_thunk.bx>:
     820:	8b 1c 24             	mov    (%esp),%ebx
     823:	c3                   	ret    
     824:	66 90                	xchg   %ax,%ax
     826:	66 90                	xchg   %ax,%ax
     828:	66 90                	xchg   %ax,%ax
     82a:	66 90                	xchg   %ax,%ax
     82c:	66 90                	xchg   %ax,%ax
     82e:	66 90                	xchg   %ax,%ax

00000830 <deregister_tm_clones>:
     830:	e8 17 01 00 00       	call   94c <__x86.get_pc_thunk.dx>
     835:	81 c2 cb 37 00 00    	add    $0x37cb,%edx
     83b:	8d 8a 48 02 00 00    	lea    0x248(%edx),%ecx
     841:	8d 82 4b 02 00 00    	lea    0x24b(%edx),%eax
     847:	29 c8                	sub    %ecx,%eax
     849:	83 f8 06             	cmp    $0x6,%eax
     84c:	76 17                	jbe    865 <deregister_tm_clones+0x35>
     84e:	8b 82 e0 ff ff ff    	mov    -0x20(%edx),%eax
     854:	85 c0                	test   %eax,%eax
     856:	74 0d                	je     865 <deregister_tm_clones+0x35>
     858:	55                   	push   %ebp
     859:	89 e5                	mov    %esp,%ebp
     85b:	83 ec 14             	sub    $0x14,%esp
     85e:	51                   	push   %ecx
     85f:	ff d0                	call   *%eax
     861:	83 c4 10             	add    $0x10,%esp
     864:	c9                   	leave  
     865:	f3 c3                	repz ret 
     867:	89 f6                	mov    %esi,%esi
     869:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000870 <register_tm_clones>:
     870:	e8 d7 00 00 00       	call   94c <__x86.get_pc_thunk.dx>
     875:	81 c2 8b 37 00 00    	add    $0x378b,%edx
     87b:	55                   	push   %ebp
     87c:	8d 8a 48 02 00 00    	lea    0x248(%edx),%ecx
     882:	8d 82 48 02 00 00    	lea    0x248(%edx),%eax
     888:	89 e5                	mov    %esp,%ebp
     88a:	53                   	push   %ebx
     88b:	29 c8                	sub    %ecx,%eax
     88d:	c1 f8 02             	sar    $0x2,%eax
     890:	83 ec 04             	sub    $0x4,%esp
     893:	89 c3                	mov    %eax,%ebx
     895:	c1 eb 1f             	shr    $0x1f,%ebx
     898:	01 d8                	add    %ebx,%eax
     89a:	d1 f8                	sar    %eax
     89c:	74 14                	je     8b2 <register_tm_clones+0x42>
     89e:	8b 92 fc ff ff ff    	mov    -0x4(%edx),%edx
     8a4:	85 d2                	test   %edx,%edx
     8a6:	74 0a                	je     8b2 <register_tm_clones+0x42>
     8a8:	83 ec 08             	sub    $0x8,%esp
     8ab:	50                   	push   %eax
     8ac:	51                   	push   %ecx
     8ad:	ff d2                	call   *%edx
     8af:	83 c4 10             	add    $0x10,%esp
     8b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8b5:	c9                   	leave  
     8b6:	c3                   	ret    
     8b7:	89 f6                	mov    %esi,%esi
     8b9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008c0 <__do_global_dtors_aux>:
     8c0:	55                   	push   %ebp
     8c1:	89 e5                	mov    %esp,%ebp
     8c3:	53                   	push   %ebx
     8c4:	e8 57 ff ff ff       	call   820 <__x86.get_pc_thunk.bx>
     8c9:	81 c3 37 37 00 00    	add    $0x3737,%ebx
     8cf:	83 ec 04             	sub    $0x4,%esp
     8d2:	80 bb 60 02 00 00 00 	cmpb   $0x0,0x260(%ebx)
     8d9:	75 27                	jne    902 <__do_global_dtors_aux+0x42>
     8db:	8b 83 e4 ff ff ff    	mov    -0x1c(%ebx),%eax
     8e1:	85 c0                	test   %eax,%eax
     8e3:	74 11                	je     8f6 <__do_global_dtors_aux+0x36>
     8e5:	83 ec 0c             	sub    $0xc,%esp
     8e8:	ff b3 64 00 00 00    	pushl  0x64(%ebx)
     8ee:	e8 dd fe ff ff       	call   7d0 <__ctype_b_loc@plt+0x10>
     8f3:	83 c4 10             	add    $0x10,%esp
     8f6:	e8 35 ff ff ff       	call   830 <deregister_tm_clones>
     8fb:	c6 83 60 02 00 00 01 	movb   $0x1,0x260(%ebx)
     902:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     905:	c9                   	leave  
     906:	c3                   	ret    
     907:	89 f6                	mov    %esi,%esi
     909:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000910 <frame_dummy>:
     910:	e8 37 00 00 00       	call   94c <__x86.get_pc_thunk.dx>
     915:	81 c2 eb 36 00 00    	add    $0x36eb,%edx
     91b:	8d 82 ec fe ff ff    	lea    -0x114(%edx),%eax
     921:	8b 08                	mov    (%eax),%ecx
     923:	85 c9                	test   %ecx,%ecx
     925:	75 09                	jne    930 <frame_dummy+0x20>
     927:	e9 44 ff ff ff       	jmp    870 <register_tm_clones>
     92c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     930:	8b 92 f8 ff ff ff    	mov    -0x8(%edx),%edx
     936:	85 d2                	test   %edx,%edx
     938:	74 ed                	je     927 <frame_dummy+0x17>
     93a:	55                   	push   %ebp
     93b:	89 e5                	mov    %esp,%ebp
     93d:	83 ec 14             	sub    $0x14,%esp
     940:	50                   	push   %eax
     941:	ff d2                	call   *%edx
     943:	83 c4 10             	add    $0x10,%esp
     946:	c9                   	leave  
     947:	e9 24 ff ff ff       	jmp    870 <register_tm_clones>

0000094c <__x86.get_pc_thunk.dx>:
     94c:	8b 14 24             	mov    (%esp),%edx
     94f:	c3                   	ret    

00000950 <main>:
     950:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     954:	83 e4 f0             	and    $0xfffffff0,%esp
     957:	ff 71 fc             	pushl  -0x4(%ecx)
     95a:	55                   	push   %ebp
     95b:	89 e5                	mov    %esp,%ebp
     95d:	56                   	push   %esi
     95e:	53                   	push   %ebx
     95f:	51                   	push   %ecx
     960:	83 ec 1c             	sub    $0x1c,%esp
     963:	e8 b8 fe ff ff       	call   820 <__x86.get_pc_thunk.bx>
     968:	81 c3 98 36 00 00    	add    $0x3698,%ebx
     96e:	89 ce                	mov    %ecx,%esi
     970:	83 3e 01             	cmpl   $0x1,(%esi)
     973:	75 15                	jne    98a <main+0x3a>
     975:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
     97b:	8b 10                	mov    (%eax),%edx
     97d:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
     983:	89 10                	mov    %edx,(%eax)
     985:	e9 83 00 00 00       	jmp    a0d <main+0xbd>
     98a:	83 3e 02             	cmpl   $0x2,(%esi)
     98d:	75 5c                	jne    9eb <main+0x9b>
     98f:	8b 46 04             	mov    0x4(%esi),%eax
     992:	83 c0 04             	add    $0x4,%eax
     995:	8b 00                	mov    (%eax),%eax
     997:	83 ec 08             	sub    $0x8,%esp
     99a:	8d 93 48 d8 ff ff    	lea    -0x27b8(%ebx),%edx
     9a0:	52                   	push   %edx
     9a1:	50                   	push   %eax
     9a2:	e8 e9 fd ff ff       	call   790 <fopen@plt>
     9a7:	83 c4 10             	add    $0x10,%esp
     9aa:	89 c2                	mov    %eax,%edx
     9ac:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
     9b2:	89 10                	mov    %edx,(%eax)
     9b4:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
     9ba:	8b 00                	mov    (%eax),%eax
     9bc:	85 c0                	test   %eax,%eax
     9be:	75 4d                	jne    a0d <main+0xbd>
     9c0:	8b 46 04             	mov    0x4(%esi),%eax
     9c3:	83 c0 04             	add    $0x4,%eax
     9c6:	8b 10                	mov    (%eax),%edx
     9c8:	8b 46 04             	mov    0x4(%esi),%eax
     9cb:	8b 00                	mov    (%eax),%eax
     9cd:	83 ec 04             	sub    $0x4,%esp
     9d0:	52                   	push   %edx
     9d1:	50                   	push   %eax
     9d2:	8d 83 4a d8 ff ff    	lea    -0x27b6(%ebx),%eax
     9d8:	50                   	push   %eax
     9d9:	e8 02 fd ff ff       	call   6e0 <printf@plt>
     9de:	83 c4 10             	add    $0x10,%esp
     9e1:	83 ec 0c             	sub    $0xc,%esp
     9e4:	6a 08                	push   $0x8
     9e6:	e8 65 fd ff ff       	call   750 <exit@plt>
     9eb:	8b 46 04             	mov    0x4(%esi),%eax
     9ee:	8b 00                	mov    (%eax),%eax
     9f0:	83 ec 08             	sub    $0x8,%esp
     9f3:	50                   	push   %eax
     9f4:	8d 83 67 d8 ff ff    	lea    -0x2799(%ebx),%eax
     9fa:	50                   	push   %eax
     9fb:	e8 e0 fc ff ff       	call   6e0 <printf@plt>
     a00:	83 c4 10             	add    $0x10,%esp
     a03:	83 ec 0c             	sub    $0xc,%esp
     a06:	6a 08                	push   $0x8
     a08:	e8 43 fd ff ff       	call   750 <exit@plt>
     a0d:	e8 3b 0a 00 00       	call   144d <initialize_bomb>
     a12:	83 ec 0c             	sub    $0xc,%esp
     a15:	8d 83 84 d8 ff ff    	lea    -0x277c(%ebx),%eax
     a1b:	50                   	push   %eax
     a1c:	e8 1f fd ff ff       	call   740 <puts@plt>
     a21:	83 c4 10             	add    $0x10,%esp
     a24:	83 ec 0c             	sub    $0xc,%esp
     a27:	8d 83 c0 d8 ff ff    	lea    -0x2740(%ebx),%eax
     a2d:	50                   	push   %eax
     a2e:	e8 0d fd ff ff       	call   740 <puts@plt>
     a33:	83 c4 10             	add    $0x10,%esp
     a36:	e8 0c 0b 00 00       	call   1547 <read_line>
     a3b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a3e:	83 ec 0c             	sub    $0xc,%esp
     a41:	ff 75 e4             	pushl  -0x1c(%ebp)
     a44:	e8 62 01 00 00       	call   bab <phase_0>
     a49:	83 c4 10             	add    $0x10,%esp
     a4c:	85 c0                	test   %eax,%eax
     a4e:	74 17                	je     a67 <main+0x117>
     a50:	e8 a8 0c 00 00       	call   16fd <phase_defused>
     a55:	83 ec 0c             	sub    $0xc,%esp
     a58:	8d 83 ec d8 ff ff    	lea    -0x2714(%ebx),%eax
     a5e:	50                   	push   %eax
     a5f:	e8 dc fc ff ff       	call   740 <puts@plt>
     a64:	83 c4 10             	add    $0x10,%esp
     a67:	e8 db 0a 00 00       	call   1547 <read_line>
     a6c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a6f:	83 ec 0c             	sub    $0xc,%esp
     a72:	ff 75 e4             	pushl  -0x1c(%ebp)
     a75:	e8 b1 01 00 00       	call   c2b <phase_1>
     a7a:	83 c4 10             	add    $0x10,%esp
     a7d:	85 c0                	test   %eax,%eax
     a7f:	74 17                	je     a98 <main+0x148>
     a81:	e8 77 0c 00 00       	call   16fd <phase_defused>
     a86:	83 ec 0c             	sub    $0xc,%esp
     a89:	8d 83 14 d9 ff ff    	lea    -0x26ec(%ebx),%eax
     a8f:	50                   	push   %eax
     a90:	e8 ab fc ff ff       	call   740 <puts@plt>
     a95:	83 c4 10             	add    $0x10,%esp
     a98:	e8 aa 0a 00 00       	call   1547 <read_line>
     a9d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	ff 75 e4             	pushl  -0x1c(%ebp)
     aa6:	e8 c1 01 00 00       	call   c6c <phase_2>
     aab:	83 c4 10             	add    $0x10,%esp
     aae:	85 c0                	test   %eax,%eax
     ab0:	74 17                	je     ac9 <main+0x179>
     ab2:	e8 46 0c 00 00       	call   16fd <phase_defused>
     ab7:	83 ec 0c             	sub    $0xc,%esp
     aba:	8d 83 3d d9 ff ff    	lea    -0x26c3(%ebx),%eax
     ac0:	50                   	push   %eax
     ac1:	e8 7a fc ff ff       	call   740 <puts@plt>
     ac6:	83 c4 10             	add    $0x10,%esp
     ac9:	e8 79 0a 00 00       	call   1547 <read_line>
     ace:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     ad1:	83 ec 0c             	sub    $0xc,%esp
     ad4:	ff 75 e4             	pushl  -0x1c(%ebp)
     ad7:	e8 2b 02 00 00       	call   d07 <phase_3>
     adc:	83 c4 10             	add    $0x10,%esp
     adf:	85 c0                	test   %eax,%eax
     ae1:	74 17                	je     afa <main+0x1aa>
     ae3:	e8 15 0c 00 00       	call   16fd <phase_defused>
     ae8:	83 ec 0c             	sub    $0xc,%esp
     aeb:	8d 83 5b d9 ff ff    	lea    -0x26a5(%ebx),%eax
     af1:	50                   	push   %eax
     af2:	e8 49 fc ff ff       	call   740 <puts@plt>
     af7:	83 c4 10             	add    $0x10,%esp
     afa:	e8 48 0a 00 00       	call   1547 <read_line>
     aff:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     b02:	83 ec 0c             	sub    $0xc,%esp
     b05:	ff 75 e4             	pushl  -0x1c(%ebp)
     b08:	e8 30 03 00 00       	call   e3d <phase_4>
     b0d:	83 c4 10             	add    $0x10,%esp
     b10:	85 c0                	test   %eax,%eax
     b12:	74 17                	je     b2b <main+0x1db>
     b14:	e8 e4 0b 00 00       	call   16fd <phase_defused>
     b19:	83 ec 0c             	sub    $0xc,%esp
     b1c:	8d 83 6c d9 ff ff    	lea    -0x2694(%ebx),%eax
     b22:	50                   	push   %eax
     b23:	e8 18 fc ff ff       	call   740 <puts@plt>
     b28:	83 c4 10             	add    $0x10,%esp
     b2b:	e8 17 0a 00 00       	call   1547 <read_line>
     b30:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     b33:	83 ec 0c             	sub    $0xc,%esp
     b36:	ff 75 e4             	pushl  -0x1c(%ebp)
     b39:	e8 78 03 00 00       	call   eb6 <phase_5>
     b3e:	83 c4 10             	add    $0x10,%esp
     b41:	85 c0                	test   %eax,%eax
     b43:	74 17                	je     b5c <main+0x20c>
     b45:	e8 b3 0b 00 00       	call   16fd <phase_defused>
     b4a:	83 ec 0c             	sub    $0xc,%esp
     b4d:	8d 83 90 d9 ff ff    	lea    -0x2670(%ebx),%eax
     b53:	50                   	push   %eax
     b54:	e8 e7 fb ff ff       	call   740 <puts@plt>
     b59:	83 c4 10             	add    $0x10,%esp
     b5c:	e8 e6 09 00 00       	call   1547 <read_line>
     b61:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     b64:	83 ec 0c             	sub    $0xc,%esp
     b67:	ff 75 e4             	pushl  -0x1c(%ebp)
     b6a:	e8 cd 03 00 00       	call   f3c <phase_6>
     b6f:	83 c4 10             	add    $0x10,%esp
     b72:	85 c0                	test   %eax,%eax
     b74:	74 05                	je     b7b <main+0x22b>
     b76:	e8 82 0b 00 00       	call   16fd <phase_defused>
     b7b:	b8 00 00 00 00       	mov    $0x0,%eax
     b80:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b83:	59                   	pop    %ecx
     b84:	5b                   	pop    %ebx
     b85:	5e                   	pop    %esi
     b86:	5d                   	pop    %ebp
     b87:	8d 61 fc             	lea    -0x4(%ecx),%esp
     b8a:	c3                   	ret    

00000b8b <CsvIwpNq>:
     b8b:	55                   	push   %ebp
     b8c:	89 e5                	mov    %esp,%ebp
     b8e:	e8 48 06 00 00       	call   11db <__x86.get_pc_thunk.ax>
     b93:	05 6d 34 00 00       	add    $0x346d,%eax
     b98:	d9 45 0c             	flds   0xc(%ebp)
     b9b:	d8 4d 10             	fmuls  0x10(%ebp)
     b9e:	d8 45 08             	fadds  0x8(%ebp)
     ba1:	d9 45 0c             	flds   0xc(%ebp)
     ba4:	d8 75 10             	fdivs  0x10(%ebp)
     ba7:	de e9                	fsubrp %st,%st(1)
     ba9:	5d                   	pop    %ebp
     baa:	c3                   	ret    

00000bab <phase_0>:
     bab:	55                   	push   %ebp
     bac:	89 e5                	mov    %esp,%ebp
     bae:	53                   	push   %ebx
     baf:	83 ec 34             	sub    $0x34,%esp
     bb2:	e8 69 fc ff ff       	call   820 <__x86.get_pc_thunk.bx>
     bb7:	81 c3 49 34 00 00    	add    $0x3449,%ebx
     bbd:	c7 45 f0 af 44 ea 0c 	movl   $0xcea44af,-0x10(%ebp)
     bc4:	db 45 f0             	fildl  -0x10(%ebp)
     bc7:	dd 5d e8             	fstpl  -0x18(%ebp)
     bca:	83 ec 04             	sub    $0x4,%esp
     bcd:	6a 08                	push   $0x8
     bcf:	8d 45 c8             	lea    -0x38(%ebp),%eax
     bd2:	50                   	push   %eax
     bd3:	ff 75 08             	pushl  0x8(%ebp)
     bd6:	e8 24 07 00 00       	call   12ff <read_n_numbers>
     bdb:	83 c4 10             	add    $0x10,%esp
     bde:	85 c0                	test   %eax,%eax
     be0:	75 07                	jne    be9 <phase_0+0x3e>
     be2:	b8 00 00 00 00       	mov    $0x0,%eax
     be7:	eb 3d                	jmp    c26 <phase_0+0x7b>
     be9:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     bf0:	eb 29                	jmp    c1b <phase_0+0x70>
     bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bf5:	8b 54 85 c8          	mov    -0x38(%ebp,%eax,4),%edx
     bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bfc:	8d 4d e8             	lea    -0x18(%ebp),%ecx
     bff:	01 c8                	add    %ecx,%eax
     c01:	0f b6 00             	movzbl (%eax),%eax
     c04:	0f be c0             	movsbl %al,%eax
     c07:	39 c2                	cmp    %eax,%edx
     c09:	74 0c                	je     c17 <phase_0+0x6c>
     c0b:	e8 b1 0a 00 00       	call   16c1 <explode_bomb>
     c10:	b8 00 00 00 00       	mov    $0x0,%eax
     c15:	eb 0f                	jmp    c26 <phase_0+0x7b>
     c17:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c1b:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
     c1f:	7e d1                	jle    bf2 <phase_0+0x47>
     c21:	b8 01 00 00 00       	mov    $0x1,%eax
     c26:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c29:	c9                   	leave  
     c2a:	c3                   	ret    

00000c2b <phase_1>:
     c2b:	55                   	push   %ebp
     c2c:	89 e5                	mov    %esp,%ebp
     c2e:	53                   	push   %ebx
     c2f:	83 ec 04             	sub    $0x4,%esp
     c32:	e8 e9 fb ff ff       	call   820 <__x86.get_pc_thunk.bx>
     c37:	81 c3 c9 33 00 00    	add    $0x33c9,%ebx
     c3d:	83 ec 08             	sub    $0x8,%esp
     c40:	8d 83 0c da ff ff    	lea    -0x25f4(%ebx),%eax
     c46:	50                   	push   %eax
     c47:	ff 75 08             	pushl  0x8(%ebp)
     c4a:	e8 89 07 00 00       	call   13d8 <strings_not_equal>
     c4f:	83 c4 10             	add    $0x10,%esp
     c52:	85 c0                	test   %eax,%eax
     c54:	74 0c                	je     c62 <phase_1+0x37>
     c56:	e8 66 0a 00 00       	call   16c1 <explode_bomb>
     c5b:	b8 00 00 00 00       	mov    $0x0,%eax
     c60:	eb 05                	jmp    c67 <phase_1+0x3c>
     c62:	b8 01 00 00 00       	mov    $0x1,%eax
     c67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c6a:	c9                   	leave  
     c6b:	c3                   	ret    

00000c6c <phase_2>:
     c6c:	55                   	push   %ebp
     c6d:	89 e5                	mov    %esp,%ebp
     c6f:	53                   	push   %ebx
     c70:	83 ec 24             	sub    $0x24,%esp
     c73:	e8 a8 fb ff ff       	call   820 <__x86.get_pc_thunk.bx>
     c78:	81 c3 88 33 00 00    	add    $0x3388,%ebx
     c7e:	83 ec 04             	sub    $0x4,%esp
     c81:	6a 06                	push   $0x6
     c83:	8d 45 dc             	lea    -0x24(%ebp),%eax
     c86:	50                   	push   %eax
     c87:	ff 75 08             	pushl  0x8(%ebp)
     c8a:	e8 70 06 00 00       	call   12ff <read_n_numbers>
     c8f:	83 c4 10             	add    $0x10,%esp
     c92:	85 c0                	test   %eax,%eax
     c94:	75 07                	jne    c9d <phase_2+0x31>
     c96:	b8 00 00 00 00       	mov    $0x0,%eax
     c9b:	eb 65                	jmp    d02 <phase_2+0x96>
     c9d:	8b 45 dc             	mov    -0x24(%ebp),%eax
     ca0:	83 f8 07             	cmp    $0x7,%eax
     ca3:	75 08                	jne    cad <phase_2+0x41>
     ca5:	8b 45 e0             	mov    -0x20(%ebp),%eax
     ca8:	83 f8 0e             	cmp    $0xe,%eax
     cab:	74 0c                	je     cb9 <phase_2+0x4d>
     cad:	e8 0f 0a 00 00       	call   16c1 <explode_bomb>
     cb2:	b8 00 00 00 00       	mov    $0x0,%eax
     cb7:	eb 49                	jmp    d02 <phase_2+0x96>
     cb9:	c7 45 f4 02 00 00 00 	movl   $0x2,-0xc(%ebp)
     cc0:	eb 35                	jmp    cf7 <phase_2+0x8b>
     cc2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc5:	8b 44 85 dc          	mov    -0x24(%ebp,%eax,4),%eax
     cc9:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ccc:	83 ea 02             	sub    $0x2,%edx
     ccf:	8b 54 95 dc          	mov    -0x24(%ebp,%edx,4),%edx
     cd3:	89 d1                	mov    %edx,%ecx
     cd5:	d1 f9                	sar    %ecx
     cd7:	8b 55 f4             	mov    -0xc(%ebp),%edx
     cda:	83 ea 01             	sub    $0x1,%edx
     cdd:	8b 54 95 dc          	mov    -0x24(%ebp,%edx,4),%edx
     ce1:	01 ca                	add    %ecx,%edx
     ce3:	39 d0                	cmp    %edx,%eax
     ce5:	74 0c                	je     cf3 <phase_2+0x87>
     ce7:	e8 d5 09 00 00       	call   16c1 <explode_bomb>
     cec:	b8 00 00 00 00       	mov    $0x0,%eax
     cf1:	eb 0f                	jmp    d02 <phase_2+0x96>
     cf3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cf7:	83 7d f4 05          	cmpl   $0x5,-0xc(%ebp)
     cfb:	7e c5                	jle    cc2 <phase_2+0x56>
     cfd:	b8 01 00 00 00       	mov    $0x1,%eax
     d02:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d05:	c9                   	leave  
     d06:	c3                   	ret    

00000d07 <phase_3>:
     d07:	55                   	push   %ebp
     d08:	89 e5                	mov    %esp,%ebp
     d0a:	53                   	push   %ebx
     d0b:	83 ec 14             	sub    $0x14,%esp
     d0e:	e8 0d fb ff ff       	call   820 <__x86.get_pc_thunk.bx>
     d13:	81 c3 ed 32 00 00    	add    $0x32ed,%ebx
     d19:	8d 45 e8             	lea    -0x18(%ebp),%eax
     d1c:	50                   	push   %eax
     d1d:	8d 45 ec             	lea    -0x14(%ebp),%eax
     d20:	50                   	push   %eax
     d21:	8d 83 2c da ff ff    	lea    -0x25d4(%ebx),%eax
     d27:	50                   	push   %eax
     d28:	ff 75 08             	pushl  0x8(%ebp)
     d2b:	e8 50 fa ff ff       	call   780 <__isoc99_sscanf@plt>
     d30:	83 c4 10             	add    $0x10,%esp
     d33:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d36:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
     d3a:	7f 0f                	jg     d4b <phase_3+0x44>
     d3c:	e8 80 09 00 00       	call   16c1 <explode_bomb>
     d41:	b8 00 00 00 00       	mov    $0x0,%eax
     d46:	e9 93 00 00 00       	jmp    dde <.L35+0x39>
     d4b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d52:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d55:	2d 89 00 00 00       	sub    $0x89,%eax
     d5a:	83 f8 08             	cmp    $0x8,%eax
     d5d:	77 5a                	ja     db9 <.L35+0x14>
     d5f:	c1 e0 02             	shl    $0x2,%eax
     d62:	8b 84 18 34 da ff ff 	mov    -0x25cc(%eax,%ebx,1),%eax
     d69:	01 d8                	add    %ebx,%eax
     d6b:	ff e0                	jmp    *%eax

00000d6d <.L26>:
     d6d:	81 45 f4 b1 01 00 00 	addl   $0x1b1,-0xc(%ebp)

00000d74 <.L28>:
     d74:	81 45 f4 69 01 00 00 	addl   $0x169,-0xc(%ebp)

00000d7b <.L29>:
     d7b:	81 6d f4 b1 01 00 00 	subl   $0x1b1,-0xc(%ebp)

00000d82 <.L30>:
     d82:	81 45 f4 b1 01 00 00 	addl   $0x1b1,-0xc(%ebp)

00000d89 <.L31>:
     d89:	81 45 f4 69 01 00 00 	addl   $0x169,-0xc(%ebp)

00000d90 <.L32>:
     d90:	81 6d f4 b1 01 00 00 	subl   $0x1b1,-0xc(%ebp)

00000d97 <.L33>:
     d97:	81 45 f4 69 01 00 00 	addl   $0x169,-0xc(%ebp)

00000d9e <.L34>:
     d9e:	81 6d f4 69 01 00 00 	subl   $0x169,-0xc(%ebp)

00000da5 <.L35>:
     da5:	81 45 f4 b1 01 00 00 	addl   $0x1b1,-0xc(%ebp)
     dac:	90                   	nop
     dad:	8b 45 ec             	mov    -0x14(%ebp),%eax
     db0:	3d 8f 00 00 00       	cmp    $0x8f,%eax
     db5:	7f 16                	jg     dcd <.L35+0x28>
     db7:	eb 0c                	jmp    dc5 <.L35+0x20>
     db9:	e8 03 09 00 00       	call   16c1 <explode_bomb>
     dbe:	b8 00 00 00 00       	mov    $0x0,%eax
     dc3:	eb 19                	jmp    dde <.L35+0x39>
     dc5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     dc8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     dcb:	74 0c                	je     dd9 <.L35+0x34>
     dcd:	e8 ef 08 00 00       	call   16c1 <explode_bomb>
     dd2:	b8 00 00 00 00       	mov    $0x0,%eax
     dd7:	eb 05                	jmp    dde <.L35+0x39>
     dd9:	b8 01 00 00 00       	mov    $0x1,%eax
     dde:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     de1:	c9                   	leave  
     de2:	c3                   	ret    

00000de3 <func4>:
     de3:	55                   	push   %ebp
     de4:	89 e5                	mov    %esp,%ebp
     de6:	53                   	push   %ebx
     de7:	83 ec 04             	sub    $0x4,%esp
     dea:	e8 ec 03 00 00       	call   11db <__x86.get_pc_thunk.ax>
     def:	05 11 32 00 00       	add    $0x3211,%eax
     df4:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     df8:	7f 07                	jg     e01 <func4+0x1e>
     dfa:	b8 0f 00 00 00       	mov    $0xf,%eax
     dff:	eb 37                	jmp    e38 <func4+0x55>
     e01:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
     e05:	75 07                	jne    e0e <func4+0x2b>
     e07:	b8 1a 00 00 00       	mov    $0x1a,%eax
     e0c:	eb 2a                	jmp    e38 <func4+0x55>
     e0e:	8b 45 08             	mov    0x8(%ebp),%eax
     e11:	83 e8 01             	sub    $0x1,%eax
     e14:	83 ec 0c             	sub    $0xc,%esp
     e17:	50                   	push   %eax
     e18:	e8 c6 ff ff ff       	call   de3 <func4>
     e1d:	83 c4 10             	add    $0x10,%esp
     e20:	89 c3                	mov    %eax,%ebx
     e22:	8b 45 08             	mov    0x8(%ebp),%eax
     e25:	83 e8 02             	sub    $0x2,%eax
     e28:	83 ec 0c             	sub    $0xc,%esp
     e2b:	50                   	push   %eax
     e2c:	e8 b2 ff ff ff       	call   de3 <func4>
     e31:	83 c4 10             	add    $0x10,%esp
     e34:	d1 f8                	sar    %eax
     e36:	01 d8                	add    %ebx,%eax
     e38:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e3b:	c9                   	leave  
     e3c:	c3                   	ret    

00000e3d <phase_4>:
     e3d:	55                   	push   %ebp
     e3e:	89 e5                	mov    %esp,%ebp
     e40:	53                   	push   %ebx
     e41:	83 ec 14             	sub    $0x14,%esp
     e44:	e8 d7 f9 ff ff       	call   820 <__x86.get_pc_thunk.bx>
     e49:	81 c3 b7 31 00 00    	add    $0x31b7,%ebx
     e4f:	8d 45 e8             	lea    -0x18(%ebp),%eax
     e52:	50                   	push   %eax
     e53:	8d 45 ec             	lea    -0x14(%ebp),%eax
     e56:	50                   	push   %eax
     e57:	8d 83 2c da ff ff    	lea    -0x25d4(%ebx),%eax
     e5d:	50                   	push   %eax
     e5e:	ff 75 08             	pushl  0x8(%ebp)
     e61:	e8 1a f9 ff ff       	call   780 <__isoc99_sscanf@plt>
     e66:	83 c4 10             	add    $0x10,%esp
     e69:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e6c:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
     e70:	75 08                	jne    e7a <phase_4+0x3d>
     e72:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e75:	83 f8 0b             	cmp    $0xb,%eax
     e78:	7f 0c                	jg     e86 <phase_4+0x49>
     e7a:	e8 42 08 00 00       	call   16c1 <explode_bomb>
     e7f:	b8 00 00 00 00       	mov    $0x0,%eax
     e84:	eb 2b                	jmp    eb1 <phase_4+0x74>
     e86:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e89:	83 ec 0c             	sub    $0xc,%esp
     e8c:	50                   	push   %eax
     e8d:	e8 51 ff ff ff       	call   de3 <func4>
     e92:	83 c4 10             	add    $0x10,%esp
     e95:	89 45 f0             	mov    %eax,-0x10(%ebp)
     e98:	8b 45 e8             	mov    -0x18(%ebp),%eax
     e9b:	39 45 f0             	cmp    %eax,-0x10(%ebp)
     e9e:	74 0c                	je     eac <phase_4+0x6f>
     ea0:	e8 1c 08 00 00       	call   16c1 <explode_bomb>
     ea5:	b8 00 00 00 00       	mov    $0x0,%eax
     eaa:	eb 05                	jmp    eb1 <phase_4+0x74>
     eac:	b8 01 00 00 00       	mov    $0x1,%eax
     eb1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     eb4:	c9                   	leave  
     eb5:	c3                   	ret    

00000eb6 <phase_5>:
     eb6:	55                   	push   %ebp
     eb7:	89 e5                	mov    %esp,%ebp
     eb9:	53                   	push   %ebx
     eba:	83 ec 14             	sub    $0x14,%esp
     ebd:	e8 5e f9 ff ff       	call   820 <__x86.get_pc_thunk.bx>
     ec2:	81 c3 3e 31 00 00    	add    $0x313e,%ebx
     ec8:	83 ec 0c             	sub    $0xc,%esp
     ecb:	ff 75 08             	pushl  0x8(%ebp)
     ece:	e8 cf 04 00 00       	call   13a2 <string_length>
     ed3:	83 c4 10             	add    $0x10,%esp
     ed6:	89 45 ec             	mov    %eax,-0x14(%ebp)
     ed9:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
     edd:	74 0c                	je     eeb <phase_5+0x35>
     edf:	e8 dd 07 00 00       	call   16c1 <explode_bomb>
     ee4:	b8 00 00 00 00       	mov    $0x0,%eax
     ee9:	eb 4c                	jmp    f37 <phase_5+0x81>
     eeb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ef2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     ef9:	eb 1f                	jmp    f1a <phase_5+0x64>
     efb:	8b 55 f4             	mov    -0xc(%ebp),%edx
     efe:	8b 45 08             	mov    0x8(%ebp),%eax
     f01:	01 d0                	add    %edx,%eax
     f03:	0f b6 00             	movzbl (%eax),%eax
     f06:	0f be c0             	movsbl %al,%eax
     f09:	83 e0 0f             	and    $0xf,%eax
     f0c:	8b 84 83 60 01 00 00 	mov    0x160(%ebx,%eax,4),%eax
     f13:	01 45 f0             	add    %eax,-0x10(%ebp)
     f16:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f1a:	83 7d f4 04          	cmpl   $0x4,-0xc(%ebp)
     f1e:	7e db                	jle    efb <phase_5+0x45>
     f20:	83 7d f0 30          	cmpl   $0x30,-0x10(%ebp)
     f24:	74 0c                	je     f32 <phase_5+0x7c>
     f26:	e8 96 07 00 00       	call   16c1 <explode_bomb>
     f2b:	b8 00 00 00 00       	mov    $0x0,%eax
     f30:	eb 05                	jmp    f37 <phase_5+0x81>
     f32:	b8 01 00 00 00       	mov    $0x1,%eax
     f37:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f3a:	c9                   	leave  
     f3b:	c3                   	ret    

00000f3c <phase_6>:
     f3c:	55                   	push   %ebp
     f3d:	89 e5                	mov    %esp,%ebp
     f3f:	53                   	push   %ebx
     f40:	83 ec 54             	sub    $0x54,%esp
     f43:	e8 d8 f8 ff ff       	call   820 <__x86.get_pc_thunk.bx>
     f48:	81 c3 b8 30 00 00    	add    $0x30b8,%ebx
     f4e:	8d 83 e8 01 00 00    	lea    0x1e8(%ebx),%eax
     f54:	89 45 e8             	mov    %eax,-0x18(%ebp)
     f57:	83 ec 04             	sub    $0x4,%esp
     f5a:	6a 08                	push   $0x8
     f5c:	8d 45 c8             	lea    -0x38(%ebp),%eax
     f5f:	50                   	push   %eax
     f60:	ff 75 08             	pushl  0x8(%ebp)
     f63:	e8 97 03 00 00       	call   12ff <read_n_numbers>
     f68:	83 c4 10             	add    $0x10,%esp
     f6b:	85 c0                	test   %eax,%eax
     f6d:	75 0a                	jne    f79 <phase_6+0x3d>
     f6f:	b8 00 00 00 00       	mov    $0x0,%eax
     f74:	e9 5f 01 00 00       	jmp    10d8 <phase_6+0x19c>
     f79:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     f80:	eb 60                	jmp    fe2 <phase_6+0xa6>
     f82:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f85:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
     f89:	85 c0                	test   %eax,%eax
     f8b:	7e 0c                	jle    f99 <phase_6+0x5d>
     f8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f90:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
     f94:	83 f8 08             	cmp    $0x8,%eax
     f97:	7e 0f                	jle    fa8 <phase_6+0x6c>
     f99:	e8 23 07 00 00       	call   16c1 <explode_bomb>
     f9e:	b8 00 00 00 00       	mov    $0x0,%eax
     fa3:	e9 30 01 00 00       	jmp    10d8 <phase_6+0x19c>
     fa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fab:	83 c0 01             	add    $0x1,%eax
     fae:	89 45 ec             	mov    %eax,-0x14(%ebp)
     fb1:	eb 25                	jmp    fd8 <phase_6+0x9c>
     fb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fb6:	8b 54 85 c8          	mov    -0x38(%ebp,%eax,4),%edx
     fba:	8b 45 ec             	mov    -0x14(%ebp),%eax
     fbd:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
     fc1:	39 c2                	cmp    %eax,%edx
     fc3:	75 0f                	jne    fd4 <phase_6+0x98>
     fc5:	e8 f7 06 00 00       	call   16c1 <explode_bomb>
     fca:	b8 00 00 00 00       	mov    $0x0,%eax
     fcf:	e9 04 01 00 00       	jmp    10d8 <phase_6+0x19c>
     fd4:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     fd8:	83 7d ec 07          	cmpl   $0x7,-0x14(%ebp)
     fdc:	7e d5                	jle    fb3 <phase_6+0x77>
     fde:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     fe2:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
     fe6:	7e 9a                	jle    f82 <phase_6+0x46>
     fe8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     fef:	eb 19                	jmp    100a <phase_6+0xce>
     ff1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ff4:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
     ff8:	ba 09 00 00 00       	mov    $0x9,%edx
     ffd:	29 c2                	sub    %eax,%edx
     fff:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1002:	89 54 85 c8          	mov    %edx,-0x38(%ebp,%eax,4)
    1006:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    100a:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    100e:	7e e1                	jle    ff1 <phase_6+0xb5>
    1010:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1017:	eb 36                	jmp    104f <phase_6+0x113>
    1019:	8b 45 e8             	mov    -0x18(%ebp),%eax
    101c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    101f:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    1026:	eb 0d                	jmp    1035 <phase_6+0xf9>
    1028:	8b 45 f4             	mov    -0xc(%ebp),%eax
    102b:	8b 40 08             	mov    0x8(%eax),%eax
    102e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1031:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1035:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1038:	8b 44 85 c8          	mov    -0x38(%ebp,%eax,4),%eax
    103c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    103f:	7f e7                	jg     1028 <phase_6+0xec>
    1041:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1044:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1047:	89 54 85 a8          	mov    %edx,-0x58(%ebp,%eax,4)
    104b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    104f:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    1053:	7e c4                	jle    1019 <phase_6+0xdd>
    1055:	8b 45 a8             	mov    -0x58(%ebp),%eax
    1058:	89 45 e8             	mov    %eax,-0x18(%ebp)
    105b:	8b 45 e8             	mov    -0x18(%ebp),%eax
    105e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1061:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    1068:	eb 1a                	jmp    1084 <phase_6+0x148>
    106a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    106d:	8b 54 85 a8          	mov    -0x58(%ebp,%eax,4),%edx
    1071:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1074:	89 50 08             	mov    %edx,0x8(%eax)
    1077:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107a:	8b 40 08             	mov    0x8(%eax),%eax
    107d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1080:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1084:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
    1088:	7e e0                	jle    106a <phase_6+0x12e>
    108a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    108d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    1094:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1097:	89 45 f4             	mov    %eax,-0xc(%ebp)
    109a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    10a1:	eb 2a                	jmp    10cd <phase_6+0x191>
    10a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10a6:	8b 10                	mov    (%eax),%edx
    10a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ab:	8b 40 08             	mov    0x8(%eax),%eax
    10ae:	8b 00                	mov    (%eax),%eax
    10b0:	39 c2                	cmp    %eax,%edx
    10b2:	7d 0c                	jge    10c0 <phase_6+0x184>
    10b4:	e8 08 06 00 00       	call   16c1 <explode_bomb>
    10b9:	b8 00 00 00 00       	mov    $0x0,%eax
    10be:	eb 18                	jmp    10d8 <phase_6+0x19c>
    10c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c3:	8b 40 08             	mov    0x8(%eax),%eax
    10c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10c9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    10cd:	83 7d f0 06          	cmpl   $0x6,-0x10(%ebp)
    10d1:	7e d0                	jle    10a3 <phase_6+0x167>
    10d3:	b8 01 00 00 00       	mov    $0x1,%eax
    10d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10db:	c9                   	leave  
    10dc:	c3                   	ret    

000010dd <fun7>:
    10dd:	55                   	push   %ebp
    10de:	89 e5                	mov    %esp,%ebp
    10e0:	83 ec 08             	sub    $0x8,%esp
    10e3:	e8 f3 00 00 00       	call   11db <__x86.get_pc_thunk.ax>
    10e8:	05 18 2f 00 00       	add    $0x2f18,%eax
    10ed:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    10f1:	75 07                	jne    10fa <fun7+0x1d>
    10f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    10f8:	eb 4e                	jmp    1148 <fun7+0x6b>
    10fa:	8b 45 08             	mov    0x8(%ebp),%eax
    10fd:	8b 00                	mov    (%eax),%eax
    10ff:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1102:	7e 19                	jle    111d <fun7+0x40>
    1104:	8b 45 08             	mov    0x8(%ebp),%eax
    1107:	8b 40 04             	mov    0x4(%eax),%eax
    110a:	83 ec 08             	sub    $0x8,%esp
    110d:	ff 75 0c             	pushl  0xc(%ebp)
    1110:	50                   	push   %eax
    1111:	e8 c7 ff ff ff       	call   10dd <fun7>
    1116:	83 c4 10             	add    $0x10,%esp
    1119:	01 c0                	add    %eax,%eax
    111b:	eb 2b                	jmp    1148 <fun7+0x6b>
    111d:	8b 45 08             	mov    0x8(%ebp),%eax
    1120:	8b 00                	mov    (%eax),%eax
    1122:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1125:	75 07                	jne    112e <fun7+0x51>
    1127:	b8 00 00 00 00       	mov    $0x0,%eax
    112c:	eb 1a                	jmp    1148 <fun7+0x6b>
    112e:	8b 45 08             	mov    0x8(%ebp),%eax
    1131:	8b 40 08             	mov    0x8(%eax),%eax
    1134:	83 ec 08             	sub    $0x8,%esp
    1137:	ff 75 0c             	pushl  0xc(%ebp)
    113a:	50                   	push   %eax
    113b:	e8 9d ff ff ff       	call   10dd <fun7>
    1140:	83 c4 10             	add    $0x10,%esp
    1143:	01 c0                	add    %eax,%eax
    1145:	83 c0 01             	add    $0x1,%eax
    1148:	c9                   	leave  
    1149:	c3                   	ret    

0000114a <secret_phase>:
    114a:	55                   	push   %ebp
    114b:	89 e5                	mov    %esp,%ebp
    114d:	53                   	push   %ebx
    114e:	83 ec 14             	sub    $0x14,%esp
    1151:	e8 ca f6 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    1156:	81 c3 aa 2e 00 00    	add    $0x2eaa,%ebx
    115c:	e8 e6 03 00 00       	call   1547 <read_line>
    1161:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1164:	83 ec 0c             	sub    $0xc,%esp
    1167:	ff 75 f4             	pushl  -0xc(%ebp)
    116a:	e8 41 f6 ff ff       	call   7b0 <atoi@plt>
    116f:	83 c4 10             	add    $0x10,%esp
    1172:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1175:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1179:	7e 09                	jle    1184 <secret_phase+0x3a>
    117b:	81 7d f0 e9 03 00 00 	cmpl   $0x3e9,-0x10(%ebp)
    1182:	7e 0c                	jle    1190 <secret_phase+0x46>
    1184:	e8 38 05 00 00       	call   16c1 <explode_bomb>
    1189:	b8 00 00 00 00       	mov    $0x0,%eax
    118e:	eb 46                	jmp    11d6 <secret_phase+0x8c>
    1190:	83 ec 08             	sub    $0x8,%esp
    1193:	ff 75 f0             	pushl  -0x10(%ebp)
    1196:	8d 83 3c 02 00 00    	lea    0x23c(%ebx),%eax
    119c:	50                   	push   %eax
    119d:	e8 3b ff ff ff       	call   10dd <fun7>
    11a2:	83 c4 10             	add    $0x10,%esp
    11a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    11a8:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
    11ac:	74 0c                	je     11ba <secret_phase+0x70>
    11ae:	e8 0e 05 00 00       	call   16c1 <explode_bomb>
    11b3:	b8 00 00 00 00       	mov    $0x0,%eax
    11b8:	eb 1c                	jmp    11d6 <secret_phase+0x8c>
    11ba:	83 ec 0c             	sub    $0xc,%esp
    11bd:	8d 83 58 da ff ff    	lea    -0x25a8(%ebx),%eax
    11c3:	50                   	push   %eax
    11c4:	e8 77 f5 ff ff       	call   740 <puts@plt>
    11c9:	83 c4 10             	add    $0x10,%esp
    11cc:	e8 2c 05 00 00       	call   16fd <phase_defused>
    11d1:	b8 01 00 00 00       	mov    $0x1,%eax
    11d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11d9:	c9                   	leave  
    11da:	c3                   	ret    

000011db <__x86.get_pc_thunk.ax>:
    11db:	8b 04 24             	mov    (%esp),%eax
    11de:	c3                   	ret    

000011df <sig_handler>:
    11df:	55                   	push   %ebp
    11e0:	89 e5                	mov    %esp,%ebp
    11e2:	53                   	push   %ebx
    11e3:	83 ec 04             	sub    $0x4,%esp
    11e6:	e8 35 f6 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    11eb:	81 c3 15 2e 00 00    	add    $0x2e15,%ebx
    11f1:	83 ec 0c             	sub    $0xc,%esp
    11f4:	8d 83 80 da ff ff    	lea    -0x2580(%ebx),%eax
    11fa:	50                   	push   %eax
    11fb:	e8 40 f5 ff ff       	call   740 <puts@plt>
    1200:	83 c4 10             	add    $0x10,%esp
    1203:	83 ec 0c             	sub    $0xc,%esp
    1206:	6a 03                	push   $0x3
    1208:	e8 13 f5 ff ff       	call   720 <sleep@plt>
    120d:	83 c4 10             	add    $0x10,%esp
    1210:	83 ec 0c             	sub    $0xc,%esp
    1213:	8d 83 b8 da ff ff    	lea    -0x2548(%ebx),%eax
    1219:	50                   	push   %eax
    121a:	e8 c1 f4 ff ff       	call   6e0 <printf@plt>
    121f:	83 c4 10             	add    $0x10,%esp
    1222:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
    1228:	8b 00                	mov    (%eax),%eax
    122a:	83 ec 0c             	sub    $0xc,%esp
    122d:	50                   	push   %eax
    122e:	e8 bd f4 ff ff       	call   6f0 <fflush@plt>
    1233:	83 c4 10             	add    $0x10,%esp
    1236:	83 ec 0c             	sub    $0xc,%esp
    1239:	6a 01                	push   $0x1
    123b:	e8 e0 f4 ff ff       	call   720 <sleep@plt>
    1240:	83 c4 10             	add    $0x10,%esp
    1243:	83 ec 0c             	sub    $0xc,%esp
    1246:	8d 83 c0 da ff ff    	lea    -0x2540(%ebx),%eax
    124c:	50                   	push   %eax
    124d:	e8 ee f4 ff ff       	call   740 <puts@plt>
    1252:	83 c4 10             	add    $0x10,%esp
    1255:	83 ec 0c             	sub    $0xc,%esp
    1258:	6a 10                	push   $0x10
    125a:	e8 f1 f4 ff ff       	call   750 <exit@plt>

0000125f <invalid_phase>:
    125f:	55                   	push   %ebp
    1260:	89 e5                	mov    %esp,%ebp
    1262:	53                   	push   %ebx
    1263:	83 ec 04             	sub    $0x4,%esp
    1266:	e8 b5 f5 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    126b:	81 c3 95 2d 00 00    	add    $0x2d95,%ebx
    1271:	83 ec 08             	sub    $0x8,%esp
    1274:	ff 75 08             	pushl  0x8(%ebp)
    1277:	8d 83 c8 da ff ff    	lea    -0x2538(%ebx),%eax
    127d:	50                   	push   %eax
    127e:	e8 5d f4 ff ff       	call   6e0 <printf@plt>
    1283:	83 c4 10             	add    $0x10,%esp
    1286:	83 ec 0c             	sub    $0xc,%esp
    1289:	6a 08                	push   $0x8
    128b:	e8 c0 f4 ff ff       	call   750 <exit@plt>

00001290 <read_six_numbers>:
    1290:	55                   	push   %ebp
    1291:	89 e5                	mov    %esp,%ebp
    1293:	57                   	push   %edi
    1294:	56                   	push   %esi
    1295:	53                   	push   %ebx
    1296:	83 ec 1c             	sub    $0x1c,%esp
    1299:	e8 3d ff ff ff       	call   11db <__x86.get_pc_thunk.ax>
    129e:	05 62 2d 00 00       	add    $0x2d62,%eax
    12a3:	8b 55 0c             	mov    0xc(%ebp),%edx
    12a6:	8d 7a 14             	lea    0x14(%edx),%edi
    12a9:	8b 55 0c             	mov    0xc(%ebp),%edx
    12ac:	8d 72 10             	lea    0x10(%edx),%esi
    12af:	8b 55 0c             	mov    0xc(%ebp),%edx
    12b2:	8d 5a 0c             	lea    0xc(%edx),%ebx
    12b5:	8b 55 0c             	mov    0xc(%ebp),%edx
    12b8:	8d 4a 08             	lea    0x8(%edx),%ecx
    12bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    12be:	83 c2 04             	add    $0x4,%edx
    12c1:	57                   	push   %edi
    12c2:	56                   	push   %esi
    12c3:	53                   	push   %ebx
    12c4:	51                   	push   %ecx
    12c5:	52                   	push   %edx
    12c6:	ff 75 0c             	pushl  0xc(%ebp)
    12c9:	8d 90 d9 da ff ff    	lea    -0x2527(%eax),%edx
    12cf:	52                   	push   %edx
    12d0:	ff 75 08             	pushl  0x8(%ebp)
    12d3:	89 c3                	mov    %eax,%ebx
    12d5:	e8 a6 f4 ff ff       	call   780 <__isoc99_sscanf@plt>
    12da:	83 c4 20             	add    $0x20,%esp
    12dd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    12e0:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    12e4:	7f 0c                	jg     12f2 <read_six_numbers+0x62>
    12e6:	e8 d6 03 00 00       	call   16c1 <explode_bomb>
    12eb:	b8 00 00 00 00       	mov    $0x0,%eax
    12f0:	eb 05                	jmp    12f7 <read_six_numbers+0x67>
    12f2:	b8 01 00 00 00       	mov    $0x1,%eax
    12f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
    12fa:	5b                   	pop    %ebx
    12fb:	5e                   	pop    %esi
    12fc:	5f                   	pop    %edi
    12fd:	5d                   	pop    %ebp
    12fe:	c3                   	ret    

000012ff <read_n_numbers>:
    12ff:	55                   	push   %ebp
    1300:	89 e5                	mov    %esp,%ebp
    1302:	53                   	push   %ebx
    1303:	83 ec 14             	sub    $0x14,%esp
    1306:	e8 15 f5 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    130b:	81 c3 f5 2c 00 00    	add    $0x2cf5,%ebx
    1311:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1318:	eb 76                	jmp    1390 <read_n_numbers+0x91>
    131a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    131e:	75 1a                	jne    133a <read_n_numbers+0x3b>
    1320:	83 ec 08             	sub    $0x8,%esp
    1323:	8d 83 eb da ff ff    	lea    -0x2515(%ebx),%eax
    1329:	50                   	push   %eax
    132a:	ff 75 08             	pushl  0x8(%ebp)
    132d:	e8 6e f4 ff ff       	call   7a0 <strtok@plt>
    1332:	83 c4 10             	add    $0x10,%esp
    1335:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1338:	eb 17                	jmp    1351 <read_n_numbers+0x52>
    133a:	83 ec 08             	sub    $0x8,%esp
    133d:	8d 83 eb da ff ff    	lea    -0x2515(%ebx),%eax
    1343:	50                   	push   %eax
    1344:	6a 00                	push   $0x0
    1346:	e8 55 f4 ff ff       	call   7a0 <strtok@plt>
    134b:	83 c4 10             	add    $0x10,%esp
    134e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1351:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1355:	74 29                	je     1380 <read_n_numbers+0x81>
    1357:	8b 45 f0             	mov    -0x10(%ebp),%eax
    135a:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1361:	8b 45 0c             	mov    0xc(%ebp),%eax
    1364:	01 d0                	add    %edx,%eax
    1366:	83 ec 04             	sub    $0x4,%esp
    1369:	50                   	push   %eax
    136a:	8d 83 ef da ff ff    	lea    -0x2511(%ebx),%eax
    1370:	50                   	push   %eax
    1371:	ff 75 f4             	pushl  -0xc(%ebp)
    1374:	e8 07 f4 ff ff       	call   780 <__isoc99_sscanf@plt>
    1379:	83 c4 10             	add    $0x10,%esp
    137c:	85 c0                	test   %eax,%eax
    137e:	7f 0c                	jg     138c <read_n_numbers+0x8d>
    1380:	e8 3c 03 00 00       	call   16c1 <explode_bomb>
    1385:	b8 00 00 00 00       	mov    $0x0,%eax
    138a:	eb 11                	jmp    139d <read_n_numbers+0x9e>
    138c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1390:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1393:	3b 45 10             	cmp    0x10(%ebp),%eax
    1396:	7c 82                	jl     131a <read_n_numbers+0x1b>
    1398:	b8 01 00 00 00       	mov    $0x1,%eax
    139d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13a0:	c9                   	leave  
    13a1:	c3                   	ret    

000013a2 <string_length>:
    13a2:	55                   	push   %ebp
    13a3:	89 e5                	mov    %esp,%ebp
    13a5:	83 ec 10             	sub    $0x10,%esp
    13a8:	e8 2e fe ff ff       	call   11db <__x86.get_pc_thunk.ax>
    13ad:	05 53 2c 00 00       	add    $0x2c53,%eax
    13b2:	8b 45 08             	mov    0x8(%ebp),%eax
    13b5:	89 45 f8             	mov    %eax,-0x8(%ebp)
    13b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13bf:	eb 08                	jmp    13c9 <string_length+0x27>
    13c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    13c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    13c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13cc:	0f b6 00             	movzbl (%eax),%eax
    13cf:	84 c0                	test   %al,%al
    13d1:	75 ee                	jne    13c1 <string_length+0x1f>
    13d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13d6:	c9                   	leave  
    13d7:	c3                   	ret    

000013d8 <strings_not_equal>:
    13d8:	55                   	push   %ebp
    13d9:	89 e5                	mov    %esp,%ebp
    13db:	53                   	push   %ebx
    13dc:	83 ec 10             	sub    $0x10,%esp
    13df:	e8 f7 fd ff ff       	call   11db <__x86.get_pc_thunk.ax>
    13e4:	05 1c 2c 00 00       	add    $0x2c1c,%eax
    13e9:	ff 75 08             	pushl  0x8(%ebp)
    13ec:	e8 b1 ff ff ff       	call   13a2 <string_length>
    13f1:	83 c4 04             	add    $0x4,%esp
    13f4:	89 c3                	mov    %eax,%ebx
    13f6:	ff 75 0c             	pushl  0xc(%ebp)
    13f9:	e8 a4 ff ff ff       	call   13a2 <string_length>
    13fe:	83 c4 04             	add    $0x4,%esp
    1401:	39 c3                	cmp    %eax,%ebx
    1403:	74 07                	je     140c <strings_not_equal+0x34>
    1405:	b8 01 00 00 00       	mov    $0x1,%eax
    140a:	eb 3c                	jmp    1448 <strings_not_equal+0x70>
    140c:	8b 45 08             	mov    0x8(%ebp),%eax
    140f:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1412:	8b 45 0c             	mov    0xc(%ebp),%eax
    1415:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1418:	eb 1f                	jmp    1439 <strings_not_equal+0x61>
    141a:	8b 45 f8             	mov    -0x8(%ebp),%eax
    141d:	0f b6 10             	movzbl (%eax),%edx
    1420:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1423:	0f b6 00             	movzbl (%eax),%eax
    1426:	38 c2                	cmp    %al,%dl
    1428:	74 07                	je     1431 <strings_not_equal+0x59>
    142a:	b8 01 00 00 00       	mov    $0x1,%eax
    142f:	eb 17                	jmp    1448 <strings_not_equal+0x70>
    1431:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    1435:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1439:	8b 45 f8             	mov    -0x8(%ebp),%eax
    143c:	0f b6 00             	movzbl (%eax),%eax
    143f:	84 c0                	test   %al,%al
    1441:	75 d7                	jne    141a <strings_not_equal+0x42>
    1443:	b8 00 00 00 00       	mov    $0x0,%eax
    1448:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    144b:	c9                   	leave  
    144c:	c3                   	ret    

0000144d <initialize_bomb>:
    144d:	55                   	push   %ebp
    144e:	89 e5                	mov    %esp,%ebp
    1450:	53                   	push   %ebx
    1451:	83 ec 04             	sub    $0x4,%esp
    1454:	e8 82 fd ff ff       	call   11db <__x86.get_pc_thunk.ax>
    1459:	05 a7 2b 00 00       	add    $0x2ba7,%eax
    145e:	83 ec 08             	sub    $0x8,%esp
    1461:	8d 90 df d1 ff ff    	lea    -0x2e21(%eax),%edx
    1467:	52                   	push   %edx
    1468:	6a 02                	push   $0x2
    146a:	89 c3                	mov    %eax,%ebx
    146c:	e8 9f f2 ff ff       	call   710 <signal@plt>
    1471:	83 c4 10             	add    $0x10,%esp
    1474:	90                   	nop
    1475:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1478:	c9                   	leave  
    1479:	c3                   	ret    

0000147a <initialize_bomb_solve>:
    147a:	55                   	push   %ebp
    147b:	89 e5                	mov    %esp,%ebp
    147d:	e8 59 fd ff ff       	call   11db <__x86.get_pc_thunk.ax>
    1482:	05 7e 2b 00 00       	add    $0x2b7e,%eax
    1487:	90                   	nop
    1488:	5d                   	pop    %ebp
    1489:	c3                   	ret    

0000148a <blank_line>:
    148a:	55                   	push   %ebp
    148b:	89 e5                	mov    %esp,%ebp
    148d:	53                   	push   %ebx
    148e:	83 ec 04             	sub    $0x4,%esp
    1491:	e8 8a f3 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    1496:	81 c3 6a 2b 00 00    	add    $0x2b6a,%ebx
    149c:	eb 30                	jmp    14ce <blank_line+0x44>
    149e:	e8 1d f3 ff ff       	call   7c0 <__ctype_b_loc@plt>
    14a3:	8b 08                	mov    (%eax),%ecx
    14a5:	8b 45 08             	mov    0x8(%ebp),%eax
    14a8:	8d 50 01             	lea    0x1(%eax),%edx
    14ab:	89 55 08             	mov    %edx,0x8(%ebp)
    14ae:	0f b6 00             	movzbl (%eax),%eax
    14b1:	0f be c0             	movsbl %al,%eax
    14b4:	01 c0                	add    %eax,%eax
    14b6:	01 c8                	add    %ecx,%eax
    14b8:	0f b7 00             	movzwl (%eax),%eax
    14bb:	0f b7 c0             	movzwl %ax,%eax
    14be:	25 00 20 00 00       	and    $0x2000,%eax
    14c3:	85 c0                	test   %eax,%eax
    14c5:	75 07                	jne    14ce <blank_line+0x44>
    14c7:	b8 00 00 00 00       	mov    $0x0,%eax
    14cc:	eb 0f                	jmp    14dd <blank_line+0x53>
    14ce:	8b 45 08             	mov    0x8(%ebp),%eax
    14d1:	0f b6 00             	movzbl (%eax),%eax
    14d4:	84 c0                	test   %al,%al
    14d6:	75 c6                	jne    149e <blank_line+0x14>
    14d8:	b8 01 00 00 00       	mov    $0x1,%eax
    14dd:	83 c4 04             	add    $0x4,%esp
    14e0:	5b                   	pop    %ebx
    14e1:	5d                   	pop    %ebp
    14e2:	c3                   	ret    

000014e3 <skip>:
    14e3:	55                   	push   %ebp
    14e4:	89 e5                	mov    %esp,%ebp
    14e6:	53                   	push   %ebx
    14e7:	83 ec 14             	sub    $0x14,%esp
    14ea:	e8 31 f3 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    14ef:	81 c3 11 2b 00 00    	add    $0x2b11,%ebx
    14f5:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
    14fb:	8b 08                	mov    (%eax),%ecx
    14fd:	8b 93 64 02 00 00    	mov    0x264(%ebx),%edx
    1503:	89 d0                	mov    %edx,%eax
    1505:	c1 e0 02             	shl    $0x2,%eax
    1508:	01 d0                	add    %edx,%eax
    150a:	c1 e0 04             	shl    $0x4,%eax
    150d:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    1513:	01 d0                	add    %edx,%eax
    1515:	83 ec 04             	sub    $0x4,%esp
    1518:	51                   	push   %ecx
    1519:	6a 50                	push   $0x50
    151b:	50                   	push   %eax
    151c:	e8 df f1 ff ff       	call   700 <fgets@plt>
    1521:	83 c4 10             	add    $0x10,%esp
    1524:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1527:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    152b:	74 12                	je     153f <skip+0x5c>
    152d:	83 ec 0c             	sub    $0xc,%esp
    1530:	ff 75 f4             	pushl  -0xc(%ebp)
    1533:	e8 52 ff ff ff       	call   148a <blank_line>
    1538:	83 c4 10             	add    $0x10,%esp
    153b:	85 c0                	test   %eax,%eax
    153d:	75 b6                	jne    14f5 <skip+0x12>
    153f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1542:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1545:	c9                   	leave  
    1546:	c3                   	ret    

00001547 <read_line>:
    1547:	55                   	push   %ebp
    1548:	89 e5                	mov    %esp,%ebp
    154a:	56                   	push   %esi
    154b:	53                   	push   %ebx
    154c:	83 ec 10             	sub    $0x10,%esp
    154f:	e8 cc f2 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    1554:	81 c3 ac 2a 00 00    	add    $0x2aac,%ebx
    155a:	e8 84 ff ff ff       	call   14e3 <skip>
    155f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1562:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1566:	0f 85 8a 00 00 00    	jne    15f6 <read_line+0xaf>
    156c:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
    1572:	8b 10                	mov    (%eax),%edx
    1574:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
    157a:	8b 00                	mov    (%eax),%eax
    157c:	39 c2                	cmp    %eax,%edx
    157e:	75 1c                	jne    159c <read_line+0x55>
    1580:	83 ec 0c             	sub    $0xc,%esp
    1583:	8d 83 f2 da ff ff    	lea    -0x250e(%ebx),%eax
    1589:	50                   	push   %eax
    158a:	e8 b1 f1 ff ff       	call   740 <puts@plt>
    158f:	83 c4 10             	add    $0x10,%esp
    1592:	83 ec 0c             	sub    $0xc,%esp
    1595:	6a 08                	push   $0x8
    1597:	e8 b4 f1 ff ff       	call   750 <exit@plt>
    159c:	83 ec 0c             	sub    $0xc,%esp
    159f:	8d 83 10 db ff ff    	lea    -0x24f0(%ebx),%eax
    15a5:	50                   	push   %eax
    15a6:	e8 85 f1 ff ff       	call   730 <getenv@plt>
    15ab:	83 c4 10             	add    $0x10,%esp
    15ae:	85 c0                	test   %eax,%eax
    15b0:	74 0a                	je     15bc <read_line+0x75>
    15b2:	83 ec 0c             	sub    $0xc,%esp
    15b5:	6a 00                	push   $0x0
    15b7:	e8 94 f1 ff ff       	call   750 <exit@plt>
    15bc:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
    15c2:	8b 10                	mov    (%eax),%edx
    15c4:	8d 83 68 02 00 00    	lea    0x268(%ebx),%eax
    15ca:	89 10                	mov    %edx,(%eax)
    15cc:	e8 12 ff ff ff       	call   14e3 <skip>
    15d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    15d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15d8:	75 1c                	jne    15f6 <read_line+0xaf>
    15da:	83 ec 0c             	sub    $0xc,%esp
    15dd:	8d 83 f2 da ff ff    	lea    -0x250e(%ebx),%eax
    15e3:	50                   	push   %eax
    15e4:	e8 57 f1 ff ff       	call   740 <puts@plt>
    15e9:	83 c4 10             	add    $0x10,%esp
    15ec:	83 ec 0c             	sub    $0xc,%esp
    15ef:	6a 00                	push   $0x0
    15f1:	e8 5a f1 ff ff       	call   750 <exit@plt>
    15f6:	8b 93 64 02 00 00    	mov    0x264(%ebx),%edx
    15fc:	89 d0                	mov    %edx,%eax
    15fe:	c1 e0 02             	shl    $0x2,%eax
    1601:	01 d0                	add    %edx,%eax
    1603:	c1 e0 04             	shl    $0x4,%eax
    1606:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    160c:	01 d0                	add    %edx,%eax
    160e:	83 ec 0c             	sub    $0xc,%esp
    1611:	50                   	push   %eax
    1612:	e8 49 f1 ff ff       	call   760 <strlen@plt>
    1617:	83 c4 10             	add    $0x10,%esp
    161a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    161d:	83 7d f0 4e          	cmpl   $0x4e,-0x10(%ebp)
    1621:	7e 53                	jle    1676 <read_line+0x12f>
    1623:	83 ec 0c             	sub    $0xc,%esp
    1626:	8d 83 1b db ff ff    	lea    -0x24e5(%ebx),%eax
    162c:	50                   	push   %eax
    162d:	e8 0e f1 ff ff       	call   740 <puts@plt>
    1632:	83 c4 10             	add    $0x10,%esp
    1635:	8b 93 64 02 00 00    	mov    0x264(%ebx),%edx
    163b:	8d 42 01             	lea    0x1(%edx),%eax
    163e:	89 83 64 02 00 00    	mov    %eax,0x264(%ebx)
    1644:	89 d0                	mov    %edx,%eax
    1646:	c1 e0 02             	shl    $0x2,%eax
    1649:	01 d0                	add    %edx,%eax
    164b:	c1 e0 04             	shl    $0x4,%eax
    164e:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    1654:	01 d0                	add    %edx,%eax
    1656:	c7 00 2a 2a 2a 74    	movl   $0x742a2a2a,(%eax)
    165c:	c7 40 04 72 75 6e 63 	movl   $0x636e7572,0x4(%eax)
    1663:	c7 40 08 61 74 65 64 	movl   $0x64657461,0x8(%eax)
    166a:	c7 40 0c 2a 2a 2a 00 	movl   $0x2a2a2a,0xc(%eax)
    1671:	e8 4b 00 00 00       	call   16c1 <explode_bomb>
    1676:	8b 93 64 02 00 00    	mov    0x264(%ebx),%edx
    167c:	8b 45 f0             	mov    -0x10(%ebp),%eax
    167f:	8d 70 ff             	lea    -0x1(%eax),%esi
    1682:	8d 8b 80 02 00 00    	lea    0x280(%ebx),%ecx
    1688:	89 d0                	mov    %edx,%eax
    168a:	c1 e0 02             	shl    $0x2,%eax
    168d:	01 d0                	add    %edx,%eax
    168f:	c1 e0 04             	shl    $0x4,%eax
    1692:	01 c8                	add    %ecx,%eax
    1694:	01 f0                	add    %esi,%eax
    1696:	c6 00 00             	movb   $0x0,(%eax)
    1699:	8b 93 64 02 00 00    	mov    0x264(%ebx),%edx
    169f:	8d 42 01             	lea    0x1(%edx),%eax
    16a2:	89 83 64 02 00 00    	mov    %eax,0x264(%ebx)
    16a8:	89 d0                	mov    %edx,%eax
    16aa:	c1 e0 02             	shl    $0x2,%eax
    16ad:	01 d0                	add    %edx,%eax
    16af:	c1 e0 04             	shl    $0x4,%eax
    16b2:	8d 93 80 02 00 00    	lea    0x280(%ebx),%edx
    16b8:	01 d0                	add    %edx,%eax
    16ba:	8d 65 f8             	lea    -0x8(%ebp),%esp
    16bd:	5b                   	pop    %ebx
    16be:	5e                   	pop    %esi
    16bf:	5d                   	pop    %ebp
    16c0:	c3                   	ret    

000016c1 <explode_bomb>:
    16c1:	55                   	push   %ebp
    16c2:	89 e5                	mov    %esp,%ebp
    16c4:	53                   	push   %ebx
    16c5:	83 ec 04             	sub    $0x4,%esp
    16c8:	e8 53 f1 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    16cd:	81 c3 33 29 00 00    	add    $0x2933,%ebx
    16d3:	83 ec 0c             	sub    $0xc,%esp
    16d6:	8d 83 36 db ff ff    	lea    -0x24ca(%ebx),%eax
    16dc:	50                   	push   %eax
    16dd:	e8 5e f0 ff ff       	call   740 <puts@plt>
    16e2:	83 c4 10             	add    $0x10,%esp
    16e5:	83 ec 0c             	sub    $0xc,%esp
    16e8:	8d 83 3f db ff ff    	lea    -0x24c1(%ebx),%eax
    16ee:	50                   	push   %eax
    16ef:	e8 4c f0 ff ff       	call   740 <puts@plt>
    16f4:	83 c4 10             	add    $0x10,%esp
    16f7:	90                   	nop
    16f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    16fb:	c9                   	leave  
    16fc:	c3                   	ret    

000016fd <phase_defused>:
    16fd:	55                   	push   %ebp
    16fe:	89 e5                	mov    %esp,%ebp
    1700:	53                   	push   %ebx
    1701:	83 ec 64             	sub    $0x64,%esp
    1704:	e8 17 f1 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    1709:	81 c3 f7 28 00 00    	add    $0x28f7,%ebx
    170f:	8b 83 64 02 00 00    	mov    0x264(%ebx),%eax
    1715:	83 f8 07             	cmp    $0x7,%eax
    1718:	0f 85 89 00 00 00    	jne    17a7 <phase_defused+0xaa>
    171e:	83 ec 0c             	sub    $0xc,%esp
    1721:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    1724:	50                   	push   %eax
    1725:	8d 45 9c             	lea    -0x64(%ebp),%eax
    1728:	50                   	push   %eax
    1729:	8d 45 a0             	lea    -0x60(%ebp),%eax
    172c:	50                   	push   %eax
    172d:	8d 83 56 db ff ff    	lea    -0x24aa(%ebx),%eax
    1733:	50                   	push   %eax
    1734:	8d 83 80 02 00 00    	lea    0x280(%ebx),%eax
    173a:	8d 80 40 01 00 00    	lea    0x140(%eax),%eax
    1740:	50                   	push   %eax
    1741:	e8 3a f0 ff ff       	call   780 <__isoc99_sscanf@plt>
    1746:	83 c4 20             	add    $0x20,%esp
    1749:	89 45 f4             	mov    %eax,-0xc(%ebp)
    174c:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    1750:	75 43                	jne    1795 <phase_defused+0x98>
    1752:	83 ec 08             	sub    $0x8,%esp
    1755:	8d 83 5f db ff ff    	lea    -0x24a1(%ebx),%eax
    175b:	50                   	push   %eax
    175c:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    175f:	50                   	push   %eax
    1760:	e8 73 fc ff ff       	call   13d8 <strings_not_equal>
    1765:	83 c4 10             	add    $0x10,%esp
    1768:	85 c0                	test   %eax,%eax
    176a:	75 29                	jne    1795 <phase_defused+0x98>
    176c:	83 ec 0c             	sub    $0xc,%esp
    176f:	8d 83 68 db ff ff    	lea    -0x2498(%ebx),%eax
    1775:	50                   	push   %eax
    1776:	e8 c5 ef ff ff       	call   740 <puts@plt>
    177b:	83 c4 10             	add    $0x10,%esp
    177e:	83 ec 0c             	sub    $0xc,%esp
    1781:	8d 83 90 db ff ff    	lea    -0x2470(%ebx),%eax
    1787:	50                   	push   %eax
    1788:	e8 b3 ef ff ff       	call   740 <puts@plt>
    178d:	83 c4 10             	add    $0x10,%esp
    1790:	e8 b5 f9 ff ff       	call   114a <secret_phase>
    1795:	83 ec 0c             	sub    $0xc,%esp
    1798:	8d 83 c8 db ff ff    	lea    -0x2438(%ebx),%eax
    179e:	50                   	push   %eax
    179f:	e8 9c ef ff ff       	call   740 <puts@plt>
    17a4:	83 c4 10             	add    $0x10,%esp
    17a7:	90                   	nop
    17a8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    17ab:	c9                   	leave  
    17ac:	c3                   	ret    
    17ad:	66 90                	xchg   %ax,%ax
    17af:	90                   	nop

000017b0 <__libc_csu_init>:
    17b0:	55                   	push   %ebp
    17b1:	57                   	push   %edi
    17b2:	56                   	push   %esi
    17b3:	53                   	push   %ebx
    17b4:	e8 67 f0 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    17b9:	81 c3 47 28 00 00    	add    $0x2847,%ebx
    17bf:	83 ec 0c             	sub    $0xc,%esp
    17c2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    17c6:	8d b3 e8 fe ff ff    	lea    -0x118(%ebx),%esi
    17cc:	e8 d7 ee ff ff       	call   6a8 <_init>
    17d1:	8d 83 e4 fe ff ff    	lea    -0x11c(%ebx),%eax
    17d7:	29 c6                	sub    %eax,%esi
    17d9:	c1 fe 02             	sar    $0x2,%esi
    17dc:	85 f6                	test   %esi,%esi
    17de:	74 25                	je     1805 <__libc_csu_init+0x55>
    17e0:	31 ff                	xor    %edi,%edi
    17e2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17e8:	83 ec 04             	sub    $0x4,%esp
    17eb:	ff 74 24 2c          	pushl  0x2c(%esp)
    17ef:	ff 74 24 2c          	pushl  0x2c(%esp)
    17f3:	55                   	push   %ebp
    17f4:	ff 94 bb e4 fe ff ff 	call   *-0x11c(%ebx,%edi,4)
    17fb:	83 c7 01             	add    $0x1,%edi
    17fe:	83 c4 10             	add    $0x10,%esp
    1801:	39 fe                	cmp    %edi,%esi
    1803:	75 e3                	jne    17e8 <__libc_csu_init+0x38>
    1805:	83 c4 0c             	add    $0xc,%esp
    1808:	5b                   	pop    %ebx
    1809:	5e                   	pop    %esi
    180a:	5f                   	pop    %edi
    180b:	5d                   	pop    %ebp
    180c:	c3                   	ret    
    180d:	8d 76 00             	lea    0x0(%esi),%esi

00001810 <__libc_csu_fini>:
    1810:	f3 c3                	repz ret 

Disassembly of section .fini:

00001814 <_fini>:
    1814:	53                   	push   %ebx
    1815:	83 ec 08             	sub    $0x8,%esp
    1818:	e8 03 f0 ff ff       	call   820 <__x86.get_pc_thunk.bx>
    181d:	81 c3 e3 27 00 00    	add    $0x27e3,%ebx
    1823:	83 c4 08             	add    $0x8,%esp
    1826:	5b                   	pop    %ebx
    1827:	c3                   	ret    
