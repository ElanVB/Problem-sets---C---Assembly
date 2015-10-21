;;Elan van Biljon - 18384439
.global _bubble_sort

_bubble_sort: ;;this is technically selection sort (decending)

movw hl, sp							;;get the stack pointer
movw ax, [hl + 4]					;;get past the return space
movw hl, ax							;;store the position of first letter in hl so that it can be dereferenced

br $count							;;these branch statements and lables are quite unnesicary but if I move my blocks of code around it will be helpfull

count:								;;start of the block of code that counts how long the sentence is
mov b, #0							;;set the upper pointer to zero

subCount:
mov a, [hl + b]						;;move the current letter into a so that it can me compared to zero
cmp0 a								;;check if it is the end of the string
bz $preloop 						;;if it is jump to the main program loop
inc b								;;increment b (count a letter)
br $subCount						;;branch back to the sub loop


preloop:
dec b								;;(the ending char '/0' has been counted)
mov a, b
mov d, a							;;Store the number of chars in d
mov b, #-1							;;set the counter b to -1

outerLoop:
inc b								;;increment b (the posistion of the lower counter)
mov a, b							;;initialize c to b
mov c, a

innerLoop:
inc c								;;increment c (the higher counter)

;;compare the letters at b and c
mov a, [hl + c]						;;copy the character at the higher counter to e
mov e, a
mov a,  [hl + b]					;;copy the character at the lower counter to a
cmp a, e							;;compare the char at the low index to the char at the high
bnh $swap							;;when the char at the lower index is lesser that the char at the high index branch to swap

checks:
;;check if outer loop is done
mov a, b
inc a								;;(the lower counter must only get to the second last char)
cmp a, d							;;compare the lower index to the length of the string
bh $end
bz $end								;;if the counter is higher than or equal to the length of the string end the program

;;check if the inner loop is done
mov a, c
cmp a, d							;;compare the higher index to the length of the string
bz $outerLoop						;;if the counter is at the last char, exit innner loop
bnh $innerLoop						;;if the counter is lower that the lenght of the string, loop
br $outerLoop						;;else end the inner loop

swap:
mov a, [hl + c]						;;move the higher index char into the a register
xch a, [hl + b]						;;exchance the contents of a and the char at the lower index
mov [hl + c], a						;;move the contents of a (now the lower char) into the higher index

br $checks

end:
ret