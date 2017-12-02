
phase4.o:     file format elf32-i386


Disassembly of section .text:

00000000 <czvrykivxh>:
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
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1f:	5d                   	pop    %ebp
  20:	c3                   	ret    

00000021 <do_phase>:
  21:	55                   	push   %ebp
  22:	89 e5                	mov    %esp,%ebp
  24:	83 ec 28             	sub    $0x28,%esp
  27:	c7 45 e6 4a 4e 51 47 	movl   $0x47514e4a,-0x1a(%ebp)
  2e:	c7 45 ea 45 46 52 4c 	movl   $0x4c524645,-0x16(%ebp)
  35:	66 c7 45 ee 59 00    	movw   $0x59,-0x12(%ebp)
  3b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  42:	e9 e0 00 00 00       	jmp    127 <do_phase+0x106>
  47:	8d 55 e6             	lea    -0x1a(%ebp),%edx
  4a:	8b 45 f0             	mov    -0x10(%ebp),%eax
  4d:	01 d0                	add    %edx,%eax
  4f:	0f b6 00             	movzbl (%eax),%eax
  52:	88 45 f7             	mov    %al,-0x9(%ebp)
  55:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  59:	83 e8 41             	sub    $0x41,%eax
  5c:	83 f8 19             	cmp    $0x19,%eax
  5f:	0f 87 b0 00 00 00    	ja     115 <do_phase+0xf4>
  65:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  6c:	ff e0                	jmp    *%eax
  6e:	c6 45 f7 47          	movb   $0x47,-0x9(%ebp)
  72:	e9 9e 00 00 00       	jmp    115 <do_phase+0xf4>
  77:	c6 45 f7 56          	movb   $0x56,-0x9(%ebp)
  7b:	e9 95 00 00 00       	jmp    115 <do_phase+0xf4>
  80:	c6 45 f7 33          	movb   $0x33,-0x9(%ebp)
  84:	e9 8c 00 00 00       	jmp    115 <do_phase+0xf4>
  89:	c6 45 f7 5a          	movb   $0x5a,-0x9(%ebp)
  8d:	e9 83 00 00 00       	jmp    115 <do_phase+0xf4>
  92:	c6 45 f7 31          	movb   $0x31,-0x9(%ebp)
  96:	eb 7d                	jmp    115 <do_phase+0xf4>
  98:	c6 45 f7 3d          	movb   $0x3d,-0x9(%ebp)
  9c:	eb 77                	jmp    115 <do_phase+0xf4>
  9e:	c6 45 f7 7b          	movb   $0x7b,-0x9(%ebp)
  a2:	eb 71                	jmp    115 <do_phase+0xf4>
  a4:	c6 45 f7 76          	movb   $0x76,-0x9(%ebp)
  a8:	eb 6b                	jmp    115 <do_phase+0xf4>
  aa:	c6 45 f7 32          	movb   $0x32,-0x9(%ebp)
  ae:	eb 65                	jmp    115 <do_phase+0xf4>
  b0:	c6 45 f7 6a          	movb   $0x6a,-0x9(%ebp)
  b4:	eb 5f                	jmp    115 <do_phase+0xf4>
  b6:	c6 45 f7 55          	movb   $0x55,-0x9(%ebp)
  ba:	eb 59                	jmp    115 <do_phase+0xf4>
  bc:	c6 45 f7 35          	movb   $0x35,-0x9(%ebp)
  c0:	eb 53                	jmp    115 <do_phase+0xf4>
  c2:	c6 45 f7 52          	movb   $0x52,-0x9(%ebp)
  c6:	eb 4d                	jmp    115 <do_phase+0xf4>
  c8:	c6 45 f7 4e          	movb   $0x4e,-0x9(%ebp)
  cc:	eb 47                	jmp    115 <do_phase+0xf4>
  ce:	c6 45 f7 66          	movb   $0x66,-0x9(%ebp)
  d2:	eb 41                	jmp    115 <do_phase+0xf4>
  d4:	c6 45 f7 36          	movb   $0x36,-0x9(%ebp)
  d8:	eb 3b                	jmp    115 <do_phase+0xf4>
  da:	c6 45 f7 7c          	movb   $0x7c,-0x9(%ebp)
  de:	eb 35                	jmp    115 <do_phase+0xf4>
  e0:	c6 45 f7 67          	movb   $0x67,-0x9(%ebp)
  e4:	eb 2f                	jmp    115 <do_phase+0xf4>
  e6:	c6 45 f7 3c          	movb   $0x3c,-0x9(%ebp)
  ea:	eb 29                	jmp    115 <do_phase+0xf4>
  ec:	c6 45 f7 38          	movb   $0x38,-0x9(%ebp)
  f0:	eb 23                	jmp    115 <do_phase+0xf4>
  f2:	c6 45 f7 37          	movb   $0x37,-0x9(%ebp)
  f6:	eb 1d                	jmp    115 <do_phase+0xf4>
  f8:	c6 45 f7 34          	movb   $0x34,-0x9(%ebp)
  fc:	eb 17                	jmp    115 <do_phase+0xf4>
  fe:	c6 45 f7 69          	movb   $0x69,-0x9(%ebp)
 102:	eb 11                	jmp    115 <do_phase+0xf4>
 104:	c6 45 f7 5d          	movb   $0x5d,-0x9(%ebp)
 108:	eb 0b                	jmp    115 <do_phase+0xf4>
 10a:	c6 45 f7 39          	movb   $0x39,-0x9(%ebp)
 10e:	eb 05                	jmp    115 <do_phase+0xf4>
 110:	c6 45 f7 30          	movb   $0x30,-0x9(%ebp)
 114:	90                   	nop
 115:	8d 55 dc             	lea    -0x24(%ebp),%edx
 118:	8b 45 f0             	mov    -0x10(%ebp),%eax
 11b:	01 c2                	add    %eax,%edx
 11d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 121:	88 02                	mov    %al,(%edx)
 123:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 127:	8b 45 f0             	mov    -0x10(%ebp),%eax
 12a:	83 f8 08             	cmp    $0x8,%eax
 12d:	0f 86 14 ff ff ff    	jbe    47 <do_phase+0x26>
 133:	8d 55 dc             	lea    -0x24(%ebp),%edx
 136:	8b 45 f0             	mov    -0x10(%ebp),%eax
 139:	01 d0                	add    %edx,%eax
 13b:	c6 00 00             	movb   $0x0,(%eax)
 13e:	83 ec 0c             	sub    $0xc,%esp
 141:	8d 45 dc             	lea    -0x24(%ebp),%eax
 144:	50                   	push   %eax
 145:	e8 fc ff ff ff       	call   146 <do_phase+0x125>
 14a:	83 c4 10             	add    $0x10,%esp
 14d:	90                   	nop
 14e:	c9                   	leave  
 14f:	c3                   	ret    
