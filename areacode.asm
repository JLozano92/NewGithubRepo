;;;;;;;;;;;;;;;;;;;;;;;;;
;Jesus Lozano
;CPSC 240
;Professor P
;Assignment 1

;;;;;;;;;;
;Begin section

section	.data

SYS_WRITE		equ	1
SYS_EXIT		equ	60

EXIT_SUCCESS		equ	0


FD_STDIN		equ	0
FD_STDOUT		equ	1
FD_STDERR		equ	2


;;;;;;;;;
;Strings

CALC_MESSAGE		db	"Welcome to your friendly area calculator",13,10
CALC_MESSAGE_LEN	equ	$-CALC_MESSAGE

CRLF			db	13,10
CRLF_LEN		equ	$-CRLF



;;;;;;;;;
;Section text
section	.text


global _start
	
_start:

	nop
	nop
	
message:

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, CALC_MESSAGE
	mov rdx, CALC_MESSAGE_LEN
	syscall

	
goodbye:
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
