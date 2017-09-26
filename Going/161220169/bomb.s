
bomb:     file format elf32-i386


Disassembly of section .init:

00000698 <_init>:
 698:	53                   	push   %ebx
 699:	83 ec 08             	sub    $0x8,%esp
 69c:	e8 6f 01 00 00       	call   810 <__x86.get_pc_thunk.bx>
 6a1:	81 c3 5f 39 00 00    	add    $0x395f,%ebx
 6a7:	8b 83 e8 ff ff ff    	mov    -0x18(%ebx),%eax
 6ad:	85 c0                	test   %eax,%eax
 6af:	74 05                	je     6b6 <_init+0x1e>
 6b1:	e8 12 01 00 00       	call   7c8 <.plt.got+0x8>
 6b6:	83 c4 08             	add    $0x8,%esp
 6b9:	5b                   	pop    %ebx
 6ba:	c3                   	ret    

Disassembly of section .plt:

000006c0 <.plt>:
 6c0:	ff b3 04 00 00 00    	pushl  0x4(%ebx)
 6c6:	ff a3 08 00 00 00    	jmp    *0x8(%ebx)
 6cc:	00 00                	add    %al,(%eax)
	...

000006d0 <printf@plt>:
 6d0:	ff a3 0c 00 00 00    	jmp    *0xc(%ebx)
 6d6:	68 00 00 00 00       	push   $0x0
 6db:	e9 e0 ff ff ff       	jmp    6c0 <.plt>

000006e0 <fflush@plt>:
 6e0:	ff a3 10 00 00 00    	jmp    *0x10(%ebx)
 6e6:	68 08 00 00 00       	push   $0x8
 6eb:	e9 d0 ff ff ff       	jmp    6c0 <.plt>

000006f0 <fgets@plt>:
 6f0:	ff a3 14 00 00 00    	jmp    *0x14(%ebx)
 6f6:	68 10 00 00 00       	push   $0x10
 6fb:	e9 c0 ff ff ff       	jmp    6c0 <.plt>

00000700 <signal@plt>:
 700:	ff a3 18 00 00 00    	jmp    *0x18(%ebx)
 706:	68 18 00 00 00       	push   $0x18
 70b:	e9 b0 ff ff ff       	jmp    6c0 <.plt>

00000710 <sleep@plt>:
 710:	ff a3 1c 00 00 00    	jmp    *0x1c(%ebx)
 716:	68 20 00 00 00       	push   $0x20
 71b:	e9 a0 ff ff ff       	jmp    6c0 <.plt>

00000720 <getenv@plt>:
 720:	ff a3 20 00 00 00    	jmp    *0x20(%ebx)
 726:	68 28 00 00 00       	push   $0x28
 72b:	e9 90 ff ff ff       	jmp    6c0 <.plt>

00000730 <puts@plt>:
 730:	ff a3 24 00 00 00    	jmp    *0x24(%ebx)
 736:	68 30 00 00 00       	push   $0x30
 73b:	e9 80 ff ff ff       	jmp    6c0 <.plt>

00000740 <exit@plt>:
 740:	ff a3 28 00 00 00    	jmp    *0x28(%ebx)
 746:	68 38 00 00 00       	push   $0x38
 74b:	e9 70 ff ff ff       	jmp    6c0 <.plt>

00000750 <strlen@plt>:
 750:	ff a3 2c 00 00 00    	jmp    *0x2c(%ebx)
 756:	68 40 00 00 00       	push   $0x40
 75b:	e9 60 ff ff ff       	jmp    6c0 <.plt>

00000760 <__libc_start_main@plt>:
 760:	ff a3 30 00 00 00    	jmp    *0x30(%ebx)
 766:	68 48 00 00 00       	push   $0x48
 76b:	e9 50 ff ff ff       	jmp    6c0 <.plt>

00000770 <__isoc99_sscanf@plt>:
 770:	ff a3 34 00 00 00    	jmp    *0x34(%ebx)
 776:	68 50 00 00 00       	push   $0x50
 77b:	e9 40 ff ff ff       	jmp    6c0 <.plt>

00000780 <fopen@plt>:
 780:	ff a3 38 00 00 00    	jmp    *0x38(%ebx)
 786:	68 58 00 00 00       	push   $0x58
 78b:	e9 30 ff ff ff       	jmp    6c0 <.plt>

00000790 <strtok@plt>:
 790:	ff a3 3c 00 00 00    	jmp    *0x3c(%ebx)
 796:	68 60 00 00 00       	push   $0x60
 79b:	e9 20 ff ff ff       	jmp    6c0 <.plt>

000007a0 <atoi@plt>:
 7a0:	ff a3 40 00 00 00    	jmp    *0x40(%ebx)
 7a6:	68 68 00 00 00       	push   $0x68
 7ab:	e9 10 ff ff ff       	jmp    6c0 <.plt>

000007b0 <__ctype_b_loc@plt>:
 7b0:	ff a3 44 00 00 00    	jmp    *0x44(%ebx)
 7b6:	68 70 00 00 00       	push   $0x70
 7bb:	e9 00 ff ff ff       	jmp    6c0 <.plt>

Disassembly of section .plt.got:

000007c0 <.plt.got>:
 7c0:	ff a3 e4 ff ff ff    	jmp    *-0x1c(%ebx)
 7c6:	66 90                	xchg   %ax,%ax
 7c8:	ff a3 e8 ff ff ff    	jmp    *-0x18(%ebx)
 7ce:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

000007d0 <_start>:
     7d0:	31 ed                	xor    %ebp,%ebp
     7d2:	5e                   	pop    %esi
     7d3:	89 e1                	mov    %esp,%ecx
     7d5:	83 e4 f0             	and    $0xfffffff0,%esp
     7d8:	50                   	push   %eax
     7d9:	54                   	push   %esp
     7da:	52                   	push   %edx
     7db:	e8 22 00 00 00       	call   802 <_start+0x32>
     7e0:	81 c3 20 38 00 00    	add    $0x3820,%ebx
     7e6:	8d 83 20 d8 ff ff    	lea    -0x27e0(%ebx),%eax
     7ec:	50                   	push   %eax
     7ed:	8d 83 c0 d7 ff ff    	lea    -0x2840(%ebx),%eax
     7f3:	50                   	push   %eax
     7f4:	51                   	push   %ecx
     7f5:	56                   	push   %esi
     7f6:	ff b3 f4 ff ff ff    	pushl  -0xc(%ebx)
     7fc:	e8 5f ff ff ff       	call   760 <__libc_start_main@plt>
     801:	f4                   	hlt    
     802:	8b 1c 24             	mov    (%esp),%ebx
     805:	c3                   	ret    
     806:	66 90                	xchg   %ax,%ax
     808:	66 90                	xchg   %ax,%ax
     80a:	66 90                	xchg   %ax,%ax
     80c:	66 90                	xchg   %ax,%ax
     80e:	66 90                	xchg   %ax,%ax

00000810 <__x86.get_pc_thunk.bx>:
     810:	8b 1c 24             	mov    (%esp),%ebx
     813:	c3                   	ret    
     814:	66 90                	xchg   %ax,%ax
     816:	66 90                	xchg   %ax,%ax
     818:	66 90                	xchg   %ax,%ax
     81a:	66 90                	xchg   %ax,%ax
     81c:	66 90                	xchg   %ax,%ax
     81e:	66 90                	xchg   %ax,%ax

00000820 <deregister_tm_clones>:
     820:	e8 17 01 00 00       	call   93c <__x86.get_pc_thunk.dx>
     825:	81 c2 db 37 00 00    	add    $0x37db,%edx
     82b:	8d 8a b0 02 00 00    	lea    0x2b0(%edx),%ecx
     831:	8d 82 b3 02 00 00    	lea    0x2b3(%edx),%eax
     837:	29 c8                	sub    %ecx,%eax
     839:	83 f8 06             	cmp    $0x6,%eax
     83c:	76 17                	jbe    855 <deregister_tm_clones+0x35>
     83e:	8b 82 e0 ff ff ff    	mov    -0x20(%edx),%eax
     844:	85 c0                	test   %eax,%eax
     846:	74 0d                	je     855 <deregister_tm_clones+0x35>
     848:	55                   	push   %ebp
     849:	89 e5                	mov    %esp,%ebp
     84b:	83 ec 14             	sub    $0x14,%esp
     84e:	51                   	push   %ecx
     84f:	ff d0                	call   *%eax
     851:	83 c4 10             	add    $0x10,%esp
     854:	c9                   	leave  
     855:	f3 c3                	repz ret 
     857:	89 f6                	mov    %esi,%esi
     859:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000860 <register_tm_clones>:
     860:	e8 d7 00 00 00       	call   93c <__x86.get_pc_thunk.dx>
     865:	81 c2 9b 37 00 00    	add    $0x379b,%edx
     86b:	55                   	push   %ebp
     86c:	8d 8a b0 02 00 00    	lea    0x2b0(%edx),%ecx
     872:	8d 82 b0 02 00 00    	lea    0x2b0(%edx),%eax
     878:	89 e5                	mov    %esp,%ebp
     87a:	53                   	push   %ebx
     87b:	29 c8                	sub    %ecx,%eax
     87d:	c1 f8 02             	sar    $0x2,%eax
     880:	83 ec 04             	sub    $0x4,%esp
     883:	89 c3                	mov    %eax,%ebx
     885:	c1 eb 1f             	shr    $0x1f,%ebx
     888:	01 d8                	add    %ebx,%eax
     88a:	d1 f8                	sar    %eax
     88c:	74 14                	je     8a2 <register_tm_clones+0x42>
     88e:	8b 92 fc ff ff ff    	mov    -0x4(%edx),%edx
     894:	85 d2                	test   %edx,%edx
     896:	74 0a                	je     8a2 <register_tm_clones+0x42>
     898:	83 ec 08             	sub    $0x8,%esp
     89b:	50                   	push   %eax
     89c:	51                   	push   %ecx
     89d:	ff d2                	call   *%edx
     89f:	83 c4 10             	add    $0x10,%esp
     8a2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8a5:	c9                   	leave  
     8a6:	c3                   	ret    
     8a7:	89 f6                	mov    %esi,%esi
     8a9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000008b0 <__do_global_dtors_aux>:
     8b0:	55                   	push   %ebp
     8b1:	89 e5                	mov    %esp,%ebp
     8b3:	53                   	push   %ebx
     8b4:	e8 57 ff ff ff       	call   810 <__x86.get_pc_thunk.bx>
     8b9:	81 c3 47 37 00 00    	add    $0x3747,%ebx
     8bf:	83 ec 04             	sub    $0x4,%esp
     8c2:	80 bb c0 02 00 00 00 	cmpb   $0x0,0x2c0(%ebx)
     8c9:	75 27                	jne    8f2 <__do_global_dtors_aux+0x42>
     8cb:	8b 83 e4 ff ff ff    	mov    -0x1c(%ebx),%eax
     8d1:	85 c0                	test   %eax,%eax
     8d3:	74 11                	je     8e6 <__do_global_dtors_aux+0x36>
     8d5:	83 ec 0c             	sub    $0xc,%esp
     8d8:	ff b3 64 00 00 00    	pushl  0x64(%ebx)
     8de:	e8 dd fe ff ff       	call   7c0 <.plt.got>
     8e3:	83 c4 10             	add    $0x10,%esp
     8e6:	e8 35 ff ff ff       	call   820 <deregister_tm_clones>
     8eb:	c6 83 c0 02 00 00 01 	movb   $0x1,0x2c0(%ebx)
     8f2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     8f5:	c9                   	leave  
     8f6:	c3                   	ret    
     8f7:	89 f6                	mov    %esi,%esi
     8f9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000900 <frame_dummy>:
     900:	e8 37 00 00 00       	call   93c <__x86.get_pc_thunk.dx>
     905:	81 c2 fb 36 00 00    	add    $0x36fb,%edx
     90b:	8d 82 ec fe ff ff    	lea    -0x114(%edx),%eax
     911:	8b 08                	mov    (%eax),%ecx
     913:	85 c9                	test   %ecx,%ecx
     915:	75 09                	jne    920 <frame_dummy+0x20>
     917:	e9 44 ff ff ff       	jmp    860 <register_tm_clones>
     91c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     920:	8b 92 f8 ff ff ff    	mov    -0x8(%edx),%edx
     926:	85 d2                	test   %edx,%edx
     928:	74 ed                	je     917 <frame_dummy+0x17>
     92a:	55                   	push   %ebp
     92b:	89 e5                	mov    %esp,%ebp
     92d:	83 ec 14             	sub    $0x14,%esp
     930:	50                   	push   %eax
     931:	ff d2                	call   *%edx
     933:	83 c4 10             	add    $0x10,%esp
     936:	c9                   	leave  
     937:	e9 24 ff ff ff       	jmp    860 <register_tm_clones>

