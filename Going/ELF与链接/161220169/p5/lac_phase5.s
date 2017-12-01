
lac_phase5.o:     file format elf32-i386


Disassembly of section .text:

00000000 <qXFHGFZxHg>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 20             	sub    $0x20,%esp
   6:	c7 45 ec 46 61 56 73 	movl   $0x73566146,-0x14(%ebp)
   d:	c7 45 f0 56 64 63 76 	movl   $0x76636456,-0x10(%ebp)
  14:	c7 45 f4 50 4f 47 56 	movl   $0x56474f50,-0xc(%ebp)
  1b:	c7 45 f8 4f 50 6f 00 	movl   $0x6f504f,-0x8(%ebp)
  22:	c7 45 fc 10 00 00 00 	movl   $0x10,-0x4(%ebp)
  29:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  2d:	78 15                	js     44 <qXFHGFZxHg+0x44>
  2f:	8b 45 08             	mov    0x8(%ebp),%eax
  32:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  35:	7d 0d                	jge    44 <qXFHGFZxHg+0x44>
  37:	8d 55 ec             	lea    -0x14(%ebp),%edx
  3a:	8b 45 08             	mov    0x8(%ebp),%eax
  3d:	01 d0                	add    %edx,%eax
  3f:	0f b6 00             	movzbl (%eax),%eax
  42:	eb 05                	jmp    49 <qXFHGFZxHg+0x49>
  44:	b8 00 00 00 00       	mov    $0x0,%eax
  49:	c9                   	leave  
  4a:	c3                   	ret    

0000004b <transform_code>:
  4b:	55                   	push   %ebp
  4c:	89 e5                	mov    %esp,%ebp
  4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  51:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  58:	83 e0 07             	and    $0x7,%eax
  5b:	83 f8 07             	cmp    $0x7,%eax
  5e:	77 74                	ja     d4 <transform_code+0x89>
  60:	8b 04 85 3c 00 00 00 	mov    0x3c(,%eax,4),%eax
  67:	ff e0                	jmp    *%eax
  69:	f7 55 08             	notl   0x8(%ebp)
  6c:	eb 6a                	jmp    d8 <transform_code+0x8d>
  6e:	8b 45 0c             	mov    0xc(%ebp),%eax
  71:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  78:	83 e0 03             	and    $0x3,%eax
  7b:	89 c1                	mov    %eax,%ecx
  7d:	d3 7d 08             	sarl   %cl,0x8(%ebp)
  80:	eb 56                	jmp    d8 <transform_code+0x8d>
  82:	8b 45 0c             	mov    0xc(%ebp),%eax
  85:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  8c:	f7 d0                	not    %eax
  8e:	21 45 08             	and    %eax,0x8(%ebp)
  91:	eb 45                	jmp    d8 <transform_code+0x8d>
  93:	8b 45 0c             	mov    0xc(%ebp),%eax
  96:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  9d:	c1 e0 08             	shl    $0x8,%eax
  a0:	09 45 08             	or     %eax,0x8(%ebp)
  a3:	eb 33                	jmp    d8 <transform_code+0x8d>
  a5:	8b 45 0c             	mov    0xc(%ebp),%eax
  a8:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  af:	31 45 08             	xor    %eax,0x8(%ebp)
  b2:	eb 24                	jmp    d8 <transform_code+0x8d>
  b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  b7:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  be:	f7 d0                	not    %eax
  c0:	09 45 08             	or     %eax,0x8(%ebp)
  c3:	eb 13                	jmp    d8 <transform_code+0x8d>
  c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c8:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  cf:	01 45 08             	add    %eax,0x8(%ebp)
  d2:	eb 04                	jmp    d8 <transform_code+0x8d>
  d4:	f7 5d 08             	negl   0x8(%ebp)
  d7:	90                   	nop
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    

