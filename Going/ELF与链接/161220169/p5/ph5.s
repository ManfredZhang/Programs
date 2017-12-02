
phase5.o:     file format elf32-i386


Disassembly of section .text:

00000000 <SnLHPJDszf>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 30             	sub    $0x30,%esp
   6:	c7 45 dd 63 53 69 55 	movl   $0x55695363,-0x23(%ebp)
   d:	c7 45 e1 6e 69 75 55 	movl   $0x5575696e,-0x1f(%ebp)
  14:	c7 45 e5 4d 71 76 4b 	movl   $0x4b76714d,-0x1b(%ebp)
  1b:	c7 45 e9 71 63 48 4d 	movl   $0x4d486371,-0x17(%ebp)
  22:	c7 45 ed 41 6e 59 71 	movl   $0x71596e41,-0x13(%ebp)
  29:	c7 45 f1 42 55 50 78 	movl   $0x78505542,-0xf(%ebp)
  30:	c7 45 f5 48 6f 44 52 	movl   $0x52446f48,-0xb(%ebp)
  37:	66 c7 45 f9 77 41    	movw   $0x4177,-0x7(%ebp)
  3d:	c6 45 fb 00          	movb   $0x0,-0x5(%ebp)
  41:	c7 45 fc 1f 00 00 00 	movl   $0x1f,-0x4(%ebp)
  48:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  4c:	78 15                	js     63 <SnLHPJDszf+0x63>
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  54:	7d 0d                	jge    63 <SnLHPJDszf+0x63>
  56:	8d 55 dd             	lea    -0x23(%ebp),%edx
  59:	8b 45 08             	mov    0x8(%ebp),%eax
  5c:	01 d0                	add    %edx,%eax
  5e:	0f b6 00             	movzbl (%eax),%eax
  61:	eb 05                	jmp    68 <SnLHPJDszf+0x68>
  63:	b8 00 00 00 00       	mov    $0x0,%eax
  68:	c9                   	leave  
  69:	c3                   	ret    

0000006a <transform_code>:
  6a:	55                   	push   %ebp
  6b:	89 e5                	mov    %esp,%ebp
  6d:	8b 45 0c             	mov    0xc(%ebp),%eax
  70:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			73: R_386_32	.rodata
  77:	83 e0 07             	and    $0x7,%eax
  7a:	83 f8 07             	cmp    $0x7,%eax
  7d:	77 74                	ja     f3 <transform_code+0x89>
  7f:	8b 04 85 24 00 00 00 	mov    0x24(,%eax,4),%eax
			83: R_386_32	.rodata
  86:	ff e0                	jmp    *%eax
  88:	f7 55 08             	notl   0x8(%ebp)
  8b:	eb 6a                	jmp    f7 <transform_code+0x8d>
  8d:	8b 45 0c             	mov    0xc(%ebp),%eax
  90:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			93: R_386_32	.rodata
  97:	83 e0 03             	and    $0x3,%eax
  9a:	89 c1                	mov    %eax,%ecx
  9c:	d3 7d 08             	sarl   %cl,0x8(%ebp)
  9f:	eb 56                	jmp    f7 <transform_code+0x8d>
  a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  a4:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			a7: R_386_32	.rodata
  ab:	f7 d0                	not    %eax
  ad:	21 45 08             	and    %eax,0x8(%ebp)
  b0:	eb 45                	jmp    f7 <transform_code+0x8d>
  b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  b5:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			b8: R_386_32	.rodata
  bc:	c1 e0 08             	shl    $0x8,%eax
  bf:	09 45 08             	or     %eax,0x8(%ebp)
  c2:	eb 33                	jmp    f7 <transform_code+0x8d>
  c4:	8b 45 0c             	mov    0xc(%ebp),%eax
  c7:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			ca: R_386_32	.rodata
  ce:	31 45 08             	xor    %eax,0x8(%ebp)
  d1:	eb 24                	jmp    f7 <transform_code+0x8d>
  d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  d6:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			d9: R_386_32	.rodata
  dd:	f7 d0                	not    %eax
  df:	09 45 08             	or     %eax,0x8(%ebp)
  e2:	eb 13                	jmp    f7 <transform_code+0x8d>
  e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  e7:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
			ea: R_386_32	.rodata
  ee:	01 45 08             	add    %eax,0x8(%ebp)
  f1:	eb 04                	jmp    f7 <transform_code+0x8d>
  f3:	f7 5d 08             	negl   0x8(%ebp)
  f6:	90                   	nop
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	5d                   	pop    %ebp
  fb:	c3                   	ret    