0000093c <__x86.get_pc_thunk.dx>:
     93c:	8b 14 24             	mov    (%esp),%edx
     93f:	c3                   	ret    

00000940 <main>:
     940:	8d 4c 24 04          	lea    0x4(%esp),%ecx
     944:	83 e4 f0             	and    $0xfffffff0,%esp
     947:	ff 71 fc             	pushl  -0x4(%ecx)
     94a:	55                   	push   %ebp
     94b:	89 e5                	mov    %esp,%ebp
     94d:	56                   	push   %esi
     94e:	53                   	push   %ebx
     94f:	51                   	push   %ecx
     950:	83 ec 1c             	sub    $0x1c,%esp
     953:	e8 b8 fe ff ff       	call   810 <__x86.get_pc_thunk.bx>
     958:	81 c3 a8 36 00 00    	add    $0x36a8,%ebx
     95e:	89 ce                	mov    %ecx,%esi
     960:	83 3e 01             	cmpl   $0x1,(%esi)
     963:	75 15                	jne    97a <main+0x3a>
     965:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
     96b:	8b 10                	mov    (%eax),%edx
     96d:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
     973:	89 10                	mov    %edx,(%eax)
     975:	e9 83 00 00 00       	jmp    9fd <main+0xbd>
     97a:	83 3e 02             	cmpl   $0x2,(%esi)
     97d:	75 5c                	jne    9db <main+0x9b>
     97f:	8b 46 04             	mov    0x4(%esi),%eax
     982:	83 c0 04             	add    $0x4,%eax
     985:	8b 00                	mov    (%eax),%eax
     987:	83 ec 08             	sub    $0x8,%esp
     98a:	8d 93 48 d8 ff ff    	lea    -0x27b8(%ebx),%edx
     990:	52                   	push   %edx
     991:	50                   	push   %eax
     992:	e8 e9 fd ff ff       	call   780 <fopen@plt>
     997:	83 c4 10             	add    $0x10,%esp
     99a:	89 c2                	mov    %eax,%edx
     99c:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
     9a2:	89 10                	mov    %edx,(%eax)
     9a4:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
     9aa:	8b 00                	mov    (%eax),%eax
     9ac:	85 c0                	test   %eax,%eax
     9ae:	75 4d                	jne    9fd <main+0xbd>
     9b0:	8b 46 04             	mov    0x4(%esi),%eax
     9b3:	83 c0 04             	add    $0x4,%eax
     9b6:	8b 10                	mov    (%eax),%edx
     9b8:	8b 46 04             	mov    0x4(%esi),%eax
     9bb:	8b 00                	mov    (%eax),%eax
     9bd:	83 ec 04             	sub    $0x4,%esp
     9c0:	52                   	push   %edx
     9c1:	50                   	push   %eax
     9c2:	8d 83 4a d8 ff ff    	lea    -0x27b6(%ebx),%eax
     9c8:	50                   	push   %eax
     9c9:	e8 02 fd ff ff       	call   6d0 <printf@plt>
     9ce:	83 c4 10             	add    $0x10,%esp
     9d1:	83 ec 0c             	sub    $0xc,%esp
     9d4:	6a 08                	push   $0x8
     9d6:	e8 65 fd ff ff       	call   740 <exit@plt>
     9db:	8b 46 04             	mov    0x4(%esi),%eax
     9de:	8b 00                	mov    (%eax),%eax
     9e0:	83 ec 08             	sub    $0x8,%esp
     9e3:	50                   	push   %eax
     9e4:	8d 83 67 d8 ff ff    	lea    -0x2799(%ebx),%eax
     9ea:	50                   	push   %eax
     9eb:	e8 e0 fc ff ff       	call   6d0 <printf@plt>
     9f0:	83 c4 10             	add    $0x10,%esp
     9f3:	83 ec 0c             	sub    $0xc,%esp
     9f6:	6a 08                	push   $0x8
     9f8:	e8 43 fd ff ff       	call   740 <exit@plt>
     9fd:	e8 51 0a 00 00       	call   1453 <initialize_bomb>
     a02:	83 ec 0c             	sub    $0xc,%esp
     a05:	8d 83 84 d8 ff ff    	lea    -0x277c(%ebx),%eax
     a0b:	50                   	push   %eax
     a0c:	e8 1f fd ff ff       	call   730 <puts@plt>
     a11:	83 c4 10             	add    $0x10,%esp
     a14:	83 ec 0c             	sub    $0xc,%esp
     a17:	8d 83 c0 d8 ff ff    	lea    -0x2740(%ebx),%eax
     a1d:	50                   	push   %eax
     a1e:	e8 0d fd ff ff       	call   730 <puts@plt>
     a23:	83 c4 10             	add    $0x10,%esp
     a26:	e8 22 0b 00 00       	call   154d <read_line>
     a2b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a2e:	83 ec 0c             	sub    $0xc,%esp
     a31:	ff 75 e4             	pushl  -0x1c(%ebp)
     a34:	e8 89 01 00 00       	call   bc2 <phase_0>
     a39:	83 c4 10             	add    $0x10,%esp
     a3c:	85 c0                	test   %eax,%eax
     a3e:	74 17                	je     a57 <main+0x117>
     a40:	e8 be 0c 00 00       	call   1703 <phase_defused>
     a45:	83 ec 0c             	sub    $0xc,%esp
     a48:	8d 83 ec d8 ff ff    	lea    -0x2714(%ebx),%eax
     a4e:	50                   	push   %eax
     a4f:	e8 dc fc ff ff       	call   730 <puts@plt>
     a54:	83 c4 10             	add    $0x10,%esp
     a57:	e8 f1 0a 00 00       	call   154d <read_line>
     a5c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a5f:	83 ec 0c             	sub    $0xc,%esp
     a62:	ff 75 e4             	pushl  -0x1c(%ebp)
     a65:	e8 d8 01 00 00       	call   c42 <phase_1>
     a6a:	83 c4 10             	add    $0x10,%esp
     a6d:	85 c0                	test   %eax,%eax
     a6f:	74 17                	je     a88 <main+0x148>
     a71:	e8 8d 0c 00 00       	call   1703 <phase_defused>
     a76:	83 ec 0c             	sub    $0xc,%esp
     a79:	8d 83 14 d9 ff ff    	lea    -0x26ec(%ebx),%eax
     a7f:	50                   	push   %eax
     a80:	e8 ab fc ff ff       	call   730 <puts@plt>
     a85:	83 c4 10             	add    $0x10,%esp
     a88:	e8 c0 0a 00 00       	call   154d <read_line>
     a8d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     a90:	83 ec 0c             	sub    $0xc,%esp
     a93:	ff 75 e4             	pushl  -0x1c(%ebp)
     a96:	e8 e8 01 00 00       	call   c83 <phase_2>
     a9b:	83 c4 10             	add    $0x10,%esp
     a9e:	85 c0                	test   %eax,%eax
     aa0:	74 17                	je     ab9 <main+0x179>
     aa2:	e8 5c 0c 00 00       	call   1703 <phase_defused>
     aa7:	83 ec 0c             	sub    $0xc,%esp
     aaa:	8d 83 3d d9 ff ff    	lea    -0x26c3(%ebx),%eax
     ab0:	50                   	push   %eax
     ab1:	e8 7a fc ff ff       	call   730 <puts@plt>
     ab6:	83 c4 10             	add    $0x10,%esp
     ab9:	e8 8f 0a 00 00       	call   154d <read_line>
     abe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     ac1:	83 ec 0c             	sub    $0xc,%esp
     ac4:	ff 75 e4             	pushl  -0x1c(%ebp)
     ac7:	e8 41 02 00 00       	call   d0d <phase_3>
     acc:	83 c4 10             	add    $0x10,%esp
     acf:	85 c0                	test   %eax,%eax
     ad1:	74 17                	je     aea <main+0x1aa>
     ad3:	e8 2b 0c 00 00       	call   1703 <phase_defused>
     ad8:	83 ec 0c             	sub    $0xc,%esp
     adb:	8d 83 5b d9 ff ff    	lea    -0x26a5(%ebx),%eax
     ae1:	50                   	push   %eax
     ae2:	e8 49 fc ff ff       	call   730 <puts@plt>
     ae7:	83 c4 10             	add    $0x10,%esp
     aea:	e8 5e 0a 00 00       	call   154d <read_line>
     aef:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     af2:	83 ec 0c             	sub    $0xc,%esp
     af5:	ff 75 e4             	pushl  -0x1c(%ebp)
     af8:	e8 59 03 00 00       	call   e56 <phase_4>
     afd:	83 c4 10             	add    $0x10,%esp
     b00:	85 c0                	test   %eax,%eax
     b02:	74 17                	je     b1b <main+0x1db>
     b04:	e8 fa 0b 00 00       	call   1703 <phase_defused>
     b09:	83 ec 0c             	sub    $0xc,%esp
     b0c:	8d 83 6c d9 ff ff    	lea    -0x2694(%ebx),%eax
     b12:	50                   	push   %eax
     b13:	e8 18 fc ff ff       	call   730 <puts@plt>
     b18:	83 c4 10             	add    $0x10,%esp
     b1b:	e8 2d 0a 00 00       	call   154d <read_line>
     b20:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     b23:	83 ec 0c             	sub    $0xc,%esp
     b26:	ff 75 e4             	pushl  -0x1c(%ebp)
     b29:	e8 a1 03 00 00       	call   ecf <phase_5>
     b2e:	83 c4 10             	add    $0x10,%esp
     b31:	85 c0                	test   %eax,%eax
     b33:	74 17                	je     b4c <main+0x20c>
     b35:	e8 c9 0b 00 00       	call   1703 <phase_defused>
     b3a:	83 ec 0c             	sub    $0xc,%esp
     b3d:	8d 83 90 d9 ff ff    	lea    -0x2670(%ebx),%eax
     b43:	50                   	push   %eax
     b44:	e8 e7 fb ff ff       	call   730 <puts@plt>
     b49:	83 c4 10             	add    $0x10,%esp
     b4c:	e8 fc 09 00 00       	call   154d <read_line>
     b51:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     b54:	83 ec 0c             	sub    $0xc,%esp
     b57:	ff 75 e4             	pushl  -0x1c(%ebp)
     b5a:	e8 0d 04 00 00       	call   f6c <phase_6>
     b5f:	83 c4 10             	add    $0x10,%esp
     b62:	85 c0                	test   %eax,%eax
     b64:	74 05                	je     b6b <main+0x22b>
     b66:	e8 98 0b 00 00       	call   1703 <phase_defused>
     b6b:	b8 00 00 00 00       	mov    $0x0,%eax
     b70:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b73:	59                   	pop    %ecx
     b74:	5b                   	pop    %ebx
     b75:	5e                   	pop    %esi
     b76:	5d                   	pop    %ebp
     b77:	8d 61 fc             	lea    -0x4(%ecx),%esp
     b7a:	c3                   	ret    