000000dd <generate_code>:
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	83 ec 10             	sub    $0x10,%esp
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	a3 c4 00 00 00       	mov    %eax,0xc4
  eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  f2:	eb 1a                	jmp    10e <generate_code+0x31>
  f4:	a1 c4 00 00 00       	mov    0xc4,%eax
  f9:	ff 75 fc             	pushl  -0x4(%ebp)
  fc:	50                   	push   %eax
  fd:	e8 fc ff ff ff       	call   fe <generate_code+0x21>
 102:	83 c4 08             	add    $0x8,%esp
 105:	a3 c4 00 00 00       	mov    %eax,0xc4
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 111:	83 f8 0e             	cmp    $0xe,%eax
 114:	76 de                	jbe    f4 <generate_code+0x17>
 116:	90                   	nop
 117:	c9                   	leave  
 118:	c3                   	ret    

00000119 <encode_1>:
 119:	55                   	push   %ebp
 11a:	89 e5                	mov    %esp,%ebp
 11c:	83 ec 18             	sub    $0x18,%esp
 11f:	83 ec 0c             	sub    $0xc,%esp
 122:	ff 75 08             	pushl  0x8(%ebp)
 125:	e8 fc ff ff ff       	call   126 <encode_1+0xd>
 12a:	83 c4 10             	add    $0x10,%esp
 12d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 130:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 137:	eb 56                	jmp    18f <encode_1+0x76>
 139:	8b 55 f4             	mov    -0xc(%ebp),%edx
 13c:	8b 45 08             	mov    0x8(%ebp),%eax
 13f:	01 c2                	add    %eax,%edx
 141:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 144:	8b 45 08             	mov    0x8(%ebp),%eax
 147:	01 c8                	add    %ecx,%eax
 149:	0f b6 00             	movzbl (%eax),%eax
 14c:	0f be c0             	movsbl %al,%eax
 14f:	0f b6 88 60 00 00 00 	movzbl 0x60(%eax),%ecx
 156:	a1 c4 00 00 00       	mov    0xc4,%eax
 15b:	31 c8                	xor    %ecx,%eax
 15d:	83 e0 7f             	and    $0x7f,%eax
 160:	88 02                	mov    %al,(%edx)
 162:	8b 55 f4             	mov    -0xc(%ebp),%edx
 165:	8b 45 08             	mov    0x8(%ebp),%eax
 168:	01 d0                	add    %edx,%eax
 16a:	0f b6 00             	movzbl (%eax),%eax
 16d:	3c 1f                	cmp    $0x1f,%al
 16f:	7e 0f                	jle    180 <encode_1+0x67>
 171:	8b 55 f4             	mov    -0xc(%ebp),%edx
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	01 d0                	add    %edx,%eax
 179:	0f b6 00             	movzbl (%eax),%eax
 17c:	3c 7f                	cmp    $0x7f,%al
 17e:	75 0b                	jne    18b <encode_1+0x72>
 180:	8b 55 f4             	mov    -0xc(%ebp),%edx
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	01 d0                	add    %edx,%eax
 188:	c6 00 20             	movb   $0x20,(%eax)
 18b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 18f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 192:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 195:	7c a2                	jl     139 <encode_1+0x20>
 197:	8b 45 f0             	mov    -0x10(%ebp),%eax
 19a:	c9                   	leave  
 19b:	c3                   	ret    

0000019c <do_phase>:
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 08             	sub    $0x8,%esp
 1a2:	68 82 00 00 00       	push   $0x82
 1a7:	e8 fc ff ff ff       	call   1a8 <do_phase+0xc>
 1ac:	83 c4 04             	add    $0x4,%esp
 1af:	a1 c8 00 00 00       	mov    0xc8,%eax
 1b4:	83 ec 0c             	sub    $0xc,%esp
 1b7:	68 00 00 00 00       	push   $0x0
 1bc:	ff d0                	call   *%eax
 1be:	83 c4 10             	add    $0x10,%esp
 1c1:	83 ec 0c             	sub    $0xc,%esp
 1c4:	68 00 00 00 00       	push   $0x0
 1c9:	e8 fc ff ff ff       	call   1ca <do_phase+0x2e>
 1ce:	83 c4 10             	add    $0x10,%esp
 1d1:	90                   	nop
 1d2:	c9                   	leave  
 1d3:	c3                   	ret    
