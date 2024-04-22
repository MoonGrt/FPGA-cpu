
li r1 0x04
li r2 0xff
slli r2 0 8
li r2 0x40
0000000000000000
lw r4 r2 0
sw r4 r3 0
addi r3 x x1
beq r1 r3 next
0000000000000000
li r6 0x03
sub r1 r2
sub r2 r3
sub r3 r3
sub r4 r4


(f0)addi r3 x 1
sub ad ad x0
(f1)addi r4 x 1
lw a ad 0
li ad 0x01
lw b ad 0
blt a b (f3)
subi ad x 1
sw b ad 0
li ad 0x01
sw a ad 0
(f3)blt r4 r6 (f1)
sub r4 r4 x0
blt r3 r6 (f0)
//r5-ad r6=3 r1=a r2=b r3=i r4=j//
sub r3 r3 x0
li ad2 0xff
slli ad2 0 8
li ad2 0x20
sub r1 r1 x0
sub ad ad x0


lw r1 ad x0
lw r2 ad x1
slli x 0 8
add r1 r2 x0
sw x ad2 x0
lw x ad x2
lw y ad x3
slli x 0 8
add x y x0
sw x ad2 0
