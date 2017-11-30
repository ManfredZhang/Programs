
phase2.o:     file format elf32-i386


Disassembly of section .text:

00000000 <vrjqLgNJjW>:
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
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  22:	5d                   	pop    %ebp
  23:	c3                   	ret    

00000024 <SnLHPJDszf>:
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	83 ec 38             	sub    $0x38,%esp
  2a:	c7 45 ce 76 76 59 32 	movl   $0x32597676,-0x32(%ebp)
  31:	c7 45 d2 34 69 51 30 	movl   $0x30516934,-0x2e(%ebp)
  38:	c7 45 d6 49 59 4b 76 	movl   $0x764b5949,-0x2a(%ebp)
  3f:	c7 45 da 48 62 6d 37 	movl   $0x376d6248,-0x26(%ebp)
  46:	c7 45 de 46 41 6a 71 	movl   $0x716a4146,-0x22(%ebp)
  4d:	c7 45 e2 49 66 6a 78 	movl   $0x786a6649,-0x1e(%ebp)
  54:	c7 45 e6 34 30 41 49 	movl   $0x49413034,-0x1a(%ebp)
  5b:	c7 45 ea 6a 30 37 65 	movl   $0x6537306a,-0x16(%ebp)
  62:	c7 45 ee 74 68 7a 36 	movl   $0x367a6874,-0x12(%ebp)
  69:	66 c7 45 f2 53 00    	movw   $0x53,-0xe(%ebp)
  6f:	83 ec 0c             	sub    $0xc,%esp
  72:	8d 45 ce             	lea    -0x32(%ebp),%eax
  75:	50                   	push   %eax
  76:	e8 fc ff ff ff       	call   77 <SnLHPJDszf+0x53>
  7b:	83 c4 10             	add    $0x10,%esp
  7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  81:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  85:	78 15                	js     9c <SnLHPJDszf+0x78>
  87:	8b 45 08             	mov    0x8(%ebp),%eax
  8a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  8d:	7d 0d                	jge    9c <SnLHPJDszf+0x78>
  8f:	8d 55 ce             	lea    -0x32(%ebp),%edx
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	01 d0                	add    %edx,%eax
  97:	0f b6 00             	movzbl (%eax),%eax
  9a:	eb 05                	jmp    a1 <SnLHPJDszf+0x7d>
  9c:	b8 00 00 00 00       	mov    $0x0,%eax
  a1:	c9                   	leave  
  a2:	c3                   	ret    

000000a3 <QvrqHyZu>:
  a3:	55                   	push   %ebp
  a4:	89 e5                	mov    %esp,%ebp
  a6:	83 ec 18             	sub    $0x18,%esp
  a9:	c7 45 ee 31 36 31 32 	movl   $0x32313631,-0x12(%ebp)
  b0:	c7 45 f2 32 30 31 36 	movl   $0x36313032,-0xe(%ebp)
  b7:	66 c7 45 f6 39 00    	movw   $0x39,-0xa(%ebp)
  bd:	83 ec 08             	sub    $0x8,%esp
  c0:	8d 45 ee             	lea    -0x12(%ebp),%eax
  c3:	50                   	push   %eax
  c4:	ff 75 08             	pushl  0x8(%ebp)
  c7:	e8 fc ff ff ff       	call   c8 <QvrqHyZu+0x25>
  cc:	83 c4 10             	add    $0x10,%esp
  cf:	85 c0                	test   %eax,%eax
  d1:	75 10                	jne    e3 <QvrqHyZu+0x40>
  d3:	83 ec 0c             	sub    $0xc,%esp
  d6:	ff 75 08             	pushl  0x8(%ebp)
  d9:	e8 fc ff ff ff       	call   da <QvrqHyZu+0x37>
  de:	83 c4 10             	add    $0x10,%esp
  e1:	eb 01                	jmp    e4 <QvrqHyZu+0x41>
  e3:	90                   	nop
  e4:	c9                   	leave  
  e5:	c3                   	ret    

000000e6 <do_phase>:
  e6:	55                   	push   %ebp
  e7:	89 e5                	mov    %esp,%ebp
  e9:	89 e8                	mov    %ebp,%eax
  eb:	83 e8 1e             	sub    $0x1e,%eax
  ee:	90                   	nop  0xbfffee28 0xbfffee0e
  ef:	90                   	nop
  f0:	90                   	nop
  f1:	50                   	push   %eax
  f2:	90                   	nop
  f3:	90                   	nop
  f4:	90                   	nop
  f5:	90                   	nop
  f6:	e8 a8 ff ff ff       	call   a3 <QvrqHyZu>
  fb:	83 c4 04             	add    $0x4,%esp
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
 114:	90                   	nop
 115:	90                   	nop
 116:	90                   	nop
 117:	90                   	nop
 118:	90                   	nop
 119:	90                   	nop
 11a:	90                   	nop
 11b:	90                   	nop
 11c:	90                   	nop
 11d:	90                   	nop
 11e:	90                   	nop
 11f:	90                   	nop
 120:	90                   	nop
 121:	90                   	nop
 122:	90                   	nop
 123:	90                   	nop
 124:	90                   	nop
 125:	90                   	nop
 126:	90                   	nop
 127:	90                   	nop
 128:	90                   	nop
 129:	90                   	nop
 12a:	5d                   	pop    %ebp
 12b:	c3                   	ret    
