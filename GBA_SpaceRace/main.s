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
	.global	goToStartState
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStartState, %function
goToStartState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L4
	mov	lr, pc
	bx	r3
	ldr	r4, .L4+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+12
	mov	r2, #100663296
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+20
	ldr	r1, .L4+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #67108864
	mov	r3, #0
	mov	lr, #7936
	mov	ip, #256
	ldr	r0, .L4+28
	ldr	r1, .L4+32
	strh	lr, [r2, #8]	@ movhi
	strh	ip, [r2]	@ movhi
	strh	r3, [r2, #16]	@ movhi
	pop	{r4, lr}
	strh	r3, [r2, #18]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	DMANow
	.word	startScreenPal
	.word	5168
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	seed
	.word	state
	.size	goToStartState, .-goToStartState
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+8
	mov	r3, #1
	ldr	r2, .L8+12
	ldr	r1, .L8+16
	ldr	r0, .L8+20
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToStartState
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupInterrupts
	.word	playSoundA
	.word	11025
	.word	844032
	.word	startMusic
	.size	initialize, .-initialize
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionState.part.1, %function
instructionState.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	bl	goToStartState
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	ldr	r4, .L12+4
	mov	r3, #1
	ldr	r2, .L12+8
	ldr	r1, .L12+12
	ldr	r0, .L12+16
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	844032
	.word	startMusic
	.size	instructionState.part.1, .-instructionState.part.1
	.set	pauseState.part.2,instructionState.part.1
	.set	winState.part.3,instructionState.part.1
	.align	2
	.global	goToInstructionState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToInstructionState, %function
goToInstructionState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L16
	mov	lr, pc
	bx	r3
	ldr	r4, .L16+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L16+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L16+12
	mov	r2, #100663296
	ldr	r1, .L16+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L16+20
	ldr	r1, .L16+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7936
	mov	r2, #0
	mov	ip, #256
	mov	r0, #1
	ldr	r1, .L16+28
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L17:
	.align	2
.L16:
	.word	waitForVBlank
	.word	DMANow
	.word	instructionsScreenPal
	.word	8336
	.word	instructionsScreenTiles
	.word	100726784
	.word	instructionsScreenMap
	.word	state
	.size	goToInstructionState, .-goToInstructionState
	.align	2
	.global	goToGameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGameState, %function
goToGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4352
	mov	r5, #67108864
	mov	r3, #40448
	ldr	r4, .L20
	strh	r2, [r5]	@ movhi
	strh	r3, [r5, #8]	@ movhi
	mov	r2, #83886080
	mov	r3, #256
	ldr	r1, .L20+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+8
	mov	r2, #100663296
	ldr	r1, .L20+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L20+16
	ldr	r1, .L20+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	ldr	r2, .L20+24
	ldr	r1, .L20+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L20+32
	ldr	r1, .L20+36
	mov	r3, #16384
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L20+40
	mov	lr, pc
	bx	r3
	mov	r3, #0
	mov	r1, #2
	ldr	r2, .L20+44
	strh	r3, [r5, #16]	@ movhi
	strh	r3, [r5, #18]	@ movhi
	str	r1, [r2]
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	DMANow
	.word	gameScreenPal
	.word	30416
	.word	gameScreenTiles
	.word	100724736
	.word	gameScreenMap
	.word	83886592
	.word	spritesheetPal
	.word	100728832
	.word	spritesheetTiles
	.word	hideSprites
	.word	state
	.size	goToGameState, .-goToGameState
	.align	2
	.global	startState
	.syntax unified
	.arm
	.fpu softvfp
	.type	startState, %function
startState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L34
	ldr	r3, [r4]
	ldr	r5, .L34+4
	add	r3, r3, #1
	ldr	r2, .L34+8
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldrh	r3, [r5]
	tst	r3, #8
	beq	.L23
	ldr	r2, .L34+12
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L32
.L23:
	tst	r3, #4
	beq	.L22
	ldr	r3, .L34+12
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L33
.L22:
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	bl	goToInstructionState
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+20
	mov	r3, #1
	ldr	r2, .L34+24
	ldr	r1, .L34+28
	ldr	r0, .L34+32
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L32:
	ldr	r0, [r4]
	ldr	r3, .L34+36
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+40
	mov	lr, pc
	bx	r3
	bl	goToGameState
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L34+44
	mov	r3, #1
	ldr	r2, .L34+24
	ldr	r1, .L34+48
	ldr	r0, .L34+52
	mov	lr, pc
	bx	r4
	ldrh	r3, [r5]
	b	.L23
.L35:
	.align	2
.L34:
	.word	seed
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	stopSound
	.word	playSoundA
	.word	11025
	.word	1723728
	.word	instructionMusic
	.word	srand
	.word	initGame
	.word	playSoundB
	.word	2280960
	.word	gameMusic
	.size	startState, .-startState
	.align	2
	.global	instructionState
	.syntax unified
	.arm
	.fpu softvfp
	.type	instructionState, %function
instructionState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L48
	ldr	r3, .L48+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L37
	ldr	r2, .L48+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L46
.L37:
	tst	r3, #4
	beq	.L36
	ldr	r3, .L48+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L47
.L36:
	pop	{r4, r5, r6, lr}
	bx	lr
.L47:
	pop	{r4, r5, r6, lr}
	b	instructionState.part.1
.L46:
	ldr	r3, .L48+12
	mov	lr, pc
	bx	r3
	bl	goToGameState
	ldr	r3, .L48+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L48+20
	mov	r3, #1
	ldr	r2, .L48+24
	ldr	r1, .L48+28
	ldr	r0, .L48+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L37
.L49:
	.align	2
.L48:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	initGame
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	2280960
	.word	gameMusic
	.size	instructionState, .-instructionState
	.align	2
	.global	pauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	pauseState, %function
pauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r4, .L62
	ldr	r3, .L62+4
	mov	lr, pc
	bx	r3
	ldrh	r3, [r4]
	tst	r3, #8
	beq	.L51
	ldr	r2, .L62+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L60
.L51:
	tst	r3, #4
	beq	.L50
	ldr	r3, .L62+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L61
.L50:
	pop	{r4, r5, r6, lr}
	bx	lr
.L61:
	pop	{r4, r5, r6, lr}
	b	pauseState.part.2
.L60:
	ldr	r2, .L62+12
	ldrh	r3, [r2, #10]
	eor	r3, r3, #128
	strh	r3, [r2, #10]	@ movhi
	bl	goToGameState
	ldr	r3, .L62+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L62+20
	mov	r3, #1
	ldr	r2, .L62+24
	ldr	r1, .L62+28
	ldr	r0, .L62+32
	mov	lr, pc
	bx	r5
	ldrh	r3, [r4]
	b	.L51
.L63:
	.align	2
.L62:
	.word	oldButtons
	.word	waitForVBlank
	.word	buttons
	.word	67109120
	.word	unpauseSound
	.word	playSoundB
	.word	11025
	.word	2280960
	.word	gameMusic
	.size	pauseState, .-pauseState
	.align	2
	.global	goToPauseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPauseState, %function
goToPauseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L66
	mov	lr, pc
	bx	r3
	ldr	r4, .L66+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L66+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3232
	mov	r2, #100663296
	ldr	r1, .L66+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+16
	ldr	r1, .L66+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3232
	ldr	r2, .L66+24
	ldr	r1, .L66+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L66+32
	ldr	r1, .L66+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	r1, #7936
	mov	r2, #0
	mov	ip, #768
	mov	r0, #3
	strh	r1, [r3, #8]	@ movhi
	ldr	lr, .L66+40
	ldr	r1, .L66+44
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L67:
	.align	2
.L66:
	.word	waitForVBlank
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100726784
	.word	pauseScreenMap
	.word	100679680
	.word	pauseScreen2Tiles
	.word	100724736
	.word	pauseScreen2Map
	.word	7684
	.word	state
	.size	goToPauseState, .-goToPauseState
	.align	2
	.global	winState
	.syntax unified
	.arm
	.fpu softvfp
	.type	winState, %function
winState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L75
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L75+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L68
	ldr	r3, .L75+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L74
.L68:
	pop	{r4, lr}
	bx	lr
.L74:
	pop	{r4, lr}
	b	winState.part.3
.L76:
	.align	2
.L75:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	winState, .-winState
	.align	2
	.global	goToWinState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWinState, %function
goToWinState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L79
	mov	lr, pc
	bx	r3
	ldr	r4, .L79+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L79+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #3392
	mov	r2, #100663296
	ldr	r1, .L79+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L79+16
	ldr	r1, .L79+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7936
	mov	r2, #0
	mov	ip, #256
	mov	r0, #4
	ldr	r1, .L79+24
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L80:
	.align	2
.L79:
	.word	waitForVBlank
	.word	DMANow
	.word	winScreenPal
	.word	winScreenTiles
	.word	100726784
	.word	winScreenMap
	.word	state
	.size	goToWinState, .-goToWinState
	.align	2
	.global	loseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	loseState, %function
loseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	winState
	.size	loseState, .-loseState
	.align	2
	.global	goToLoseState
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLoseState, %function
goToLoseState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r4, .L84+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L84+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L84+12
	mov	r2, #100663296
	ldr	r1, .L84+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L84+20
	ldr	r1, .L84+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #67108864
	mov	lr, #7936
	mov	r2, #0
	mov	ip, #256
	mov	r0, #5
	ldr	r1, .L84+28
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	pop	{r4, lr}
	strh	r2, [r3, #18]	@ movhi
	str	r0, [r1]
	bx	lr
.L85:
	.align	2
.L84:
	.word	waitForVBlank
	.word	DMANow
	.word	loseScreenPal
	.word	4832
	.word	loseScreenTiles
	.word	100726784
	.word	loseScreenMap
	.word	state
	.size	goToLoseState, .-goToLoseState
	.align	2
	.global	gameState
	.syntax unified
	.arm
	.fpu softvfp
	.type	gameState, %function
gameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L102
	sub	sp, sp, #16
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L102+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L87
	ldr	r3, .L102+16
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L98
.L87:
	ldr	r3, .L102+20
	add	r1, r3, #8
	ldr	r2, [r3, #4]
	ldm	r1, {r1, ip}
	ldr	r3, [r3]
	ldr	r0, .L102+24
	str	r2, [sp, #4]
	str	ip, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	add	r2, r0, #24
	ldm	r2, {r2, r3}
	ldm	r0, {r0, r1}
	ldr	r4, .L102+28
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	bne	.L99
.L88:
	ldr	r3, .L102+32
	ldr	r4, [r3]
	cmp	r4, #0
	beq	.L100
	ldr	r3, .L102+36
	ldrh	r3, [r3, #12]
	cmp	r3, #30
	beq	.L101
.L86:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L100:
	bl	goToLoseState
	ldr	r3, .L102+40
	mov	lr, pc
	bx	r3
	mov	r3, r4
	ldr	r2, .L102+44
	ldr	r1, .L102+48
	ldr	r0, .L102+52
	ldr	r4, .L102+56
	mov	lr, pc
	bx	r4
	ldr	r3, .L102+36
	ldrh	r3, [r3, #12]
	cmp	r3, #30
	bne	.L86
.L101:
	bl	goToLoseState
	ldr	r3, .L102+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L102+56
	mov	r3, #0
	ldr	r2, .L102+44
	ldr	r1, .L102+48
	ldr	r0, .L102+52
	mov	lr, pc
	bx	r4
	add	sp, sp, #16
	@ sp needed
	pop	{r4, lr}
	bx	lr
.L99:
	bl	goToWinState
	ldr	r3, .L102+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L102+60
	mov	r3, #0
	ldr	r2, .L102+44
	ldr	r1, .L102+64
	ldr	r0, .L102+68
	mov	lr, pc
	bx	r4
	b	.L88
.L98:
	bl	goToPauseState
	ldr	r2, .L102+36
	ldrh	r3, [r2, #10]
	eor	r3, r3, #128
	strh	r3, [r2, #10]	@ movhi
	ldr	r3, .L102+72
	mov	lr, pc
	bx	r3
	ldr	r4, .L102+56
	mov	r3, #1
	ldr	r2, .L102+44
	mov	r1, #671744
	ldr	r0, .L102+76
	mov	lr, pc
	bx	r4
	b	.L87
.L103:
	.align	2
.L102:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	rocket
	.word	player
	.word	collision
	.word	livesLeft
	.word	67109120
	.word	stopSound
	.word	11025
	.word	38846
	.word	lose
	.word	playSoundB
	.word	playSoundA
	.word	70813
	.word	win
	.word	pauseSound
	.word	pause
	.size	gameState, .-gameState
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
	push	{r4, r7, fp, lr}
	ldr	r3, .L116
	mov	lr, pc
	bx	r3
	ldr	r6, .L116+4
	ldr	r8, .L116+8
	ldr	r5, .L116+12
	ldr	fp, .L116+16
	ldr	r10, .L116+20
	ldr	r9, .L116+24
	ldr	r7, .L116+28
	ldr	r4, .L116+32
.L105:
	ldr	r2, [r6]
	ldrh	r3, [r8]
.L106:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r8]	@ movhi
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L106
.L108:
	.word	.L112
	.word	.L111
	.word	.L110
	.word	.L109
	.word	.L107
	.word	.L107
.L107:
	mov	lr, pc
	bx	r7
	b	.L105
.L109:
	ldr	r3, .L116+36
	mov	lr, pc
	bx	r3
	b	.L105
.L110:
	mov	lr, pc
	bx	r9
	b	.L105
.L111:
	mov	lr, pc
	bx	r10
	b	.L105
.L112:
	mov	lr, pc
	bx	fp
	b	.L105
.L117:
	.align	2
.L116:
	.word	initialize
	.word	state
	.word	buttons
	.word	oldButtons
	.word	startState
	.word	instructionState
	.word	gameState
	.word	winState
	.word	67109120
	.word	pauseState
	.size	main, .-main
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	shadowOAM,1024,4
	.comm	time,4,4
	.comm	seed,4,4
	.comm	state,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
