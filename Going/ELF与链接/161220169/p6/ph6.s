
phase6.o:     file format elf32-i386


Disassembly of section .text:

00000000 <SnLHPJDszf>:
   0:	55                   	push   %ebp
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
			0: R_386_NONE	*ABS*
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 10             	sub    $0x10,%esp
   6:	e8 fc ff ff ff       	call   7 <SnLHPJDszf+0x7>
			7: R_386_PC32	__x86.get_pc_thunk.ax
   b:	05 01 00 00 00       	add    $0x1,%eax
			c: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
  10:	c7 45 f0 61 47 77 67 	movl   $0x67774761,-0x10(%ebp)
  17:	c7 45 f4 41 4b 73 6f 	movl   $0x6f734b41,-0xc(%ebp)
  1e:	c7 45 f8 45 53 54 00 	movl   $0x545345,-0x8(%ebp)
  25:	c7 45 fc 0c 00 00 00 	movl   $0xc,-0x4(%ebp)
  2c:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  30:	78 15                	js     47 <SnLHPJDszf+0x47>
  32:	8b 45 08             	mov    0x8(%ebp),%eax
  35:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  38:	7d 0d                	jge    47 <SnLHPJDszf+0x47>
  3a:	8d 55 f0             	lea    -0x10(%ebp),%edx
  3d:	8b 45 08             	mov    0x8(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	0f b6 00             	movzbl (%eax),%eax
  45:	eb 05                	jmp    4c <SnLHPJDszf+0x4c>
  47:	b8 00 00 00 00       	mov    $0x0,%eax
  4c:	c9                   	leave  
  4d:	c3                   	ret    

0000004e <transform_code>:
  4e:	55                   	push   %ebp
  4f:	89 e5                	mov    %esp,%ebp
  51:	e8 fc ff ff ff       	call   52 <transform_code+0x4>
			52: R_386_PC32	__x86.get_pc_thunk.ax
  56:	05 01 00 00 00       	add    $0x1,%eax
			57: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
  5b:	8b 55 0c             	mov    0xc(%ebp),%edx
  5e:	8b 94 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%edx
			61: R_386_GOTOFF	.rodata
  65:	83 e2 07             	and    $0x7,%edx
  68:	83 fa 07             	cmp    $0x7,%edx
  6b:	77 79                	ja     e6 <.L6>
  6d:	c1 e2 02             	shl    $0x2,%edx
  70:	8b 94 02 24 00 00 00 	mov    0x24(%edx,%eax,1),%edx
			73: R_386_GOTOFF	.rodata
  77:	01 c2                	add    %eax,%edx
  79:	ff e2                	jmp    *%edx

0000007b <.L7>:
  7b:	f7 55 08             	notl   0x8(%ebp)
  7e:	eb 6a                	jmp    ea <.L6+0x4>

00000080 <.L9>:
  80:	8b 55 0c             	mov    0xc(%ebp),%edx
  83:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			86: R_386_GOTOFF	.rodata
  8a:	83 e0 03             	and    $0x3,%eax
  8d:	89 c1                	mov    %eax,%ecx
  8f:	d3 7d 08             	sarl   %cl,0x8(%ebp)
  92:	eb 56                	jmp    ea <.L6+0x4>

00000094 <.L10>:
  94:	8b 55 0c             	mov    0xc(%ebp),%edx
  97:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
  9e:	f7 d0                	not    %eax
  a0:	21 45 08             	and    %eax,0x8(%ebp)
  a3:	eb 45                	jmp    ea <.L6+0x4>

000000a5 <.L11>:
  a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  a8:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			ab: R_386_GOTOFF	.rodata
  af:	c1 e0 08             	shl    $0x8,%eax
  b2:	09 45 08             	or     %eax,0x8(%ebp)
  b5:	eb 33                	jmp    ea <.L6+0x4>

000000b7 <.L12>:
  b7:	8b 55 0c             	mov    0xc(%ebp),%edx
  ba:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			bd: R_386_GOTOFF	.rodata
  c1:	31 45 08             	xor    %eax,0x8(%ebp)
  c4:	eb 24                	jmp    ea <.L6+0x4>

000000c6 <.L13>:
  c6:	8b 55 0c             	mov    0xc(%ebp),%edx
  c9:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
			cc: R_386_GOTOFF	.rodata
  d0:	f7 d0                	not    %eax
  d2:	09 45 08             	or     %eax,0x8(%ebp)
  d5:	eb 13                	jmp    ea <.L6+0x4>

000000d7 <.L14>:
  d7:	8b 55 0c             	mov    0xc(%ebp),%edx
  da:	8b 84 90 00 00 00 00 	mov    0x0(%eax,%edx,4),%eax
  e1:	01 45 08             	add    %eax,0x8(%ebp)
  e4:	eb 04                	jmp    ea <.L6+0x4>

000000e6 <.L6>:
  e6:	f7 5d 08             	negl   0x8(%ebp)
  e9:	90                   	nop
  ea:	8b 45 08             	mov    0x8(%ebp),%eax
  ed:	5d                   	pop    %ebp
  ee:	c3                   	ret    

000000ef <generate_code>:
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	53                   	push   %ebx
  f3:	83 ec 14             	sub    $0x14,%esp
  f6:	e8 fc ff ff ff       	call   f7 <generate_code+0x8>
  fb:	81 c3 02 00 00 00    	add    $0x2,%ebx
			fd: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 101:	8b 45 08             	mov    0x8(%ebp),%eax
 104:	89 83 a4 00 00 00    	mov    %eax,0xa4(%ebx)
			106: R_386_GOTOFF	.data
 10a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 111:	eb 1f                	jmp    132 <generate_code+0x43>
 113:	8b 83 a4 00 00 00    	mov    0xa4(%ebx),%eax
			115: R_386_GOTOFF	.data
 119:	83 ec 08             	sub    $0x8,%esp
 11c:	ff 75 f4             	pushl  -0xc(%ebp)
 11f:	50                   	push   %eax
 120:	e8 fc ff ff ff       	call   121 <generate_code+0x32>
 125:	83 c4 10             	add    $0x10,%esp
 128:	89 83 a4 00 00 00    	mov    %eax,0xa4(%ebx)
 12e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 132:	8b 45 f4             	mov    -0xc(%ebp),%eax
 135:	83 f8 08             	cmp    $0x8,%eax
 138:	76 d9                	jbe    113 <generate_code+0x24>
 13a:	90                   	nop
 13b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 13e:	c9                   	leave  
 13f:	c3                   	ret    

00000140 <encode_1>:
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	53                   	push   %ebx
 144:	83 ec 14             	sub    $0x14,%esp
 147:	e8 fc ff ff ff       	call   148 <encode_1+0x8>
			148: R_386_PC32	__x86.get_pc_thunk.bx
 14c:	81 c3 02 00 00 00    	add    $0x2,%ebx
			14e: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 152:	83 ec 0c             	sub    $0xc,%esp
 155:	ff 75 08             	pushl  0x8(%ebp)
 158:	e8 fc ff ff ff       	call   159 <encode_1+0x19>
			159: R_386_PLT32	strlen
 15d:	83 c4 10             	add    $0x10,%esp
 160:	89 45 f0             	mov    %eax,-0x10(%ebp)
 163:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 16a:	eb 58                	jmp    1c4 <encode_1+0x84>
 16c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 16f:	8b 45 08             	mov    0x8(%ebp),%eax
 172:	01 c2                	add    %eax,%edx
 174:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	01 c8                	add    %ecx,%eax
 17c:	0f b6 00             	movzbl (%eax),%eax
 17f:	0f be c0             	movsbl %al,%eax
 182:	0f b6 8c 03 60 00 00 	movzbl 0x60(%ebx,%eax,1),%ecx
 189:	00 
			186: R_386_GOTOFF	.rodata
 18a:	8b 83 a4 00 00 00    	mov    0xa4(%ebx),%eax
			18c: R_386_GOTOFF	.data
 190:	31 c8                	xor    %ecx,%eax
 192:	83 e0 7f             	and    $0x7f,%eax
 195:	88 02                	mov    %al,(%edx)
 197:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	01 d0                	add    %edx,%eax
 19f:	0f b6 00             	movzbl (%eax),%eax
 1a2:	3c 1f                	cmp    $0x1f,%al
 1a4:	7e 0f                	jle    1b5 <encode_1+0x75>
 1a6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1a9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ac:	01 d0                	add    %edx,%eax
 1ae:	0f b6 00             	movzbl (%eax),%eax
 1b1:	3c 7f                	cmp    $0x7f,%al
 1b3:	75 0b                	jne    1c0 <encode_1+0x80>
 1b5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1b8:	8b 45 08             	mov    0x8(%ebp),%eax
 1bb:	01 d0                	add    %edx,%eax
 1bd:	c6 00 20             	movb   $0x20,(%eax)
 1c0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 1c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c7:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 1ca:	7c a0                	jl     16c <encode_1+0x2c>
 1cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1cf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 1d2:	c9                   	leave  
 1d3:	c3                   	ret    

000001d4 <do_phase>:
 1d4:	55                   	push   %ebp
 1d5:	89 e5                	mov    %esp,%ebp
 1d7:	53                   	push   %ebx
 1d8:	83 ec 04             	sub    $0x4,%esp
 1db:	e8 fc ff ff ff       	call   1dc <do_phase+0x8>
 1e0:	81 c3 02 00 00 00    	add    $0x2,%ebx
			1e2: R_386_GOTPC	_GLOBAL_OFFSET_TABLE_
 1e6:	83 ec 0c             	sub    $0xc,%esp
 1e9:	68 e2 00 00 00       	push   $0xe2
 1ee:	e8 fc ff ff ff       	call   1ef <do_phase+0x1b>
 1f3:	83 c4 10             	add    $0x10,%esp
 1f6:	8b 83 00 00 00 00    	mov    0x0(%ebx),%eax
			1f8: R_386_GOTOFF	.data.rel.local
 1fc:	83 ec 0c             	sub    $0xc,%esp
 1ff:	8b 93 00 00 00 00    	mov    0x0(%ebx),%edx
			201: R_386_GOT32X	gdlSdyLK
 205:	52                   	push   %edx
 206:	ff d0                	call   *%eax
 208:	83 c4 10             	add    $0x10,%esp
 20b:	83 ec 0c             	sub    $0xc,%esp
 20e:	8b 83 00 00 00 00    	mov    0x0(%ebx),%eax
			210: R_386_GOT32X	gdlSdyLK
 214:	50                   	push   %eax
 215:	e8 fc ff ff ff       	call   216 <do_phase+0x42>
			216: R_386_PLT32	puts
 21a:	83 c4 10             	add    $0x10,%esp
 21d:	90                   	nop
 21e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
 221:	c9                   	leave  
 222:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

00000000 <__x86.get_pc_thunk.ax>:
   0:	8b 04 24             	mov    (%esp),%eax
   3:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

00000000 <__x86.get_pc_thunk.bx>:
   0:	8b 1c 24             	mov    (%esp),%ebx
   3:	c3                   	ret    
