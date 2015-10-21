;;Elan van Biljon - 18384439
.global _calculate

_calculate:

movw hl, sp						;;get stack pointer
mov a, [hl + 4]					;;put the operand in a so that we can determine what operand it is

cmp a, #'+'						;;check if it is a '+'
bz $addition					;;if it is branch to the block of code that handles addition

cmp a, #'-'						;;check if it is a '-'
bz $subtraction					;;if it is branch to the block of code that handles subtraction

cmp a, #'*'						;;check if it is a '*'
bz $multiplication				;;if it is branch to the block of code that handles multiplication
br $end							;;if it is none of the supported operands branch to end

addition:
movw ax, [hl + 6]				;;get the first number and store it in ax
addw ax, [hl + 8]				;;add the second number to the first
br $setReturnValue

subtraction:
movw ax, [hl + 6]				;;get the first number and store it in ax
subw ax, [hl + 8]				;;subtract the second number from the first
br $setReturnValue

multiplication:
mov a, [hl + 6]					;;get the first number and store it in a
mov x, a						;;move it form a to x
mov a, [hl + 8]					;;store the second number in x
mulu x							;;multiply the second number by the first and store it in ax
br $setReturnValue

setReturnValue:
movw 0xFFEF0, ax				;;stores the result in R0 in the first memory bank

end:
ret
