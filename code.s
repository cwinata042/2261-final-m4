	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"code.c"
	.text
	.align	2
	.global	showCodeScreen
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	showCodeScreen, %function
showCodeScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldrh	r3, [r2]
	push	{r4, lr}
	ldr	r1, .L4
	orr	r3, r3, #256
	strh	r3, [r2]	@ movhi
	ldr	r4, .L4+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #144
	mov	r0, #3
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	7432
	.word	DMANow
	.word	100696064
	.word	codeInputBoxTiles
	.word	100722688
	.word	codeInputBoxMap
	.word	hideSprites
	.size	showCodeScreen, .-showCodeScreen
	.align	2
	.global	hideCodeScreen
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideCodeScreen, %function
hideCodeScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #4608
	strh	r2, [r3]	@ movhi
	bx	lr
	.size	hideCodeScreen, .-hideCodeScreen
	.align	2
	.global	initCodePuzzle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCodePuzzle, %function
initCodePuzzle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	showCodeScreen
	ldr	r3, .L11
	ldr	r3, [r3]
	cmp	r3, #1
	beq	.L10
.L7:
	pop	{r4, lr}
	bx	lr
.L10:
	ldr	r3, .L11+4
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L7
	mov	r4, #5
	mov	lr, #6
	mov	ip, #2
	mov	r0, #3
	mov	r1, #8
	ldr	r3, .L11+8
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #16]
	ldr	r2, .L11+12
	str	r4, [r3, #40]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	currMap
	.word	.LANCHOR0
	.word	codePuzzle1
	.word	currCodePuzzle
	.size	initCodePuzzle, .-initCodePuzzle
	.align	2
	.global	initCodePuzzle1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initCodePuzzle1, %function
initCodePuzzle1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #5
	mov	lr, #6
	mov	ip, #2
	mov	r0, #3
	mov	r1, #8
	ldr	r3, .L15
	str	r4, [r3, #40]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r2, [r3, #16]
	pop	{r4, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	codePuzzle1
	.size	initCodePuzzle1, .-initCodePuzzle1
	.align	2
	.global	updateCode
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCode, %function
updateCode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L60
	ldrh	r1, [r4]
	tst	r1, #32
	beq	.L18
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #32
	bne	.L18
	ldr	r3, .L60+8
	ldr	r2, [r3]
	ldr	r3, [r2, #44]
	sub	r0, r3, #1
	cmn	r0, #1
	str	r0, [r2, #44]
	beq	.L54
	lsl	ip, r3, #3
	mov	r3, ip
	ldr	r0, .L60+12
	ldr	r2, .L60+16
	add	r0, ip, r0
	add	r2, r3, r2
	ldr	ip, .L60+20
	ldr	r3, .L60+24
	strh	ip, [r0]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	r3, [r2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
.L20:
	tst	r1, #1
	beq	.L27
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L27
	ldr	r2, .L60+8
	ldr	r2, [r2]
	ldr	lr, [r2, #40]
	cmp	lr, #0
	ble	.L28
	sub	r2, r2, #4
	b	.L29
.L55:
	cmp	r3, lr
	beq	.L28
.L29:
	ldr	ip, [r2, #24]
	ldr	r0, [r2, #4]!
	cmp	ip, r0
	add	r3, r3, #1
	beq	.L55
.L27:
	tst	r1, #2
	beq	.L17
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	ands	r4, r3, #2
	beq	.L56
.L17:
	pop	{r4, lr}
	bx	lr
.L18:
	tst	r1, #16
	beq	.L21
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	ands	r3, r3, #16
	bne	.L21
	ldr	r2, .L60+8
	ldr	r0, [r2]
	ldr	r2, [r0, #44]
	ldr	lr, [r0, #40]
	add	ip, r2, #1
	cmp	ip, lr
	str	ip, [r0, #44]
	beq	.L57
	lsl	ip, r2, #3
	mov	r2, ip
	ldr	r0, .L60+12
	ldr	r3, .L60+28
	add	r0, ip, r0
	add	r3, r2, r3
	ldr	ip, .L60+20
	ldr	r2, .L60+24
	strh	ip, [r0]	@ movhi
	strh	ip, [r0, #2]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L20
.L21:
	tst	r1, #64
	bne	.L58
.L23:
	tst	r1, #128
	beq	.L20
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	tst	r3, #128
	bne	.L20
	ldr	r3, .L60+8
	ldr	r3, [r3]
	ldr	r2, [r3, #44]
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #20]
	cmp	r2, #0
	sub	r2, r2, #1
	moveq	r2, #9
	str	r2, [r3, #20]
	b	.L20
.L58:
	ldr	r3, .L60+4
	ldrh	r3, [r3]
	ands	r3, r3, #64
	bne	.L23
	ldr	r2, .L60+8
	ldr	r2, [r2]
	ldr	r0, [r2, #44]
	add	r2, r2, r0, lsl #2
	ldr	r0, [r2, #20]
	cmp	r0, #9
	addne	r3, r0, #1
	str	r3, [r2, #20]
	b	.L20
.L54:
	ldr	r0, [r2, #40]
	ldr	r3, .L60+12
	sub	r0, r0, #1
	lsl	ip, r0, #3
	str	r0, [r2, #44]
	add	r3, ip, r3
	ldr	r2, .L60+24
	ldr	ip, .L60+32
	ldr	r0, .L60+36
	str	r0, [ip, #2316]
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	b	.L20
.L56:
	mov	r2, #67108864
	mov	r1, #4608
	ldr	r3, .L60+40
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r3, .L60+44
	str	r4, [r3]
	pop	{r4, lr}
	bx	lr
.L28:
	mov	r2, #67108864
	mov	r1, #4608
	ldr	r3, .L60+40
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r2, #0
	ldr	r3, .L60+48
	ldr	r0, [r3]
	ldr	r3, .L60+44
	cmp	r0, #1
	str	r2, [r3]
	beq	.L59
.L32:
	mov	r0, #0
	mov	ip, #1
	ldr	r3, .L60+52
	ldr	r2, .L60+56
	str	r0, [r3]
	mov	r1, #2
	ldr	r0, .L60+60
	ldr	r3, .L60+64
	str	ip, [r2]
	mov	lr, pc
	bx	r3
	ldrh	r1, [r4]
	b	.L27
.L57:
	ldr	ip, .L60+12
	lsl	r2, r2, #3
	str	r3, [r0, #44]
	add	ip, r2, ip
	ldr	r3, .L60+32
	ldr	r2, .L60+20
	ldr	r0, .L60+68
	strh	r2, [ip]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	str	r0, [r3, #2316]
	b	.L20
.L59:
	ldr	r2, .L60+72
	ldr	r3, .L60+76
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	b	.L32
.L61:
	.align	2
.L60:
	.word	oldButtons
	.word	buttons
	.word	currCodePuzzle
	.word	100722956
	.word	100722948
	.word	4100
	.word	4101
	.word	100722964
	.word	100720640
	.word	268701700
	.word	hideSprites
	.word	showCode
	.word	currMap
	.word	prevShowDialogue
	.word	showDialogue
	.word	codePuzzle1D
	.word	initDialogue
	.word	268767237
	.word	.LANCHOR0
	.word	updateHeldKey
	.size	updateCode, .-updateCode
	.align	2
	.global	updateCursor
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateCursor, %function
updateCursor:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L64
	mov	r3, r2
	str	lr, [sp, #-4]!
	ldr	ip, .L64+4
	ldr	lr, .L64+8
	lsl	r0, r0, #3
	lsl	r1, r1, #3
	add	r2, r0, r2
	add	r3, r1, r3
	strh	lr, [r2]	@ movhi
	strh	lr, [r2, #2]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	ip, [r3, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L65:
	.align	2
.L64:
	.word	100722956
	.word	4101
	.word	4100
	.size	updateCursor, .-updateCursor
	.align	2
	.global	checkSolution
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkSolution, %function
checkSolution:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L73
	ldr	r3, [r3]
	ldr	ip, [r3, #40]
	cmp	ip, #0
	ble	.L69
	mov	r2, #0
	sub	r3, r3, #4
	b	.L68
.L72:
	cmp	r2, ip
	beq	.L69
.L68:
	ldr	r0, [r3, #24]
	ldr	r1, [r3, #4]!
	cmp	r0, r1
	add	r2, r2, #1
	beq	.L72
	mov	r0, #0
	bx	lr
.L69:
	mov	r0, #1
	bx	lr
.L74:
	.align	2
.L73:
	.word	currCodePuzzle
	.size	checkSolution, .-checkSolution
	.align	2
	.global	drawCode
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawCode, %function
drawCode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L80
	ldr	r0, [r3]
	push	{r4, r5, r6, r7, lr}
	ldr	r5, [r0, #40]
	cmp	r5, #0
	ble	.L75
	mov	r3, #54
	mov	r4, #52
	ldr	r6, .L80+4
	ldr	r1, .L80+8
	ldr	r7, [r6]
	lsl	lr, r5, #21
	add	lr, lr, #3538944
	add	r0, r0, #20
	add	r1, r1, r7, lsl #3
	lsr	lr, lr, #16
.L77:
	ldr	r2, [r0], #4
	add	ip, r3, #32
	strh	r3, [r1, #2]	@ movhi
	lsl	r3, ip, #16
	add	r2, r2, #512
	lsr	r3, r3, #16
	orr	r2, r2, #20480
	cmp	r3, lr
	strh	r2, [r1, #4]	@ movhi
	strh	r4, [r1]	@ movhi
	add	r1, r1, #8
	bne	.L77
	add	r5, r5, r7
	str	r5, [r6]
.L75:
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	currCodePuzzle
	.word	shadowOAMCount
	.word	shadowOAM
	.size	drawCode, .-drawCode
	.global	codePuzzles
	.comm	currCodePuzzle,4,4
	.comm	codePuzzle1,48,4
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.type	codePuzzles, %object
	.size	codePuzzles, 4
codePuzzles:
	.space	4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
