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
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L4+4
	mov	lr, pc
	bx	r4
	mov	r3, #1504
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r5, #512
	mov	r2, #0
	mov	r1, #67108864
	ldr	r0, .L4+20
	ldr	r3, .L4+24
	strh	r5, [r1]	@ movhi
	str	r2, [r0]
	str	r2, [r3]
	strh	r2, [r1, #22]	@ movhi
	ldr	r3, .L4+28
	strh	r2, [r1, #20]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L4+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	shadowOAM
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #512
	mov	r1, #7936
	mov	r2, #0
	strh	r0, [r3]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	ldr	r0, .L7
	ldr	r1, .L7+4
	ldrh	r0, [r0, #48]
	ldr	r3, .L7+8
	strh	r0, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	b	goToStart
.L8:
	.align	2
.L7:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause.part.0, %function
pause.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldrh	r3, [r3]
	ands	r3, r3, #4
	bxne	lr
	ldr	r2, .L11+4
	str	r3, [r2]
	b	goToStart
.L12:
	.align	2
.L11:
	.word	buttons
	.word	state
	.size	pause.part.0, .-pause.part.0
	.set	lose.part.0,pause.part.0
	.set	win.part.0,pause.part.0
	.align	2
	.global	goToInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L15
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L15+4
	mov	lr, pc
	bx	r4
	mov	r3, #2336
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L15+12
	ldr	r1, .L15+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L15+20
	ldrh	r1, [r2]
	ldr	r2, .L15+24
	ldrh	r2, [r2]
	strh	r1, [r3, #22]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #20]	@ movhi
	bx	lr
.L16:
	.align	2
.L15:
	.word	DMANow
	.word	instructionsScreenPal
	.word	instructionsScreenTiles
	.word	100726784
	.word	instructionsScreenMap
	.word	vOff
	.word	hOff
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r5, #67108864
	ldr	r3, .L19
	mov	lr, pc
	bx	r3
	ldrh	r3, [r5]
	orr	r3, r3, #4096
	ldr	r4, .L19+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	mov	r0, #3
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L19+12
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L19+16
	ldr	r1, .L19+20
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+24
	ldrh	r2, [r3]
	ldr	r3, .L19+28
	strh	r2, [r5, #22]	@ movhi
	ldrh	r2, [r3]
	mov	r0, #3
	strh	r2, [r5, #20]	@ movhi
	mov	r3, #16384
	ldr	r2, .L19+32
	ldr	r1, .L19+36
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L19+40
	ldr	r1, .L19+44
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+48
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L19+52
	mov	lr, pc
	bx	r4
	ldr	r3, .L19+56
	mov	lr, pc
	bx	r3
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	waitForVBlank
	.word	DMANow
	.word	mainMapPal
	.word	mainMapTiles
	.word	100726784
	.word	mainMapMap
	.word	vOff
	.word	hOff
	.word	100728832
	.word	spritesheetTiles
	.word	83886592
	.word	spritesheetPal
	.word	hideSprites
	.word	shadowOAM
	.word	initGame
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L33
	ldr	r4, .L33+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L22
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L31
.L22:
	tst	r2, #4
	beq	.L21
	ldr	r3, .L33+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L32
.L21:
	pop	{r4, lr}
	bx	lr
.L31:
	mov	r2, #2
	ldr	r3, .L33+12
	str	r2, [r3]
	bl	goToGame
	ldr	r0, [r4]
	ldr	r3, .L33+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L32:
	mov	r2, #1
	ldr	r3, .L33+12
	pop	{r4, lr}
	str	r2, [r3]
	b	goToInstructions
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	state
	.word	srand
	.size	start, .-start
	.align	2
	.global	instructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, .L47
	ldr	r4, .L47+4
	ldrh	r2, [r2]
	ldr	r3, [r4]
	tst	r2, #8
	add	r3, r3, #1
	str	r3, [r4]
	beq	.L36
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L45
.L36:
	tst	r2, #4
	beq	.L35
	ldr	r3, .L47+8
	ldrh	r3, [r3]
	ands	r3, r3, #4
	beq	.L46
.L35:
	pop	{r4, lr}
	bx	lr
.L45:
	mov	r2, #2
	ldr	r3, .L47+12
	str	r2, [r3]
	bl	goToGame
	ldr	r0, [r4]
	ldr	r3, .L47+16
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	bx	lr
.L46:
	ldr	r2, .L47+12
	pop	{r4, lr}
	str	r3, [r2]
	b	goToStart
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	seed
	.word	buttons
	.word	state
	.word	srand
	.size	instructions, .-instructions
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L59
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L59+4
	ldrh	r2, [r2]
	tst	r2, #8
	bne	.L51
	mov	r2, #2
	ldr	r3, .L59+8
	str	r2, [r3]
	bx	lr
.L51:
	tst	r3, #4
	bxeq	lr
	b	pause.part.0
.L60:
	.align	2
.L59:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L63
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L63+4
	mov	lr, pc
	bx	r4
	mov	r3, #1104
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L63+12
	ldr	r1, .L63+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L63+20
	ldr	r1, .L63+24
	str	r3, [r0]
	str	r3, [r1]
	strh	r3, [r2, #22]	@ movhi
	ldr	r1, .L63+28
	strh	r3, [r2, #20]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L63+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L64:
	.align	2
.L63:
	.word	DMANow
	.word	winScreenPal
	.word	winScreenTiles
	.word	100726784
	.word	winScreenMap
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	shadowOAM
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L67
	ldrh	r3, [r3]
	tst	r3, #4
	bxeq	lr
	b	win.part.0
.L68:
	.align	2
.L67:
	.word	oldButtons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L71
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L71+4
	mov	lr, pc
	bx	r4
	mov	r3, #1040
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L71+8
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L71+12
	ldr	r1, .L71+16
	mov	lr, pc
	bx	r4
	mov	r3, #0
	mov	r2, #67108864
	ldr	r0, .L71+20
	ldr	r1, .L71+24
	str	r3, [r0]
	str	r3, [r1]
	strh	r3, [r2, #22]	@ movhi
	ldr	r1, .L71+28
	strh	r3, [r2, #20]	@ movhi
	mov	lr, pc
	bx	r1
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L71+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L72:
	.align	2
.L71:
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100726784
	.word	loseScreenMap
	.word	vOff
	.word	hOff
	.word	hideSprites
	.word	shadowOAM
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L90+8
	ldr	r2, .L90+12
	ldr	r3, [r3]
	ldr	r1, [r2]
	cmp	r1, r3
	beq	.L74
	cmp	r3, #1
	str	r3, [r2]
	beq	.L75
	cmp	r3, #2
	beq	.L76
	cmp	r3, #0
	beq	.L87
.L74:
	ldr	r3, .L90+16
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L77
	ldr	r3, .L90+20
	ldrh	r3, [r3]
	tst	r3, #4
	moveq	r2, #3
	ldreq	r3, .L90+24
	streq	r2, [r3]
.L77:
	ldr	r4, .L90+28
	add	r2, r4, #16
	ldr	r5, .L90+32
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L88
.L78:
	add	r2, r4, #16
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	ldm	r2, {r2, r3}
	ldr	r4, .L90+36
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L89
	pop	{r4, r5, r6, lr}
	bx	lr
.L89:
	mov	r2, #4
	ldr	r3, .L90+24
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	b	goToWin
.L88:
	mov	r2, #5
	ldr	r3, .L90+24
	str	r2, [r3]
	bl	goToLose
	b	.L78
.L87:
	ldr	r4, .L90+40
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L90+44
	mov	lr, pc
	bx	r4
	mov	r3, #528
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L90+48
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L90+52
	ldr	r1, .L90+56
	mov	lr, pc
	bx	r4
	b	.L74
.L76:
	ldr	r4, .L90+40
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L90+60
	mov	lr, pc
	bx	r4
	mov	r3, #176
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L90+64
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L90+52
	ldr	r1, .L90+68
	mov	lr, pc
	bx	r4
	b	.L74
.L75:
	ldr	r4, .L90+40
	mov	r3, #256
	mov	r2, #83886080
	mov	r0, #3
	ldr	r1, .L90+72
	mov	lr, pc
	bx	r4
	mov	r3, #752
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L90+76
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L90+52
	ldr	r1, .L90+80
	mov	lr, pc
	bx	r4
	b	.L74
.L91:
	.align	2
.L90:
	.word	updateGame
	.word	drawGame
	.word	currMap
	.word	prevMap
	.word	oldButtons
	.word	buttons
	.word	state
	.word	player
	.word	loseCollision
	.word	winCollision
	.word	DMANow
	.word	mainMapPal
	.word	mainMapTiles
	.word	100726784
	.word	mainMapMap
	.word	storageRoomPal
	.word	storageRoomTiles
	.word	storageRoomMap
	.word	classroomAPal
	.word	classroomATiles
	.word	classroomAMap
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r0, #512
	mov	r1, #7936
	mov	r2, #0
	push	{r4, r7, fp, lr}
	strh	r0, [r3]	@ movhi
	ldr	r4, .L107
	strh	r1, [r3, #10]	@ movhi
	ldr	fp, .L107+4
	ldrh	r0, [r4, #48]
	ldr	r5, .L107+8
	ldr	r6, .L107+12
	ldr	r3, .L107+16
	strh	r0, [fp]	@ movhi
	strh	r2, [r5]	@ movhi
	ldr	r10, .L107+20
	mov	lr, pc
	bx	r3
	ldr	r9, .L107+24
	ldrh	r0, [fp]
	ldr	r2, [r6]
	ldr	r8, .L107+28
	ldr	r7, .L107+32
.L94:
	strh	r0, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L103
.L96:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L98
	.word	.L97
	.word	.L95
.L95:
	tst	r0, #4
	beq	.L103
	ldr	r3, .L107+36
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L97:
	tst	r0, #4
	beq	.L103
	ldr	r3, .L107+40
	mov	lr, pc
	bx	r3
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L98:
	mov	lr, pc
	bx	r7
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L99:
	mov	lr, pc
	bx	r8
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L100:
	mov	lr, pc
	bx	r9
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L101:
	mov	lr, pc
	bx	r10
	ldr	r2, [r6]
	ldrh	r0, [fp]
	b	.L94
.L103:
	mov	r0, r3
	b	.L94
.L108:
	.align	2
.L107:
	.word	67109120
	.word	buttons
	.word	oldButtons
	.word	state
	.word	goToStart
	.word	start
	.word	instructions
	.word	game
	.word	pause
	.word	lose.part.0
	.word	win.part.0
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
