;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Data Section
section		.data

SYS_WRITE					equ		1
SYS_EXIT					equ		60

EXIT_SUCCESS					equ		0


FD_STDIN					equ		0
FD_STDOUT					equ		1
FD_STDERR					equ		2

;String Messages

startingMSG					db		"This program will reverse your array of integers."
startingMSG_LEN					equ		$-startingMSG

userINPUT					db		"Enter a sequence of long integers separated by the enter key (one integer per line). Enter 'q' to quit."
userINPUT_LEN					equ		$-userINPUT

nextINPUT					db		"Enter the next integer: "
nextINPUT_LEN					equ		$-nextINPUT

enteredMSG					db		"You entered: "
enteredMSG_LEN					equ		$-enteredMSG

exitMSG						db		"You've entered nonsense. Assuming you are done!"
exitMSG_LEN					equ		$-exitMSG

recievedMSG					db		"These numbers were received and placed into the array: "
recievedMSG_LEN					equ		$-recievedMSG

afterREVERSE					db		"After the reverse function, these are the numbers of the array in their new order: "
afterREVERSE_LEN				equ		$-afterREVERSE

LOCAL_VARIABLE_COUNT				db		100

CRLF						db		13,10
CRLF_LEN					equ		$-CRLF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;	Text Section
section		.text


extern libPuhfessorP_printSignedInteger64
extern libPuhfessorP_inputSignedInteger64
;extern main
;extern reverse


glabal main:


main:

	push rbp
	push rbx
	push r12
	push r13
	push r14
	push r15
	
	mov rbp, rsp
	
	mov r10, LOCAL_VARIABLE_COUNT
	
	imul r10, 8
	sub rsp, r10
	mov r12, rsp


	
arrayFILL:

	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, userINPUT
	mov rdx, userINPUT_LEN
	syscall
	call libPuhfessorP_inputSignedInteger64
	mov r13, rax
	
	mov rax, SYS_WRITE
	mov rdi, FD_STDOUT
	mov rsi, nextINPUT
	mov rdx, nextINPUT_LEN
	syscall

	mov rsp, rbp
	pop r15
	pop r14
	pop r13
	pop r12
	pop rbx
	pop rbp
	
	mov rax, 0
	
	ret
	mov rax, SYS_EXIT
	mov rdi, EXIT_SUCCESS
	syscall
