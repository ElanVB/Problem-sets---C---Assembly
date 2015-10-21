.global _changecase

_changecase:

movw hl, sp
movw ax, [hl + 4]
movw hl, ax

loop:
mov a, [hl]				;;put the next letter in the a register where comparisons take place
cmp0 a					;;subtracts the second value from the first and sets the flags - if result is 0 the z flag is set to 1
bz $end					;;jumps to the end of the program if the z flag is set to 1

						;;compare letter to 41 if higher -> compare to 5A if higher -> compare to 61 if higher -> compare to 7A if higher -> ignore
						;;					   if lower  -> ignore		  if lower  -> add 20		 if lower  -> ignore		if lower  -> subtract 20
						;;I might have to store each char in the next adress relative to the 0xFFEF0 memory address.....

						;;cmp a, c			when a is bigger than c, it will jump to the some code option
						;;bh $somecode

cmp a, #'@'				;;compare letter to 40
bh	$biggerFour			;;if the letter is bigger than forty then jump to the biggerFour section
br $skip				;;else skip to the end of the loop

biggerFour:				;;this piece of code is called if the letter is bigger than 40
cmp a, #'Z'				;;compare the letter to 5A
bh $biggerFive			;;if the letter is bigger than 5A then jump to the biggerFive section
add a, #20H				;;otherwise add 20 to the letter
br $skip				;;and go to the end of the loop

biggerFive:				;;this section is called if the letter is bigger than 5A
cmp a, #'`'				;;compare the letter to 60 or `
bh $biggerSix			;;if the letter is bigger than 60 jump to the biggerSix section
br $skip				;;otherwise jump to the end of the loop

biggerSix:				;;this section is called if the letter is bigger than 60
cmp a, #'z'				;;compare the letter to 7A or z
bh $skip				;;if the letter is bigger than 7A jump to the end of the loop
sub a, #20H				;;otherwise subtract 20 from the letter

skip:
mov [hl], a				;;store the character in memory
incw hl 				;;increments hl
br $loop				;;jumps to the top of the loop

end:
ret
