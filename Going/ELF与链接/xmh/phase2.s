
phase2.o:     file format elf32-i386


Disassembly of section .text:

00000000 <helper>:
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
  1d:	90                   	nop
  1e:	90                   	nop
  1f:	90                   	nop
  20:	90                   	nop
  21:	b8 e7 00 00 00       	mov    $0xe7,%eax
  26:	5d                   	pop    %ebp
  27:	c3                   	ret    

00000028 <ciSTtWkC>:
  28:	55                   	push   %ebp
  29:	89 e5                	mov    %esp,%ebp
  2b:	83 ec 08             	sub    $0x8,%esp
  2e:	83 ec 0c             	sub    $0xc,%esp
  31:	68 00 00 00 00       	push   $0x0
  36:	e8 fc ff ff ff       	call   37 <ciSTtWkC+0xf>
  3b:	83 c4 10             	add    $0x10,%esp
  3e:	3b 45 08             	cmp    0x8(%ebp),%eax
  41:	74 02                	je     45 <ciSTtWkC+0x1d>
  43:	eb 10                	jmp    55 <ciSTtWkC+0x2d>
  45:	83 ec 0c             	sub    $0xc,%esp
  48:	68 00 00 00 00       	push   $0x0
  4d:	e8 fc ff ff ff       	call   4e <ciSTtWkC+0x26>
  52:	83 c4 10             	add    $0x10,%esp
  55:	c9                   	leave  
  56:	c3                   	ret    

00000057 <do_phase_2>:
  57:	55                   	push   %ebp
  58:	89 e5                	mov    %esp,%ebp
  5a:	68 a3 6f 03 09       	push   $0x9036fa3
  5f:	e8 c4 ff ff ff       	call   28 <ciSTtWkC>
  64:	83 c4 04             	add    $0x4,%esp
  67:	90                   	nop
  68:	90                   	nop
  69:	90                   	nop
  6a:	90                   	nop
  6b:	90                   	nop
  6c:	90                   	nop
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop
  70:	90                   	nop
  71:	90                   	nop
  72:	5d                   	pop    %ebp
  73:	c3                   	ret    