00000b7b <GeawuQpD>:
     b7b:	55                   	push   %ebp
     b7c:	89 e5                	mov    %esp,%ebp
     b7e:	83 ec 08             	sub    $0x8,%esp
     b81:	e8 5b 06 00 00       	call   11e1 <__x86.get_pc_thunk.ax>
     b86:	05 7a 34 00 00       	add    $0x347a,%eax
     b8b:	8b 45 08             	mov    0x8(%ebp),%eax
     b8e:	0f af 45 0c          	imul   0xc(%ebp),%eax
     b92:	89 c2                	mov    %eax,%edx
     b94:	d9 45 10             	flds   0x10(%ebp)
     b97:	d9 7d fe             	fnstcw -0x2(%ebp)
     b9a:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
     b9e:	b4 0c                	mov    $0xc,%ah
     ba0:	66 89 45 fc          	mov    %ax,-0x4(%ebp)
     ba4:	d9 6d fc             	fldcw  -0x4(%ebp)
     ba7:	db 5d f8             	fistpl -0x8(%ebp)
     baa:	d9 6d fe             	fldcw  -0x2(%ebp)
     bad:	8b 4d f8             	mov    -0x8(%ebp),%ecx
     bb0:	89 c8                	mov    %ecx,%eax
     bb2:	01 c0                	add    %eax,%eax
     bb4:	01 c8                	add    %ecx,%eax
     bb6:	01 c2                	add    %eax,%edx
     bb8:	8b 45 08             	mov    0x8(%ebp),%eax
     bbb:	c1 f8 03             	sar    $0x3,%eax
     bbe:	01 d0                	add    %edx,%eax
     bc0:	c9                   	leave  
     bc1:	c3                   	ret    

00000bc2 <phase_0>:
     bc2:	55                   	push   %ebp
     bc3:	89 e5                	mov    %esp,%ebp
     bc5:	53                   	push   %ebx
     bc6:	83 ec 34             	sub    $0x34,%esp
     bc9:	e8 42 fc ff ff       	call   810 <__x86.get_pc_thunk.bx>
     bce:	81 c3 32 34 00 00    	add    $0x3432,%ebx
     bd4:	c7 45 f0 a7 67 66 13 	movl   $0x136667a7,-0x10(%ebp)
     bdb:	db 45 f0             	fildl  -0x10(%ebp)
     bde:	dd 5d e8             	fstpl  -0x18(%ebp)
     be1:	83 ec 04             	sub    $0x4,%esp
     be4:	6a 08                	push   $0x8
     be6:	8d 45 c8             	lea    -0x38(%ebp),%eax
     be9:	50                   	push   %eax
     bea:	ff 75 08             	pushl  0x8(%ebp)
     bed:	e8 13 07 00 00       	call   1305 <read_n_numbers>
     bf2:	83 c4 10             	add    $0x10,%esp
     bf5:	85 c0                	test   %eax,%eax
     bf7:	75 07                	jne    c00 <phase_0+0x3e>
     bf9:	b8 00 00 00 00       	mov    $0x0,%eax
     bfe:	eb 3d                	jmp    c3d <phase_0+0x7b>
     c00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c07:	eb 29                	jmp    c32 <phase_0+0x70>
     c09:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c0c:	8b 54 85 c8          	mov    -0x38(%ebp,%eax,4),%edx
     c10:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c13:	8d 4d e8             	lea    -0x18(%ebp),%ecx
     c16:	01 c8                	add    %ecx,%eax
     c18:	0f b6 00             	movzbl (%eax),%eax
     c1b:	0f be c0             	movsbl %al,%eax
     c1e:	39 c2                	cmp    %eax,%edx
     c20:	74 0c                	je     c2e <phase_0+0x6c>
     c22:	e8 a0 0a 00 00       	call   16c7 <explode_bomb>
     c27:	b8 00 00 00 00       	mov    $0x0,%eax
     c2c:	eb 0f                	jmp    c3d <phase_0+0x7b>
     c2e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c32:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
     c36:	7e d1                	jle    c09 <phase_0+0x47>
     c38:	b8 01 00 00 00       	mov    $0x1,%eax
     c3d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c40:	c9                   	leave  
     c41:	c3                   	ret    

00000c42 <phase_1>:
     c42:	55                   	push   %ebp
     c43:	89 e5                	mov    %esp,%ebp
     c45:	53                   	push   %ebx
     c46:	83 ec 04             	sub    $0x4,%esp
     c49:	e8 c2 fb ff ff       	call   810 <__x86.get_pc_thunk.bx>
     c4e:	81 c3 b2 33 00 00    	add    $0x33b2,%ebx
     c54:	83 ec 08             	sub    $0x8,%esp
     c57:	8d 83 1c da ff ff    	lea    -0x25e4(%ebx),%eax
     c5d:	50                   	push   %eax
     c5e:	ff 75 08             	pushl  0x8(%ebp)
     c61:	e8 78 07 00 00       	call   13de <strings_not_equal>
     c66:	83 c4 10             	add    $0x10,%esp
     c69:	85 c0                	test   %eax,%eax
     c6b:	74 0c                	je     c79 <phase_1+0x37>
     c6d:	e8 55 0a 00 00       	call   16c7 <explode_bomb>
     c72:	b8 00 00 00 00       	mov    $0x0,%eax
     c77:	eb 05                	jmp    c7e <phase_1+0x3c>
     c79:	b8 01 00 00 00       	mov    $0x1,%eax
     c7e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     c81:	c9                   	leave  
     c82:	c3                   	ret    

00000c83 <phase_2>:
     c83:	55                   	push   %ebp
     c84:	89 e5                	mov    %esp,%ebp
     c86:	53                   	push   %ebx
     c87:	83 ec 24             	sub    $0x24,%esp
     c8a:	e8 81 fb ff ff       	call   810 <__x86.get_pc_thunk.bx>
     c8f:	81 c3 71 33 00 00    	add    $0x3371,%ebx
     c95:	83 ec 04             	sub    $0x4,%esp
     c98:	6a 07                	push   $0x7
     c9a:	8d 45 d8             	lea    -0x28(%ebp),%eax
     c9d:	50                   	push   %eax
     c9e:	ff 75 08             	pushl  0x8(%ebp)
     ca1:	e8 5f 06 00 00       	call   1305 <read_n_numbers>
     ca6:	83 c4 10             	add    $0x10,%esp
     ca9:	85 c0                	test   %eax,%eax
     cab:	75 07                	jne    cb4 <phase_2+0x31>
     cad:	b8 00 00 00 00       	mov    $0x0,%eax
     cb2:	eb 54                	jmp    d08 <phase_2+0x85>
     cb4:	8b 45 d8             	mov    -0x28(%ebp),%eax
     cb7:	3d bd 00 00 00       	cmp    $0xbd,%eax
     cbc:	74 0c                	je     cca <phase_2+0x47>
     cbe:	e8 04 0a 00 00       	call   16c7 <explode_bomb>
     cc3:	b8 00 00 00 00       	mov    $0x0,%eax
     cc8:	eb 3e                	jmp    d08 <phase_2+0x85>
     cca:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
     cd1:	eb 2a                	jmp    cfd <phase_2+0x7a>
     cd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cd6:	8b 44 85 d8          	mov    -0x28(%ebp,%eax,4),%eax
     cda:	8b 55 f4             	mov    -0xc(%ebp),%edx
     cdd:	83 ea 01             	sub    $0x1,%edx
     ce0:	8b 54 95 d8          	mov    -0x28(%ebp,%edx,4),%edx
     ce4:	d1 fa                	sar    %edx
     ce6:	83 c2 01             	add    $0x1,%edx
     ce9:	39 d0                	cmp    %edx,%eax
     ceb:	74 0c                	je     cf9 <phase_2+0x76>
     ced:	e8 d5 09 00 00       	call   16c7 <explode_bomb>
     cf2:	b8 00 00 00 00       	mov    $0x0,%eax
     cf7:	eb 0f                	jmp    d08 <phase_2+0x85>
     cf9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cfd:	83 7d f4 06          	cmpl   $0x6,-0xc(%ebp)
     d01:	7e d0                	jle    cd3 <phase_2+0x50>
     d03:	b8 01 00 00 00       	mov    $0x1,%eax
     d08:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d0b:	c9                   	leave  
     d0c:	c3                   	ret    

