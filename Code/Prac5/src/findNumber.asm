;;Elan van Biljon - 18384439
.global _find_number
.global _populate_addresses

_populate_addresses:
movw hl, sp
mov a, [hl + 8]
add a, #30H
mov c, a
movw ax, [hl + 6]
movw de, ax
movw ax, [hl + 4]
movw hl, ax

clrb b

change:
inc b
mov a, c
mov x, a
mov a, #0
movw [hl], ax
incw hl

movw ax, de
cmpw ax, hl
bh $change
bz $change
br $end2

end2:
mov a, b
;;mov 0xFFEF0, a
mov x, a
mov a, #0
movw 0xFFEF0, ax

ret

_find_number:
movw hl, sp
mov a, [hl + 8]
sub a, #30H
mov c, a
movw ax, [hl + 6]
movw de, ax
movw ax, [hl + 4]
movw hl, ax							;;I forgot the W

clrb b

check_value:
mov a, c
cmp a, [hl]
bz $count

continue:
incw hl
movw ax, de
cmpw ax, hl							;;I forgot the W
bh $check_value
bz $check_value
br $end

count:
inc b
br $continue

end:
mov a, b
;;mov 0xFFEF0, a
mov x, a
mov a, #0
movw 0xFFEF0, ax
ret
