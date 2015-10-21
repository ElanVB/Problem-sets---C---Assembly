.global _switchLEDon
.global _switchLEDoff
.global _toggleLED
_switchLEDon:
;; Switch LED on
push bc ;; Save the original contents of the two registers
push ax ;; we use by pushing it to the stack.
;; (push works with 16bit register pairs)
movw bc, #0xff07 ;; Save the 16bit address of P7's register into
;; 16bit register pair BC
mov a, [bc] ;; Get the 8bit value stored at that address
;; and store it in register A
or a, #10000000B ;; Bitwise OR the value in A with 10000000
mov [bc], a ;; Set the value in P7's register to the value in A
pop ax ;; Restore the contents of the two registers we used,
pop bc ;; by popping it from the stack.
;; (pop works with register pairs)
ret ;; exit this function
_switchLEDoff:
;; Switch LED off
push bc ;; Save the original contents of the two registers
push ax ;; we use by pushing it to the stack.
movw bc, #0xff07 ;; Save the 16bit address of P7's register into
;; 16bit register pair BC
mov a, [bc] ;; Get the 8bit value stored at that address
;; and store it in register A
and a, #01111111B ;; Bitwise AND the value in A with 01111111
mov [bc], a ;; Set the value in P7's register to the value in A
pop ax ;; Restore the contents of the two registers we used,
pop bc ;; by popping it from the stack.
ret ;; exit this function

_toggleLED:
push bc
push ax
movw bc, #0xff07
mov a, [bc]
xor a, #10000000B
mov [bc], a
pop ax
pop bc
ret
