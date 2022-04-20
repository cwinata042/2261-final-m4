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
	.file	"dialogue.c"
	.text
	.align	2
	.global	updateDialogue
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateDialogue, %function
updateDialogue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	ldrh	r3, [r3]
	tst	r3, #1
	bxeq	lr
	ldr	r3, .L13+4
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bxne	lr
	ldr	r2, .L13+8
	ldr	r0, .L13+12
	ldr	r2, [r2]
	ldr	r1, [r0]
	sub	r2, r2, #1
	cmp	r2, r1
	push	{r4, lr}
	beq	.L12
	ldr	r3, .L13+16
	ldr	r2, [r3]
	add	r3, r1, #1
	ldr	lr, [r2, r3, lsl #2]
	ldr	ip, .L13+20
	ldr	r2, .L13+24
	str	r3, [r0]
	str	lr, [ip]
	str	r1, [r2]
.L1:
	pop	{r4, lr}
	bx	lr
.L12:
	mov	r1, #67108864
	mov	r0, #4608
	ldr	ip, .L13+28
	ldr	r2, .L13+32
	str	r3, [ip]
	strh	r0, [r1]	@ movhi
	mov	lr, pc
	bx	r2
	b	.L1
.L14:
	.align	2
.L13:
	.word	oldButtons
	.word	buttons
	.word	totalLines
	.word	currLine
	.word	currDialogue
	.word	currDialogueLine
	.word	prevLine
	.word	showDialogue
	.word	hideSprites
	.size	updateDialogue, .-updateDialogue
	.align	2
	.global	drawDialogueBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDialogueBox, %function
drawDialogueBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	ldrh	r3, [r2]
	push	{r4, lr}
	ldr	r1, .L17
	orr	r3, r3, #256
	strh	r3, [r2]	@ movhi
	ldr	r4, .L17+4
	strh	r1, [r2, #8]	@ movhi
	mov	r3, #144
	mov	r0, #3
	ldr	r2, .L17+8
	ldr	r1, .L17+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L17+16
	ldr	r1, .L17+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L17+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	7684
	.word	DMANow
	.word	100679680
	.word	dialogueBoxTiles
	.word	100724736
	.word	dialogueBoxMap
	.word	hideSprites
	.size	drawDialogueBox, .-drawDialogueBox
	.align	2
	.global	initDialogue
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDialogue, %function
initDialogue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r4, r0
	mov	r5, r1
	bl	drawDialogueBox
	mov	r3, #0
	mov	r1, #1
	ldr	r2, .L21
	ldr	ip, [r4]
	ldr	r0, .L21+4
	str	r4, [r2]
	ldr	r2, .L21+8
	str	ip, [r0]
	str	r5, [r2]
	ldr	ip, .L21+12
	ldr	r0, .L21+16
	ldr	r2, .L21+20
	str	r3, [ip]
	str	r3, [r0]
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	currDialogue
	.word	currDialogueLine
	.word	totalLines
	.word	currLine
	.word	prevLine
	.word	startDialogue
	.size	initDialogue, .-initDialogue
	.align	2
	.global	hideDialogueBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	hideDialogueBox, %function
hideDialogueBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864
	mov	r1, #4608
	push	{r4, lr}
	ldr	r3, .L25
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	hideSprites
	.size	hideDialogueBox, .-hideDialogueBox
	.align	2
	.global	drawLetter
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLetter, %function
drawLetter:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	sub	r2, r0, #65
	and	r3, r2, #255
	cmp	r3, #25
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	bhi	.L28
	ldr	r3, .L54
	ldr	r7, [r3, r2, lsl #2]
.L29:
	ldr	r1, .L54+4
	umull	r3, r1, r0, r1
	sub	r3, r0, r1
	add	r1, r1, r3, lsr #1
	lsr	r1, r1, #6
	rsbs	ip, r2, #0
	and	r1, r1, #255
	add	r1, r1, #13
	and	ip, ip, #31
	and	r3, r2, #31
	add	r7, r7, #1
	lsl	lr, r1, #5
	rsbpl	r3, ip, #0
.L40:
	mov	r9, #110
	cmp	r0, #106
	cmpne	r0, #103
	ldr	r6, .L54+8
	ldr	r8, .L54+12
	ldr	ip, [r6]
	ldr	r4, [r8]
	lsl	r3, r3, #16
	ldr	r5, .L54+16
	lsr	r3, r3, #16
	add	lr, r3, lr
	add	r2, r4, #16
	lsl	r10, ip, #3
	strh	r9, [r5, r10]	@ movhi
	orr	lr, lr, #20480
	add	r9, r5, ip, lsl #3
	lsl	r2, r2, #16
	strh	lr, [r9, #4]	@ movhi
	lsr	r2, r2, #16
	add	lr, ip, #1
	strh	r2, [r9, #2]	@ movhi
	str	lr, [r6]
	beq	.L44
	sub	r9, r0, #112
	cmp	r9, #1
	bls	.L44
	cmp	r0, #44
	cmpne	r0, #121
	bne	.L45
.L44:
	mov	r0, #118
	add	r1, r1, #1
	add	r3, r3, r1, lsl #5
	orr	r3, r3, #20480
	lsl	r1, lr, #3
	add	ip, ip, #2
	add	lr, r5, lr, lsl #3
	str	ip, [r6]
	strh	r0, [r5, r1]	@ movhi
	strh	r3, [lr, #4]	@ movhi
	strh	r2, [lr, #2]	@ movhi
.L45:
	add	r4, r4, r7
	str	r4, [r8]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L28:
	sub	r3, r0, #97
	cmp	r3, #25
	ldrls	r3, .L54
	subls	r1, r0, #71
	ldrls	r7, [r3, r1, lsl #2]
	bls	.L29
.L30:
	sub	r3, r0, #48
	and	r2, r3, #255
	cmp	r2, #9
	bls	.L52
	sub	r1, r0, #33
	and	r3, r1, #255
	cmp	r3, #14
	bhi	.L34
	mov	r3, r1
	ldr	r2, .L54
	add	r2, r2, r1, lsl #2
	ldr	r7, [r2, #208]
	add	r2, r7, #1
.L35:
	mov	r7, r2
	mov	lr, #544
	mov	r1, #17
	b	.L40
.L52:
	cmp	r0, #49
	moveq	r7, #2
	movne	r7, #5
	mov	lr, #512
	mov	r1, #16
	b	.L40
.L34:
	sub	r3, r0, #58
	cmp	r3, #6
	bls	.L53
	sub	r3, r0, #91
	cmp	r3, #5
	ldr	r2, .L54
	bhi	.L38
	sub	r3, r0, #69
	add	r2, r2, r3, lsl #2
	ldr	r7, [r2, #208]
	add	r7, r7, #1
.L46:
	mov	lr, #544
	mov	r1, #17
	b	.L40
.L53:
	ldr	r2, .L54
	sub	r3, r0, #43
	add	r2, r2, r3, lsl #2
	ldr	r7, [r2, #208]
	add	r7, r7, #1
	b	.L46
.L38:
	sub	r3, r0, #95
	add	r2, r2, r3, lsl #2
	ldr	r7, [r2, #208]
	cmp	r0, #122
	add	r7, r7, #1
	mov	r2, r7
	bgt	.L46
	cmp	r0, #90
	subgt	r3, r0, #69
	bgt	.L46
	cmp	r0, #57
	subgt	r3, r0, #43
	bgt	.L46
.L43:
	mov	r3, r1
	b	.L35
.L55:
	.align	2
.L54:
	.word	.LANCHOR0
	.word	1372618415
	.word	shadowOAMCount
	.word	prevCol
	.word	shadowOAM
	.size	drawLetter, .-drawLetter
	.align	2
	.global	drawDialogueText
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDialogueText, %function
drawDialogueText:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r6, .L64
	cmp	r1, #0
	str	r3, [r6]
	ble	.L56
	sub	r4, r0, #1
	add	r5, r4, r1
	b	.L60
.L63:
	bl	drawLetter
	cmp	r4, r5
	beq	.L56
.L60:
	ldrb	r0, [r4, #1]!	@ zero_extendqisi2
	cmp	r0, #32
	bne	.L63
	ldr	r3, [r6]
	cmp	r4, r5
	add	r3, r3, #3
	str	r3, [r6]
	bne	.L60
.L56:
	pop	{r4, r5, r6, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	prevCol
	.size	drawDialogueText, .-drawDialogueText
	.align	2
	.global	drawDialogue
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawDialogue, %function
drawDialogue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L72
	ldr	r2, [r3]
	cmp	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L72+4
	ldr	r4, .L72+8
	bne	.L67
	ldr	r1, [r5]
	ldr	r2, [r4]
	cmp	r1, r2
	beq	.L66
.L67:
	mov	r1, #0
	ldr	r2, .L72+12
	str	r1, [r3]
	mov	lr, pc
	bx	r2
	ldr	r3, .L72+16
	ldr	r6, [r3]
	ldr	r3, .L72+20
	mov	r0, r6
	mov	lr, pc
	bx	r3
	mov	r1, r0
	mov	r0, r6
	bl	drawDialogueText
	ldr	r3, [r5]
	str	r3, [r4]
.L66:
	pop	{r4, r5, r6, lr}
	bx	lr
.L73:
	.align	2
.L72:
	.word	startDialogue
	.word	currLine
	.word	prevLine
	.word	hideSprites
	.word	currDialogueLine
	.word	strlen
	.size	drawDialogue, .-drawDialogue
	.align	2
	.global	findPunctCol
	.syntax unified
	.arm
	.fpu softvfp
	.type	findPunctCol, %function
findPunctCol:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r0, #122
	bgt	.L79
	cmp	r0, #90
	bgt	.L80
	cmp	r0, #57
	subgt	r0, r0, #43
	suble	r0, r0, #33
	bx	lr
.L80:
	sub	r0, r0, #69
	bx	lr
.L79:
	sub	r0, r0, #95
	bx	lr
	.size	findPunctCol, .-findPunctCol
	.global	punctWidths
	.global	charWidths
	.comm	prevCol,4,4
	.comm	totalLines,4,4
	.comm	startDialogue,4,4
	.comm	prevLine,4,4
	.comm	currLine,4,4
	.comm	currDialogue,4,4
	.comm	currDialogueLine,4,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	charWidths, %object
	.size	charWidths, 208
charWidths:
	.word	5
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	5
	.word	4
	.word	3
	.word	4
	.word	4
	.word	4
	.word	5
	.word	5
	.word	4
	.word	4
	.word	5
	.word	4
	.word	4
	.word	3
	.word	4
	.word	5
	.word	5
	.word	5
	.word	5
	.word	4
	.word	5
	.word	4
	.word	4
	.word	4
	.word	4
	.word	3
	.word	4
	.word	4
	.word	1
	.word	3
	.word	3
	.word	1
	.word	5
	.word	4
	.word	4
	.word	4
	.word	4
	.word	4
	.word	5
	.word	3
	.word	4
	.word	5
	.word	5
	.word	5
	.word	5
	.word	4
	.type	punctWidths, %object
	.size	punctWidths, 128
punctWidths:
	.word	1
	.word	2
	.word	5
	.word	5
	.word	7
	.word	6
	.word	1
	.word	2
	.word	2
	.word	5
	.word	5
	.word	2
	.word	3
	.word	1
	.word	5
	.word	1
	.word	1
	.word	4
	.word	4
	.word	4
	.word	5
	.word	7
	.word	2
	.word	5
	.word	2
	.word	3
	.word	3
	.word	3
	.word	4
	.word	1
	.word	4
	.word	5
	.ident	"GCC: (devkitARM release 53) 9.1.0"
