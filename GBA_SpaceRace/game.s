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
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer.part.0, %function
drawPlayer.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L9
	ldr	r2, [r3, #44]
	cmp	r2, #1
	beq	.L7
	cmp	r2, #3
	beq	.L8
	cmp	r2, #0
	bne	.L5
	ldr	r2, [r3, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r3, #52]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	ldr	r0, .L9+4
	lsl	r3, r1, #7
	add	r3, r3, #8
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L8:
	ldr	r2, [r3, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r3, #52]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	ldr	r0, .L9+4
	lsl	r3, r1, #7
	add	r3, r3, #4
	strh	r2, [r0, #2]	@ movhi
	strh	ip, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L7:
	ldr	r2, [r3, #12]
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r0, [r3, #52]
	ldrb	ip, [r3, #8]	@ zero_extendqisi2
	ldr	r1, .L9+4
	lsl	r3, r0, #7
	strh	r2, [r1, #2]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r3, [r1, #4]	@ movhi
	bx	lr
.L5:
	cmp	r2, #2
	bxne	lr
	ldr	r2, [r3, #12]
	ldrb	r1, [r3, #8]	@ zero_extendqisi2
	lsl	r2, r2, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r1, r1, lsl #17
	mvn	r2, r2, lsr #18
	mvn	r1, r1, lsr #17
	ldr	r3, [r3, #52]
	ldr	r0, .L9+4
	lsl	r3, r3, #8
	add	r3, r3, #12
	strh	r2, [r0, #2]	@ movhi
	strh	r1, [r0]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	bx	lr
.L10:
	.align	2
.L9:
	.word	player
	.word	shadowOAM
	.size	drawPlayer.part.0, .-drawPlayer.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBigAsteroidTopLeft.part.1, %function
updateBigAsteroidTopLeft.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r1, .L28
	ldrh	r3, [r1, #48]
	ands	r3, r3, #64
	sub	sp, sp, #16
	mov	r4, r0
	ldr	r2, [r0]
	bne	.L12
	ldr	r0, .L28+4
	ldr	r0, [r0]
	ldr	ip, .L28+8
	sub	r0, r0, #1
	cmp	r0, ip
	bls	.L15
	ldrh	r1, [r1, #48]
	ldr	r5, .L28+12
	str	r3, [r4, #36]
.L16:
	add	r0, r4, #16
	ldm	r0, {r0, r1}
	ldr	r3, [r4, #4]
	str	r2, [sp]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp, #4]
	add	r2, r5, #24
	add	r0, r5, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r6, .L28+16
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L11
	ldr	ip, [r5, #60]
	cmp	ip, #0
	beq	.L25
.L11:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L12:
	ldrh	r3, [r1, #48]
	ands	r3, r3, #2
	bne	.L26
	ldr	r1, .L28+4
	ldr	r1, [r1]
	ldr	r0, .L28+8
	sub	r1, r1, #1
	cmp	r1, r0
	bhi	.L27
.L15:
	mvn	r3, #0
	ldr	r5, .L28+12
	str	r3, [r4, #36]
	ldr	r3, [r5, #20]
	add	r2, r2, r3
	str	r2, [r4]
	b	.L16
.L26:
	mov	r3, #0
	ldr	r5, .L28+12
	str	r3, [r4, #36]
	b	.L16
.L27:
	str	r3, [r4, #36]
	ldr	r5, .L28+12
	b	.L16
.L25:
	ldr	r0, .L28+20
	ldr	r1, [r0]
	ldr	lr, .L28+24
	sub	r1, r1, #1
	add	r3, r1, r1, lsl #1
	add	lr, lr, r3, lsl #2
	str	ip, [r4, #32]
	str	r1, [r0]
	mov	r3, ip
	ldr	r2, .L28+28
	ldr	r1, .L28+32
	ldr	r0, .L28+36
	str	ip, [lr, #8]
	ldr	r4, .L28+40
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, lr}
	bx	lr
.L29:
	.align	2
.L28:
	.word	67109120
	.word	vOff
	.word	350
	.word	player
	.word	collision
	.word	livesLeft
	.word	lives
	.word	44100
	.word	461604
	.word	explosion
	.word	playSoundA
	.size	updateBigAsteroidTopLeft.part.1, .-updateBigAsteroidTopLeft.part.1
	.set	updateSmallAsteroidTopRight.part.3,updateBigAsteroidTopLeft.part.1
	.set	updateSmallAsteroidTopLeft.part.2,updateBigAsteroidTopLeft.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet.part.4, %function
updateBullet.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r3, .L61
	ldrh	r3, [r3, #48]
	tst	r3, #64
	sub	sp, sp, #16
	mov	r4, r0
	movne	ip, #0
	bne	.L31
	ldr	r3, .L61+4
	ldr	ip, [r3]
	ldr	r3, .L61+8
	sub	ip, ip, #1
	cmp	ip, r3
	movhi	ip, #0
	mvnls	ip, #0
.L31:
	ldr	lr, [r4, #28]
	cmp	lr, #1
	str	ip, [r4, #32]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	beq	.L58
	cmn	lr, #1
	beq	.L59
	ldr	r6, [r4, #8]
	add	r5, r3, r1
	sub	r5, r5, r6
	cmp	r5, #0
	movlt	r5, #0
	subge	r3, r3, r6
	strge	r3, [r4]
	strlt	r5, [r4, #24]
	cmp	lr, #0
	bne	.L45
.L39:
	mov	r8, #0
	ldr	r5, .L61+12
	ldr	r6, .L61+16
	add	r7, r5, #240
.L41:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r8, [r5, #32]
	add	r5, r5, #40
	strne	r8, [r4, #24]
	cmp	r5, r7
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
	bne	.L41
	ldr	r5, .L61+20
	mov	r8, #0
	add	r7, r5, #240
	b	.L44
.L60:
	ldr	r3, [r4]
	ldr	r1, [r4, #16]
	ldr	r2, [r4, #4]
	ldr	r0, [r4, #20]
.L44:
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r2, [sp, #4]
	str	r3, [sp]
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	strne	r8, [r5, #32]
	add	r5, r5, #40
	strne	r8, [r4, #24]
	cmp	r7, r5
	bne	.L60
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L59:
	ldr	r5, [r4, #12]
	add	lr, r2, r0
	sub	lr, lr, r5
	cmp	lr, #0
	subge	r2, r2, r5
	strge	r2, [r4, #4]
	blt	.L36
.L45:
	cmn	ip, #1
	ldreq	ip, .L61+24
	ldreq	ip, [ip, #20]
	addeq	r3, r3, ip
	streq	r3, [r4]
	b	.L39
.L58:
	ldr	lr, [r4, #12]
	add	lr, r2, lr
	cmp	lr, #239
	strle	lr, [r4, #4]
	movle	r2, lr
	ble	.L45
.L36:
	mov	lr, #0
	str	lr, [r4, #24]
	b	.L45
.L62:
	.align	2
.L61:
	.word	67109120
	.word	vOff
	.word	350
	.word	bigAsteroids
	.word	collision
	.word	smallAsteroids
	.word	player
	.size	updateBullet.part.4, .-updateBullet.part.4
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	mov	r1, #1
	mov	r2, #0
	mov	r7, #480
	mov	r6, #110
	mov	r5, #31
	mov	r4, #18
	mov	lr, #20
	mov	r0, #2
	mov	ip, #6
	ldr	r3, .L65
	str	r7, [r3]
	str	r6, [r3, #4]
	str	r5, [r3, #24]
	str	r4, [r3, #28]
	str	lr, [r3, #36]
	str	ip, [r3, #56]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	str	r1, [r3, #64]
	str	r2, [r3, #40]
	str	r2, [r3, #52]
	str	r2, [r3, #60]
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	player
	.size	initPlayer, .-initPlayer
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
	@ link register save eliminated.
	ldr	r3, .L69
	ldr	r3, [r3, #32]
	cmp	r3, #0
	bne	drawPlayer.part.0
.L68:
	mov	r2, #512
	ldr	r3, .L69+4
	strh	r2, [r3]	@ movhi
	bx	lr
.L70:
	.align	2
.L69:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	initRocket
	.syntax unified
	.arm
	.fpu softvfp
	.type	initRocket, %function
initRocket:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	ip, #2
	mov	r0, #95
	mov	r1, #19
	mov	r2, #47
	ldr	r3, .L72
	str	ip, [r3]
	stmib	r3, {r0, r1, r2}
	bx	lr
.L73:
	.align	2
.L72:
	.word	rocket
	.size	initRocket, .-initRocket
	.align	2
	.global	initBigAsteroidTopLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBigAsteroidTopLeft, %function
initBigAsteroidTopLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L76
	str	r3, [r0]
	mov	r4, r0
	mov	lr, pc
	bx	r5
	mov	ip, #21
	mov	r1, #26
	ldr	r3, .L76+4
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	str	r3, [r4, #4]
	str	ip, [r4, #16]
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	str	r0, [r4, #24]
	mov	lr, pc
	bx	r5
	mov	r2, #1
	mov	r3, #0
	cmp	r0, #0
	and	r0, r0, r2
	rsblt	r0, r0, #0
	add	r0, r0, r2
	str	r0, [r4, #28]
	str	r2, [r4, #32]
	str	r3, [r4, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L77:
	.align	2
.L76:
	.word	rand
	.word	1195121335
	.size	initBigAsteroidTopLeft, .-initBigAsteroidTopLeft
	.align	2
	.global	initBigAsteroidTopRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBigAsteroidTopRight, %function
initBigAsteroidTopRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #0
	push	{r4, r5, r6, lr}
	ldr	r5, .L80
	str	r3, [r0]
	mov	r4, r0
	mov	lr, pc
	bx	r5
	mov	ip, #21
	mov	r1, #26
	ldr	r3, .L80+4
	smull	lr, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	add	r3, r3, #125
	str	r3, [r4, #4]
	str	ip, [r4, #16]
	str	r1, [r4, #20]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	add	r0, r0, #1
	str	r0, [r4, #24]
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	and	r0, r0, #1
	rsblt	r0, r0, #0
	mvn	r0, r0
	mov	r2, #1
	mov	r3, #0
	str	r0, [r4, #28]
	str	r2, [r4, #32]
	str	r3, [r4, #36]
	pop	{r4, r5, r6, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	rand
	.word	1195121335
	.size	initBigAsteroidTopRight, .-initBigAsteroidTopRight
	.align	2
	.global	initSmallAsteroidTopLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmallAsteroidTopLeft, %function
initSmallAsteroidTopLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L84
	str	r3, [r0]
	mov	r5, r0
	mov	lr, pc
	bx	r6
	mov	r1, #13
	ldr	r3, .L84+4
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	str	r1, [r5, #16]
	str	r1, [r5, #20]
	str	r3, [r5, #4]
	mov	lr, pc
	bx	r6
	ldr	r7, .L84+8
	smull	r2, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r0, [r5, #24]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r3, #0
	smull	r1, r4, r0, r7
	sub	r4, r4, r0, asr #31
	add	r4, r4, r4, lsl r2
	sub	r4, r0, r4
	add	r4, r4, r2
	str	r4, [r5, #28]
	str	r2, [r5, #32]
	str	r3, [r5, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L85:
	.align	2
.L84:
	.word	rand
	.word	1195121335
	.word	1431655766
	.size	initSmallAsteroidTopLeft, .-initSmallAsteroidTopLeft
	.align	2
	.global	initSmallAsteroidTopRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	initSmallAsteroidTopRight, %function
initSmallAsteroidTopRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r3, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r6, .L88
	str	r3, [r0]
	mov	r5, r0
	mov	lr, pc
	bx	r6
	mov	r1, #13
	ldr	r3, .L88+4
	smull	ip, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r2, r3, r3, lsl #1
	rsb	r3, r3, r2, lsl #3
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3
	add	r3, r3, #125
	str	r3, [r5, #4]
	str	r1, [r5, #16]
	str	r1, [r5, #20]
	mov	lr, pc
	bx	r6
	ldr	r7, .L88+8
	smull	r2, r3, r7, r0
	sub	r3, r3, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r0, r0, r3
	add	r0, r0, #1
	str	r0, [r5, #24]
	mov	lr, pc
	bx	r6
	smull	r3, r4, r0, r7
	sub	r4, r4, r0, asr #31
	add	r4, r4, r4, lsl #1
	sub	r4, r0, r4
	mvn	r4, r4
	mov	r2, #1
	mov	r3, #0
	str	r4, [r5, #28]
	str	r2, [r5, #32]
	str	r3, [r5, #36]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L89:
	.align	2
.L88:
	.word	rand
	.word	1195121335
	.word	1431655766
	.size	initSmallAsteroidTopRight, .-initSmallAsteroidTopRight
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r4, #0
	mov	r2, #6
	mov	r0, #2
	mov	ip, #95
	mov	r1, #1
	mov	lr, #352
	mov	fp, #480
	mov	r10, #110
	mov	r9, #31
	mov	r8, #18
	mov	r7, #20
	mov	r6, #19
	mov	r5, #47
	ldr	r3, .L96
	str	r4, [r3]
	ldr	r3, .L96+4
	str	r4, [r3]
	ldr	r3, .L96+8
	str	r2, [r3, #56]
	ldr	r2, .L96+12
	stm	r2, {r0, ip}
	ldr	ip, .L96+16
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	ldr	r0, .L96+20
	str	r4, [r3, #40]
	str	r4, [r3, #52]
	str	r4, [r3, #60]
	str	r1, [r3, #32]
	str	r1, [r3, #44]
	str	r1, [r3, #64]
	str	lr, [ip]
	str	fp, [r3]
	str	r10, [r3, #4]
	str	r9, [r3, #24]
	str	r8, [r3, #28]
	str	r7, [r3, #36]
	str	r6, [r2, #8]
	str	r5, [r2, #12]
	bl	initBigAsteroidTopLeft
	ldr	r0, .L96+24
	bl	initBigAsteroidTopLeft
	ldr	r0, .L96+28
	bl	initBigAsteroidTopLeft
	ldr	r0, .L96+32
	bl	initBigAsteroidTopRight
	ldr	r0, .L96+36
	bl	initBigAsteroidTopRight
	ldr	r0, .L96+40
	bl	initBigAsteroidTopRight
	ldr	r0, .L96+44
	bl	initSmallAsteroidTopLeft
	ldr	r0, .L96+48
	bl	initSmallAsteroidTopLeft
	ldr	r0, .L96+52
	bl	initSmallAsteroidTopLeft
	ldr	r0, .L96+56
	bl	initSmallAsteroidTopRight
	ldr	r0, .L96+60
	bl	initSmallAsteroidTopRight
	ldr	r0, .L96+64
	bl	initSmallAsteroidTopRight
	mov	r2, r4
	mov	lr, #13
	mov	r4, #5
	mvn	ip, #4
	mov	r1, #3
	ldr	r3, .L96+68
	add	r0, r3, #180
.L91:
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r0, r3
	bne	.L91
	mov	r2, #160
	mov	r1, #0
	mov	r0, #1
	ldr	r3, .L96+72
.L92:
	str	r2, [r3, #4]
	add	r2, r2, #16
	cmp	r2, #240
	str	r1, [r3]
	str	r0, [r3, #8]
	add	r3, r3, #12
	bne	.L92
	mov	r4, #49152
	mov	lr, #131
	mov	ip, #196
	mov	r0, #5
	ldr	r3, .L96+76
	ldr	r2, .L96+80
	strh	r1, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #14]	@ movhi
	str	r0, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L97:
	.align	2
.L96:
	.word	cheatOn
	.word	hOff
	.word	player
	.word	rocket
	.word	vOff
	.word	bigAsteroids
	.word	bigAsteroids+40
	.word	bigAsteroids+80
	.word	bigAsteroids+120
	.word	bigAsteroids+160
	.word	bigAsteroids+200
	.word	smallAsteroids
	.word	smallAsteroids+40
	.word	smallAsteroids+80
	.word	smallAsteroids+120
	.word	smallAsteroids+160
	.word	smallAsteroids+200
	.word	bullets
	.word	lives
	.word	67109120
	.word	livesLeft
	.size	initGame, .-initGame
	.align	2
	.global	updateBigAsteroidTopLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBigAsteroidTopLeft, %function
updateBigAsteroidTopLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L99
	ldr	r3, [r0]
	cmp	r3, #159
	push	{r4, lr}
	mov	r4, r0
	bgt	.L100
	ldr	r2, [r0, #4]
	cmp	r2, #239
	bgt	.L100
	add	r0, r0, #24
	ldm	r0, {r0, r1}
	add	r3, r0, r3
	add	r2, r1, r2
	str	r3, [r4]
	str	r2, [r4, #4]
	mov	r0, r4
	pop	{r4, lr}
	b	updateBigAsteroidTopLeft.part.1
.L100:
	mov	r0, r4
	bl	initBigAsteroidTopLeft
	mov	r0, r4
	pop	{r4, lr}
	b	updateBigAsteroidTopLeft.part.1
.L99:
	b	initBigAsteroidTopLeft
	.size	updateBigAsteroidTopLeft, .-updateBigAsteroidTopLeft
	.align	2
	.global	updateBigAsteroidTopRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBigAsteroidTopRight, %function
updateBigAsteroidTopRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, lr}
	ldr	r3, [r0, #32]
	cmp	r3, #0
	sub	sp, sp, #20
	mov	r4, r0
	beq	.L107
	ldr	r3, [r0]
	cmp	r3, #159
	bgt	.L108
	ldr	r1, [r0, #4]
	ldr	ip, [r0, #16]
	cmn	r1, ip
	bmi	.L108
	add	r0, r0, #24
	ldm	r0, {r0, r2}
	add	r3, r3, r0
	ldr	r0, .L129
	add	r1, r1, r2
	ldrh	r2, [r0, #48]
	ands	r2, r2, #64
	str	r3, [r4]
	str	r1, [r4, #4]
	bne	.L111
.L127:
	ldr	r6, .L129+4
	ldr	lr, [r6]
	ldr	r5, .L129+8
	sub	lr, lr, #1
	cmp	lr, r5
	bls	.L114
	ldrh	r0, [r0, #48]
	ldr	r5, .L129+12
	str	r2, [r4, #36]
.L115:
	ldr	r2, [r4, #20]
	str	ip, [sp, #12]
	str	r2, [sp, #8]
	str	r1, [sp, #4]
	str	r3, [sp]
	add	r2, r5, #24
	add	r0, r5, #8
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r7, .L129+16
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L116
	ldr	ip, [r5, #60]
	cmp	ip, #0
	beq	.L126
.L116:
	ldr	r3, .L129+20
	ldr	r0, [r6]
	ldr	r1, [r3]
	ldr	r2, [r4]
	ldr	r3, [r4, #4]
	sub	r2, r2, r0
	sub	r3, r3, r1
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, r6, r7, lr}
	bx	lr
.L108:
	mov	r0, r4
	bl	initBigAsteroidTopRight
	ldr	r0, .L129
	ldrh	r2, [r0, #48]
	ands	r2, r2, #64
	ldr	r3, [r4]
	ldr	r1, [r4, #4]
	ldr	ip, [r4, #16]
	beq	.L127
.L111:
	ldrh	r2, [r0, #48]
	ands	r2, r2, #2
	beq	.L128
	mov	r2, #0
	ldr	r6, .L129+4
.L125:
	str	r2, [r4, #36]
	ldr	r5, .L129+12
	b	.L115
.L107:
	bl	initBigAsteroidTopRight
	ldr	r6, .L129+4
	b	.L116
.L128:
	ldr	r6, .L129+4
	ldr	r0, [r6]
	ldr	lr, .L129+8
	sub	r0, r0, #1
	cmp	r0, lr
	bhi	.L125
.L114:
	mvn	r2, #0
	ldr	r5, .L129+12
	str	r2, [r4, #36]
	ldr	r2, [r5, #20]
	add	r3, r3, r2
	str	r3, [r4]
	b	.L115
.L126:
	ldr	r0, .L129+24
	ldr	r1, [r0]
	ldr	lr, .L129+28
	sub	r1, r1, #1
	add	r3, r1, r1, lsl #1
	add	lr, lr, r3, lsl #2
	str	ip, [r4, #32]
	str	r1, [r0]
	mov	r3, ip
	ldr	r2, .L129+32
	ldr	r1, .L129+36
	ldr	r0, .L129+40
	str	ip, [lr, #8]
	ldr	r5, .L129+44
	mov	lr, pc
	bx	r5
	b	.L116
.L130:
	.align	2
.L129:
	.word	67109120
	.word	vOff
	.word	350
	.word	player
	.word	collision
	.word	hOff
	.word	livesLeft
	.word	lives
	.word	44100
	.word	461604
	.word	explosion
	.word	playSoundA
	.size	updateBigAsteroidTopRight, .-updateBigAsteroidTopRight
	.align	2
	.global	updateSmallAsteroidTopLeft
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSmallAsteroidTopLeft, %function
updateSmallAsteroidTopLeft:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L132
	ldr	r3, [r0]
	cmp	r3, #159
	push	{r4, lr}
	mov	r4, r0
	bgt	.L133
	ldr	r2, [r0, #4]
	cmp	r2, #239
	bgt	.L133
	add	r0, r0, #24
	ldm	r0, {r0, r1}
	add	r3, r0, r3
	add	r2, r1, r2
	str	r3, [r4]
	str	r2, [r4, #4]
	mov	r0, r4
	pop	{r4, lr}
	b	updateSmallAsteroidTopLeft.part.2
.L133:
	mov	r0, r4
	bl	initSmallAsteroidTopLeft
	mov	r0, r4
	pop	{r4, lr}
	b	updateSmallAsteroidTopLeft.part.2
.L132:
	b	initSmallAsteroidTopLeft
	.size	updateSmallAsteroidTopLeft, .-updateSmallAsteroidTopLeft
	.align	2
	.global	updateSmallAsteroidTopRight
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateSmallAsteroidTopRight, %function
updateSmallAsteroidTopRight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	cmp	r3, #0
	beq	.L140
	ldr	r3, [r0]
	cmp	r3, #159
	push	{r4, lr}
	mov	r4, r0
	bgt	.L141
	ldr	r2, [r0, #4]
	ldr	r1, [r0, #16]
	cmn	r2, r1
	bmi	.L141
	add	r0, r0, #24
	ldm	r0, {r0, r1}
	add	r3, r0, r3
	add	r2, r1, r2
	str	r3, [r4]
	str	r2, [r4, #4]
	mov	r0, r4
	pop	{r4, lr}
	b	updateSmallAsteroidTopRight.part.3
.L141:
	mov	r0, r4
	bl	initSmallAsteroidTopRight
	mov	r0, r4
	pop	{r4, lr}
	b	updateSmallAsteroidTopRight.part.3
.L140:
	b	initSmallAsteroidTopRight
	.size	updateSmallAsteroidTopRight, .-updateSmallAsteroidTopRight
	.align	2
	.global	drawBigAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBigAsteroids, %function
drawBigAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L160
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L148
	mov	r1, #512
	ldr	r2, .L160+4
	strh	r1, [r2, #8]	@ movhi
.L149:
	ldr	r1, [r3, #72]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #16]	@ movhi
	beq	.L151
	ldr	r1, [r3, #44]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	ip, #308
	mvn	r1, r1, lsr #17
	ldrb	r0, [r3, #40]	@ zero_extendqisi2
	strh	r1, [r2, #18]	@ movhi
	strh	ip, [r2, #20]	@ movhi
	strh	r0, [r2, #16]	@ movhi
.L151:
	ldr	r1, [r3, #112]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #24]	@ movhi
	beq	.L153
	ldr	r1, [r3, #84]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	ip, #312
	mvn	r1, r1, lsr #17
	ldrb	r0, [r3, #80]	@ zero_extendqisi2
	strh	r1, [r2, #26]	@ movhi
	strh	ip, [r2, #28]	@ movhi
	strh	r0, [r2, #24]	@ movhi
.L153:
	ldr	r1, [r3, #152]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #32]	@ movhi
	beq	.L155
	ldr	r1, [r3, #124]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	ip, #312
	mvn	r1, r1, lsr #17
	ldrb	r0, [r3, #120]	@ zero_extendqisi2
	strh	r1, [r2, #34]	@ movhi
	strh	ip, [r2, #36]	@ movhi
	strh	r0, [r2, #32]	@ movhi
.L155:
	ldr	r1, [r3, #192]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #40]	@ movhi
	beq	.L157
	ldr	r1, [r3, #164]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	ip, #316
	mvn	r1, r1, lsr #17
	ldrb	r0, [r3, #160]	@ zero_extendqisi2
	strh	r1, [r2, #42]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	strh	r0, [r2, #40]	@ movhi
.L157:
	ldr	r1, [r3, #232]
	cmp	r1, #0
	bne	.L158
	mov	r3, #512
	strh	r3, [r2, #48]	@ movhi
	bx	lr
.L148:
	ldr	r1, [r3, #4]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	r0, #308
	mvn	r1, r1, lsr #17
	ldr	r2, .L160+4
	ldrb	ip, [r3]	@ zero_extendqisi2
	strh	r1, [r2, #10]	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
	b	.L149
.L158:
	ldr	r1, [r3, #204]
	lsl	r1, r1, #23
	lsr	r1, r1, #23
	mvn	r1, r1, lsl #17
	mov	r0, #316
	mvn	r1, r1, lsr #17
	ldrb	r3, [r3, #200]	@ zero_extendqisi2
	strh	r1, [r2, #50]	@ movhi
	strh	r3, [r2, #48]	@ movhi
	strh	r0, [r2, #52]	@ movhi
	bx	lr
.L161:
	.align	2
.L160:
	.word	bigAsteroids
	.word	shadowOAM
	.size	drawBigAsteroids, .-drawBigAsteroids
	.align	2
	.global	drawSmallAsteroids
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawSmallAsteroids, %function
drawSmallAsteroids:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L175
	ldr	r2, [r3, #32]
	cmp	r2, #0
	bne	.L163
	mov	r1, #512
	ldr	r2, .L175+4
	strh	r1, [r2, #56]	@ movhi
.L164:
	ldr	r1, [r3, #72]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #64]	@ movhi
	beq	.L166
	mov	ip, #500
	ldr	r1, [r3, #44]
	lsl	r1, r1, #23
	ldrb	r0, [r3, #40]	@ zero_extendqisi2
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #66]	@ movhi
	strh	ip, [r2, #68]	@ movhi
	strh	r0, [r2, #64]	@ movhi
.L166:
	ldr	r1, [r3, #112]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #72]	@ movhi
	beq	.L168
	ldr	r1, [r3, #84]
	lsl	r1, r1, #23
	ldrb	ip, [r3, #80]	@ zero_extendqisi2
	lsr	r1, r1, #23
	ldr	r0, .L175+8
	orr	r1, r1, #16384
	strh	r1, [r2, #74]	@ movhi
	strh	ip, [r2, #72]	@ movhi
	strh	r0, [r2, #76]	@ movhi
.L168:
	ldr	r1, [r3, #152]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #80]	@ movhi
	beq	.L170
	ldr	r1, [r3, #124]
	lsl	r1, r1, #23
	ldrb	ip, [r3, #120]	@ zero_extendqisi2
	lsr	r1, r1, #23
	ldr	r0, .L175+8
	orr	r1, r1, #16384
	strh	r1, [r2, #82]	@ movhi
	strh	ip, [r2, #80]	@ movhi
	strh	r0, [r2, #84]	@ movhi
.L170:
	ldr	r1, [r3, #192]
	cmp	r1, #0
	moveq	r1, #512
	strheq	r1, [r2, #88]	@ movhi
	beq	.L172
	mov	ip, #504
	ldr	r1, [r3, #164]
	lsl	r1, r1, #23
	ldrb	r0, [r3, #160]	@ zero_extendqisi2
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #90]	@ movhi
	strh	ip, [r2, #92]	@ movhi
	strh	r0, [r2, #88]	@ movhi
.L172:
	ldr	r1, [r3, #232]
	cmp	r1, #0
	bne	.L173
	mov	r3, #512
	strh	r3, [r2, #96]	@ movhi
	bx	lr
.L163:
	mov	r0, #500
	ldr	r1, [r3, #4]
	lsl	r1, r1, #23
	ldr	r2, .L175+4
	ldrb	ip, [r3]	@ zero_extendqisi2
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #58]	@ movhi
	strh	ip, [r2, #56]	@ movhi
	strh	r0, [r2, #60]	@ movhi
	b	.L164
.L173:
	mov	r0, #504
	ldr	r1, [r3, #204]
	lsl	r1, r1, #23
	ldrb	r3, [r3, #200]	@ zero_extendqisi2
	lsr	r1, r1, #23
	orr	r1, r1, #16384
	strh	r1, [r2, #98]	@ movhi
	strh	r3, [r2, #96]	@ movhi
	strh	r0, [r2, #100]	@ movhi
	bx	lr
.L176:
	.align	2
.L175:
	.word	smallAsteroids
	.word	shadowOAM
	.word	502
	.size	drawSmallAsteroids, .-drawSmallAsteroids
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mvn	ip, #4
	mov	r4, #5
	mov	lr, #13
	mov	r2, #0
	mov	r1, #3
	ldr	r3, .L181
	add	r0, r3, #180
.L178:
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3]
	str	r2, [r3, #4]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	add	r3, r3, #36
	cmp	r3, r0
	bne	.L178
	pop	{r4, lr}
	bx	lr
.L182:
	.align	2
.L181:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L199
	mov	r2, r0
	ldr	r1, [r2, #24]
	cmp	r1, #0
	mov	r3, #0
	beq	.L196
.L184:
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #36
	bxeq	lr
	ldr	r1, [r2, #24]
	cmp	r1, #0
	bne	.L184
.L196:
	ldr	ip, .L199+4
	push	{r4, r5, r6, r7, r8, r9, lr}
	ldr	lr, [ip, #64]
	add	r4, ip, #8
	cmp	lr, #1
	ldm	r4, {r4, r5}
	beq	.L197
	cmn	lr, #1
	beq	.L198
	mov	r7, #13
	mov	r6, #5
	lsl	r2, r3, #3
	add	lr, r2, r3
	lsl	lr, lr, #2
	add	ip, r0, lr
	str	r5, [ip, #4]
	ldr	r5, [ip, #20]
	sub	r4, r4, r5
	str	r1, [ip, #28]
	str	r4, [r0, lr]
	str	r7, [ip, #16]
	str	r6, [ip, #20]
.L186:
	mov	r1, #1
	add	r3, r2, r3
	add	r0, r0, r3, lsl #2
	str	r1, [r0, #24]
	pop	{r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L197:
	mov	r8, #5
	mov	r7, #13
	add	r1, ip, #24
	lsl	r2, r3, #3
	ldm	r1, {r1, r9}
	add	r6, r2, r3
	lsl	r6, r6, #2
	add	ip, r0, r6
	add	r1, r1, r1, lsr #31
	add	r1, r4, r1, asr #1
	ldr	r4, [ip, #20]
	add	r5, r5, r9
	add	r4, r4, r4, lsr #31
	sub	r1, r1, #3
	sub	r4, r5, r4, asr #1
	str	r1, [r0, r6]
	str	lr, [ip, #28]
	str	r4, [ip, #4]
	str	r8, [ip, #16]
	str	r7, [ip, #20]
	b	.L186
.L198:
	mov	r7, #5
	mov	r6, #13
	ldr	r1, [ip, #24]
	lsl	r2, r3, #3
	add	r8, r2, r3
	add	r1, r1, r1, lsr #31
	lsl	r8, r8, #2
	add	r1, r4, r1, asr #1
	add	ip, r0, r8
	sub	r1, r1, #3
	str	r1, [r0, r8]
	ldr	r1, [ip, #20]
	add	r1, r1, r1, lsr #31
	sub	r5, r5, r1, asr #1
	str	lr, [ip, #28]
	str	r5, [ip, #4]
	str	r7, [ip, #16]
	str	r6, [ip, #20]
	b	.L186
.L200:
	.align	2
.L199:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	mov	r2, #0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L242
	ldr	r3, [r4, #44]
	ldr	r1, [r4, #48]
	cmp	r1, r3
	strne	r2, [r4, #52]
	cmp	r3, #4
	str	r2, [r4, #60]
	movne	r2, #4
	strne	r3, [r4, #48]
	strne	r2, [r4, #44]
	ldr	r3, .L242+4
	ldr	r2, [r4, #40]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	bne	.L205
	ldr	r3, [r4, #52]
	ldr	r2, [r4, #56]
	cmp	r3, r2
	addlt	r3, r3, #1
	strlt	r3, [r4, #52]
	cmp	r2, r3
	moveq	r3, #0
	streq	r3, [r4, #52]
.L205:
	ldr	r3, .L242+8
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L208
	ldr	r3, .L242+12
	ldrh	r3, [r3]
	ands	r5, r3, #1
	bne	.L208
	ldr	r3, [r4, #36]
	cmp	r3, #9
	bgt	.L239
.L208:
	ldr	r3, .L242+16
	ldrh	r3, [r3, #48]
	tst	r3, #2
	beq	.L235
	ldr	r5, .L242+20
.L210:
	ldr	r2, .L242+16
	ldr	r3, [r4, #36]
	ldrh	r2, [r2, #48]
	add	r3, r3, #1
	tst	r2, #32
	str	r3, [r4, #36]
	bne	.L213
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	cmp	r3, r2
	blt	.L213
	ldr	r1, [r4, #60]
	sub	r3, r3, r2
	cmp	r1, #0
	str	r3, [r4, #4]
	beq	.L240
.L214:
	ldr	r3, .L242+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r1, [r5]
	ldr	r3, [r4]
	bne	.L216
.L220:
	ldr	r2, [r4, #20]
	subs	r2, r3, r2
	bmi	.L216
	ldr	r0, [r4, #60]
	cmp	r0, #0
	bne	.L216
	mov	r3, #2
	mov	lr, #3
	mov	ip, #38
	str	r3, [r4, #44]
	str	r3, [r4, #20]
	subs	r3, r1, #2
	str	r2, [r4]
	str	r0, [r4, #64]
	str	lr, [r4, #56]
	str	ip, [r4, #24]
	bmi	.L217
	ldr	r0, [r4, #8]
	cmp	r0, #61
	movle	r1, r3
	strle	r3, [r5]
.L217:
	mov	r3, r2
	b	.L218
.L235:
	mov	r2, #4
	mov	ip, #1
	mov	r0, #3
	mov	r1, #31
	ldr	r3, [r4]
	subs	r3, r3, #4
	ldr	r5, .L242+20
	str	ip, [r4, #60]
	str	r0, [r4, #44]
	str	r2, [r4, #56]
	str	r2, [r4, #20]
	str	r1, [r4, #24]
	bmi	.L209
	ldr	r2, [r5]
	subs	r2, r2, #4
	str	r3, [r4]
	bmi	.L209
	ldr	r3, [r4, #8]
	cmp	r3, #65
	strle	r2, [r5]
.L209:
	ldr	r6, .L242+24
	ldr	r3, [r6]
	cmp	r3, #1
	beq	.L210
	mov	r3, #1
	ldr	r2, .L242+28
	ldr	r1, .L242+32
	ldr	r0, .L242+36
	ldr	r7, .L242+40
	mov	lr, pc
	bx	r7
	mov	r3, #1
	str	r3, [r6]
	b	.L210
.L216:
	ldr	r2, [r4, #44]
	cmp	r2, #4
	beq	.L241
.L218:
	ldr	r2, [r4, #40]
	add	r2, r2, #1
	str	r2, [r4, #40]
.L219:
	ldr	r0, .L242+44
	ldr	r2, [r4, #4]
	ldr	r0, [r0]
	sub	r3, r3, r1
	sub	r2, r2, r0
	str	r3, [r4, #8]
	str	r2, [r4, #12]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L239:
	bl	fireBullet
	ldr	r6, .L242+40
	mov	r3, r5
	ldr	r2, .L242+28
	ldr	r1, .L242+48
	ldr	r0, .L242+52
	str	r5, [r4, #36]
	mov	lr, pc
	bx	r6
	ldr	r3, [r4, #60]
	cmp	r3, #1
	ldr	r5, .L242+20
	bne	.L210
	b	.L209
.L213:
	ldr	r3, .L242+16
	ldrh	r3, [r3, #48]
	tst	r3, #16
	bne	.L214
	ldr	r2, [r4, #4]
	ldr	r3, [r4, #28]
	ldr	r1, [r4, #16]
	add	r3, r2, r3
	rsb	r0, r1, #240
	cmp	r3, r0
	bgt	.L214
	ldr	r3, [r4, #60]
	add	r2, r2, r1
	cmp	r3, #0
	str	r2, [r4, #4]
	bne	.L214
	mov	r3, #1
	mov	r0, #6
	mov	r1, #2
	mov	r2, #31
	str	r3, [r4, #44]
	str	r3, [r4, #64]
	str	r0, [r4, #56]
	str	r1, [r4, #20]
	str	r2, [r4, #24]
.L215:
	ldr	r3, .L242+16
	ldrh	r3, [r3, #48]
	tst	r3, #64
	ldr	r1, [r5]
	ldr	r3, [r4]
	beq	.L220
	b	.L218
.L241:
	mov	r0, #0
	ldr	r2, [r4, #48]
	str	r0, [r4, #52]
	str	r2, [r4, #44]
	b	.L219
.L240:
	mov	ip, #6
	mov	r0, #2
	mvn	r2, #0
	mov	r3, #31
	str	r1, [r4, #44]
	str	ip, [r4, #56]
	str	r0, [r4, #20]
	str	r2, [r4, #64]
	str	r3, [r4, #24]
	b	.L215
.L243:
	.align	2
.L242:
	.word	player
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	vOff
	.word	cheatOn
	.word	44100
	.word	155750
	.word	jetpack
	.word	playSoundA
	.word	hOff
	.word	95088
	.word	laser
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	b	updateBullet.part.4
	.size	updateBullet, .-updateBullet
	.align	2
	.global	drawBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullets, %function
drawBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, #512
	mov	r7, #568
	mov	r6, #564
	ldr	r3, .L253
	ldr	r2, .L253+4
	ldr	r4, .L253+8
	ldr	lr, .L253+12
	add	ip, r3, #180
.L250:
	ldr	r1, [r3, #24]
	cmp	r1, #0
	strheq	r5, [r2, #104]	@ movhi
	beq	.L249
	ldr	r1, [r3, #28]
	ldr	r0, [r3, #4]
	cmp	r1, #0
	ldrb	r1, [r3]	@ zero_extendqisi2
	and	r0, r0, r4
	orr	r8, r1, #16384
	orr	r1, r1, lr
	strhne	r8, [r2, #104]	@ movhi
	strhne	r0, [r2, #106]	@ movhi
	strhne	r6, [r2, #108]	@ movhi
	strheq	r1, [r2, #104]	@ movhi
	strheq	r0, [r2, #106]	@ movhi
	strheq	r7, [r2, #108]	@ movhi
.L249:
	add	r3, r3, #36
	cmp	ip, r3
	add	r2, r2, #8
	bne	.L250
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L254:
	.align	2
.L253:
	.word	bullets
	.word	shadowOAM
	.word	511
	.word	-32768
	.size	drawBullets, .-drawBullets
	.align	2
	.global	initLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	initLives, %function
initLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #160
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L259
.L256:
	str	r2, [r3, #4]
	add	r2, r2, #16
	cmp	r2, #240
	str	r0, [r3]
	str	r1, [r3, #8]
	add	r3, r3, #12
	bne	.L256
	bx	lr
.L260:
	.align	2
.L259:
	.word	lives
	.size	initLives, .-initLives
	.align	2
	.global	drawLives
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawLives, %function
drawLives:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r5, #512
	ldr	r3, .L267
	ldr	r2, .L267+4
	ldr	r4, .L267+8
	ldr	lr, .L267+12
	add	r0, r3, #60
.L264:
	ldr	r1, [r3, #8]
	cmp	r1, #0
	ldrne	r1, [r3, #4]
	ldrbne	ip, [r3]	@ zero_extendqisi2
	andne	r1, r1, r4
	orrne	r1, r1, #16384
	add	r3, r3, #12
	strheq	r5, [r2, #152]	@ movhi
	strhne	lr, [r2, #156]	@ movhi
	strhne	r1, [r2, #154]	@ movhi
	strhne	ip, [r2, #152]	@ movhi
	cmp	r3, r0
	add	r2, r2, #8
	bne	.L264
	pop	{r4, r5, lr}
	bx	lr
.L268:
	.align	2
.L267:
	.word	lives
	.word	shadowOAM
	.word	511
	.word	566
	.size	drawLives, .-drawLives
	.align	2
	.global	initTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initTimer, %function
initTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #0
	mov	ip, #49152
	mov	r0, #131
	mov	r1, #196
	ldr	r3, .L270
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L271:
	.align	2
.L270:
	.word	67109120
	.size	initTimer, .-initTimer
	.align	2
	.global	updateTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateTimer, %function
updateTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L279
	ldrh	r2, [r3, #12]
	ldrh	r0, [r3, #12]
	ldr	r2, .L279+4
	umull	r3, r1, r0, r2
	lsr	r2, r1, #5
	ldr	r3, .L279+8
	rsb	r1, r2, r2, lsl #4
	sub	r1, r0, r1, lsl #2
	push	{r4, r5, r6, lr}
	umull	ip, lr, r1, r3
	ldr	ip, .L279+12
	lsr	r3, lr, #3
	str	r0, [ip]
	cmp	r0, #20
	add	r0, r3, r3, lsl #2
	sub	r1, r1, r0, lsl #1
	ldr	lr, .L279+16
	ldr	ip, .L279+20
	ldr	r0, .L279+24
	str	r2, [lr]
	str	r3, [ip]
	str	r1, [r0]
	beq	.L278
.L272:
	pop	{r4, r5, r6, lr}
	bx	lr
.L278:
	ldr	r4, .L279+28
	ldr	r3, [r4]
	cmp	r3, #1
	beq	.L272
	mov	r3, #1
	ldr	r5, .L279+32
	ldr	r2, .L279+36
	ldr	r1, .L279+40
	ldr	r0, .L279+44
	mov	lr, pc
	bx	r5
	mov	r3, #1
	str	r3, [r4]
	pop	{r4, r5, r6, lr}
	bx	lr
.L280:
	.align	2
.L279:
	.word	67109120
	.word	-2004318071
	.word	-858993459
	.word	sec
	.word	minuteDigit
	.word	secondDigit1
	.word	secondDigit2
	.word	clockTime
	.word	playSoundB
	.word	11025
	.word	88092
	.word	clock
	.size	updateTimer, .-updateTimer
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
	bl	updatePlayer
	ldr	r0, .L289
	bl	updateBigAsteroidTopLeft
	ldr	r0, .L289+4
	bl	updateBigAsteroidTopLeft
	ldr	r0, .L289+8
	bl	updateBigAsteroidTopLeft
	ldr	r0, .L289+12
	bl	updateBigAsteroidTopRight
	ldr	r0, .L289+16
	bl	updateBigAsteroidTopRight
	ldr	r0, .L289+20
	bl	updateBigAsteroidTopRight
	ldr	r0, .L289+24
	bl	updateSmallAsteroidTopLeft
	ldr	r0, .L289+28
	bl	updateSmallAsteroidTopLeft
	ldr	r0, .L289+32
	bl	updateSmallAsteroidTopLeft
	ldr	r0, .L289+36
	bl	updateSmallAsteroidTopRight
	ldr	r0, .L289+40
	bl	updateSmallAsteroidTopRight
	ldr	r0, .L289+44
	bl	updateSmallAsteroidTopRight
	ldr	r4, .L289+48
	add	r5, r4, #180
.L283:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	movne	r0, r4
	blne	updateBullet.part.4
.L282:
	add	r4, r4, #36
	cmp	r5, r4
	bne	.L283
	bl	updateTimer
	ldr	r3, .L289+52
	mov	lr, pc
	bx	r3
	ldr	r4, .L289+56
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L289+60
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L290:
	.align	2
.L289:
	.word	bigAsteroids
	.word	bigAsteroids+40
	.word	bigAsteroids+80
	.word	bigAsteroids+120
	.word	bigAsteroids+160
	.word	bigAsteroids+200
	.word	smallAsteroids
	.word	smallAsteroids+40
	.word	smallAsteroids+80
	.word	smallAsteroids+120
	.word	smallAsteroids+160
	.word	smallAsteroids+200
	.word	bullets
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.size	updateGame, .-updateGame
	.align	2
	.global	drawTimer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawTimer, %function
drawTimer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L296
	ldr	r0, [r3]
	cmp	r0, #19
	push	{r4, r5, r6, lr}
	movle	ip, #0
	movgt	ip, #0
	mov	r6, #16384
	mov	r5, #32768
	mov	r4, #16
	movle	lr, #884
	movgt	lr, #948
	ldr	r1, .L296+4
	ldr	r2, .L296+8
	ldr	r3, .L296+12
	ldr	r1, [r1]
	ldr	r2, [r2]
	ldr	r3, [r3]
	addle	r1, r1, #432
	addle	r0, r3, #432
	addgt	r0, r3, #464
	addle	r2, r2, #432
	ldr	r3, .L296+16
	addgt	r1, r1, #464
	addgt	r2, r2, #464
	lsl	r1, r1, #1
	lsl	r2, r2, #1
	strh	r1, [r3, #204]	@ movhi
	strh	r2, [r3, #220]	@ movhi
	ldr	r1, .L296+20
	ldr	r2, .L296+24
	lsl	r0, r0, #1
	strh	r6, [r3, #202]	@ movhi
	strh	r5, [r3, #208]	@ movhi
	strh	r4, [r3, #210]	@ movhi
	strh	lr, [r3, #212]	@ movhi
	strh	r0, [r3, #228]	@ movhi
	strh	r1, [r3, #218]	@ movhi
	strh	r2, [r3, #226]	@ movhi
	strh	ip, [r3, #200]	@ movhi
	strh	ip, [r3, #216]	@ movhi
	strh	ip, [r3, #224]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L297:
	.align	2
.L296:
	.word	sec
	.word	minuteDigit
	.word	secondDigit1
	.word	secondDigit2
	.word	shadowOAM
	.word	16408
	.word	16424
	.size	drawTimer, .-drawTimer
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
	ldr	r3, .L302
	ldr	r3, [r3, #32]
	cmp	r3, #0
	push	{r4, lr}
	beq	.L299
	bl	drawPlayer.part.0
.L300:
	bl	drawBigAsteroids
	bl	drawSmallAsteroids
	bl	drawBullets
	bl	drawLives
	bl	drawTimer
	mov	r3, #67108864
	ldr	r2, .L302+4
	ldrh	r1, [r2]
	ldr	r2, .L302+8
	ldrh	r2, [r2]
	strh	r1, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	bx	lr
.L299:
	mov	r2, #512
	ldr	r3, .L302+12
	strh	r2, [r3]	@ movhi
	b	.L300
.L303:
	.align	2
.L302:
	.word	player
	.word	hOff
	.word	vOff
	.word	shadowOAM
	.size	drawGame, .-drawGame
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	cheatOn,4,4
	.comm	sec,4,4
	.comm	clockTime,4,4
	.comm	secondDigit2,4,4
	.comm	secondDigit1,4,4
	.comm	minuteDigit,4,4
	.comm	livesLeft,4,4
	.comm	lives,60,4
	.comm	smallAsteroids,240,4
	.comm	bigAsteroids,240,4
	.comm	bullets,180,4
	.comm	rocket,16,4
	.comm	player,68,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
