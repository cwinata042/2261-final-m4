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
	.file	"collision.c"
	.text
	.align	2
	.global	keyCollision
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	keyCollision, %function
keyCollision:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r7, r1
	mov	r10, r0
	mov	r9, r2
	mov	r4, #0
	sub	sp, sp, #28
	mov	r8, r3
	add	r3, r1, #1
	str	r3, [sp, #16]
	sub	r3, r1, #1
	ldr	r6, .L17
	ldr	r5, .L17+4
	ldr	fp, .L17+8
	str	r3, [sp, #20]
.L10:
	ldr	r3, [sp, #64]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L2
.L4:
	.word	.L7
	.word	.L6
	.word	.L5
	.word	.L3
.L3:
	str	r8, [sp, #12]
	str	r9, [sp, #8]
	ldr	r3, [sp, #16]
.L15:
	str	r3, [sp, #4]
	str	r10, [sp]
.L14:
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldm	r6, {r0, r1}
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L1
.L2:
	add	r4, r4, #1
	cmp	r4, #3
	add	r6, r6, #8
	add	r5, r5, #48
	bne	.L10
	mvn	r4, #0
.L1:
	mov	r0, r4
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L5:
	str	r8, [sp, #12]
	str	r9, [sp, #8]
	ldr	r3, [sp, #20]
	b	.L15
.L7:
	sub	r3, r10, #1
	stm	sp, {r3, r7, r9}
	str	r8, [sp, #12]
	b	.L14
.L6:
	add	r3, r10, #1
	stm	sp, {r3, r7, r9}
	str	r8, [sp, #12]
	b	.L14
.L18:
	.align	2
.L17:
	.word	keyLocations
	.word	keys
	.word	collision
	.size	keyCollision, .-keyCollision
	.align	2
	.global	doorCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	doorCollision, %function
doorCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	fp, .L24
	ldr	r10, .L24+4
	ldr	r8, .L24+8
	sub	sp, sp, #20
	stm	sp, {r0, r1, r2, r3}
	mov	r4, r0
	mov	r5, r1
	mov	r6, r2
	mov	r7, r3
	ldr	r2, [r10]
	ldr	r3, [fp]
	ldm	r8, {r0, r1}
	ldr	r9, .L24+12
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	bne	.L21
	stm	sp, {r4, r5, r6, r7}
	add	r0, r8, #8
	ldr	r3, [fp]
	ldr	r2, [r10]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	mvneq	r0, #0
	movne	r0, #1
.L19:
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L21:
	mov	r0, #0
	b	.L19
.L25:
	.align	2
.L24:
	.word	doorHeight
	.word	doorWidth
	.word	doorLocations
	.word	collision
	.size	doorCollision, .-doorCollision
	.align	2
	.global	noteCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	noteCollision, %function
noteCollision:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #28
	ldr	r7, [sp, #72]
	cmp	r7, #0
	str	r1, [sp, #16]
	ldr	r6, [sp, #64]
	ble	.L27
	mov	r8, r0
	mov	r9, r2
	mov	r5, #0
	mov	r10, r3
	ldr	r3, [sp, #68]
	add	r4, r3, #4
	add	r3, r1, #1
	ldr	fp, .L44
	str	r3, [sp, #20]
.L36:
	cmp	r6, #3
	ldrls	pc, [pc, r6, asl #2]
	b	.L28
.L30:
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L29
.L29:
	ldr	r1, [sp, #20]
	ldr	r0, [r4, #-4]
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	str	r1, [sp, #4]
	str	r8, [sp]
	mov	r3, #8
	mov	r2, #6
	ldr	r1, [r4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L26
.L28:
	add	r5, r5, #1
	cmp	r7, r5
	add	r4, r4, #8
	bne	.L36
.L27:
	mvn	r5, #0
.L26:
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L32:
	mov	r3, #8
	ldr	r0, [r4, #-4]
	add	r2, r8, #1
.L43:
	ldr	r1, [sp, #16]
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	str	r1, [sp, #4]
	str	r2, [sp]
.L41:
	mov	r2, #6
	ldr	r1, [r4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L28
	mov	r0, r5
	add	sp, sp, #28
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L33:
	mov	r3, #8
	ldr	r0, [r4, #-4]
	sub	r2, r8, #1
	b	.L43
.L31:
	ldr	r2, [sp, #16]
	sub	r2, r2, #1
	ldr	r0, [r4, #-4]
	mov	r3, #8
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	str	r8, [sp]
	str	r2, [sp, #4]
	b	.L41
.L45:
	.align	2
.L44:
	.word	collision
	.size	noteCollision, .-noteCollision
	.align	2
	.global	codePuzzleCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	codePuzzleCollision, %function
codePuzzleCollision:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	sub	sp, sp, #20
	ldr	ip, [sp, #32]
	cmp	ip, #3
	mov	lr, r3
	ldrls	r3, .L53
	addls	r4, r3, ip, lsl #2
	ldrls	r5, [r3, ip, lsl #2]
	ldr	ip, .L53+4
	ldr	ip, [ip]
	ldrls	r4, [r4, #16]
	cmp	ip, #1
	beq	.L52
.L50:
	mov	r0, #0
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L52:
	ldr	r3, .L53+8
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L50
	mov	r3, #16
	add	r1, r5, r1
	add	r0, r4, r0
	stm	sp, {r0, r1, r2, lr}
	ldr	ip, .L53+12
	mov	r2, r3
	ldm	ip, {r0, r1}
	ldr	r4, .L53+16
	mov	lr, pc
	bx	r4
	subs	r0, r0, #0
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	.LANCHOR0
	.word	currMap
	.word	codePuzzles
	.word	codePuzzleLocations
	.word	collision
	.size	codePuzzleCollision, .-codePuzzleCollision
	.align	2
	.global	lockedDoorCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	lockedDoorCollision, %function
lockedDoorCollision:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r9, r0
	mov	r8, r1
	mov	r7, r2
	mov	r6, r3
	mov	r5, #0
	ldr	r4, .L92
	ldr	r10, .L92+4
	ldr	fp, .L92+8
	sub	sp, sp, #20
.L63:
	ldr	r3, [sp, #56]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L65
.L58:
	.word	.L61
	.word	.L60
	.word	.L59
	.word	.L57
.L65:
	mvn	r5, #0
.L55:
	mov	r0, r5
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L57:
	add	r3, r8, #1
	str	r6, [sp, #12]
	str	r7, [sp, #8]
	str	r9, [sp]
	str	r3, [sp, #4]
.L90:
	ldr	r2, .L92+12
	ldr	r3, [fp]
	ldr	r2, [r2]
	ldm	r4, {r0, r1}
	ldr	ip, .L92+16
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	beq	.L64
	ldr	r3, [r10, #8]
	cmp	r3, #0
	beq	.L55
.L64:
	cmp	r5, #1
	add	r4, r4, #8
	add	r10, r10, #20
	beq	.L65
	mov	r5, #1
	b	.L63
.L59:
	sub	r3, r8, #1
	str	r6, [sp, #12]
	str	r7, [sp, #8]
	str	r9, [sp]
	str	r3, [sp, #4]
	b	.L90
.L60:
	add	r3, r9, #1
.L91:
	stm	sp, {r3, r8}
	str	r6, [sp, #12]
	str	r7, [sp, #8]
	b	.L90
.L61:
	sub	r3, r9, #1
	b	.L91
.L93:
	.align	2
.L92:
	.word	doorLocations
	.word	doors
	.word	doorHeight
	.word	doorWidth
	.word	collision
	.size	lockedDoorCollision, .-lockedDoorCollision
	.align	2
	.global	boxCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	boxCollision, %function
boxCollision:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	add	r9, sp, #72
	subs	r7, r1, #0
	str	r3, [sp, #20]
	ldm	r9, {r9, r10}
	ldr	r6, [sp, #80]
	ble	.L95
	mov	r4, r0
	mov	r5, #0
	mov	r8, r2
	add	r2, r3, #1
	sub	r3, r3, #1
	ldr	fp, .L111
	str	r2, [sp, #24]
	str	r3, [sp, #28]
.L104:
	cmp	r6, #3
	ldrls	pc, [pc, r6, asl #2]
	b	.L96
.L98:
	.word	.L101
	.word	.L100
	.word	.L99
	.word	.L97
.L97:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	ldr	r1, [sp, #24]
	str	r10, [sp, #12]
	str	r9, [sp, #8]
.L108:
	str	r1, [sp, #4]
	str	r8, [sp]
	ldr	r1, [r4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	bne	.L94
.L96:
	add	r5, r5, #1
	cmp	r7, r5
	add	r4, r4, #64
	bne	.L104
.L95:
	mvn	r5, #0
.L94:
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L100:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	add	r1, r8, #1
.L110:
	ldr	ip, [sp, #20]
	stm	sp, {r1, ip}
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	ldr	r1, [r4]
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	beq	.L96
	mov	r0, r5
	add	sp, sp, #36
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L101:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	sub	r1, r8, #1
	b	.L110
.L99:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r0, [r4, #4]
	ldr	r1, [sp, #28]
	str	r10, [sp, #12]
	str	r9, [sp, #8]
	b	.L108
.L112:
	.align	2
.L111:
	.word	collision
	.size	boxCollision, .-boxCollision
	.align	2
	.global	checkCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkCollision, %function
checkCollision:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	subs	r7, r2, #0
	mov	r5, r0
	ldr	r6, [sp, #24]
	mov	r0, #256
	ldr	r2, [sp, #28]
	ble	.L114
	ldr	ip, .L122
	add	r4, r3, r1
	ldr	lr, [ip]
	add	r4, r4, r2
	add	ip, r5, r6
	add	r8, lr, r6
	add	r4, ip, r4, lsl #8
	add	r2, r1, r2
	add	r8, r8, r5
	sub	r4, r4, #256
	add	r8, r8, r2, lsl #8
	sub	r4, r4, #1
	add	r2, ip, r2, lsl #8
	add	r4, lr, r4
	add	r8, r8, r7
	add	lr, lr, r2
.L115:
	ldrb	ip, [r4, #1]!	@ zero_extendqisi2
	ldrb	r2, [lr], #1	@ zero_extendqisi2
	cmp	ip, r2
	movge	ip, r2
	cmp	r0, ip
	movge	r0, ip
	cmp	r8, lr
	bne	.L115
.L114:
	cmp	r3, #0
	ble	.L113
	ldr	r2, .L122
	add	r7, r7, r5
	ldr	r2, [r2]
	add	r7, r7, r6
	add	ip, r3, r1
	add	ip, r2, ip, lsl #8
	add	r1, r7, r1, lsl #8
	add	r5, r5, r6
	add	r2, r2, r1
	add	ip, ip, r7
.L117:
	sub	r3, r2, r7
	ldrb	r3, [r3, r5]	@ zero_extendqisi2
	ldrb	r1, [r2, #-1]	@ zero_extendqisi2
	cmp	r3, r1
	movge	r3, r1
	add	r2, r2, #256
	cmp	r0, r3
	movge	r0, r3
	cmp	ip, r2
	bne	.L117
.L113:
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	collisionMap
	.size	checkCollision, .-checkCollision
	.align	2
	.global	checkPlayerCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkPlayerCollision, %function
checkPlayerCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r4, .L139
	sub	sp, sp, #20
	str	r0, [sp]
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	mov	r5, r0
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	bl	lockedDoorCollision
	ldr	r3, .L139+4
	ldr	r3, [r3]
	cmp	r3, #2
	mov	r7, r0
	mvnne	r6, #0
	beq	.L138
.L125:
	cmp	r5, #3
	ldrls	pc, [pc, r5, asl #2]
	b	.L135
.L132:
	.word	.L126
	.word	.L128
	.word	.L129
	.word	.L130
.L135:
	mov	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L138:
	ldr	r3, .L139+8
	ldr	r2, [r4, #20]
	ldr	r0, [r3]
	ldr	r3, [r4, #16]
	ldr	r1, [r0, #640]
	stmib	sp, {r2, r5}
	str	r3, [sp]
	ldr	r2, [r4, #4]
	ldr	r3, [r4]
	bl	boxCollision
	mov	r6, r0
	b	.L125
.L130:
	mov	r2, #0
	ldr	r3, [r4, #8]
	stm	sp, {r2, r3}
.L137:
	add	r2, r4, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r4]
	ldr	r0, [r4, #4]
	bl	checkCollision
	bics	r3, r0, #2
	beq	.L135
	and	r0, r7, r6
	adds	r0, r0, #1
	movne	r0, #1
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L126:
	mov	r2, #0
	ldr	r3, [r4, #12]
	rsb	r3, r3, #0
	str	r3, [sp]
	str	r2, [sp, #4]
	b	.L137
.L128:
	mov	r2, #0
	ldr	r3, [r4, #12]
	str	r2, [sp, #4]
	str	r3, [sp]
	b	.L137
.L129:
	mov	r2, #0
	ldr	r3, [r4, #8]
	rsb	r3, r3, #0
	stm	sp, {r2, r3}
	b	.L137
.L140:
	.align	2
.L139:
	.word	player
	.word	currMap
	.word	currBoxPuzzle
	.size	checkPlayerCollision, .-checkPlayerCollision
	.align	2
	.global	checkBoxCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	checkBoxCollision, %function
checkBoxCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	ip, [r0, #4]
	sub	sp, sp, #44
	cmp	ip, #0
	mov	r7, r2
	mov	r6, r3
	str	ip, [sp, #16]
	bne	.L142
	ldr	r3, [r0, #60]
	rsbs	r3, r3, #1
	movcc	r3, #0
	str	ip, [sp, #36]
	str	r3, [sp, #32]
.L143:
	ldr	r3, [r0]
	ldr	r2, [r0, #8]
	ldr	ip, [r0, #12]
	add	r8, r0, #16
	cmp	r6, #0
	str	r3, [sp, #20]
	str	r2, [sp, #24]
	str	ip, [sp, #28]
	ldm	r8, {r8, r9}
	ble	.L144
	mov	r4, r1
	mov	r5, #0
	add	fp, r3, r2
	ldr	r3, [sp, #16]
	add	r10, r3, ip
.L146:
	cmp	r7, r5
	add	r5, r5, #1
	beq	.L147
	ldr	r3, [r4, #20]
	str	r3, [sp, #12]
	ldr	r2, [r4]
	ldr	r3, [r4, #16]
	stmib	sp, {r2, r3}
	ldr	r2, [r4, #4]
	mov	r3, r9
	str	r2, [sp]
	mov	r1, fp
	mov	r2, r8
	mov	r0, r10
	ldr	ip, .L160
	mov	lr, pc
	bx	ip
	cmp	r0, #0
	bne	.L149
.L147:
	cmp	r6, r5
	add	r4, r4, #64
	bne	.L146
.L144:
	mov	r3, #16
	ldr	r2, [sp, #24]
	str	r2, [sp, #4]
	ldr	r2, [sp, #28]
	str	r2, [sp]
	add	r0, sp, #16
	mov	r2, r3
	ldm	r0, {r0, r1}
	bl	checkCollision
	bics	r3, r0, #2
	bne	.L159
.L149:
	mov	r0, #1
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L142:
	ldr	r3, [sp, #16]
	cmp	r3, #240
	bne	.L150
	mov	r2, #0
	ldr	r3, [r0, #60]
	str	r2, [sp, #32]
	sub	r2, r3, #1
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	str	r3, [sp, #36]
	b	.L143
.L159:
	add	r2, sp, #32
	ldm	r2, {r2, r3}
	orr	r0, r3, r2
	add	sp, sp, #44
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L150:
	mov	r3, #0
	str	r3, [sp, #32]
	str	r3, [sp, #36]
	b	.L143
.L161:
	.align	2
.L160:
	.word	collision
	.size	checkBoxCollision, .-checkBoxCollision
	.align	2
	.global	loseCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseCollision, %function
loseCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L164
	add	r2, r0, r2
	ldr	ip, [ip]
	sub	r2, r2, #1
	add	r4, ip, r1, lsl #8
	add	lr, ip, r2
	ldrb	lr, [lr, r1, lsl #8]	@ zero_extendqisi2
	ldrb	r4, [r4, r0]	@ zero_extendqisi2
	cmp	r4, #9
	cmpne	lr, #9
	moveq	lr, #1
	movne	lr, #0
	add	r1, r1, r3
	sub	r1, r1, #1
	add	r1, ip, r1, lsl #8
	ldrb	r0, [r1, r0]	@ zero_extendqisi2
	cmp	r0, #9
	orreq	lr, lr, #1
	ldrb	r0, [r1, r2]	@ zero_extendqisi2
	cmp	r0, #9
	movne	r0, lr
	orreq	r0, lr, #1
	pop	{r4, lr}
	bx	lr
.L165:
	.align	2
.L164:
	.word	collisionMap
	.size	loseCollision, .-loseCollision
	.align	2
	.global	winCollision
	.syntax unified
	.arm
	.fpu softvfp
	.type	winCollision, %function
winCollision:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	ip, .L173
	add	r2, r0, r2
	ldr	ip, [ip]
	sub	r2, r2, #1
	add	lr, ip, r2
	ldrb	r4, [lr, r1, lsl #8]	@ zero_extendqisi2
	add	r3, r1, r3
	ldr	lr, .L173+4
	sub	r3, r3, #1
	add	r3, ip, r3, lsl #8
	cmp	r4, #9
	add	ip, ip, r1, lsl #8
	ldrb	r2, [r3, r2]	@ zero_extendqisi2
	ldrb	r1, [r3, r0]	@ zero_extendqisi2
	ldrb	r3, [ip, r0]	@ zero_extendqisi2
	ldr	r0, [lr, #8]
	beq	.L167
	cmp	r0, #0
	beq	.L166
	cmp	r1, #9
	cmpne	r2, #9
	moveq	r0, #1
	movne	r0, #0
	cmp	r3, #9
	orreq	r0, r0, #1
.L166:
	pop	{r4, lr}
	bx	lr
.L167:
	subs	r0, r0, #0
	movne	r0, #1
	pop	{r4, lr}
	bx	lr
.L174:
	.align	2
.L173:
	.word	collisionMap
	.word	heldKeys
	.size	winCollision, .-winCollision
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	CSWTCH.61, %object
	.size	CSWTCH.61, 16
CSWTCH.61:
	.word	0
	.word	0
	.word	-1
	.word	1
	.type	CSWTCH.62, %object
	.size	CSWTCH.62, 16
CSWTCH.62:
	.word	-1
	.word	1
	.word	0
	.word	0
	.ident	"GCC: (devkitARM release 53) 9.1.0"
