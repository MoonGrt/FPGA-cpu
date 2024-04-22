memory_initialization_radix=2;
memory_initialization_vector=
li r6 0x03
li r1 0x00
addi r2 x 9
sw r2 r1 0
li r1 0x01
subi r2 0 1
sw r2 r1 0
li r1 0x01
subi r2 0 1
sw r2 r1 0
li r1 0x01
subi r2 0 1
sw r2 r1 0
sub r1 r1
sub r2 r2
___________以下和bt_led一样___________
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
//r5-ad r6=4 r1=a r2=b r3=i r4=j//
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
___________以上和bt_led一样___________