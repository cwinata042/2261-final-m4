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
	.file	"game.c"
	.text
	.align	2
	.global	initPlayer
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #0
	mov	r1, #1
	mov	r6, #9
	mov	r5, #15
	mov	r4, #3
	mov	lr, #2
	ldr	r3, .L4
	ldr	r0, .L4+4
	ldr	ip, [r3]
	ldr	r0, [r0]
	ldr	r3, .L4+8
	add	ip, ip, #136
	add	r0, r0, #20
	str	ip, [r3]
	str	r6, [r3, #16]
	str	r5, [r3, #20]
	str	r0, [r3, #4]
	str	r4, [r3, #40]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r1, [r3, #28]
	ldr	ip, .L4+12
	ldr	r1, .L4+16
	ldr	r0, .L4+20
	str	r2, [r3, #24]
	str	r2, [r3, #36]
	ldr	r3, .L4+24
	str	r2, [ip]
	str	lr, [r3]
	str	r2, [r0]
	str	r2, [r1]
	str	r2, [r1, #4]
	str	r2, [r1, #8]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	vOff
	.word	hOff
	.word	player
	.word	currHeldKeys
	.word	heldKeys
	.word	prevHeldKeys
	.word	playerDirection
	.size	initPlayer, .-initPlayer
	.global	__aeabi_idivmod
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #4
	push	{r4, r5, r6, lr}
	ldr	r4, .L19
	ldr	r3, .L19+4
	ldr	r5, [r4, #24]
	smull	r0, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	ldr	r6, [r4, #28]
	add	r3, r3, r3, lsl #2
	cmp	r5, r3, lsl #2
	str	r6, [r4, #32]
	str	r1, [r4, #28]
	bne	.L7
	ldr	r0, [r4, #36]
	ldr	r3, .L19+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L7:
	ldr	r3, .L19+12
	ldrh	r3, [r3, #48]
	tst	r3, #64
	moveq	r3, #1
	streq	r3, [r4, #28]
	ldr	r3, .L19+12
	ldrh	r3, [r3, #48]
	ands	r3, r3, #128
	streq	r3, [r4, #28]
	ldr	r3, .L19+12
	ldrh	r2, [r3, #48]
	tst	r2, #32
	bne	.L10
	mov	r2, #3
	ldrh	r3, [r3, #48]
	tst	r3, #16
	str	r2, [r4, #28]
	bne	.L12
.L13:
	mov	r3, #2
	str	r3, [r4, #28]
.L12:
	add	r5, r5, #1
	str	r5, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L13
	ldr	r3, [r4, #28]
	cmp	r3, #4
	bne	.L12
	mov	r3, #0
	str	r6, [r4, #28]
	str	r3, [r4, #36]
	str	r3, [r4, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	player
	.word	1717986919
	.word	__aeabi_idivmod
	.word	67109120
	.size	animatePlayer, .-animatePlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L27
	ldr	r3, [r2, #44]
	ldr	r1, .L27+4
	cmp	r3, #0
	ldr	r3, [r1]
	beq	.L22
	ldr	ip, .L27+8
	lsl	r0, r3, #3
	ldrh	r2, [ip, r0]
	add	r3, r3, #1
	orr	r2, r2, #512
	strh	r2, [ip, r0]	@ movhi
	str	r3, [r1]
	bx	lr
.L22:
	ldr	r0, .L27+12
	push	{r4, r5, lr}
	ldr	ip, .L27+16
	ldr	r5, [r0]
	ldr	r0, [r2, #4]
	ldr	r4, [r2, #36]
	ldr	lr, [r2]
	ldr	r2, [r2, #28]
	ldr	ip, [ip]
	sub	r0, r0, r5
	ldr	r5, .L27+8
	add	r2, r2, r4, lsl #5
	sub	lr, lr, ip
	add	r4, r5, r3, lsl #3
	lsl	ip, r3, #3
	orr	r0, r0, #16384
	lsl	r2, r2, #1
	add	r3, r3, #1
	strh	lr, [r5, ip]	@ movhi
	strh	r0, [r4, #2]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	str	r3, [r1]
	pop	{r4, r5, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	shadowOAMCount
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initHeldKeys
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHeldKeys, %function
initHeldKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L30
	ldr	r0, .L30+4
	ldr	r1, .L30+8
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	str	r3, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L31:
	.align	2
.L30:
	.word	heldKeys
	.word	currHeldKeys
	.word	prevHeldKeys
	.size	initHeldKeys, .-initHeldKeys
	.align	2
	.global	updateHeldKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateHeldKey, %function
updateHeldKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	lr, #1
	ldr	r2, .L34
	ldr	ip, .L34+4
	ldr	r3, [r2]
	ldr	r1, .L34+8
	str	lr, [ip, r0, lsl #2]
	add	r0, r3, lr
	str	r0, [r2]
	str	r3, [r1]
	ldr	lr, [sp], #4
	bx	lr
.L35:
	.align	2
.L34:
	.word	currHeldKeys
	.word	heldKeys
	.word	prevHeldKeys
	.size	updateHeldKey, .-updateHeldKey
	.align	2
	.global	initKeys
	.syntax unified
	.arm
	.fpu softvfp
	.type	initKeys, %function
initKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L40
	push	{r4, r5, r6, lr}
	mov	r3, ip
	mov	r6, #1
	mov	r5, #8
	mov	r4, #4
	ldr	r2, .L40+4
	add	lr, ip, #144
.L37:
	ldr	r0, [r2, #4]
	ldr	r1, [r2], #8
	str	r6, [r3, #44]
	str	r5, [r3, #16]
	str	r4, [r3, #20]
	stm	r3, {r0, r1}
	add	r3, r3, #48
	cmp	r3, lr
	bne	.L37
	mov	r3, #0
	pop	{r4, r5, r6, lr}
	str	r3, [ip, #44]
	bx	lr
.L41:
	.align	2
.L40:
	.word	keys
	.word	.LANCHOR0
	.size	initKeys, .-initKeys
	.align	2
	.global	updateKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateKey, %function
updateKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #1
	str	r3, [r0, #44]
	bx	lr
	.size	updateKey, .-updateKey
	.align	2
	.global	drawKey
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawKey, %function
drawKey:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #44]
	ldr	r2, .L49
	cmp	r3, #0
	ldr	r3, [r2]
	beq	.L44
	ldr	ip, .L49+4
	lsl	r0, r3, #3
	ldrh	r1, [ip, r0]
	add	r3, r3, #1
	orr	r1, r1, #512
	strh	r1, [ip, r0]	@ movhi
	str	r3, [r2]
	bx	lr
.L44:
	push	{r4, r5, lr}
	mov	r4, #12608
	ldr	r1, .L49+8
	ldr	r5, .L49+12
	ldr	lr, [r0]
	ldr	ip, [r1]
	ldr	r5, [r5]
	ldr	r0, [r0, #4]
	ldr	r1, .L49+4
	sub	lr, lr, ip
	lsl	ip, r3, #3
	strh	lr, [r1, ip]	@ movhi
	sub	r0, r0, r5
	add	r1, r1, r3, lsl #3
	add	r3, r3, #1
	strh	r4, [r1, #4]	@ movhi
	strh	r0, [r1, #2]	@ movhi
	pop	{r4, r5, lr}
	str	r3, [r2]
	bx	lr
.L50:
	.align	2
.L49:
	.word	shadowOAMCount
	.word	shadowOAM
	.word	vOff
	.word	hOff
	.size	drawKey, .-drawKey
	.align	2
	.global	initObjects
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObjects, %function
initObjects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L60
	ldr	r0, [r0]
	cmp	r0, #2
	ldrls	r3, .L60+4
	ldrls	r1, [r3, r0, lsl #2]
	addls	r2, r3, r0, lsl #2
	ldrls	r3, [r2, #12]
	ldrls	r2, [r2, #24]
	cmp	r1, #0
	bxle	lr
	str	lr, [sp, #-4]!
	mov	r0, #3
	mov	lr, #0
	add	r1, r1, r1, lsl #1
	add	r1, r3, r1, lsl #4
.L54:
	str	lr, [r3, #44]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	ldr	ip, [r2]
	str	ip, [r3, #4]
	ldr	ip, [r2, #4]
	str	ip, [r3], #48
	cmp	r3, r1
	add	r2, r2, #12
	bne	.L54
	ldr	lr, [sp], #4
	bx	lr
.L61:
	.align	2
.L60:
	.word	currMap
	.word	.LANCHOR1
	.size	initObjects, .-initObjects
	.align	2
	.global	drawObjects
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawObjects, %function
drawObjects:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L70
	ldr	r2, [r2]
	cmp	r2, #2
	ldrls	r1, .L70+4
	ldrls	r3, .L70+8
	push	{r4, r5, r6, r7, r8, lr}
	ldrls	lr, [r1, r2, lsl #2]
	ldrls	r3, [r3, r2, lsl #2]
	cmp	lr, #0
	ble	.L62
	ldr	r8, .L70+12
	ldr	ip, .L70+16
	ldr	r0, .L70+20
	ldr	r4, [r8]
	ldr	r2, .L70+24
	add	r1, lr, lr, lsl #1
	ldrh	r7, [ip]
	ldrh	r6, [r0]
	ldr	r5, .L70+28
	add	r2, r2, r4, lsl #3
	add	r1, r3, r1, lsl #4
.L67:
	ldr	r0, [r3, #44]
	cmp	r0, #0
	ldreq	ip, [r3]
	ldreq	r0, [r3, #4]
	ldrhne	r0, [r2]
	subeq	ip, ip, r7
	orrne	r0, r0, #512
	subeq	r0, r0, r6
	add	r3, r3, #48
	strhne	r0, [r2]	@ movhi
	strheq	ip, [r2]	@ movhi
	strheq	r0, [r2, #2]	@ movhi
	strheq	r5, [r2, #4]	@ movhi
	cmp	r3, r1
	add	r2, r2, #8
	bne	.L67
	add	lr, r4, lr
	str	lr, [r8]
.L62:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L71:
	.align	2
.L70:
	.word	currMap
	.word	CSWTCH.163
	.word	CSWTCH.164
	.word	shadowOAMCount
	.word	vOff
	.word	hOff
	.word	shadowOAM
	.word	8480
	.size	drawObjects, .-drawObjects
	.align	2
	.global	initDoors
	.syntax unified
	.arm
	.fpu softvfp
	.type	initDoors, %function
initDoors:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	ldr	r2, .L74
	add	r0, r2, #28
	str	lr, [sp, #-4]!
	ldr	r3, .L74+4
	ldm	r0, {r0, lr}
	ldr	ip, [r2, #24]
	str	r0, [r3, #4]
	add	r0, r2, #40
	str	ip, [r3]
	ldr	ip, [r2, #36]
	ldm	r0, {r0, r2}
	str	lr, [r3, #20]
	str	ip, [r3, #24]
	str	r0, [r3, #12]
	str	r0, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	ldr	lr, [sp], #4
	bx	lr
.L75:
	.align	2
.L74:
	.word	.LANCHOR0
	.word	doors
	.size	initDoors, .-initDoors
	.align	2
	.global	initBoxPuzzle1
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzle1, %function
initBoxPuzzle1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 56
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #56
	mov	ip, sp
	mov	r5, #7
	ldr	lr, .L81
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	ldr	r4, .L81+4
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r3, [r4, #652]
	ldm	lr, {r0, r1}
	cmp	r3, #0
	stm	ip, {r0, r1}
	str	r5, [r4, #640]
	bne	.L76
	mov	r0, r3
	mov	r2, sp
	mov	r3, r4
	mov	r1, #16
	mov	r6, #2
	add	r5, r4, #448
.L78:
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	str	r0, [r3, #48]
	str	r0, [r3, #56]
	str	r1, [r3, #52]
	str	r6, [r3, #60]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	lr, [r3, #4]
	str	ip, [r3], #64
	cmp	r3, r5
	add	r2, r2, #8
	bne	.L78
	mov	r2, #64
	mov	r3, #168
	str	r0, [r4, #652]
	str	r2, [r4, #644]
	str	r3, [r4, #648]
.L76:
	add	sp, sp, #56
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	.LANCHOR1+36
	.word	boxPuzzle1
	.size	initBoxPuzzle1, .-initBoxPuzzle1
	.align	2
	.global	initBoxPuzzle2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzle2, %function
initBoxPuzzle2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	ldr	r3, .L89
	ldr	r2, [r3, #652]
	cmp	r2, #0
	str	r1, [r3, #640]
	bxne	lr
	push	{r4, r5, lr}
	mov	r1, #16
	mov	r5, #48
	mov	r4, #120
	mov	lr, #2
	mov	ip, #64
	mov	r0, #136
	str	r5, [r3, #644]
	str	r4, [r3, #648]
	str	lr, [r3, #60]
	stm	r3, {r0, ip}
	str	r2, [r3, #48]
	str	r2, [r3, #56]
	str	r1, [r3, #52]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	pop	{r4, r5, lr}
	bx	lr
.L90:
	.align	2
.L89:
	.word	boxPuzzle2
	.size	initBoxPuzzle2, .-initBoxPuzzle2
	.align	2
	.global	initBoxPuzzle3
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzle3, %function
initBoxPuzzle3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #48
	mov	ip, sp
	mov	r5, #6
	ldr	lr, .L96
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	ldr	r4, .L96+4
	stmia	ip!, {r0, r1, r2, r3}
	ldm	lr, {r0, r1, r2, r3}
	ldr	lr, [r4, #652]
	cmp	lr, #0
	stm	ip, {r0, r1, r2, r3}
	str	r5, [r4, #640]
	bne	.L91
	mov	r2, sp
	mov	r0, lr
	mov	r3, r4
	mov	r1, #16
	mov	r6, #2
	add	r5, r4, #384
.L93:
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	str	r0, [r3, #48]
	str	r0, [r3, #56]
	str	r1, [r3, #52]
	str	r6, [r3, #60]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	lr, [r3, #4]
	str	ip, [r3], #64
	cmp	r3, r5
	add	r2, r2, #8
	bne	.L93
	mov	r2, #128
	mov	r3, #24
	str	r0, [r4, #652]
	str	r2, [r4, #644]
	str	r3, [r4, #648]
.L91:
	add	sp, sp, #48
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	.LANCHOR1+92
	.word	boxPuzzle3
	.size	initBoxPuzzle3, .-initBoxPuzzle3
	.align	2
	.global	initBoxPuzzle4
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzle4, %function
initBoxPuzzle4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 64
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	sub	sp, sp, #64
	mov	ip, sp
	mov	r5, #8
	ldr	lr, .L103
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldmia	lr!, {r0, r1, r2, r3}
	stmia	ip!, {r0, r1, r2, r3}
	ldr	r4, .L103+4
	ldm	lr, {r0, r1, r2, r3}
	str	r5, [r4, #640]
	stm	ip, {r0, r1, r2, r3}
	ldr	r0, [r4, #652]
	cmp	r0, #0
	bne	.L98
	mov	r2, sp
	mov	r3, r4
	mov	r1, #16
	mov	r6, #2
	add	r5, r4, #512
.L100:
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	str	r0, [r3, #48]
	str	r0, [r3, #56]
	str	r1, [r3, #52]
	str	r6, [r3, #60]
	str	r1, [r3, #20]
	str	r1, [r3, #16]
	str	lr, [r3, #4]
	str	ip, [r3], #64
	cmp	r3, r5
	add	r2, r2, #8
	bne	.L100
	mov	r2, #192
	mov	r3, #152
	str	r0, [r4, #652]
	str	r2, [r4, #644]
	str	r3, [r4, #648]
.L98:
	add	sp, sp, #64
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L104:
	.align	2
.L103:
	.word	.LANCHOR1+140
	.word	boxPuzzle4
	.size	initBoxPuzzle4, .-initBoxPuzzle4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzles.part.0, %function
initBoxPuzzles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	initBoxPuzzle1
	bl	initBoxPuzzle2
	bl	initBoxPuzzle3
	pop	{r4, lr}
	b	initBoxPuzzle4
	.size	initBoxPuzzles.part.0, .-initBoxPuzzles.part.0
	.align	2
	.global	initBoxPuzzles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBoxPuzzles, %function
initBoxPuzzles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L109
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	initBoxPuzzles.part.0
.L110:
	.align	2
.L109:
	.word	currMap
	.size	initBoxPuzzles, .-initBoxPuzzles
	.align	2
	.global	updateBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBox, %function
updateBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	ip, [r0, #56]
	ldr	lr, [r0, #52]
	cmp	lr, ip
	mov	r4, r0
	bne	.L112
.L114:
	mov	r3, #0
	str	r3, [r4, #48]
	str	r3, [r4, #12]
	str	r3, [r4, #8]
	str	r3, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L112:
	ldr	r5, .L116
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L114
	mov	r0, #1
	ldr	r2, [r4, #4]
	ldr	ip, [r4, #12]
	ldr	r1, [r4, #56]
	ldr	r3, [r4]
	add	r2, r2, ip
	ldr	ip, [r4, #8]
	add	r1, r1, r0
	add	r3, r3, ip
	str	r1, [r4, #56]
	str	r2, [r4, #4]
	str	r3, [r4]
	str	r0, [r4, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L117:
	.align	2
.L116:
	.word	checkBoxCollision
	.size	updateBox, .-updateBox
	.align	2
	.global	drawBox
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBox, %function
drawBox:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L123
	ldr	r3, [r0, #4]
	ldr	r2, [r2]
	push	{r4, lr}
	ldr	lr, .L123+4
	subs	r3, r3, r2
	ldr	r2, [lr]
	bmi	.L119
	mov	r4, #0
	ldr	r1, .L123+8
	ldr	ip, [r0]
	ldr	r1, [r1]
	sub	ip, ip, r1
	ldr	r1, .L123+12
	str	r4, [r0, #44]
	lsl	r4, r2, #3
	ldr	r0, .L123+16
	strh	ip, [r1, r4]	@ movhi
	orr	r3, r3, #16384
	add	r1, r1, r2, lsl #3
	add	r2, r2, #1
	strh	r3, [r1, #2]	@ movhi
	strh	r0, [r1, #4]	@ movhi
	str	r2, [lr]
	pop	{r4, lr}
	bx	lr
.L119:
	mov	r4, #1
	ldr	ip, .L123+12
	lsl	r1, r2, #3
	ldrh	r3, [ip, r1]
	add	r2, r2, #1
	orr	r3, r3, #512
	str	r4, [r0, #44]
	strh	r3, [ip, r1]	@ movhi
	str	r2, [lr]
	pop	{r4, lr}
	bx	lr
.L124:
	.align	2
.L123:
	.word	hOff
	.word	shadowOAMCount
	.word	vOff
	.word	shadowOAM
	.word	16736
	.size	drawBox, .-drawBox
	.align	2
	.global	drawBoxPuzzle1
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzle1, %function
drawBoxPuzzle1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L130
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L125
	mov	r5, r6
	mov	r4, #0
.L127:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #64
	bgt	.L127
.L125:
	pop	{r4, r5, r6, lr}
	bx	lr
.L131:
	.align	2
.L130:
	.word	boxPuzzle1
	.size	drawBoxPuzzle1, .-drawBoxPuzzle1
	.align	2
	.global	drawBoxPuzzle2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzle2, %function
drawBoxPuzzle2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L137
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L132
	mov	r5, r6
	mov	r4, #0
.L134:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #64
	bgt	.L134
.L132:
	pop	{r4, r5, r6, lr}
	bx	lr
.L138:
	.align	2
.L137:
	.word	boxPuzzle2
	.size	drawBoxPuzzle2, .-drawBoxPuzzle2
	.align	2
	.global	drawBoxPuzzle3
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzle3, %function
drawBoxPuzzle3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L144
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L139
	mov	r5, r6
	mov	r4, #0
.L141:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #64
	bgt	.L141
.L139:
	pop	{r4, r5, r6, lr}
	bx	lr
.L145:
	.align	2
.L144:
	.word	boxPuzzle3
	.size	drawBoxPuzzle3, .-drawBoxPuzzle3
	.align	2
	.global	drawBoxPuzzle4
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzle4, %function
drawBoxPuzzle4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L151
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L146
	mov	r5, r6
	mov	r4, #0
.L148:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r3, r4
	add	r5, r5, #64
	bgt	.L148
.L146:
	pop	{r4, r5, r6, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	boxPuzzle4
	.size	drawBoxPuzzle4, .-drawBoxPuzzle4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzles.part.0, %function
drawBoxPuzzles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r6, .L167
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L154
	mov	r5, r6
	mov	r4, #0
.L155:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r4, r3
	add	r5, r5, #64
	blt	.L155
.L154:
	ldr	r6, .L167+4
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L156
	mov	r5, r6
	mov	r4, #0
.L157:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r4, r3
	add	r5, r5, #64
	blt	.L157
.L156:
	ldr	r6, .L167+8
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L158
	mov	r5, r6
	mov	r4, #0
.L159:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r4, r3
	add	r5, r5, #64
	blt	.L159
.L158:
	ldr	r6, .L167+12
	ldr	r3, [r6, #640]
	cmp	r3, #0
	ble	.L153
	mov	r5, r6
	mov	r4, #0
.L161:
	mov	r0, r5
	bl	drawBox
	ldr	r3, [r6, #640]
	add	r4, r4, #1
	cmp	r4, r3
	add	r5, r5, #64
	blt	.L161
.L153:
	pop	{r4, r5, r6, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	boxPuzzle1
	.word	boxPuzzle2
	.word	boxPuzzle3
	.word	boxPuzzle4
	.size	drawBoxPuzzles.part.0, .-drawBoxPuzzles.part.0
	.align	2
	.global	drawBoxPuzzles
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBoxPuzzles, %function
drawBoxPuzzles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L171
	ldr	r3, [r3]
	cmp	r3, #2
	bxne	lr
	b	drawBoxPuzzles.part.0
.L172:
	.align	2
.L171:
	.word	currMap
	.size	drawBoxPuzzles, .-drawBoxPuzzles
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L179
	ldr	r0, [r3]
	cmp	r0, #0
	push	{r4, r5, r6, r7, lr}
	beq	.L176
	cmp	r0, #2
	ldr	r2, .L179+4
	ldr	r3, .L179+8
	movne	r2, #0
	movne	r3, #0
.L174:
	mov	ip, #1
	mov	r1, #0
	mov	r7, #3
	mov	r6, #7
	mov	r5, #6
	add	r0, r0, r0, lsl ip
	add	r0, r3, r0, lsl #4
.L175:
	ldm	r2, {r4, lr}
	str	r1, [r3, #44]
	str	r1, [r3, #24]
	str	r1, [r3, #28]
	str	ip, [r3, #12]
	str	ip, [r3, #8]
	str	r1, [r3, #36]
	str	r7, [r3, #40]
	str	r6, [r3, #20]
	str	r5, [r3, #16]
	str	r4, [r3, #4]
	str	lr, [r3], #48
	cmp	r3, r0
	add	r2, r2, #12
	bne	.L175
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L176:
	mov	r0, #5
	ldr	r2, .L179+12
	ldr	r3, .L179+16
	b	.L174
.L180:
	.align	2
.L179:
	.word	currMap
	.word	.LANCHOR0+108
	.word	enemiesStorage
	.word	.LANCHOR0+48
	.word	enemiesMain
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L187
	mov	lr, pc
	bx	r3
	mov	r6, #96
	mov	r3, #0
	mov	r2, #256
	mov	r4, #1
	ldr	r1, .L187+4
	ldr	r5, .L187+8
	str	r6, [r1]
	str	r3, [r5]
	ldr	r7, .L187+12
	ldr	lr, .L187+16
	ldr	ip, .L187+20
	ldr	r0, .L187+24
	ldr	r1, .L187+28
	ldr	r5, .L187+32
	ldr	r6, .L187+36
	str	r3, [r7]
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r1]
	ldr	lr, .L187+40
	str	r3, [r0]
	ldr	r1, .L187+44
	str	r2, [r5]
	ldr	r8, .L187+48
	ldr	r5, .L187+52
	ldr	r7, .L187+56
	ldr	ip, .L187+60
	str	r3, [r6]
	ldr	r0, .L187+64
	ldr	r3, .L187+68
	str	r2, [r8]
	str	r5, [r3]
	str	r4, [r7]
	str	r4, [lr]
	str	r0, [r1]
	str	r4, [ip]
	bl	initPlayer
	ldr	lr, .L187+72
	sub	r2, r5, #132
	mov	r1, r2
	mov	r3, lr
	mov	r8, #8
	mov	r7, #4
	add	r5, lr, #144
.L182:
	ldr	ip, [r1, #4]
	ldr	r0, [r1], #8
	str	r4, [r3, #44]
	str	r8, [r3, #16]
	str	r7, [r3, #20]
	str	ip, [r3]
	str	r0, [r3, #4]
	add	r3, r3, #48
	cmp	r5, r3
	bne	.L182
	mov	r1, #0
	ldr	r3, .L187+76
	ldr	r0, [r6]
	str	r1, [lr, #44]
	str	r1, [r3, #8]
	str	r1, [r3, #28]
	add	r1, r2, #40
	ldr	r5, [r2, #24]
	ldr	r4, [r2, #28]
	ldr	ip, [r2, #32]
	cmp	r0, #2
	ldr	r0, [r2, #36]
	ldm	r1, {r1, r2}
	str	r5, [r3]
	str	r4, [r3, #4]
	str	ip, [r3, #20]
	str	r0, [r3, #24]
	str	r1, [r3, #12]
	str	r1, [r3, #32]
	str	r2, [r3, #16]
	str	r2, [r3, #36]
	beq	.L186
.L183:
	bl	initEnemies
	bl	initObjects
	mov	r3, #0
	ldr	ip, .L187+80
	ldr	r0, .L187+84
	ldr	r1, .L187+88
	ldr	r2, .L187+92
	str	r3, [ip, #652]
	str	r3, [r0, #652]
	str	r3, [r1, #652]
	str	r3, [r2, #652]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L186:
	bl	initBoxPuzzles.part.0
	b	.L183
.L188:
	.align	2
.L187:
	.word	mgba_open
	.word	vOff
	.word	showDialogue
	.word	hOff
	.word	prevShowDialogue
	.word	showCode
	.word	prevShowCode
	.word	prevMap
	.word	currMapHeight
	.word	currMap
	.word	spawnStorageEnemies
	.word	collisionMap
	.word	currMapWidth
	.word	.LANCHOR0+132
	.word	spawnMainEnemies
	.word	currNoteCount
	.word	collisionMapBitmap
	.word	currNoteLocations
	.word	keys
	.word	doors
	.word	boxPuzzle1
	.word	boxPuzzle2
	.word	boxPuzzle3
	.word	boxPuzzle4
	.size	initGame, .-initGame
	.align	2
	.global	moveMap
	.syntax unified
	.arm
	.fpu softvfp
	.type	moveMap, %function
moveMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L198
	mov	r4, r0
	mov	lr, pc
	bx	r3
	ldr	r3, .L198+4
	ldr	r2, [r3]
	cmp	r2, #0
	bne	.L190
	cmp	r4, #0
	beq	.L191
	cmp	r4, #1
	beq	.L192
.L194:
	bl	initEnemies
	pop	{r4, r5, r6, lr}
	b	initObjects
.L190:
	mov	r2, #0
	mov	r0, #256
	mov	ip, #1
	str	r2, [r3]
	ldr	lr, .L198+8
	ldr	r3, .L198+12
	ldr	r1, .L198+16
	str	r0, [lr]
	str	r0, [r3]
	ldr	lr, .L198+20
	ldr	r0, .L198+24
	ldr	r1, [r1]
	ldr	r4, .L198+28
	ldr	r3, .L198+32
	str	r0, [lr]
	ldr	r0, .L198+36
	cmp	r1, ip
	str	ip, [r4]
	str	r0, [r3]
	beq	.L195
	cmp	r1, #2
	bne	.L194
	mov	lr, #8
	mov	r1, #168
	ldr	r3, .L198+40
	str	r1, [r3, #4]
	str	lr, [r3]
	ldr	r3, .L198+44
	ldr	r0, .L198+48
	ldr	r1, .L198+52
	str	ip, [r3, #140]
	str	r2, [r0]
	str	r2, [r1]
	bl	initEnemies
	pop	{r4, r5, r6, lr}
	b	initObjects
.L192:
	mov	r5, #2
	mov	r1, #256
	mov	r0, #16
	mov	ip, #232
	mov	lr, #96
	str	r5, [r3]
	ldr	r3, .L198+8
	str	r1, [r3]
	ldr	r3, .L198+12
	str	r1, [r3]
	ldr	r3, .L198+40
	str	ip, [r3]
	str	r0, [r3, #4]
	ldr	r3, .L198+28
	ldr	r0, .L198+48
	ldr	r1, .L198+20
	ldr	ip, .L198+56
	str	r4, [r3]
	ldr	r3, .L198+44
	str	lr, [r0]
	str	ip, [r1]
	ldr	r0, .L198+32
	ldr	ip, .L198+60
	ldr	r1, .L198+52
	str	r2, [r3, #140]
	str	ip, [r0]
	str	r2, [r1]
	bl	initBoxPuzzles.part.0
	bl	initEnemies
	pop	{r4, r5, r6, lr}
	b	initObjects
.L195:
	mov	lr, #88
	mov	ip, #8
	ldr	r3, .L198+40
	ldr	r0, .L198+48
	ldr	r1, .L198+52
	stm	r3, {ip, lr}
	str	r2, [r0]
	str	r2, [r1]
	bl	initEnemies
	pop	{r4, r5, r6, lr}
	b	initObjects
.L191:
	mov	r6, #1
	mov	r5, #2
	mov	ip, #256
	mov	r1, #176
	mov	lr, #96
	mov	r0, #31
	mov	r2, #232
	str	r6, [r3]
	ldr	r3, .L198+28
	str	r5, [r3]
	ldr	r3, .L198+8
	str	ip, [r3]
	ldr	r3, .L198+12
	str	r1, [r3]
	ldr	r3, .L198+40
	ldr	r1, .L198+48
	str	r2, [r3]
	str	r0, [r3, #4]
	str	lr, [r1]
	ldr	r0, .L198+20
	ldr	ip, .L198+64
	ldr	r2, .L198+32
	ldr	r1, .L198+68
	ldr	r3, .L198+52
	str	ip, [r0]
	str	r4, [r3]
	str	r1, [r2]
	bl	initEnemies
	pop	{r4, r5, r6, lr}
	b	initObjects
.L199:
	.align	2
.L198:
	.word	hideSprites
	.word	currMap
	.word	currMapWidth
	.word	currMapHeight
	.word	prevMap
	.word	currNoteLocations
	.word	.LANCHOR0+132
	.word	currNoteCount
	.word	collisionMap
	.word	collisionMapBitmap
	.word	player
	.word	keys
	.word	vOff
	.word	hOff
	.word	.LANCHOR0+148
	.word	storageRoomCollisionBitmap
	.word	.LANCHOR0+140
	.word	classroomACollisionBitmap
	.size	moveMap, .-moveMap
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r3, .L281
	ldrh	r3, [r3, #48]
	tst	r3, #64
	sub	sp, sp, #16
	beq	.L201
	ldr	r4, .L281+4
.L202:
	ldr	r3, .L281
	ldrh	r3, [r3, #48]
	tst	r3, #128
	beq	.L274
.L205:
	ldr	r3, .L281
	ldrh	r0, [r3, #48]
	ands	r0, r0, #32
	beq	.L275
.L208:
	ldr	r3, .L281
	ldrh	r3, [r3, #48]
	tst	r3, #16
	beq	.L210
.L271:
	ldr	lr, [r4, #4]
	ldr	r6, [r4, #16]
.L211:
	ldr	ip, [r4]
	cmp	ip, #183
	ble	.L213
	ldr	r3, .L281+8
	ldr	r2, .L281+12
	str	r2, [r3]
.L214:
	ldr	r3, .L281+16
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r7, [r4, #20]
	beq	.L272
	ldr	r3, .L281+20
	ldrh	r3, [r3]
	tst	r3, #1
	bne	.L272
	ldr	r3, .L281+24
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L268
.L272:
	ldr	r5, .L281+28
.L218:
	ldr	r3, [r5]
	cmp	r3, #2
	beq	.L276
.L240:
	mov	r5, #0
	mov	r3, r7
	str	r5, [sp, #4]
	str	r5, [sp]
	mov	r2, r6
	mov	r1, ip
	mov	r0, lr
	ldr	r5, .L281+32
	mov	lr, pc
	bx	r5
	cmp	r0, #1
	beq	.L277
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L213:
	sub	r3, ip, #87
	cmp	r3, #95
	bhi	.L215
	cmp	lr, #111
	bgt	.L216
	ldr	r3, .L281+8
	ldr	r2, .L281+36
	str	r2, [r3]
	b	.L214
.L276:
	ldr	r5, .L281+8
	ldr	r2, [r5]
	ldr	r3, [r2, #652]
	cmp	r3, #0
	bne	.L240
	mov	r3, #16
	add	r0, r2, #644
	ldm	r0, {r0, r1}
	mov	r2, r3
	str	ip, [sp, #4]
	str	lr, [sp]
	str	r7, [sp, #12]
	str	r6, [sp, #8]
	ldr	r6, .L281+40
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, [r5]
	add	r6, r4, #16
	ldmeq	r4, {ip, lr}
	ldrne	lr, [r4, #4]
	strne	r2, [r3, #652]
	ldrne	ip, [r4]
	ldm	r6, {r6, r7}
	b	.L240
.L210:
	mov	r0, #1
	ldr	r2, .L281+44
	ldr	r3, .L281+48
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L271
	ldr	r6, [r4, #16]
	ldr	lr, [r4, #4]
	rsb	r3, r6, #256
	cmp	lr, r3
	bge	.L211
	ldr	r2, .L281+52
	ldr	r1, [r4, #12]
	ldr	r3, [r2]
	add	lr, lr, r1
	cmp	r3, #15
	movle	r1, #1
	movgt	r1, #0
	cmp	lr, #120
	movle	r1, #0
	cmp	r1, #0
	addne	r3, r3, #1
	str	lr, [r4, #4]
	strne	r3, [r2]
	b	.L211
.L275:
	ldr	r2, .L281+44
	ldr	r3, .L281+48
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L208
	ldr	r3, [r4, #4]
	cmp	r3, #0
	ble	.L208
	ldr	r1, .L281+52
	ldr	r0, [r4, #12]
	ldr	r2, [r1]
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r4, #4]
	ble	.L208
	sub	r3, r3, r2
	cmp	r3, #119
	suble	r2, r2, #1
	strle	r2, [r1]
	b	.L208
.L274:
	mov	r0, #3
	ldr	r2, .L281+44
	ldr	r3, .L281+48
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	bne	.L205
	ldr	r3, [r4, #20]
	ldr	r2, [r4]
	rsb	r3, r3, #256
	cmp	r2, r3
	bge	.L205
	ldr	r1, .L281+56
	ldr	r0, [r4, #8]
	ldr	r3, [r1]
	add	r2, r2, r0
	cmp	r3, #95
	movle	r0, #1
	movgt	r0, #0
	cmp	r2, #80
	movle	r0, #0
	cmp	r0, #0
	addne	r3, r3, #1
	str	r2, [r4]
	strne	r3, [r1]
	b	.L205
.L201:
	mov	r0, #2
	ldr	r2, .L281+44
	ldr	r3, .L281+48
	str	r0, [r2]
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	ldr	r4, .L281+4
	bne	.L202
	ldr	r3, [r4]
	cmp	r3, #0
	ble	.L202
	ldr	r1, .L281+56
	ldr	r0, [r4, #8]
	ldr	r2, [r1]
	sub	r3, r3, r0
	cmp	r2, #0
	str	r3, [r4]
	ble	.L202
	sub	r3, r3, r2
	cmp	r3, #79
	suble	r2, r2, #1
	strle	r2, [r1]
	b	.L202
.L215:
	cmp	ip, #85
	bgt	.L216
	cmp	lr, #160
	ble	.L278
.L217:
	ldr	r3, .L281+8
	ldr	r2, .L281+60
	str	r2, [r3]
	b	.L214
.L277:
	add	r2, r4, #16
	ldr	r1, [r4]
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	ldr	r4, .L281+64
	mov	lr, pc
	bx	r4
	bl	moveMap
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	b	animatePlayer
.L216:
	cmp	ip, #168
	bgt	.L214
	cmp	lr, #160
	ble	.L214
	b	.L217
.L268:
	ldr	r8, .L281+44
	ldr	r5, [r8]
	mov	r1, ip
	mov	r0, lr
	mov	r3, r7
	mov	r2, r6
	str	r5, [sp]
	ldr	r5, .L281+68
	mov	lr, pc
	bx	r5
	ldr	r2, [r8]
	ldr	r3, [r4, #20]
	str	r2, [sp]
	mov	r6, r0
	ldr	r2, [r4, #16]
	ldr	r1, [r4]
	ldr	r5, .L281+72
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r5
	ldr	r2, .L281+76
	ldr	r3, .L281+80
	ldr	r2, [r2]
	ldr	r3, [r3]
	ldr	r1, [r8]
	str	r2, [sp, #8]
	str	r1, [sp]
	str	r3, [sp, #4]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r7, .L281+84
	mov	r5, r0
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r7
	ldr	r10, .L281+8
	ldr	r2, [r4, #20]
	ldr	ip, [r8]
	mov	r9, r0
	ldr	r0, [r10]
	ldr	r3, [r4, #16]
	ldr	r1, [r0, #640]
	stmib	sp, {r2, ip}
	str	r3, [sp]
	ldr	r7, .L281+88
	ldr	r3, [r4]
	ldr	r2, [r4, #4]
	mov	lr, pc
	bx	r7
	cmn	r6, #1
	mov	r7, r0
	beq	.L219
	ldr	r3, .L281+92
	add	r2, r6, r6, lsl #1
	add	r3, r3, r2, lsl #4
	ldr	r2, [r3, #44]
	cmp	r2, #0
	bne	.L219
	mov	r1, #1
	ldr	ip, .L281+96
	ldr	r0, [ip]
	add	lr, r0, r1
	str	lr, [ip]
	ldr	ip, .L281+100
	ldr	lr, .L281+104
	str	r0, [ip]
	ldr	ip, .L281+108
	ldr	r0, .L281+112
	cmp	r6, #0
	str	r1, [r3, #44]
	str	r1, [lr]
	str	r1, [ip, r6, lsl #2]
	str	r2, [r0]
	beq	.L220
	cmp	r6, #2
	moveq	r1, #3
	ldreq	r0, .L281+116
	ldreq	r3, .L281+120
	moveq	lr, pc
	bxeq	r3
.L219:
	cmn	r5, #1
	beq	.L222
	ldr	r3, .L281+124
	add	r2, r5, r5, lsl #2
	add	r3, r3, r2, lsl #2
	ldr	r2, [r3, #8]
	cmp	r2, #0
	bne	.L222
	ldr	r1, .L281+108
	ldr	r1, [r1, r5, lsl #2]
	cmp	r1, #1
	beq	.L279
	mov	r0, #1
	ldr	r1, .L281+104
	ldr	r3, .L281+112
	cmp	r5, #0
	str	r0, [r1]
	str	r2, [r3]
	beq	.L226
	cmp	r5, r0
	moveq	r1, #2
	ldreq	r0, .L281+128
	ldreq	r3, .L281+120
	moveq	lr, pc
	bxeq	r3
.L222:
	cmn	r9, #1
	ldreq	r5, .L281+28
	beq	.L230
	mov	r1, #0
	mov	r2, #1
	ldr	r3, .L281+112
	str	r1, [r3]
	ldr	r3, .L281+104
	cmp	r9, r1
	ldr	r5, .L281+28
	str	r2, [r3]
	bne	.L230
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L280
	cmp	r3, #1
	moveq	r1, #8
	ldreq	r0, .L281+132
	ldreq	r3, .L281+120
	moveq	lr, pc
	bxeq	r3
.L230:
	cmn	r7, #1
	ldr	r3, [r8]
	beq	.L233
	ldr	r2, [r10]
	ldr	r1, [r2, #652]
	cmp	r1, #0
	bne	.L233
	add	r1, r2, r7, lsl #6
	ldr	r0, [r1, #48]
	cmp	r0, #0
	lsl	r7, r7, #6
	bne	.L233
	mov	r0, #1
	str	r3, [r1, #60]
	str	r0, [r1, #48]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L233
.L235:
	.word	.L238
	.word	.L237
	.word	.L236
	.word	.L234
.L234:
	mov	r0, #1
	mov	r1, #0
	add	r2, r2, r7
	str	r0, [r2, #8]
	str	r1, [r2, #12]
.L233:
	str	r3, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r6, .L281+136
	ldr	r0, [r4, #4]
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	movne	r0, #1
	ldrne	r3, .L281+140
	ldrne	r2, .L281+144
	ldrne	r1, [r3]
	add	r6, r4, #16
	strne	r0, [r3]
	strne	r1, [r2]
	ldm	r4, {ip, lr}
	ldm	r6, {r6, r7}
	b	.L218
.L278:
	ldr	r3, .L281+8
	ldr	r2, .L281+148
	str	r2, [r3]
	b	.L214
.L236:
	mvn	r0, #0
	mov	r1, #0
	add	r2, r2, r7
	str	r0, [r2, #8]
	str	r1, [r2, #12]
	b	.L233
.L237:
	mov	r0, #1
	mov	r1, #0
	add	r2, r2, r7
	str	r0, [r2, #12]
	str	r1, [r2, #8]
	b	.L233
.L238:
	mvn	r0, #0
	mov	r1, #0
	add	r2, r2, r7
	str	r0, [r2, #12]
	str	r1, [r2, #8]
	b	.L233
.L279:
	ldr	r0, .L281+112
	str	r1, [r3, #8]
	ldr	r3, .L281+104
	cmp	r5, #0
	str	r2, [r0]
	str	r1, [r3]
	beq	.L224
	cmp	r5, #1
	bne	.L222
	mov	r1, #2
	ldr	r0, .L281+152
	ldr	r3, .L281+120
	mov	lr, pc
	bx	r3
	b	.L222
.L220:
	mov	r1, #4
	ldr	r0, .L281+156
	ldr	r3, .L281+120
	mov	lr, pc
	bx	r3
	b	.L219
.L280:
	mov	r1, #7
	ldr	r0, .L281+160
	ldr	r3, .L281+120
	mov	lr, pc
	bx	r3
	b	.L230
.L226:
	mov	r1, #2
	ldr	r0, .L281+164
	ldr	r3, .L281+120
	mov	lr, pc
	bx	r3
	b	.L222
.L224:
	mov	r1, #2
	ldr	r0, .L281+168
	ldr	r3, .L281+120
	mov	lr, pc
	bx	r3
	b	.L222
.L282:
	.align	2
.L281:
	.word	67109120
	.word	player
	.word	currBoxPuzzle
	.word	boxPuzzle1
	.word	oldButtons
	.word	buttons
	.word	intCD
	.word	currMap
	.word	checkCollision
	.word	boxPuzzle2
	.word	collision
	.word	playerDirection
	.word	checkPlayerCollision
	.word	hOff
	.word	vOff
	.word	boxPuzzle4
	.word	doorCollision
	.word	keyCollision
	.word	lockedDoorCollision
	.word	currNoteCount
	.word	currNoteLocations
	.word	noteCollision
	.word	boxCollision
	.word	keys
	.word	currHeldKeys
	.word	prevHeldKeys
	.word	showDialogue
	.word	heldKeys
	.word	prevShowDialogue
	.word	entranceKeyD
	.word	initDialogue
	.word	doors
	.word	storageRoomDoorLD
	.word	notesClass1D
	.word	codePuzzleCollision
	.word	showCode
	.word	prevShowCode
	.word	boxPuzzle3
	.word	storageRoomDoorD
	.word	classroomAKeyD
	.word	notesMain1D
	.word	classroomADoorLD
	.word	classroomADoorD
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateMainEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateMainEnemies, %function
updateMainEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L293
	ldr	r3, .L293+4
	ldr	r2, [r0, #168]
	smull	ip, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #1
	add	r3, r3, r3, lsl #2
	subs	r3, r2, r3
	push	{r4, r5, r6, r7, r8, lr}
	bne	.L285
	ldr	r2, [r0, #148]
	cmp	r2, #239
	ldr	r1, [r0, #156]
	ble	.L292
.L286:
	sub	r2, r2, r1
	cmp	r2, #208
	str	r2, [r0, #148]
	movle	r2, #1
	ldrle	r3, .L293+8
	strle	r2, [r3, #92]
.L285:
	ldr	r5, .L293
	ldr	r8, .L293+4
	ldr	r6, .L293+12
	add	r7, r5, #240
.L288:
	ldr	r4, [r5, #24]
	smull	r3, r2, r8, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	bne	.L289
	add	r0, r5, #36
	ldm	r0, {r0, r1}
	add	r0, r0, #1
	mov	lr, pc
	bx	r6
	str	r1, [r5, #36]
.L289:
	add	r4, r4, #1
	str	r4, [r5, #24]
	add	r5, r5, #48
	cmp	r5, r7
	bne	.L288
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L292:
	ldr	ip, .L293+8
	ldr	lr, [ip, #92]
	cmp	lr, #1
	bne	.L286
	add	r2, r2, r1
	cmp	r2, #239
	str	r2, [r0, #148]
	strgt	r3, [ip, #92]
	b	.L285
.L294:
	.align	2
.L293:
	.word	enemiesMain
	.word	1717986919
	.word	.LANCHOR0
	.word	__aeabi_idivmod
	.size	updateMainEnemies, .-updateMainEnemies
	.align	2
	.global	updateEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemies, %function
updateEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L312
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L296
	cmp	r3, #2
	bxne	lr
	ldr	r3, .L312+4
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	push	{r4, r5, r6, lr}
	ldr	r4, .L312+8
	ldr	r3, .L312+12
	ldr	r6, [r4, #24]
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r6, r3, lsl #2
	bne	.L299
	ldr	r0, [r4, #36]
	ldr	r3, .L312+16
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L299:
	ldr	r5, [r4, #72]
	ldr	r3, .L312+12
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	add	r6, r6, #1
	cmp	r5, r3, lsl #2
	str	r6, [r4, #24]
	bne	.L300
	ldr	r0, [r4, #84]
	ldr	r3, .L312+16
	ldr	r1, [r4, #88]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #84]
.L300:
	add	r5, r5, #1
	str	r5, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L296:
	ldr	r3, .L312+20
	ldr	r3, [r3]
	cmp	r3, #0
	bxeq	lr
	b	updateMainEnemies
.L313:
	.align	2
.L312:
	.word	currMap
	.word	spawnStorageEnemies
	.word	enemiesStorage
	.word	1717986919
	.word	__aeabi_idivmod
	.word	spawnMainEnemies
	.size	updateEnemies, .-updateEnemies
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L334
	ldr	r3, [r4]
	cmp	r3, #0
	bne	.L330
	ldr	r3, .L334+4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L331
.L317:
	bl	updatePlayer
	ldr	r2, .L334+8
	ldr	r3, [r2]
	add	r3, r3, #1
	mov	r4, #0
	str	r3, [r2]
	ldr	r5, .L334+12
	b	.L320
.L319:
	add	r4, r4, #1
	cmp	r4, #10
	beq	.L332
.L320:
	ldr	r1, [r5]
	add	r0, r1, r4, lsl #6
	ldr	r3, [r0, #48]
	cmp	r3, #0
	beq	.L319
	mov	r2, r4
	ldr	r3, [r1, #640]
	add	r4, r4, #1
	bl	updateBox
	cmp	r4, #10
	bne	.L320
.L332:
	pop	{r4, r5, r6, lr}
	b	updateEnemies
.L331:
	ldr	r3, .L334+16
	mov	lr, pc
	bx	r3
.L316:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L333
	pop	{r4, r5, r6, lr}
	bx	lr
.L333:
	ldr	r3, .L334+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L317
	pop	{r4, r5, r6, lr}
	bx	lr
.L330:
	mov	r1, #0
	ldr	r2, .L334+8
	ldr	r3, .L334+20
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	b	.L316
.L335:
	.align	2
.L334:
	.word	showDialogue
	.word	showCode
	.word	intCD
	.word	currBoxPuzzle
	.word	updateCode
	.word	updateDialogue
	.size	updateGame, .-updateGame
	.align	2
	.global	updateStorageEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateStorageEnemies, %function
updateStorageEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L340
	ldr	r3, .L340+4
	ldr	r6, [r4, #24]
	smull	r1, r2, r3, r6
	asr	r3, r6, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r6, r3, lsl #2
	bne	.L337
	ldr	r0, [r4, #36]
	ldr	r3, .L340+8
	ldr	r1, [r4, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #36]
.L337:
	ldr	r5, [r4, #72]
	ldr	r3, .L340+4
	smull	r1, r2, r3, r5
	asr	r3, r5, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	add	r6, r6, #1
	cmp	r5, r3, lsl #2
	str	r6, [r4, #24]
	bne	.L338
	ldr	r0, [r4, #84]
	ldr	r3, .L340+8
	ldr	r1, [r4, #88]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r4, #84]
.L338:
	add	r5, r5, #1
	str	r5, [r4, #72]
	pop	{r4, r5, r6, lr}
	bx	lr
.L341:
	.align	2
.L340:
	.word	enemiesStorage
	.word	1717986919
	.word	__aeabi_idivmod
	.size	updateStorageEnemies, .-updateStorageEnemies
	.align	2
	.global	animateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	animateEnemy, %function
animateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L345
	ldr	r4, [r0, #24]
	smull	r1, r2, r3, r4
	asr	r3, r4, #31
	rsb	r3, r3, r2, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r4, r3, lsl #2
	mov	r5, r0
	bne	.L343
	ldr	r0, [r0, #36]
	ldr	r3, .L345+4
	ldr	r1, [r5, #40]
	add	r0, r0, #1
	mov	lr, pc
	bx	r3
	str	r1, [r5, #36]
.L343:
	add	r4, r4, #1
	str	r4, [r5, #24]
	pop	{r4, r5, r6, lr}
	bx	lr
.L346:
	.align	2
.L345:
	.word	1717986919
	.word	__aeabi_idivmod
	.size	animateEnemy, .-animateEnemy
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L352
	ldr	r2, [r0, #4]
	ldr	r3, [r3]
	ldr	ip, .L352+4
	subs	r1, r2, r3
	push	{r4, r5, lr}
	ldr	r3, [ip]
	bmi	.L348
	mov	r4, #0
	ldr	lr, .L352+8
	ldr	r2, [r0, #36]
	ldr	r5, [lr]
	ldr	lr, [r0]
	add	r2, r2, #6
	sub	lr, lr, r5
	ldr	r5, .L352+12
	lsl	r2, r2, #5
	str	r4, [r0, #44]
	orr	r2, r2, #4096
	add	r4, r5, r3, lsl #3
	lsl	r0, r3, #3
	add	r3, r3, #1
	strh	lr, [r5, r0]	@ movhi
	strh	r2, [r4, #4]	@ movhi
	strh	r1, [r4, #2]	@ movhi
	str	r3, [ip]
	pop	{r4, r5, lr}
	bx	lr
.L348:
	mov	r4, #1
	ldr	lr, .L352+12
	lsl	r1, r3, #3
	ldrh	r2, [lr, r1]
	add	r3, r3, #1
	orr	r2, r2, #512
	str	r4, [r0, #44]
	strh	r2, [lr, r1]	@ movhi
	str	r3, [ip]
	pop	{r4, r5, lr}
	bx	lr
.L353:
	.align	2
.L352:
	.word	hOff
	.word	shadowOAMCount
	.word	vOff
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	drawEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemies, %function
drawEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L365
	ldr	r3, [r3]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L355
	cmp	r3, #2
	bne	.L354
	ldr	r3, .L365+4
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L354
	ldr	r0, .L365+8
	bl	drawEnemy
	ldr	r0, .L365+12
	pop	{r4, lr}
	b	drawEnemy
.L355:
	ldr	r3, .L365+16
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L364
.L354:
	pop	{r4, lr}
	bx	lr
.L364:
	ldr	r0, .L365+20
	bl	drawEnemy
	ldr	r0, .L365+24
	bl	drawEnemy
	ldr	r0, .L365+28
	bl	drawEnemy
	ldr	r0, .L365+32
	bl	drawEnemy
	ldr	r0, .L365+36
	pop	{r4, lr}
	b	drawEnemy
.L366:
	.align	2
.L365:
	.word	currMap
	.word	spawnStorageEnemies
	.word	enemiesStorage
	.word	enemiesStorage+48
	.word	spawnMainEnemies
	.word	enemiesMain
	.word	enemiesMain+48
	.word	enemiesMain+96
	.word	enemiesMain+144
	.word	enemiesMain+192
	.size	drawEnemies, .-drawEnemies
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L383
	ldr	r1, [r5]
	ldr	r3, .L383+4
	cmp	r1, r2
	ldr	r4, .L383+8
	str	r2, [r3]
	bne	.L368
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L381
.L369:
	ldr	r5, .L383+12
	ldr	r2, [r5]
	cmp	r2, r3
	bne	.L382
.L373:
	ldr	r3, .L383+16
	mov	lr, pc
	bx	r3
.L372:
	ldr	r3, .L383+20
	mov	lr, pc
	bx	r3
	ldr	r4, .L383+24
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L383+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	ldr	r2, .L383+32
	ldrh	r1, [r2]
	ldr	r2, .L383+36
	ldrh	r2, [r2]
	strh	r1, [r3, #20]	@ movhi
	pop	{r4, r5, r6, lr}
	strh	r2, [r3, #22]	@ movhi
	bx	lr
.L381:
	bl	drawPlayer
	ldr	r3, .L383+40
	ldr	r3, [r3]
	cmp	r3, #2
	bleq	drawBoxPuzzles.part.0
.L370:
	bl	drawObjects
	bl	drawEnemies
	ldr	r0, .L383+44
	bl	drawKey
	ldr	r0, .L383+48
	bl	drawKey
	ldr	r0, .L383+52
	bl	drawKey
	ldr	r3, [r5]
	cmp	r3, #0
	beq	.L380
.L368:
	ldr	r3, .L383+56
	mov	lr, pc
	bx	r3
.L380:
	ldr	r3, [r4]
	cmp	r3, #0
	beq	.L372
	b	.L369
.L382:
	ldr	r3, .L383+60
	mov	lr, pc
	bx	r3
	ldr	r3, [r4]
	str	r3, [r5]
	b	.L373
.L384:
	.align	2
.L383:
	.word	showDialogue
	.word	shadowOAMCount
	.word	showCode
	.word	prevShowCode
	.word	drawCode
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	hOff
	.word	vOff
	.word	currMap
	.word	keys
	.word	keys+48
	.word	keys+96
	.word	drawDialogue
	.word	initCodePuzzle
	.size	drawGame, .-drawGame
	.set	CSWTCH.164,CSWTCH.160
	.set	CSWTCH.163,CSWTCH.159
	.comm	collisionMap,4,4
	.comm	intCD,4,4
	.comm	prevMap,4,4
	.comm	currMap,4,4
	.comm	currMapHeight,4,4
	.comm	currMapWidth,4,4
	.comm	prevShowCode,4,4
	.comm	showCode,4,4
	.comm	prevShowDialogue,4,4
	.comm	showDialogue,4,4
	.comm	shadowOAMCount,4,4
	.comm	playerDirection,4,4
	.global	objectStorageLocations
	.global	objectClassLocations
	.global	objectMainLocations
	.comm	spawnStorageEnemies,4,4
	.comm	spawnMainEnemies,4,4
	.global	enemyStorageLocations
	.global	enemyMainLocations
	.comm	currNoteCount,4,4
	.comm	currNoteLocations,4,4
	.global	noteStorageLocations
	.global	noteClassroomLocations
	.global	noteMainLocations
	.global	codePuzzleLocations
	.comm	currBoxPuzzle,4,4
	.comm	boxPuzzle4,656,4
	.comm	boxPuzzle3,656,4
	.comm	boxPuzzle2,656,4
	.comm	boxPuzzle1,656,4
	.global	doorHeight
	.global	doorWidth
	.global	doorLocations
	.comm	doors,40,4
	.comm	prevHeldKeys,4,4
	.comm	currHeldKeys,4,4
	.global	keyLocations
	.comm	heldKeys,12,4
	.comm	objectsStorage,96,4
	.comm	objectsClass,144,4
	.comm	objectsMain,144,4
	.comm	keys,144,4
	.comm	enemiesStorage,96,4
	.comm	enemiesMain,240,4
	.comm	player,48,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.section	.rodata
	.align	2
	.set	.LANCHOR1,. + 0
	.type	CSWTCH.159, %object
	.size	CSWTCH.159, 12
CSWTCH.159:
	.word	3
	.word	3
	.word	2
	.type	CSWTCH.160, %object
	.size	CSWTCH.160, 12
CSWTCH.160:
	.word	objectsMain
	.word	objectsClass
	.word	objectsStorage
	.type	CSWTCH.161, %object
	.size	CSWTCH.161, 12
CSWTCH.161:
	.word	objectMainLocations
	.word	objectClassLocations
	.word	objectStorageLocations
.LC0:
	.word	32
	.word	184
	.word	32
	.word	200
	.word	48
	.word	216
	.word	48
	.word	232
	.word	64
	.word	200
	.word	80
	.word	184
	.word	80
	.word	216
.LC2:
	.word	32
	.word	24
	.word	48
	.word	24
	.word	64
	.word	24
	.word	80
	.word	8
	.word	48
	.word	40
	.word	48
	.word	56
.LC3:
	.word	208
	.word	8
	.word	192
	.word	24
	.word	176
	.word	40
	.word	176
	.word	56
	.word	176
	.word	88
	.word	208
	.word	88
	.word	224
	.word	104
	.word	192
	.word	136
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	keyLocations, %object
	.size	keyLocations, 24
keyLocations:
	.word	70
	.word	160
	.word	0
	.word	0
	.word	240
	.word	240
	.type	doorLocations, %object
	.size	doorLocations, 16
doorLocations:
	.word	80
	.word	0
	.word	160
	.word	0
	.type	doorWidth, %object
	.size	doorWidth, 4
doorWidth:
	.word	24
	.type	doorHeight, %object
	.size	doorHeight, 4
doorHeight:
	.word	8
	.type	enemyMainLocations, %object
	.size	enemyMainLocations, 60
enemyMainLocations:
	.word	88
	.word	160
	.word	0
	.word	88
	.word	170
	.word	0
	.word	103
	.word	177
	.word	0
	.word	208
	.word	64
	.word	1
	.word	208
	.word	136
	.word	1
	.type	enemyStorageLocations, %object
	.size	enemyStorageLocations, 24
enemyStorageLocations:
	.word	20
	.word	30
	.word	0
	.word	100
	.word	20
	.word	0
	.type	noteMainLocations, %object
	.size	noteMainLocations, 8
noteMainLocations:
	.word	113
	.word	7
	.type	noteClassroomLocations, %object
	.size	noteClassroomLocations, 8
noteClassroomLocations:
	.word	40
	.word	80
	.type	noteStorageLocations, %object
	.size	noteStorageLocations, 8
noteStorageLocations:
	.word	3
	.word	10
	.type	objectStorageLocations, %object
	.size	objectStorageLocations, 12
objectStorageLocations:
	.word	1
	.word	1
	.word	0
	.type	objectClassLocations, %object
	.size	objectClassLocations, 24
objectClassLocations:
	.word	71
	.word	124
	.word	1
	.word	42
	.word	91
	.word	1
	.type	objectMainLocations, %object
	.size	objectMainLocations, 36
objectMainLocations:
	.word	115
	.word	10
	.word	1
	.word	95
	.word	11
	.word	1
	.word	174
	.word	11
	.word	1
	.type	codePuzzleLocations, %object
	.size	codePuzzleLocations, 8
codePuzzleLocations:
	.word	64
	.word	116
	.ident	"GCC: (devkitARM release 53) 9.1.0"
