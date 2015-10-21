;; Author: Elan van Biljon - 18384439
.global _adder2
.global _adder4

_adder2:

movw hl, sp
movw ax, [hl + 4]
addw ax, [hl + 6]
movw 0xFFEF0, ax

ret

_adder4:

movw hl, sp
movw ax, [hl + 4]
addw ax, [hl + 6]
addw ax, [hl + 8]
addw ax, [hl + 10]
movw 0xFFEF0, ax

ret
