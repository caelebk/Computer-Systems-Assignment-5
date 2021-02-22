.pos 0x1000
S1:              ld   $i, r0              # r0 = &i
                 ld   0x0(r0), r0         # r0 = i
                 ld   $a, r1              # r1 = &a
                 ld   0x0(r1), r1         # r1 = a = &d0
                 ld   0x0(r1), r1         # r1 = d0 = &d1 = a->x
                 ld   (r1, r0, 4), r2     # r2  = *(d0+i) |a-> x[i]
                 ld   $v0, r3             # r3 = &v0
                 st   r2, 0x0(r3)         # v0 = *(d0 + i) | a->x[i]
S2:              ld   $i, r0              # r0 = &i
                 ld   0x0(r0), r0         # r0 = i
                 ld   $a, r1              # r1 = &a
                 ld   0x0(r1), r1         # r1 = a = &d0
                 inca r1                  # r1 = d0 + 4 | a->b.y;
                 ld   (r1, r0, 4), r2     # r2 = *(d0 + 1 + i) | a->b.y[i];
                 ld   $v1, r3             # r3 = &v1
                 st   r2, 0x0(r3)         # v1 = *(d0 + 1 + i) | a->b.y[i];
S3:              ld   $i, r0              # r0 = &i
                 ld   0x0(r0), r0         # r0 = i
                 ld   $a, r1              # r1 = &a
                 ld   0x0(r1), r1         # r1 = a = &d0
                 ld   0x14(r1), r1        # r1 = *(d0 + 20) = &d2 | a->b.a;
                 ld   0x0(r1), r1         # r1 = *(d2) = &d3 | a->b.a->x;
                 ld   (r1, r0, 4), r2     # r2 = r1 + 4*i = *(d3 + i) | a->b.a->x[i];
                 ld   $v2, r3             # r3 = &v2
                 st   r2, 0x0(r3)         # v2 = *(d3 + i) | a->b.a->x[i];
S4:              ld   $a, r1              # r1 = &a
                 ld   0x0(r1), r1         # r1 = a = &d0
                 st   r1, 0x14(r1)        # *(d0 + 20) = d0 | a->b.a = a;
S5:              ld   $i, r0              # r0 = &i
                 ld   0x0(r0), r0         # r0 = i
                 ld   $a, r1              # r1 = &a
                 ld   0x0(r1), r1         # r1 = a = &d0
                 ld   0x14(r1), r1        # r1 = *(d0+20) = &d0 | a->b.a;
                 inca r1                  # r1 = r1 +4 = &d0 + 4 | a->b.a->b.y;
                 ld   (r1, r0, 4), r2     # r2 = *(r1 + i *4) = *(d0 +1 + i) | a->b.a->b.y[i]
                 ld   $v3, r3             # r3 = &v3
                 st   r2, 0x0(r3)         # v3 = *(d0 +1 + i) = a->b.a->b.y[i];
                 halt                     
.pos 0x2000
i:               .long 0x1                # # Globals
v0:              .long 0xb                
v1:              .long 0x15               
v2:              .long 0x1f               
v3:              .long 0x15               
a:               .long 0x3000             
.pos 0x3000
d0:              .long 0x3030             # # Heap (these labels represent dynamic values and are thus not available to code)
                 .long 0x14               
                 .long 0x15               
                 .long 0x16               
                 .long 0x17               
                 .long 0x3018             # *a
d2:              .long 0x3040             
                 .long 0x28               
                 .long 0x29               
                 .long 0x2a               
                 .long 0x2b               
                 .long 0x0                
d1:              .long 0xa                # #x
                 .long 0xb                
                 .long 0xc                
                 .long 0xd                
d3:              .long 0x1e               
                 .long 0x1f               
                 .long 0x20               
                 .long 0x21               