00000d0d <phase_3>:
     d0d:	55                   	push   %ebp
     d0e:	89 e5                	mov    %esp,%ebp
     d10:	53                   	push   %ebx
     d11:	83 ec 14             	sub    $0x14,%esp
     d14:	e8 f7 fa ff ff       	call   810 <__x86.get_pc_thunk.bx>
     d19:	81 c3 e7 32 00 00    	add    $0x32e7,%ebx
     d1f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d26:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     d2d:	8d 45 e8             	lea    -0x18(%ebp),%eax
     d30:	50                   	push   %eax
     d31:	8d 45 ec             	lea    -0x14(%ebp),%eax
     d34:	50                   	push   %eax
     d35:	8d 83 49 da ff ff    	lea    -0x25b7(%ebx),%eax
     d3b:	50                   	push   %eax
     d3c:	ff 75 08             	pushl  0x8(%ebp)
     d3f:	e8 2c fa ff ff       	call   770 <__isoc99_sscanf@plt>
     d44:	83 c4 10             	add    $0x10,%esp
     d47:	89 45 f0             	mov    %eax,-0x10(%ebp)
     d4a:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
     d4e:	7f 0f                	jg     d5f <phase_3+0x52>
     d50:	e8 72 09 00 00       	call   16c7 <explode_bomb>
     d55:	b8 00 00 00 00       	mov    $0x0,%eax
     d5a:	e9 98 00 00 00       	jmp    df7 <.L35+0x2e>
     d5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d62:	83 e8 2b             	sub    $0x2b,%eax
     d65:	83 f8 09             	cmp    $0x9,%eax
     d68:	77 68                	ja     dd2 <.L35+0x9>
     d6a:	c1 e0 02             	shl    $0x2,%eax
     d6d:	8b 84 18 50 da ff ff 	mov    -0x25b0(%eax,%ebx,1),%eax
     d74:	01 d8                	add    %ebx,%eax
     d76:	ff e0                	jmp    *%eax

00000d78 <.L25>:
     d78:	c7 45 f4 bf 01 00 00 	movl   $0x1bf,-0xc(%ebp)
     d7f:	eb 5d                	jmp    dde <.L35+0x15>

00000d81 <.L27>:
     d81:	c7 45 f4 bf 01 00 00 	movl   $0x1bf,-0xc(%ebp)
     d88:	eb 54                	jmp    dde <.L35+0x15>

00000d8a <.L28>:
     d8a:	c7 45 f4 a7 02 00 00 	movl   $0x2a7,-0xc(%ebp)
     d91:	eb 4b                	jmp    dde <.L35+0x15>

00000d93 <.L29>:
     d93:	c7 45 f4 bf 01 00 00 	movl   $0x1bf,-0xc(%ebp)
     d9a:	eb 42                	jmp    dde <.L35+0x15>

00000d9c <.L30>:
     d9c:	c7 45 f4 a7 02 00 00 	movl   $0x2a7,-0xc(%ebp)
     da3:	eb 39                	jmp    dde <.L35+0x15>

00000da5 <.L31>:
     da5:	c7 45 f4 bf 01 00 00 	movl   $0x1bf,-0xc(%ebp)
     dac:	eb 30                	jmp    dde <.L35+0x15>

00000dae <.L32>:
     dae:	c7 45 f4 a7 02 00 00 	movl   $0x2a7,-0xc(%ebp)
     db5:	eb 27                	jmp    dde <.L35+0x15>

00000db7 <.L33>:
     db7:	c7 45 f4 a7 02 00 00 	movl   $0x2a7,-0xc(%ebp)
     dbe:	eb 1e                	jmp    dde <.L35+0x15>

00000dc0 <.L34>:
     dc0:	c7 45 f4 bf 01 00 00 	movl   $0x1bf,-0xc(%ebp)
     dc7:	eb 15                	jmp    dde <.L35+0x15>

00000dc9 <.L35>:
     dc9:	c7 45 f4 a7 02 00 00 	movl   $0x2a7,-0xc(%ebp)
     dd0:	eb 0c                	jmp    dde <.L35+0x15>
     dd2:	e8 f0 08 00 00       	call   16c7 <explode_bomb>
     dd7:	b8 00 00 00 00       	mov    $0x0,%eax
     ddc:	eb 19                	jmp    df7 <.L35+0x2e>
     dde:	8b 45 e8             	mov    -0x18(%ebp),%eax
     de1:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     de4:	74 0c                	je     df2 <.L35+0x29>
     de6:	e8 dc 08 00 00       	call   16c7 <explode_bomb>
     deb:	b8 00 00 00 00       	mov    $0x0,%eax
     df0:	eb 05                	jmp    df7 <.L35+0x2e>
     df2:	b8 01 00 00 00       	mov    $0x1,%eax
     df7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     dfa:	c9                   	leave  
     dfb:	c3                   	ret    

00000dfc <func4>:
     dfc:	55                   	push   %ebp
     dfd:	89 e5                	mov    %esp,%ebp
     dff:	53                   	push   %ebx
     e00:	83 ec 04             	sub    $0x4,%esp
     e03:	e8 d9 03 00 00       	call   11e1 <__x86.get_pc_thunk.ax>
     e08:	05 f8 31 00 00       	add    $0x31f8,%eax
     e0d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
     e11:	7f 07                	jg     e1a <func4+0x1e>
     e13:	b8 03 00 00 00       	mov    $0x3,%eax
     e18:	eb 37                	jmp    e51 <func4+0x55>
     e1a:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
     e1e:	75 07                	jne    e27 <func4+0x2b>
     e20:	b8 1c 00 00 00       	mov    $0x1c,%eax
     e25:	eb 2a                	jmp    e51 <func4+0x55>
     e27:	8b 45 08             	mov    0x8(%ebp),%eax
     e2a:	83 e8 01             	sub    $0x1,%eax
     e2d:	83 ec 0c             	sub    $0xc,%esp
     e30:	50                   	push   %eax
     e31:	e8 c6 ff ff ff       	call   dfc <func4>
     e36:	83 c4 10             	add    $0x10,%esp
     e39:	89 c3                	mov    %eax,%ebx
     e3b:	8b 45 08             	mov    0x8(%ebp),%eax
     e3e:	83 e8 02             	sub    $0x2,%eax
     e41:	83 ec 0c             	sub    $0xc,%esp
     e44:	50                   	push   %eax
     e45:	e8 b2 ff ff ff       	call   dfc <func4>
     e4a:	83 c4 10             	add    $0x10,%esp
     e4d:	d1 f8                	sar    %eax
     e4f:	01 d8                	add    %ebx,%eax
     e51:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     e54:	c9                   	leave  
     e55:	c3                   	ret    

00000e56 <phase_4>:
     e56:	55                   	push   %ebp
     e57:	89 e5                	mov    %esp,%ebp
     e59:	53                   	push   %ebx
     e5a:	83 ec 14             	sub    $0x14,%esp
     e5d:	e8 ae f9 ff ff       	call   810 <__x86.get_pc_thunk.bx>
     e62:	81 c3 9e 31 00 00    	add    $0x319e,%ebx
     e68:	8d 45 e8             	lea    -0x18(%ebp),%eax
     e6b:	50                   	push   %eax
     e6c:	8d 45 ec             	lea    -0x14(%ebp),%eax
     e6f:	50                   	push   %eax
     e70:	8d 83 49 da ff ff    	lea    -0x25b7(%ebx),%eax
     e76:	50                   	push   %eax
     e77:	ff 75 08             	pushl  0x8(%ebp)
     e7a:	e8 f1 f8 ff ff       	call   770 <__isoc99_sscanf@plt>
     e7f:	83 c4 10             	add    $0x10,%esp
     e82:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e85:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
     e89:	75 08                	jne    e93 <phase_4+0x3d>
     e8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e8e:	83 f8 09             	cmp    $0x9,%eax
     e91:	7f 0c                	jg     e9f <phase_4+0x49>
     e93:	e8 2f 08 00 00       	call   16c7 <explode_bomb>
     e98:	b8 00 00 00 00       	mov    $0x0,%eax
     e9d:	eb 2b                	jmp    eca <phase_4+0x74>
     e9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     ea2:	83 ec 0c             	sub    $0xc,%esp
     ea5:	50                   	push   %eax
     ea6:	e8 51 ff ff ff       	call   dfc <func4>
     eab:	83 c4 10             	add    $0x10,%esp
     eae:	89 45 f0             	mov    %eax,-0x10(%ebp)
     eb1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     eb4:	39 45 f0             	cmp    %eax,-0x10(%ebp)
     eb7:	74 0c                	je     ec5 <phase_4+0x6f>
     eb9:	e8 09 08 00 00       	call   16c7 <explode_bomb>
     ebe:	b8 00 00 00 00       	mov    $0x0,%eax
     ec3:	eb 05                	jmp    eca <phase_4+0x74>
     ec5:	b8 01 00 00 00       	mov    $0x1,%eax
     eca:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     ecd:	c9                   	leave  
     ece:	c3                   	ret    

00000ecf <phase_5>:
     ecf:	55                   	push   %ebp
     ed0:	89 e5                	mov    %esp,%ebp
     ed2:	53                   	push   %ebx
     ed3:	83 ec 24             	sub    $0x24,%esp
     ed6:	e8 35 f9 ff ff       	call   810 <__x86.get_pc_thunk.bx>
     edb:	81 c3 25 31 00 00    	add    $0x3125,%ebx
     ee1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     ee4:	50                   	push   %eax
     ee5:	8d 45 e8             	lea    -0x18(%ebp),%eax
     ee8:	50                   	push   %eax
     ee9:	8d 83 49 da ff ff    	lea    -0x25b7(%ebx),%eax
     eef:	50                   	push   %eax
     ef0:	ff 75 08             	pushl  0x8(%ebp)
     ef3:	e8 78 f8 ff ff       	call   770 <__isoc99_sscanf@plt>
     ef8:	83 c4 10             	add    $0x10,%esp
     efb:	89 45 ec             	mov    %eax,-0x14(%ebp)
     efe:	83 7d ec 01          	cmpl   $0x1,-0x14(%ebp)
     f02:	7f 0c                	jg     f10 <phase_5+0x41>
     f04:	e8 be 07 00 00       	call   16c7 <explode_bomb>
     f09:	b8 00 00 00 00       	mov    $0x0,%eax
     f0e:	eb 57                	jmp    f67 <phase_5+0x98>
     f10:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f13:	83 e0 0f             	and    $0xf,%eax
     f16:	89 45 e8             	mov    %eax,-0x18(%ebp)
     f19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     f20:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     f27:	eb 17                	jmp    f40 <phase_5+0x71>
     f29:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f2d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f30:	8b 84 83 e0 01 00 00 	mov    0x1e0(%ebx,%eax,4),%eax
     f37:	89 45 e8             	mov    %eax,-0x18(%ebp)
     f3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f3d:	01 45 f0             	add    %eax,-0x10(%ebp)
     f40:	8b 45 e8             	mov    -0x18(%ebp),%eax
     f43:	83 f8 0f             	cmp    $0xf,%eax
     f46:	75 e1                	jne    f29 <phase_5+0x5a>
     f48:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
     f4c:	75 08                	jne    f56 <phase_5+0x87>
     f4e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     f51:	39 45 f0             	cmp    %eax,-0x10(%ebp)
     f54:	74 0c                	je     f62 <phase_5+0x93>
     f56:	e8 6c 07 00 00       	call   16c7 <explode_bomb>
     f5b:	b8 00 00 00 00       	mov    $0x0,%eax
     f60:	eb 05                	jmp    f67 <phase_5+0x98>
     f62:	b8 01 00 00 00       	mov    $0x1,%eax
     f67:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     f6a:	c9                   	leave  
     f6b:	c3                   	ret    

