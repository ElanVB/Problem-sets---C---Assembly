;;Elan van Biljon - 18384439
.global _calculateUniqueNumber

_calculateUniqueNumber: 				;;My student number is 1 8 3 8 4 4 3 9
										;;Thus high pos - 2, 4, 6, 8
										;;And low pos 	- 1, 3, 5, 7
movw hl, sp					;;get Stack Pointer
movw ax, hl					;;move the pointer to the first number
addw ax, #4
movw hl, ax

;;smallest
mov a, [hl]					;;add all the smallest numbers together
add a, [hl + 4]				;;conincidently this is every second number including the first number
add a, [hl + 8]
add a, [hl + 12]
mov x, a					;;tempereraly store the sum in x

;;highest
mov a, [hl + 2]				;;add all the highest numbers together
add a, [hl + 6]				;;conincidently this is every second number including the second number
add a, [hl + 10]
add a, [hl + 14]

mulu x						;;multiply a with x and store in ax

movw 0xFFEF0, ax			;;return ax

ret