000000fc <generate_code>:
  fc:	55                   	push   %ebp
  fd:	89 e5                	mov    %esp,%ebp
  ff:	83 ec 10             	sub    $0x10,%esp
 102:	8b 45 08             	mov    0x8(%ebp),%eax
 105:	a3 b4 00 00 00       	mov    %eax,0xb4
			106: R_386_32	.data
 10a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 111:	eb 1a                	jmp    12d <generate_code+0x31>
 113:	a1 b4 00 00 00       	mov    0xb4,%eax
			114: R_386_32	.data
 118:	ff 75 fc             	pushl  -0x4(%ebp)
 11b:	50                   	push   %eax
 11c:	e8 fc ff ff ff       	call   11d <generate_code+0x21>
			11d: R_386_PC32	transform_code
 121:	83 c4 08             	add    $0x8,%esp
 124:	a3 b4 00 00 00       	mov    %eax,0xb4
			125: R_386_32	.data
 129:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 12d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 130:	83 f8 08             	cmp    $0x8,%eax
 133:	76 de                	jbe    113 <generate_code+0x17>
 135:	90                   	nop
 136:	c9                   	leave  
 137:	c3                   	ret    

00000138 <encode_1>:
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	83 ec 18             	sub    $0x18,%esp
 13e:	83 ec 0c             	sub    $0xc,%esp
 141:	ff 75 08             	pushl  0x8(%ebp)
 144:	e8 fc ff ff ff       	call   145 <encode_1+0xd>
			145: R_386_PC32	strlen
 149:	83 c4 10             	add    $0x10,%esp
 14c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 14f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 156:	eb 56                	jmp    1ae <encode_1+0x76>
 158:	8b 55 f4             	mov    -0xc(%ebp),%edx
 15b:	8b 45 08             	mov    0x8(%ebp),%eax
 15e:	01 c2                	add    %eax,%edx
 160:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	01 c8                	add    %ecx,%eax
 168:	0f b6 00             	movzbl (%eax),%eax
 16b:	0f be c0             	movsbl %al,%eax
 16e:	0f b6 88 60 00 00 00 	movzbl 0x60(%eax),%ecx
			172: R_386_32	.rodata
 175:	a1 b4 00 00 00       	mov    0xb4,%eax
			176: R_386_32	.data
 17a:	31 c8                	xor    %ecx,%eax
 17c:	83 e0 7f             	and    $0x7f,%eax
 17f:	88 02                	mov    %al,(%edx)
 181:	8b 55 f4             	mov    -0xc(%ebp),%edx
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	01 d0                	add    %edx,%eax
 189:	0f b6 00             	movzbl (%eax),%eax
 18c:	3c 1f                	cmp    $0x1f,%al
 18e:	7e 0f                	jle    19f <encode_1+0x67>
 190:	8b 55 f4             	mov    -0xc(%ebp),%edx
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	01 d0                	add    %edx,%eax
 198:	0f b6 00             	movzbl (%eax),%eax
 19b:	3c 7f                	cmp    $0x7f,%al
 19d:	75 0b                	jne    1aa <encode_1+0x72>
 19f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	01 d0                	add    %edx,%eax
 1a7:	c6 00 20             	movb   $0x20,(%eax)
 1aa:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 1b4:	7c a2                	jl     158 <encode_1+0x20>
 1b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1b9:	c9                   	leave  
 1ba:	c3                   	ret    

000001bb <do_phase>:
 1bb:	55                   	push   %ebp
 1bc:	89 e5                	mov    %esp,%ebp
 1be:	83 ec 08             	sub    $0x8,%esp
 1c1:	68 99 00 00 00       	push   $0x99
 1c6:	e8 fc ff ff ff       	call   1c7 <do_phase+0xc>
			1c7: R_386_PC32	generate_code
 1cb:	83 c4 04             	add    $0x4,%esp
 1ce:	a1 b8 00 00 00       	mov    0xb8,%eax
			1cf: R_386_32	.data
 1d3:	83 ec 0c             	sub    $0xc,%esp
 1d6:	68 00 00 00 00       	push   $0x0
			1d7: R_386_32	gdlSdyLK
 1db:	ff d0                	call   *%eax
 1dd:	83 c4 10             	add    $0x10,%esp
 1e0:	83 ec 0c             	sub    $0xc,%esp
 1e3:	68 00 00 00 00       	push   $0x0
			1e4: R_386_32	gdlSdyLK
 1e8:	e8 fc ff ff ff       	call   1e9 <do_phase+0x2e>
			1e9: R_386_PC32	puts
 1ed:	83 c4 10             	add    $0x10,%esp
 1f0:	90                   	nop
 1f1:	c9                   	leave  
 1f2:	c3                   	ret    