00000f6c <phase_6>:
     f6c:	55                   	push   %ebp
     f6d:	89 e5                	mov    %esp,%ebp
     f6f:	53                   	push   %ebx
     f70:	83 ec 44             	sub    $0x44,%esp
     f73:	e8 98 f8 ff ff       	call   810 <__x86.get_pc_thunk.bx>
     f78:	81 c3 88 30 00 00    	add    $0x3088,%ebx
     f7e:	8d 83 50 02 00 00    	lea    0x250(%ebx),%eax
     f84:	89 45 e8             	mov    %eax,-0x18(%ebp)
     f87:	83 ec 08             	sub    $0x8,%esp
     f8a:	8d 45 d0             	lea    -0x30(%ebp),%eax
     f8d:	50                   	push   %eax
     f8e:	ff 75 08             	pushl  0x8(%ebp)
     f91:	e8 00 03 00 00       	call   1296 <read_six_numbers>
     f96:	83 c4 10             	add    $0x10,%esp
     f99:	85 c0                	test   %eax,%eax
     f9b:	75 0a                	jne    fa7 <phase_6+0x3b>
     f9d:	b8 00 00 00 00       	mov    $0x0,%eax
     fa2:	e9 37 01 00 00       	jmp    10de <phase_6+0x172>
     fa7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     fae:	eb 60                	jmp    1010 <phase_6+0xa4>
     fb0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fb3:	8b 44 85 d0          	mov    -0x30(%ebp,%eax,4),%eax
     fb7:	85 c0                	test   %eax,%eax
     fb9:	7e 0c                	jle    fc7 <phase_6+0x5b>
     fbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fbe:	8b 44 85 d0          	mov    -0x30(%ebp,%eax,4),%eax
     fc2:	83 f8 06             	cmp    $0x6,%eax
     fc5:	7e 0f                	jle    fd6 <phase_6+0x6a>
     fc7:	e8 fb 06 00 00       	call   16c7 <explode_bomb>
     fcc:	b8 00 00 00 00       	mov    $0x0,%eax
     fd1:	e9 08 01 00 00       	jmp    10de <phase_6+0x172>
     fd6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fd9:	83 c0 01             	add    $0x1,%eax
     fdc:	89 45 ec             	mov    %eax,-0x14(%ebp)
     fdf:	eb 25                	jmp    1006 <phase_6+0x9a>
     fe1:	8b 45 f0             	mov    -0x10(%ebp),%eax
     fe4:	8b 54 85 d0          	mov    -0x30(%ebp,%eax,4),%edx
     fe8:	8b 45 ec             	mov    -0x14(%ebp),%eax
     feb:	8b 44 85 d0          	mov    -0x30(%ebp,%eax,4),%eax
     fef:	39 c2                	cmp    %eax,%edx
     ff1:	75 0f                	jne    1002 <phase_6+0x96>
     ff3:	e8 cf 06 00 00       	call   16c7 <explode_bomb>
     ff8:	b8 00 00 00 00       	mov    $0x0,%eax
     ffd:	e9 dc 00 00 00       	jmp    10de <phase_6+0x172>
    1002:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    1006:	83 7d ec 05          	cmpl   $0x5,-0x14(%ebp)
    100a:	7e d5                	jle    fe1 <phase_6+0x75>
    100c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1010:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    1014:	7e 9a                	jle    fb0 <phase_6+0x44>
    1016:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    101d:	eb 36                	jmp    1055 <phase_6+0xe9>
    101f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1022:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1025:	c7 45 ec 01 00 00 00 	movl   $0x1,-0x14(%ebp)
    102c:	eb 0d                	jmp    103b <phase_6+0xcf>
    102e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1031:	8b 40 08             	mov    0x8(%eax),%eax
    1034:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1037:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    103b:	8b 45 f0             	mov    -0x10(%ebp),%eax
    103e:	8b 44 85 d0          	mov    -0x30(%ebp,%eax,4),%eax
    1042:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1045:	7f e7                	jg     102e <phase_6+0xc2>
    1047:	8b 45 f0             	mov    -0x10(%ebp),%eax
    104a:	8b 55 f4             	mov    -0xc(%ebp),%edx
    104d:	89 54 85 b8          	mov    %edx,-0x48(%ebp,%eax,4)
    1051:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1055:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    1059:	7e c4                	jle    101f <phase_6+0xb3>
    105b:	8b 45 b8             	mov    -0x48(%ebp),%eax
    105e:	89 45 e8             	mov    %eax,-0x18(%ebp)
    1061:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1064:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1067:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    106e:	eb 1a                	jmp    108a <phase_6+0x11e>
    1070:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1073:	8b 54 85 b8          	mov    -0x48(%ebp,%eax,4),%edx
    1077:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107a:	89 50 08             	mov    %edx,0x8(%eax)
    107d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1080:	8b 40 08             	mov    0x8(%eax),%eax
    1083:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1086:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    108a:	83 7d f0 05          	cmpl   $0x5,-0x10(%ebp)
    108e:	7e e0                	jle    1070 <phase_6+0x104>
    1090:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1093:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
    109a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    109d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    10a7:	eb 2a                	jmp    10d3 <phase_6+0x167>
    10a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10ac:	8b 10                	mov    (%eax),%edx
    10ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10b1:	8b 40 08             	mov    0x8(%eax),%eax
    10b4:	8b 00                	mov    (%eax),%eax
    10b6:	39 c2                	cmp    %eax,%edx
    10b8:	7d 0c                	jge    10c6 <phase_6+0x15a>
    10ba:	e8 08 06 00 00       	call   16c7 <explode_bomb>
    10bf:	b8 00 00 00 00       	mov    $0x0,%eax
    10c4:	eb 18                	jmp    10de <phase_6+0x172>
    10c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10c9:	8b 40 08             	mov    0x8(%eax),%eax
    10cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    10cf:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    10d3:	83 7d f0 04          	cmpl   $0x4,-0x10(%ebp)
    10d7:	7e d0                	jle    10a9 <phase_6+0x13d>
    10d9:	b8 01 00 00 00       	mov    $0x1,%eax
    10de:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    10e1:	c9                   	leave  
    10e2:	c3                   	ret    

000010e3 <fun7>:
    10e3:	55                   	push   %ebp
    10e4:	89 e5                	mov    %esp,%ebp
    10e6:	83 ec 08             	sub    $0x8,%esp
    10e9:	e8 f3 00 00 00       	call   11e1 <__x86.get_pc_thunk.ax>
    10ee:	05 12 2f 00 00       	add    $0x2f12,%eax
    10f3:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
    10f7:	75 07                	jne    1100 <fun7+0x1d>
    10f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    10fe:	eb 4e                	jmp    114e <fun7+0x6b>
    1100:	8b 45 08             	mov    0x8(%ebp),%eax
    1103:	8b 00                	mov    (%eax),%eax
    1105:	3b 45 0c             	cmp    0xc(%ebp),%eax
    1108:	7e 19                	jle    1123 <fun7+0x40>
    110a:	8b 45 08             	mov    0x8(%ebp),%eax
    110d:	8b 40 04             	mov    0x4(%eax),%eax
    1110:	83 ec 08             	sub    $0x8,%esp
    1113:	ff 75 0c             	pushl  0xc(%ebp)
    1116:	50                   	push   %eax
    1117:	e8 c7 ff ff ff       	call   10e3 <fun7>
    111c:	83 c4 10             	add    $0x10,%esp
    111f:	01 c0                	add    %eax,%eax
    1121:	eb 2b                	jmp    114e <fun7+0x6b>
    1123:	8b 45 08             	mov    0x8(%ebp),%eax
    1126:	8b 00                	mov    (%eax),%eax
    1128:	3b 45 0c             	cmp    0xc(%ebp),%eax
    112b:	75 07                	jne    1134 <fun7+0x51>
    112d:	b8 00 00 00 00       	mov    $0x0,%eax
    1132:	eb 1a                	jmp    114e <fun7+0x6b>
    1134:	8b 45 08             	mov    0x8(%ebp),%eax
    1137:	8b 40 08             	mov    0x8(%eax),%eax
    113a:	83 ec 08             	sub    $0x8,%esp
    113d:	ff 75 0c             	pushl  0xc(%ebp)
    1140:	50                   	push   %eax
    1141:	e8 9d ff ff ff       	call   10e3 <fun7>
    1146:	83 c4 10             	add    $0x10,%esp
    1149:	01 c0                	add    %eax,%eax
    114b:	83 c0 01             	add    $0x1,%eax
    114e:	c9                   	leave  
    114f:	c3                   	ret    

00001150 <secret_phase>:
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	53                   	push   %ebx
    1154:	83 ec 14             	sub    $0x14,%esp
    1157:	e8 b4 f6 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    115c:	81 c3 a4 2e 00 00    	add    $0x2ea4,%ebx
    1162:	e8 e6 03 00 00       	call   154d <read_line>
    1167:	89 45 f4             	mov    %eax,-0xc(%ebp)
    116a:	83 ec 0c             	sub    $0xc,%esp
    116d:	ff 75 f4             	pushl  -0xc(%ebp)
    1170:	e8 2b f6 ff ff       	call   7a0 <atoi@plt>
    1175:	83 c4 10             	add    $0x10,%esp
    1178:	89 45 f0             	mov    %eax,-0x10(%ebp)
    117b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    117f:	7e 09                	jle    118a <secret_phase+0x3a>
    1181:	81 7d f0 e9 03 00 00 	cmpl   $0x3e9,-0x10(%ebp)
    1188:	7e 0c                	jle    1196 <secret_phase+0x46>
    118a:	e8 38 05 00 00       	call   16c7 <explode_bomb>
    118f:	b8 00 00 00 00       	mov    $0x0,%eax
    1194:	eb 46                	jmp    11dc <secret_phase+0x8c>
    1196:	83 ec 08             	sub    $0x8,%esp
    1199:	ff 75 f0             	pushl  -0x10(%ebp)
    119c:	8d 83 a4 02 00 00    	lea    0x2a4(%ebx),%eax
    11a2:	50                   	push   %eax
    11a3:	e8 3b ff ff ff       	call   10e3 <fun7>
    11a8:	83 c4 10             	add    $0x10,%esp
    11ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    11ae:	83 7d ec 06          	cmpl   $0x6,-0x14(%ebp)
    11b2:	74 0c                	je     11c0 <secret_phase+0x70>
    11b4:	e8 0e 05 00 00       	call   16c7 <explode_bomb>
    11b9:	b8 00 00 00 00       	mov    $0x0,%eax
    11be:	eb 1c                	jmp    11dc <secret_phase+0x8c>
    11c0:	83 ec 0c             	sub    $0xc,%esp
    11c3:	8d 83 78 da ff ff    	lea    -0x2588(%ebx),%eax
    11c9:	50                   	push   %eax
    11ca:	e8 61 f5 ff ff       	call   730 <puts@plt>
    11cf:	83 c4 10             	add    $0x10,%esp
    11d2:	e8 2c 05 00 00       	call   1703 <phase_defused>
    11d7:	b8 01 00 00 00       	mov    $0x1,%eax
    11dc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    11df:	c9                   	leave  
    11e0:	c3                   	ret    

