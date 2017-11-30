
xzmphase2.o:     file format elf32-i386


Disassembly of section .text:

00000000 <EdKFdkdqtr>:
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop
  10:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  15:	5d                   	pop    %ebp
  16:	c3                   	ret    

00000017 <nVVeeVJLtT>:
  17:	55                   	push   %ebp
  18:	89 e5                	mov    %esp,%ebp
  1a:	57                   	push   %edi
  1b:	56                   	push   %esi
  1c:	53                   	push   %ebx
  1d:	83 ec 5c             	sub    $0x5c,%esp
  20:	8d 45 a3             	lea    -0x5d(%ebp),%eax
  23:	bb 00 00 00 00       	mov    $0x0,%ebx
  28:	ba 41 00 00 00       	mov    $0x41,%edx
  2d:	8b 0b                	mov    (%ebx),%ecx
  2f:	89 08                	mov    %ecx,(%eax)
  31:	8b 4c 13 fc          	mov    -0x4(%ebx,%edx,1),%ecx
  35:	89 4c 10 fc          	mov    %ecx,-0x4(%eax,%edx,1)
  39:	8d 78 04             	lea    0x4(%eax),%edi
  3c:	83 e7 fc             	and    $0xfffffffc,%edi
  3f:	29 f8                	sub    %edi,%eax
  41:	29 c3                	sub    %eax,%ebx
  43:	01 c2                	add    %eax,%edx
  45:	83 e2 fc             	and    $0xfffffffc,%edx
  48:	89 d0                	mov    %edx,%eax
  4a:	c1 e8 02             	shr    $0x2,%eax
  4d:	89 de                	mov    %ebx,%esi
  4f:	89 c1                	mov    %eax,%ecx
  51:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  53:	83 ec 0c             	sub    $0xc,%esp
  56:	8d 45 a3             	lea    -0x5d(%ebp),%eax
  59:	50                   	push   %eax
  5a:	e8 fc ff ff ff       	call   5b <nVVeeVJLtT+0x44>
  5f:	83 c4 10             	add    $0x10,%esp
  62:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  65:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  69:	78 15                	js     80 <nVVeeVJLtT+0x69>
  6b:	8b 45 08             	mov    0x8(%ebp),%eax
  6e:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  71:	7d 0d                	jge    80 <nVVeeVJLtT+0x69>
  73:	8d 55 a3             	lea    -0x5d(%ebp),%edx
  76:	8b 45 08             	mov    0x8(%ebp),%eax
  79:	01 d0                	add    %edx,%eax
  7b:	0f b6 00             	movzbl (%eax),%eax
  7e:	eb 05                	jmp    85 <nVVeeVJLtT+0x6e>
  80:	b8 00 00 00 00       	mov    $0x0,%eax
  85:	8d 65 f4             	lea    -0xc(%ebp),%esp
  88:	5b                   	pop    %ebx
  89:	5e                   	pop    %esi
  8a:	5f                   	pop    %edi
  8b:	5d                   	pop    %ebp
  8c:	c3                   	ret    

0000008d <nUWhHsBO>:
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	83 ec 18             	sub    $0x18,%esp
  93:	c7 45 ee 31 36 31 31 	movl   $0x31313631,-0x12(%ebp)
  9a:	c7 45 f2 38 30 31 36 	movl   $0x36313038,-0xe(%ebp)
  a1:	66 c7 45 f6 32 00    	movw   $0x32,-0xa(%ebp)
  a7:	83 ec 08             	sub    $0x8,%esp
  aa:	8d 45 ee             	lea    -0x12(%ebp),%eax
  ad:	50                   	push   %eax
  ae:	ff 75 08             	pushl  0x8(%ebp)
  b1:	e8 fc ff ff ff       	call   b2 <nUWhHsBO+0x25>
  b6:	83 c4 10             	add    $0x10,%esp
  b9:	85 c0                	test   %eax,%eax
  bb:	75 10                	jne    cd <nUWhHsBO+0x40>
  bd:	83 ec 0c             	sub    $0xc,%esp
  c0:	ff 75 08             	pushl  0x8(%ebp)
  c3:	e8 fc ff ff ff       	call   c4 <nUWhHsBO+0x37>
  c8:	83 c4 10             	add    $0x10,%esp
  cb:	eb 01                	jmp    ce <nUWhHsBO+0x41>
  cd:	90                   	nop
  ce:	c9                   	leave  
  cf:	c3                   	ret    

000000d0 <do_phase>:
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	90                   	nop
  d4:	90                   	nop
  d5:	90                   	nop
  d6:	90                   	nop
  d7:	90                   	nop
  d8:	90                   	nop
  d9:	90                   	nop
  da:	90                   	nop
  db:	90                   	nop
  dc:	90                   	nop
  dd:	90                   	nop
  de:	90                   	nop
  df:	90                   	nop
  e0:	90                   	nop
  e1:	90                   	nop
  e2:	90                   	nop
  e3:	90                   	nop
  e4:	90                   	nop
  e5:	90                   	nop
  e6:	90                   	nop
  e7:	90                   	nop
  e8:	90                   	nop
  e9:	90                   	nop
  ea:	90                   	nop
  eb:	90                   	nop
  ec:	90                   	nop
  ed:	90                   	nop
  ee:	90                   	nop
  ef:	90                   	nop
  f0:	90                   	nop
  f1:	90                   	nop
  f2:	90                   	nop
  f3:	90                   	nop
  f4:	90                   	nop
  f5:	90                   	nop
  f6:	90                   	nop
  f7:	90                   	nop
  f8:	90                   	nop
  f9:	90                   	nop
  fa:	90                   	nop
  fb:	90                   	nop
  fc:	90                   	nop
  fd:	90                   	nop
  fe:	90                   	nop
  ff:	90                   	nop
 100:	90                   	nop
 101:	90                   	nop
 102:	90                   	nop
 103:	90                   	nop
 104:	90                   	nop
 105:	90                   	nop
 106:	90                   	nop
 107:	90                   	nop
 108:	90                   	nop
 109:	90                   	nop
 10a:	90                   	nop
 10b:	90                   	nop
 10c:	90                   	nop
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop
 110:	90                   	nop
 111:	90                   	nop
 112:	90                   	nop
 113:	90                   	nop
 114:	5d                   	pop    %ebp
 115:	c3                   	ret    
