;;Elan van Biljon - 18384439
.global _generate_checksum

_generate_checksum:

movw hl, sp					;;get the location of the first character
movw ax, [hl + 4]
movw hl, ax

mov b, #0					;;set counter to 0
mov c, #0					;;set sub total to 0
mov x, #8					;;set the multiplier to 8

loop:
mov a, b					;;move b to a
cmp a, #8					;;compar the counter to 8
bz $setReturn				;;if it is 8 then go to the serReturn
mov a, [hl + b]				;;get the number (in ASCII)
sub a, #30H					;;convert it to its hex value
mulu x						;;multiply it with x and store in ax
mov a, x					;;move the answer of the multiplication to a (this will always fit as the the highest possibe number is 9x7=63
add a, c					;;add the answer to the multiplication to the subtotal
mov c, a					;;move the answer back to c
inc b						;;increment b
mov a, #8					;;the next few lines are to recalculate the multiplier
sub a, b
mov x, a
br $loop					;;loop back


setReturn:
mov a, c					;;move the total to a
mov x, a					;;move a to x
mov a, #0					;;clear a
movw 0xFFEF0, ax			;;return the total now stored in ax

ret