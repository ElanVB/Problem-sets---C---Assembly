.global _reverse
.global _reverse2

_reverse:

movw hl, sp							;;get the stack pointer
movw ax, [hl + 4]					;;get past the return space
movw hl, ax							;;store the position of first letter in hl so that it can be dereferenced
br $count							;;these branch statements and lables are quite unnesicary but if I move my blocks of code around it will be helpfull

count:								;;start of the block of code that counts how long the sentence is
mov b, #0							;;set the upper pointer to zero
mov c, #0							;;set the lower pointer to zero

subCount:
mov a, [hl + b]						;;move the current letter into a so that it can me compared to zero
cmp0 a								;;check if it is the end of the string
bz $preloop 						;;if it is jump to the main program loop
inc b								;;increment b (count a letter)
br $subCount						;;branch back to the sub loop

preloop:
dec b								;;the upper pointer is now pointing to the zero, thus you must decrement it to get to the last letter

loop:								;;start of the main loop
mov a, b							;;move the upper pointer into a so that it can be compared to the lower pointer
cmp c, a							;;check if the upper and lower opinter are equal
bz $end								;;if they are then end the loop
bh $end

swap:								;;start of the piece of code that swaps the two letters
mov a, [hl + b]						;;put letter at position hl + b in temporarily a
mov e, a							;;move the letter to e temporarily
mov a, [hl + c] 					;;put letter at position hl + c in temporarily a
mov [hl + b], a 					;;put the letter into the position hl + b
mov a, e 							;;put the first letter in a
mov [hl + c], a						;;put the first letter in the position hl + c

adjustAandB:						;;start of the piece of code that adjusts c and b
inc c								;;increment the lower pointer
dec b								;;decrement the upper pointer
br $loop

end:
ret

/* 	I thought a fairly easy way to reverse a string would be to use the stack but it seems it wasnt as easy as I thought,
	My main delema was that the letters are 8 bits and the stack takes 16 bits in at a time....
_reverse2:

movw hl, sp							;;get the stack pointer
movw ax, [hl + 4]					;;get past the return space
movw hl, ax							;;store the position of first letter in hl so that it can be dereferenced
br $count2							;;these branch statements and lables are quite unnesicary but if I move my blocks of code around it will be helpfull

count2:								;;start of the block of code that counts how long the sentence is
mov b, #0							;;set the upper pointer to zero
mov c, #0							;;set the lower pointer to zero

subCount2:
mov a, [hl + b]						;;move the current letter into a so that it can me compared to zero
cmp0 a								;;check if it is the end of the string
bz $preloop2 						;;if it is jump to the main program loop
inc b								;;increment b (count a letter)
br $subCount2						;;branch back to the sub loop

preloop2:
dec b

push:
mov a, c
cmp b, a
bz $prepull
push ax
movw [hl + c], ax
inc c
br $push

prepull:
mov b, #0
br $pull

pull:
cmp0 c
bz $end2
pop [hl + b]
br $pull

end2:
ret
*/