000011e1 <__x86.get_pc_thunk.ax>:
    11e1:	8b 04 24             	mov    (%esp),%eax
    11e4:	c3                   	ret    

000011e5 <sig_handler>:
    11e5:	55                   	push   %ebp
    11e6:	89 e5                	mov    %esp,%ebp
    11e8:	53                   	push   %ebx
    11e9:	83 ec 04             	sub    $0x4,%esp
    11ec:	e8 1f f6 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    11f1:	81 c3 0f 2e 00 00    	add    $0x2e0f,%ebx
    11f7:	83 ec 0c             	sub    $0xc,%esp
    11fa:	8d 83 a0 da ff ff    	lea    -0x2560(%ebx),%eax
    1200:	50                   	push   %eax
    1201:	e8 2a f5 ff ff       	call   730 <puts@plt>
    1206:	83 c4 10             	add    $0x10,%esp
    1209:	83 ec 0c             	sub    $0xc,%esp
    120c:	6a 03                	push   $0x3
    120e:	e8 fd f4 ff ff       	call   710 <sleep@plt>
    1213:	83 c4 10             	add    $0x10,%esp
    1216:	83 ec 0c             	sub    $0xc,%esp
    1219:	8d 83 d8 da ff ff    	lea    -0x2528(%ebx),%eax
    121f:	50                   	push   %eax
    1220:	e8 ab f4 ff ff       	call   6d0 <printf@plt>
    1225:	83 c4 10             	add    $0x10,%esp
    1228:	8b 83 f0 ff ff ff    	mov    -0x10(%ebx),%eax
    122e:	8b 00                	mov    (%eax),%eax
    1230:	83 ec 0c             	sub    $0xc,%esp
    1233:	50                   	push   %eax
    1234:	e8 a7 f4 ff ff       	call   6e0 <fflush@plt>
    1239:	83 c4 10             	add    $0x10,%esp
    123c:	83 ec 0c             	sub    $0xc,%esp
    123f:	6a 01                	push   $0x1
    1241:	e8 ca f4 ff ff       	call   710 <sleep@plt>
    1246:	83 c4 10             	add    $0x10,%esp
    1249:	83 ec 0c             	sub    $0xc,%esp
    124c:	8d 83 e0 da ff ff    	lea    -0x2520(%ebx),%eax
    1252:	50                   	push   %eax
    1253:	e8 d8 f4 ff ff       	call   730 <puts@plt>
    1258:	83 c4 10             	add    $0x10,%esp
    125b:	83 ec 0c             	sub    $0xc,%esp
    125e:	6a 10                	push   $0x10
    1260:	e8 db f4 ff ff       	call   740 <exit@plt>

00001265 <invalid_phase>:
    1265:	55                   	push   %ebp
    1266:	89 e5                	mov    %esp,%ebp
    1268:	53                   	push   %ebx
    1269:	83 ec 04             	sub    $0x4,%esp
    126c:	e8 9f f5 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    1271:	81 c3 8f 2d 00 00    	add    $0x2d8f,%ebx
    1277:	83 ec 08             	sub    $0x8,%esp
    127a:	ff 75 08             	pushl  0x8(%ebp)
    127d:	8d 83 e8 da ff ff    	lea    -0x2518(%ebx),%eax
    1283:	50                   	push   %eax
    1284:	e8 47 f4 ff ff       	call   6d0 <printf@plt>
    1289:	83 c4 10             	add    $0x10,%esp
    128c:	83 ec 0c             	sub    $0xc,%esp
    128f:	6a 08                	push   $0x8
    1291:	e8 aa f4 ff ff       	call   740 <exit@plt>

00001296 <read_six_numbers>:
    1296:	55                   	push   %ebp
    1297:	89 e5                	mov    %esp,%ebp
    1299:	57                   	push   %edi
    129a:	56                   	push   %esi
    129b:	53                   	push   %ebx
    129c:	83 ec 1c             	sub    $0x1c,%esp
    129f:	e8 3d ff ff ff       	call   11e1 <__x86.get_pc_thunk.ax>
    12a4:	05 5c 2d 00 00       	add    $0x2d5c,%eax
    12a9:	8b 55 0c             	mov    0xc(%ebp),%edx
    12ac:	8d 7a 14             	lea    0x14(%edx),%edi
    12af:	8b 55 0c             	mov    0xc(%ebp),%edx
    12b2:	8d 72 10             	lea    0x10(%edx),%esi
    12b5:	8b 55 0c             	mov    0xc(%ebp),%edx
    12b8:	8d 5a 0c             	lea    0xc(%edx),%ebx
    12bb:	8b 55 0c             	mov    0xc(%ebp),%edx
    12be:	8d 4a 08             	lea    0x8(%edx),%ecx
    12c1:	8b 55 0c             	mov    0xc(%ebp),%edx
    12c4:	83 c2 04             	add    $0x4,%edx
    12c7:	57                   	push   %edi
    12c8:	56                   	push   %esi
    12c9:	53                   	push   %ebx
    12ca:	51                   	push   %ecx
    12cb:	52                   	push   %edx
    12cc:	ff 75 0c             	pushl  0xc(%ebp)
    12cf:	8d 90 f9 da ff ff    	lea    -0x2507(%eax),%edx
    12d5:	52                   	push   %edx
    12d6:	ff 75 08             	pushl  0x8(%ebp)
    12d9:	89 c3                	mov    %eax,%ebx
    12db:	e8 90 f4 ff ff       	call   770 <__isoc99_sscanf@plt>
    12e0:	83 c4 20             	add    $0x20,%esp
    12e3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    12e6:	83 7d e4 05          	cmpl   $0x5,-0x1c(%ebp)
    12ea:	7f 0c                	jg     12f8 <read_six_numbers+0x62>
    12ec:	e8 d6 03 00 00       	call   16c7 <explode_bomb>
    12f1:	b8 00 00 00 00       	mov    $0x0,%eax
    12f6:	eb 05                	jmp    12fd <read_six_numbers+0x67>
    12f8:	b8 01 00 00 00       	mov    $0x1,%eax
    12fd:	8d 65 f4             	lea    -0xc(%ebp),%esp
    1300:	5b                   	pop    %ebx
    1301:	5e                   	pop    %esi
    1302:	5f                   	pop    %edi
    1303:	5d                   	pop    %ebp
    1304:	c3                   	ret    

00001305 <read_n_numbers>:
    1305:	55                   	push   %ebp
    1306:	89 e5                	mov    %esp,%ebp
    1308:	53                   	push   %ebx
    1309:	83 ec 14             	sub    $0x14,%esp
    130c:	e8 ff f4 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    1311:	81 c3 ef 2c 00 00    	add    $0x2cef,%ebx
    1317:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    131e:	eb 76                	jmp    1396 <read_n_numbers+0x91>
    1320:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1324:	75 1a                	jne    1340 <read_n_numbers+0x3b>
    1326:	83 ec 08             	sub    $0x8,%esp
    1329:	8d 83 0b db ff ff    	lea    -0x24f5(%ebx),%eax
    132f:	50                   	push   %eax
    1330:	ff 75 08             	pushl  0x8(%ebp)
    1333:	e8 58 f4 ff ff       	call   790 <strtok@plt>
    1338:	83 c4 10             	add    $0x10,%esp
    133b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    133e:	eb 17                	jmp    1357 <read_n_numbers+0x52>
    1340:	83 ec 08             	sub    $0x8,%esp
    1343:	8d 83 0b db ff ff    	lea    -0x24f5(%ebx),%eax
    1349:	50                   	push   %eax
    134a:	6a 00                	push   $0x0
    134c:	e8 3f f4 ff ff       	call   790 <strtok@plt>
    1351:	83 c4 10             	add    $0x10,%esp
    1354:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    135b:	74 29                	je     1386 <read_n_numbers+0x81>
    135d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1360:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
    1367:	8b 45 0c             	mov    0xc(%ebp),%eax
    136a:	01 d0                	add    %edx,%eax
    136c:	83 ec 04             	sub    $0x4,%esp
    136f:	50                   	push   %eax
    1370:	8d 83 0f db ff ff    	lea    -0x24f1(%ebx),%eax
    1376:	50                   	push   %eax
    1377:	ff 75 f4             	pushl  -0xc(%ebp)
    137a:	e8 f1 f3 ff ff       	call   770 <__isoc99_sscanf@plt>
    137f:	83 c4 10             	add    $0x10,%esp
    1382:	85 c0                	test   %eax,%eax
    1384:	7f 0c                	jg     1392 <read_n_numbers+0x8d>
    1386:	e8 3c 03 00 00       	call   16c7 <explode_bomb>
    138b:	b8 00 00 00 00       	mov    $0x0,%eax
    1390:	eb 11                	jmp    13a3 <read_n_numbers+0x9e>
    1392:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1396:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1399:	3b 45 10             	cmp    0x10(%ebp),%eax
    139c:	7c 82                	jl     1320 <read_n_numbers+0x1b>
    139e:	b8 01 00 00 00       	mov    $0x1,%eax
    13a3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    13a6:	c9                   	leave  
    13a7:	c3                   	ret    

000013a8 <string_length>:
    13a8:	55                   	push   %ebp
    13a9:	89 e5                	mov    %esp,%ebp
    13ab:	83 ec 10             	sub    $0x10,%esp
    13ae:	e8 2e fe ff ff       	call   11e1 <__x86.get_pc_thunk.ax>
    13b3:	05 4d 2c 00 00       	add    $0x2c4d,%eax
    13b8:	8b 45 08             	mov    0x8(%ebp),%eax
    13bb:	89 45 f8             	mov    %eax,-0x8(%ebp)
    13be:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    13c5:	eb 08                	jmp    13cf <string_length+0x27>
    13c7:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    13cb:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    13cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    13d2:	0f b6 00             	movzbl (%eax),%eax
    13d5:	84 c0                	test   %al,%al
    13d7:	75 ee                	jne    13c7 <string_length+0x1f>
    13d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
    13dc:	c9                   	leave  
    13dd:	c3                   	ret    

