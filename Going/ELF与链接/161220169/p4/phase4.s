
phase4.o:     file format elf32-i386


Disassembly of section .text:

00000000 <YDnqxKzKHG>:
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
  11:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  16:	5d                   	pop    %ebp
  17:	c3                   	ret    

00000018 <do_phase>:
  18:	55                   	push   %ebp
  19:	89 e5                	mov    %esp,%ebp
  1b:	83 ec 28             	sub    $0x28,%esp
  1e:	c7 45 e6 54 44 4f 53 	movl   $0x534f4454,-0x1a(%ebp)
  25:	c7 45 ea 41 47 59 4e 	movl   $0x4e594741,-0x16(%ebp)
  2c:	66 c7 45 ee 55 00    	movw   $0x55,-0x12(%ebp)
  32:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  39:	e9 e0 00 00 00       	jmp    11e <do_phase+0x106>
  3e:	8d 55 e6             	lea    -0x1a(%ebp),%edx
  41:	8b 45 f0             	mov    -0x10(%ebp),%eax
  44:	01 d0                	add    %edx,%eax
  46:	0f b6 00             	movzbl (%eax),%eax
  49:	88 45 f7             	mov    %al,-0x9(%ebp)
  4c:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  50:	83 e8 41             	sub    $0x41,%eax
  53:	83 f8 19             	cmp    $0x19,%eax
  56:	0f 87 b0 00 00 00    	ja     10c <do_phase+0xf4>
  5c:	8b 04 85 00 00 00 00 	mov    0x0(,%eax,4),%eax
  63:	ff e0                	jmp    *%eax
  65:	c6 45 f7 53          	movb   $0x53,-0x9(%ebp)
  69:	e9 9e 00 00 00       	jmp    10c <do_phase+0xf4>
  6e:	c6 45 f7 65          	movb   $0x65,-0x9(%ebp)
  72:	e9 95 00 00 00       	jmp    10c <do_phase+0xf4>
  77:	c6 45 f7 47          	movb   $0x47,-0x9(%ebp)
  7b:	e9 8c 00 00 00       	jmp    10c <do_phase+0xf4>
  80:	c6 45 f7 44          	movb   $0x44,-0x9(%ebp)
  84:	e9 83 00 00 00       	jmp    10c <do_phase+0xf4>
  89:	c6 45 f7 31          	movb   $0x31,-0x9(%ebp)
  8d:	eb 7d                	jmp    10c <do_phase+0xf4>
  8f:	c6 45 f7 40          	movb   $0x40,-0x9(%ebp)
  93:	eb 77                	jmp    10c <do_phase+0xf4>
  95:	c6 45 f7 62          	movb   $0x62,-0x9(%ebp)
  99:	eb 71                	jmp    10c <do_phase+0xf4>
  9b:	c6 45 f7 6e          	movb   $0x6e,-0x9(%ebp)
  9f:	eb 6b                	jmp    10c <do_phase+0xf4>
  a1:	c6 45 f7 39          	movb   $0x39,-0x9(%ebp)
  a5:	eb 65                	jmp    10c <do_phase+0xf4>
  a7:	c6 45 f7 7a          	movb   $0x7a,-0x9(%ebp)
  ab:	eb 5f                	jmp    10c <do_phase+0xf4>
  ad:	c6 45 f7 35          	movb   $0x35,-0x9(%ebp)
  b1:	eb 59                	jmp    10c <do_phase+0xf4>
  b3:	c6 45 f7 7c          	movb   $0x7c,-0x9(%ebp)
  b7:	eb 53                	jmp    10c <do_phase+0xf4>
  b9:	c6 45 f7 30          	movb   $0x30,-0x9(%ebp)
  bd:	eb 4d                	jmp    10c <do_phase+0xf4>
  bf:	c6 45 f7 33          	movb   $0x33,-0x9(%ebp)
  c3:	eb 47                	jmp    10c <do_phase+0xf4>
  c5:	c6 45 f7 37          	movb   $0x37,-0x9(%ebp)
  c9:	eb 41                	jmp    10c <do_phase+0xf4>
  cb:	c6 45 f7 4d          	movb   $0x4d,-0x9(%ebp)
  cf:	eb 3b                	jmp    10c <do_phase+0xf4>
  d1:	c6 45 f7 6f          	movb   $0x6f,-0x9(%ebp)
  d5:	eb 35                	jmp    10c <do_phase+0xf4>
  d7:	c6 45 f7 46          	movb   $0x46,-0x9(%ebp)
  db:	eb 2f                	jmp    10c <do_phase+0xf4>
  dd:	c6 45 f7 7e          	movb   $0x7e,-0x9(%ebp)
  e1:	eb 29                	jmp    10c <do_phase+0xf4>
  e3:	c6 45 f7 36          	movb   $0x36,-0x9(%ebp)
  e7:	eb 23                	jmp    10c <do_phase+0xf4>
  e9:	c6 45 f7 7b          	movb   $0x7b,-0x9(%ebp)
  ed:	eb 1d                	jmp    10c <do_phase+0xf4>
  ef:	c6 45 f7 38          	movb   $0x38,-0x9(%ebp)
  f3:	eb 17                	jmp    10c <do_phase+0xf4>
  f5:	c6 45 f7 32          	movb   $0x32,-0x9(%ebp)
  f9:	eb 11                	jmp    10c <do_phase+0xf4>
  fb:	c6 45 f7 72          	movb   $0x72,-0x9(%ebp)
  ff:	eb 0b                	jmp    10c <do_phase+0xf4>
 101:	c6 45 f7 3a          	movb   $0x3a,-0x9(%ebp)
 105:	eb 05                	jmp    10c <do_phase+0xf4>
 107:	c6 45 f7 34          	movb   $0x34,-0x9(%ebp)
 10b:	90                   	nop
 10c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 10f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 112:	01 c2                	add    %eax,%edx
 114:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
 118:	88 02                	mov    %al,(%edx)
 11a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 11e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 121:	83 f8 08             	cmp    $0x8,%eax
 124:	0f 86 14 ff ff ff    	jbe    3e <do_phase+0x26>
 12a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 12d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 130:	01 d0                	add    %edx,%eax
 132:	c6 00 00             	movb   $0x0,(%eax)
 135:	83 ec 0c             	sub    $0xc,%esp
 138:	8d 45 dc             	lea    -0x24(%ebp),%eax
 13b:	50                   	push   %eax
 13c:	e8 fc ff ff ff       	call   13d <do_phase+0x125>
 141:	83 c4 10             	add    $0x10,%esp
 144:	90                   	nop
 145:	c9                   	leave  
 146:	c3                   	ret    
