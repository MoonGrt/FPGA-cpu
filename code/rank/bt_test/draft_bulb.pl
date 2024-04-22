memory_initialization_radix=2;
memory_initialization_vector=
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
sub r1 r1
sub r2 r2
sub r3 r3
sub r4 r4
___________以上和bt_led一样___________
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