000013de <strings_not_equal>:
    13de:	55                   	push   %ebp
    13df:	89 e5                	mov    %esp,%ebp
    13e1:	53                   	push   %ebx
    13e2:	83 ec 10             	sub    $0x10,%esp
    13e5:	e8 f7 fd ff ff       	call   11e1 <__x86.get_pc_thunk.ax>
    13ea:	05 16 2c 00 00       	add    $0x2c16,%eax
    13ef:	ff 75 08             	pushl  0x8(%ebp)
    13f2:	e8 b1 ff ff ff       	call   13a8 <string_length>
    13f7:	83 c4 04             	add    $0x4,%esp
    13fa:	89 c3                	mov    %eax,%ebx
    13fc:	ff 75 0c             	pushl  0xc(%ebp)
    13ff:	e8 a4 ff ff ff       	call   13a8 <string_length>
    1404:	83 c4 04             	add    $0x4,%esp
    1407:	39 c3                	cmp    %eax,%ebx
    1409:	74 07                	je     1412 <strings_not_equal+0x34>
    140b:	b8 01 00 00 00       	mov    $0x1,%eax
    1410:	eb 3c                	jmp    144e <strings_not_equal+0x70>
    1412:	8b 45 08             	mov    0x8(%ebp),%eax
    1415:	89 45 f8             	mov    %eax,-0x8(%ebp)
    1418:	8b 45 0c             	mov    0xc(%ebp),%eax
    141b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    141e:	eb 1f                	jmp    143f <strings_not_equal+0x61>
    1420:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1423:	0f b6 10             	movzbl (%eax),%edx
    1426:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1429:	0f b6 00             	movzbl (%eax),%eax
    142c:	38 c2                	cmp    %al,%dl
    142e:	74 07                	je     1437 <strings_not_equal+0x59>
    1430:	b8 01 00 00 00       	mov    $0x1,%eax
    1435:	eb 17                	jmp    144e <strings_not_equal+0x70>
    1437:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    143b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    143f:	8b 45 f8             	mov    -0x8(%ebp),%eax
    1442:	0f b6 00             	movzbl (%eax),%eax
    1445:	84 c0                	test   %al,%al
    1447:	75 d7                	jne    1420 <strings_not_equal+0x42>
    1449:	b8 00 00 00 00       	mov    $0x0,%eax
    144e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1451:	c9                   	leave  
    1452:	c3                   	ret    

00001453 <initialize_bomb>:
    1453:	55                   	push   %ebp
    1454:	89 e5                	mov    %esp,%ebp
    1456:	53                   	push   %ebx
    1457:	83 ec 04             	sub    $0x4,%esp
    145a:	e8 82 fd ff ff       	call   11e1 <__x86.get_pc_thunk.ax>
    145f:	05 a1 2b 00 00       	add    $0x2ba1,%eax
    1464:	83 ec 08             	sub    $0x8,%esp
    1467:	8d 90 e5 d1 ff ff    	lea    -0x2e1b(%eax),%edx
    146d:	52                   	push   %edx
    146e:	6a 02                	push   $0x2
    1470:	89 c3                	mov    %eax,%ebx
    1472:	e8 89 f2 ff ff       	call   700 <signal@plt>
    1477:	83 c4 10             	add    $0x10,%esp
    147a:	90                   	nop
    147b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    147e:	c9                   	leave  
    147f:	c3                   	ret    

00001480 <initialize_bomb_solve>:
    1480:	55                   	push   %ebp
    1481:	89 e5                	mov    %esp,%ebp
    1483:	e8 59 fd ff ff       	call   11e1 <__x86.get_pc_thunk.ax>
    1488:	05 78 2b 00 00       	add    $0x2b78,%eax
    148d:	90                   	nop
    148e:	5d                   	pop    %ebp
    148f:	c3                   	ret    

00001490 <blank_line>:
    1490:	55                   	push   %ebp
    1491:	89 e5                	mov    %esp,%ebp
    1493:	53                   	push   %ebx
    1494:	83 ec 04             	sub    $0x4,%esp
    1497:	e8 74 f3 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    149c:	81 c3 64 2b 00 00    	add    $0x2b64,%ebx
    14a2:	eb 30                	jmp    14d4 <blank_line+0x44>
    14a4:	e8 07 f3 ff ff       	call   7b0 <__ctype_b_loc@plt>
    14a9:	8b 08                	mov    (%eax),%ecx
    14ab:	8b 45 08             	mov    0x8(%ebp),%eax
    14ae:	8d 50 01             	lea    0x1(%eax),%edx
    14b1:	89 55 08             	mov    %edx,0x8(%ebp)
    14b4:	0f b6 00             	movzbl (%eax),%eax
    14b7:	0f be c0             	movsbl %al,%eax
    14ba:	01 c0                	add    %eax,%eax
    14bc:	01 c8                	add    %ecx,%eax
    14be:	0f b7 00             	movzwl (%eax),%eax
    14c1:	0f b7 c0             	movzwl %ax,%eax
    14c4:	25 00 20 00 00       	and    $0x2000,%eax
    14c9:	85 c0                	test   %eax,%eax
    14cb:	75 07                	jne    14d4 <blank_line+0x44>
    14cd:	b8 00 00 00 00       	mov    $0x0,%eax
    14d2:	eb 0f                	jmp    14e3 <blank_line+0x53>
    14d4:	8b 45 08             	mov    0x8(%ebp),%eax
    14d7:	0f b6 00             	movzbl (%eax),%eax
    14da:	84 c0                	test   %al,%al
    14dc:	75 c6                	jne    14a4 <blank_line+0x14>
    14de:	b8 01 00 00 00       	mov    $0x1,%eax
    14e3:	83 c4 04             	add    $0x4,%esp
    14e6:	5b                   	pop    %ebx
    14e7:	5d                   	pop    %ebp
    14e8:	c3                   	ret    

000014e9 <skip>:
    14e9:	55                   	push   %ebp
    14ea:	89 e5                	mov    %esp,%ebp
    14ec:	53                   	push   %ebx
    14ed:	83 ec 14             	sub    $0x14,%esp
    14f0:	e8 1b f3 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    14f5:	81 c3 0b 2b 00 00    	add    $0x2b0b,%ebx
    14fb:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
    1501:	8b 08                	mov    (%eax),%ecx
    1503:	8b 93 c4 02 00 00    	mov    0x2c4(%ebx),%edx
    1509:	89 d0                	mov    %edx,%eax
    150b:	c1 e0 02             	shl    $0x2,%eax
    150e:	01 d0                	add    %edx,%eax
    1510:	c1 e0 04             	shl    $0x4,%eax
    1513:	8d 93 e0 02 00 00    	lea    0x2e0(%ebx),%edx
    1519:	01 d0                	add    %edx,%eax
    151b:	83 ec 04             	sub    $0x4,%esp
    151e:	51                   	push   %ecx
    151f:	6a 50                	push   $0x50
    1521:	50                   	push   %eax
    1522:	e8 c9 f1 ff ff       	call   6f0 <fgets@plt>
    1527:	83 c4 10             	add    $0x10,%esp
    152a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    152d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1531:	74 12                	je     1545 <skip+0x5c>
    1533:	83 ec 0c             	sub    $0xc,%esp
    1536:	ff 75 f4             	pushl  -0xc(%ebp)
    1539:	e8 52 ff ff ff       	call   1490 <blank_line>
    153e:	83 c4 10             	add    $0x10,%esp
    1541:	85 c0                	test   %eax,%eax
    1543:	75 b6                	jne    14fb <skip+0x12>
    1545:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1548:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    154b:	c9                   	leave  
    154c:	c3                   	ret    

0000154d <read_line>:
    154d:	55                   	push   %ebp
    154e:	89 e5                	mov    %esp,%ebp
    1550:	56                   	push   %esi
    1551:	53                   	push   %ebx
    1552:	83 ec 10             	sub    $0x10,%esp
    1555:	e8 b6 f2 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    155a:	81 c3 a6 2a 00 00    	add    $0x2aa6,%ebx
    1560:	e8 84 ff ff ff       	call   14e9 <skip>
    1565:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1568:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    156c:	0f 85 8a 00 00 00    	jne    15fc <read_line+0xaf>
    1572:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
    1578:	8b 10                	mov    (%eax),%edx
    157a:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
    1580:	8b 00                	mov    (%eax),%eax
    1582:	39 c2                	cmp    %eax,%edx
    1584:	75 1c                	jne    15a2 <read_line+0x55>
    1586:	83 ec 0c             	sub    $0xc,%esp
    1589:	8d 83 12 db ff ff    	lea    -0x24ee(%ebx),%eax
    158f:	50                   	push   %eax
    1590:	e8 9b f1 ff ff       	call   730 <puts@plt>
    1595:	83 c4 10             	add    $0x10,%esp
    1598:	83 ec 0c             	sub    $0xc,%esp
    159b:	6a 08                	push   $0x8
    159d:	e8 9e f1 ff ff       	call   740 <exit@plt>
    15a2:	83 ec 0c             	sub    $0xc,%esp
    15a5:	8d 83 30 db ff ff    	lea    -0x24d0(%ebx),%eax
    15ab:	50                   	push   %eax
    15ac:	e8 6f f1 ff ff       	call   720 <getenv@plt>
    15b1:	83 c4 10             	add    $0x10,%esp
    15b4:	85 c0                	test   %eax,%eax
    15b6:	74 0a                	je     15c2 <read_line+0x75>
    15b8:	83 ec 0c             	sub    $0xc,%esp
    15bb:	6a 00                	push   $0x0
    15bd:	e8 7e f1 ff ff       	call   740 <exit@plt>
    15c2:	8b 83 ec ff ff ff    	mov    -0x14(%ebx),%eax
    15c8:	8b 10                	mov    (%eax),%edx
    15ca:	8d 83 c8 02 00 00    	lea    0x2c8(%ebx),%eax
    15d0:	89 10                	mov    %edx,(%eax)
    15d2:	e8 12 ff ff ff       	call   14e9 <skip>
    15d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    15da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    15de:	75 1c                	jne    15fc <read_line+0xaf>
    15e0:	83 ec 0c             	sub    $0xc,%esp
    15e3:	8d 83 12 db ff ff    	lea    -0x24ee(%ebx),%eax
    15e9:	50                   	push   %eax
    15ea:	e8 41 f1 ff ff       	call   730 <puts@plt>
    15ef:	83 c4 10             	add    $0x10,%esp
    15f2:	83 ec 0c             	sub    $0xc,%esp
    15f5:	6a 00                	push   $0x0
    15f7:	e8 44 f1 ff ff       	call   740 <exit@plt>
    15fc:	8b 93 c4 02 00 00    	mov    0x2c4(%ebx),%edx
    1602:	89 d0                	mov    %edx,%eax
    1604:	c1 e0 02             	shl    $0x2,%eax
    1607:	01 d0                	add    %edx,%eax
    1609:	c1 e0 04             	shl    $0x4,%eax
    160c:	8d 93 e0 02 00 00    	lea    0x2e0(%ebx),%edx
    1612:	01 d0                	add    %edx,%eax
    1614:	83 ec 0c             	sub    $0xc,%esp
    1617:	50                   	push   %eax
    1618:	e8 33 f1 ff ff       	call   750 <strlen@plt>
    161d:	83 c4 10             	add    $0x10,%esp
    1620:	89 45 f0             	mov    %eax,-0x10(%ebp)
    1623:	83 7d f0 4e          	cmpl   $0x4e,-0x10(%ebp)
    1627:	7e 53                	jle    167c <read_line+0x12f>
    1629:	83 ec 0c             	sub    $0xc,%esp
    162c:	8d 83 3b db ff ff    	lea    -0x24c5(%ebx),%eax
    1632:	50                   	push   %eax
    1633:	e8 f8 f0 ff ff       	call   730 <puts@plt>
    1638:	83 c4 10             	add    $0x10,%esp
    163b:	8b 93 c4 02 00 00    	mov    0x2c4(%ebx),%edx
    1641:	8d 42 01             	lea    0x1(%edx),%eax
    1644:	89 83 c4 02 00 00    	mov    %eax,0x2c4(%ebx)
    164a:	89 d0                	mov    %edx,%eax
    164c:	c1 e0 02             	shl    $0x2,%eax
    164f:	01 d0                	add    %edx,%eax
    1651:	c1 e0 04             	shl    $0x4,%eax
    1654:	8d 93 e0 02 00 00    	lea    0x2e0(%ebx),%edx
    165a:	01 d0                	add    %edx,%eax
    165c:	c7 00 2a 2a 2a 74    	movl   $0x742a2a2a,(%eax)
    1662:	c7 40 04 72 75 6e 63 	movl   $0x636e7572,0x4(%eax)
    1669:	c7 40 08 61 74 65 64 	movl   $0x64657461,0x8(%eax)
    1670:	c7 40 0c 2a 2a 2a 00 	movl   $0x2a2a2a,0xc(%eax)
    1677:	e8 4b 00 00 00       	call   16c7 <explode_bomb>
    167c:	8b 93 c4 02 00 00    	mov    0x2c4(%ebx),%edx
    1682:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1685:	8d 70 ff             	lea    -0x1(%eax),%esi
    1688:	8d 8b e0 02 00 00    	lea    0x2e0(%ebx),%ecx
    168e:	89 d0                	mov    %edx,%eax
    1690:	c1 e0 02             	shl    $0x2,%eax
    1693:	01 d0                	add    %edx,%eax
    1695:	c1 e0 04             	shl    $0x4,%eax
    1698:	01 c8                	add    %ecx,%eax
    169a:	01 f0                	add    %esi,%eax
    169c:	c6 00 00             	movb   $0x0,(%eax)
    169f:	8b 93 c4 02 00 00    	mov    0x2c4(%ebx),%edx
    16a5:	8d 42 01             	lea    0x1(%edx),%eax
    16a8:	89 83 c4 02 00 00    	mov    %eax,0x2c4(%ebx)
    16ae:	89 d0                	mov    %edx,%eax
    16b0:	c1 e0 02             	shl    $0x2,%eax
    16b3:	01 d0                	add    %edx,%eax
    16b5:	c1 e0 04             	shl    $0x4,%eax
    16b8:	8d 93 e0 02 00 00    	lea    0x2e0(%ebx),%edx
    16be:	01 d0                	add    %edx,%eax
    16c0:	8d 65 f8             	lea    -0x8(%ebp),%esp
    16c3:	5b                   	pop    %ebx
    16c4:	5e                   	pop    %esi
    16c5:	5d                   	pop    %ebp
    16c6:	c3                   	ret    

000016c7 <explode_bomb>:
    16c7:	55                   	push   %ebp
    16c8:	89 e5                	mov    %esp,%ebp
    16ca:	53                   	push   %ebx
    16cb:	83 ec 04             	sub    $0x4,%esp
    16ce:	e8 3d f1 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    16d3:	81 c3 2d 29 00 00    	add    $0x292d,%ebx
    16d9:	83 ec 0c             	sub    $0xc,%esp
    16dc:	8d 83 56 db ff ff    	lea    -0x24aa(%ebx),%eax
    16e2:	50                   	push   %eax
    16e3:	e8 48 f0 ff ff       	call   730 <puts@plt>
    16e8:	83 c4 10             	add    $0x10,%esp
    16eb:	83 ec 0c             	sub    $0xc,%esp
    16ee:	8d 83 5f db ff ff    	lea    -0x24a1(%ebx),%eax
    16f4:	50                   	push   %eax
    16f5:	e8 36 f0 ff ff       	call   730 <puts@plt>
    16fa:	83 c4 10             	add    $0x10,%esp
    16fd:	90                   	nop
    16fe:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    1701:	c9                   	leave  
    1702:	c3                   	ret    

00001703 <phase_defused>:
    1703:	55                   	push   %ebp
    1704:	89 e5                	mov    %esp,%ebp
    1706:	53                   	push   %ebx
    1707:	83 ec 64             	sub    $0x64,%esp
    170a:	e8 01 f1 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    170f:	81 c3 f1 28 00 00    	add    $0x28f1,%ebx
    1715:	8b 83 c4 02 00 00    	mov    0x2c4(%ebx),%eax
    171b:	83 f8 07             	cmp    $0x7,%eax
    171e:	0f 85 89 00 00 00    	jne    17ad <phase_defused+0xaa>
    1724:	83 ec 0c             	sub    $0xc,%esp
    1727:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    172a:	50                   	push   %eax
    172b:	8d 45 9c             	lea    -0x64(%ebp),%eax
    172e:	50                   	push   %eax
    172f:	8d 45 a0             	lea    -0x60(%ebp),%eax
    1732:	50                   	push   %eax
    1733:	8d 83 76 db ff ff    	lea    -0x248a(%ebx),%eax
    1739:	50                   	push   %eax
    173a:	8d 83 e0 02 00 00    	lea    0x2e0(%ebx),%eax
    1740:	8d 80 40 01 00 00    	lea    0x140(%eax),%eax
    1746:	50                   	push   %eax
    1747:	e8 24 f0 ff ff       	call   770 <__isoc99_sscanf@plt>
    174c:	83 c4 20             	add    $0x20,%esp
    174f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    1752:	83 7d f4 03          	cmpl   $0x3,-0xc(%ebp)
    1756:	75 43                	jne    179b <phase_defused+0x98>
    1758:	83 ec 08             	sub    $0x8,%esp
    175b:	8d 83 7f db ff ff    	lea    -0x2481(%ebx),%eax
    1761:	50                   	push   %eax
    1762:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    1765:	50                   	push   %eax
    1766:	e8 73 fc ff ff       	call   13de <strings_not_equal>
    176b:	83 c4 10             	add    $0x10,%esp
    176e:	85 c0                	test   %eax,%eax
    1770:	75 29                	jne    179b <phase_defused+0x98>
    1772:	83 ec 0c             	sub    $0xc,%esp
    1775:	8d 83 88 db ff ff    	lea    -0x2478(%ebx),%eax
    177b:	50                   	push   %eax
    177c:	e8 af ef ff ff       	call   730 <puts@plt>
    1781:	83 c4 10             	add    $0x10,%esp
    1784:	83 ec 0c             	sub    $0xc,%esp
    1787:	8d 83 b0 db ff ff    	lea    -0x2450(%ebx),%eax
    178d:	50                   	push   %eax
    178e:	e8 9d ef ff ff       	call   730 <puts@plt>
    1793:	83 c4 10             	add    $0x10,%esp
    1796:	e8 b5 f9 ff ff       	call   1150 <secret_phase>
    179b:	83 ec 0c             	sub    $0xc,%esp
    179e:	8d 83 e8 db ff ff    	lea    -0x2418(%ebx),%eax
    17a4:	50                   	push   %eax
    17a5:	e8 86 ef ff ff       	call   730 <puts@plt>
    17aa:	83 c4 10             	add    $0x10,%esp
    17ad:	90                   	nop
    17ae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
    17b1:	c9                   	leave  
    17b2:	c3                   	ret    
    17b3:	66 90                	xchg   %ax,%ax
    17b5:	66 90                	xchg   %ax,%ax
    17b7:	66 90                	xchg   %ax,%ax
    17b9:	66 90                	xchg   %ax,%ax
    17bb:	66 90                	xchg   %ax,%ax
    17bd:	66 90                	xchg   %ax,%ax
    17bf:	90                   	nop

000017c0 <__libc_csu_init>:
    17c0:	55                   	push   %ebp
    17c1:	57                   	push   %edi
    17c2:	56                   	push   %esi
    17c3:	53                   	push   %ebx
    17c4:	e8 47 f0 ff ff       	call   810 <__x86.get_pc_thunk.bx>
    17c9:	81 c3 37 28 00 00    	add    $0x2837,%ebx
    17cf:	83 ec 0c             	sub    $0xc,%esp
    17d2:	8b 6c 24 20          	mov    0x20(%esp),%ebp
    17d6:	8d b3 e8 fe ff ff    	lea    -0x118(%ebx),%esi
    17dc:	e8 b7 ee ff ff       	call   698 <_init>
    17e1:	8d 83 e4 fe ff ff    	lea    -0x11c(%ebx),%eax
    17e7:	29 c6                	sub    %eax,%esi
    17e9:	c1 fe 02             	sar    $0x2,%esi
    17ec:	85 f6                	test   %esi,%esi
    17ee:	74 25                	je     1815 <__libc_csu_init+0x55>
    17f0:	31 ff                	xor    %edi,%edi
    17f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    17f8:	83 ec 04             	sub    $0x4,%esp
    17fb:	ff 74 24 2c          	pushl  0x2c(%esp)
    17ff:	ff 74 24 2c          	pushl  0x2c(%esp)
    1803:	55                   	push   %ebp
    1804:	ff 94 bb e4 fe ff ff 	call   *-0x11c(%ebx,%edi,4)
    180b:	83 c7 01             	add    $0x1,%edi
    180e:	83 c4 10             	add    $0x10,%esp
    1811:	39 fe                	cmp    %edi,%esi
    1813:	75 e3                	jne    17f8 <__libc_csu_init+0x38>
    1815:	83 c4 0c             	add    $0xc,%esp
    1818:	5b                   	pop    %ebx
    1819:	5e                   	pop    %esi
    181a:	5f                   	pop    %edi
    181b:	5d                   	pop    %ebp
    181c:	c3                   	ret    
    181d:	8d 76 00             	lea    0x0(%esi),%esi

00001820 <__libc_csu_fini>:
    1820:	f3 c3                	repz ret 

Disassembly of section .fini:

00001824 <_fini>:
    1824:	53                   	push   %ebx
    1825:	83 ec 08             	sub    $0x8,%esp
    1828:	e8 e3 ef ff ff       	call   810 <__x86.get_pc_thunk.bx>
    182d:	81 c3 d3 27 00 00    	add    $0x27d3,%ebx
    1833:	83 c4 08             	add    $0x8,%esp
    1836:	5b                   	pop    %ebx
    1837:	c3                   	ret    
