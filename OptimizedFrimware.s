	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cr.c"
	.text
	.align	2
	.global	shiftl128
	.type	shiftl128, %function
shiftl128:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}
	add	fp, sp, #24										NOP
	sub	sp, sp, #12										NOP
	str	r0, [fp, #-32]									NOP
	str	r1, [fp, #-36]									NOP
	ldr	r3, [fp, #-36]									NOP
	cmp	r3, #63											NOP
	bls	.L2												NOP
	ldr	r3, [fp, #-32]									NOP
	add	r4, r3, #8										NOP
	ldmia	r4, {r3-r4}									ldr	r2, [fp, #-32]
	stmia	r2, {r3-r4}									NOP
	ldr	r2, [fp, #-32]									NOP
	mov	r3, #0											mov	r4, #0
	str	r3, [r2, #8]									NOP
	str	r4, [r2, #12]									ldr	r3, [fp, #-36]
	sub	r3, r3, #64										ldr	r0, [fp, #-32]
	mov	r1, r3											bl	shiftl128
	b	.L4												NOP
.L2:
	ldr	r3, [fp, #-32]									NOP
	ldmia	r3, {r4-r5}									ldr	r0, [fp, #-36]
	sub	r2, r0, #32										NOP
	mov	ip, r4, asl r2									NOP
	rsb	r3, r0, #32										NOP
	mov	r3, r4, lsr r3									cmp	r2, #0
	mov	r2, r5, asl r0									NOP
	orr	r2, r3, r2										NOP
	movge	r2, ip										mov	r1, r4, asl r0
	ldr	r3, [fp, #-32]									NOP
	add	r6, r3, #8										NOP
	ldmia	r6, {r5-r6}									ldr	r3, [fp, #-36]
	rsb	r3, r3, #64										NOP
	mov	r0, r3											NOP
	sub	ip, r0, #32										mov	r8, r6, lsr ip
	rsb	r3, r0, #32										NOP
	mov	r7, r6, asl r3									cmp	ip, #0
	mov	r3, r5, lsr r0									NOP
	orr	r3, r7, r3										NOP
	movge	r3, r8									 	mov	r4, r6, lsr r0
	orr	r3, r3, r1										orr	r4, r4, r2
	ldr	r2, [fp, #-32]									NOP
	stmia	r2, {r3-r4}									NOP
	ldr	r3, [fp, #-32]									NOP
	add	r2, r3, #8										NOP
	ldmia	r2, {r1-r2}								    ldr	r0, [fp, #-36]
	sub	ip, r0, #32										NOP							
	mov	r6, r1, asl ip									NOP
	rsb	r3, r0, #32										NOP
	mov	r5, r1, lsr r3									cmp	ip, #0
	mov	r4, r2, asl r0									NOP
	orr	r4, r5, r4										NOP
	movge	r4, r6										mov	r3, r1, asl r0
	ldr	r2, [fp, #-32]									NOP
	str	r3, [r2, #8]									NOP
	str	r4, [r2, #12]									NOP
.L4:
	sub	sp, fp, #24										NOP
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}			NOP
	bx	lr												NOP
	.size	shiftl128, .-shiftl128
	.align	2
	.global	shiftr128
	.type	shiftr128, %function
shiftr128:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}			NOP
	add	fp, sp, #24										NOP
	sub	sp, sp, #12										str	r0, [fp, #-32]
	str	r1, [fp, #-36]									NOP
	ldr	r3, [fp, #-36]									NOP
	cmp	r3, #63											bls	.L6
	ldr	r3, [fp, #-32]									NOP
	ldmia	r3, {r3-r4}									ldr	r2, [fp, #-32]
	str	r3, [r2, #8]									NOP
	str	r4, [r2, #12]									NOP
	ldr	r2, [fp, #-32]									mov	r3, #0
	mov	r4, #0											NOP
	stmia	r2, {r3-r4}									NOP
	ldr	r3, [fp, #-36]									NOP
	sub	r3, r3, #64										ldr	r0, [fp, #-32]
	mov	r1, r3											bl	shiftr128
	b	.L8												NOP
.L6:
	ldr	r3, [fp, #-32]									NOP
	ldmia	r3, {r4-r5}									NOP
	ldr	r3, [fp, #-36]									NOP
	rsb	r3, r3, #64										NOP
	mov	r0, r3											NOP
	sub	r2, r0, #32										NOP
	mov	ip, r4, asl r2									rsb	r3, r0, #32
	mov	r3, r4, lsr r3									cmp	r2, #0
	mov	r2, r5, asl r0									NOP
	orr	r2, r3, r2										NOP
	movge	r2, ip										mov	r1, r4, asl r0
	ldr	r3, [fp, #-32]									NOP
	add	r6, r3, #8										NOP
	ldmia	r6, {r5-r6}									ldr	r0, [fp, #-36]
	sub	ip, r0, #32										NOP
	mov	r8, r6, lsr ip									NOP
	rsb	r3, r0, #32										NOP
	mov	r7, r6, asl r3									cmp	ip, #0
	mov	r3, r5, lsr r0									NOP
	orr	r3, r7, r3										NOP
	movge	r3, r8										mov	r4, r6, lsr r0
	orr	r3, r3, r1										NOP
	orr	r4, r4, r2										NOP
	ldr	r2, [fp, #-32]									NOP
	str	r3, [r2, #8]									NOP
	str	r4, [r2, #12]									ldr	r3, [fp, #-32]
	ldmia	r3, {r1-r2}									ldr	r0, [fp, #-36]
	sub	ip, r0, #32										NOP
	mov	r6, r2, lsr ip									NOP
	rsb	r3, r0, #32										NOP
	mov	r5, r2, asl r3									cmp	ip, #0
	mov	r3, r1, lsr r0									NOP
	orr	r3, r5, r3										NOP
	movge	r3, r6										mov	r4, r2, lsr r0
	ldr	r2, [fp, #-32]									NOP
	stmia	r2, {r3-r4}									NOP
.L8:
	sub	sp, fp, #24										NOP
	ldmfd	sp!, {r4, r5, r6, r7, r8, fp, lr}			NOP
	bx	lr												NOP
	.size	shiftr128, .-shiftr128
	.align	2
	.global	addShift
	.type	addShift, %function
addShift:
	@ Function supports interworking.
	@ args = 20, pretend = 8, frame = 64
	@ frame_needed = 1, uses_anonymous_args = 0
	sub	sp, sp, #8										NOP
	stmfd	sp!, {r4, fp, lr}							NOP
	add	fp, sp, #8										NOP
	sub	sp, sp, #68										NOP
	str	r0, [fp, #-72]									NOP
	add	r1, fp, #4										NOP
	stmia	r1, {r2, r3}								NOP
	ldmib	fp, {r3-r4}									NOP
	str	r3, [fp, #-28]									NOP
	str	r4, [fp, #-24]									NOP
	add	r4, fp, #12										NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-20]									NOP
	str	r4, [fp, #-16]									NOP
	add	r3, fp, #4										NOP
	mov	r0, r3											ldr	r1, [fp, #20]
	bl	shiftr128										sub	r2, fp, #20
	ldmia	r2, {r1-r2}									add	r4, fp, #12
	ldmia	r4, {r3-r4}									NOP
	adds	r3, r3, r1									adc	r4, r4, r2
	str	r3, [fp, #-20]									NOP
	str	r4, [fp, #-16]									NOP
	sub	r2, fp, #28										NOP
	ldmia	r2, {r1-r2}									NOP
	str	r1, [fp, #-68]									NOP
	str	r2, [fp, #-64]									NOP
	ldmib	fp, {r2-r3}									NOP
	str	r2, [fp, #-60]									NOP
	str	r3, [fp, #-56]									NOP
	sub	r4, fp, #20										NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-52]									NOP
	str	r4, [fp, #-48]									NOP
	add	r2, fp, #12										NOP
	ldmia	r2, {r1-r2}									NOP
	str	r1, [fp, #-44]									NOP
	str	r2, [fp, #-40]									NOP
	mov	r2, #0											mov	r3, #0
	str	r2, [fp, #-36]									NOP
	str	r3, [fp, #-32]									NOP
	ldr	r3, [fp, #-40]									NOP
	ldr	r4, [fp, #-48]									NOP
	cmp	r3, r4											bhi	.L11
	ldr	r1, [fp, #-40]									NOP
	ldr	r2, [fp, #-48]									NOP
	cmp	r1, r2											bne	.L10
	ldr	r3, [fp, #-44]									NOP
	ldr	r4, [fp, #-52]									NOP
	cmp	r3, r4											bhi	.L11
	ldr	r1, [fp, #-44]									NOP
	ldr	r2, [fp, #-52]									NOP
	cmp	r1, r2											b .L10
.L11:
	mov	r3, #1											mov	r4, #0
	str	r3, [fp, #-36]									NOP
	str	r4, [fp, #-32]									NOP
.L10:
	sub	r4, fp, #60										NOP
	ldmia	r4, {r3-r4}									sub	r2, fp, #36
	ldmia	r2, {r1-r2}									adds r3, r3, r1
	adc	r4, r4, r2										NOP
	sub	r2, fp, #68										NOP
	ldmia	r2, {r1-r2}									NOP
	adds	r3, r3, r1									adc	r4, r4, r2
	str	r3, [fp, #-28]									NOP
	str	r4, [fp, #-24]									NOP
	ldr	ip, [fp, #-72]									NOP
	sub	r3, fp, #28										NOP
	ldmia	r3, {r0, r1, r2, r3}						NOP
	stmia	ip, {r0, r1, r2, r3}						NOP
	ldr	r0, [fp, #-72]									NOP
	sub	sp, fp, #8										NOP
	ldmfd	sp!, {r4, fp, lr}							NOP
	add	sp, sp, #8										NOP
	bx	lr												NOP
	.size	addShift, .-addShift
	.section	.rodata
	.align	2
.LC0:
	.ascii	"%lf\000"
	.global	__aeabi_dmul
	.global	__aeabi_d2ulz
	.global	__aeabi_ul2d
	.global	__aeabi_ddiv
	.global	__aeabi_dadd
	.align	2
.LC1:
	.ascii	"%.30f\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 176
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, fp, lr}				    NOP
	add	fp, sp, #16									    NOP
	sub	sp, sp, #196                                    sub	r3, fp, #60
	ldr	r0, .L24                                        mov	r1, r3
	bl	scanf                                           sub	r4, fp, #60
	ldmia	r4, {r3-r4}                                 mov	r5, #0
	mov	r6, #1107296256									NOP
	add	r6, r6, #7340032							    mov	r0, r3
	mov	r1, r4                                          mov	r2, r5
	mov	r3, r6                                          bl	__aeabi_dmul
	mov	r3, r0                                          mov	r4, r1
	str	r3, [fp, #-60]									NOP
	str	r4, [fp, #-56]									NOP
	mov	r3, #1                                          mov	r4, #0
	str	r3, [fp, #-76]									NOP
	str	r4, [fp, #-72]									NOP
	mov	r3, #0                                          mov	r4, #0
	str	r3, [fp, #-68]									NOP
	str	r4, [fp, #-64]									NOP
	mov	r3, #1                                          mov	r4, #0
	str	r3, [fp, #-92]									NOP
	str	r4, [fp, #-88]									NOP
	mov	r3, #0                                          mov	r4, #0
	str	r3, [fp, #-84]									NOP
	str	r4, [fp, #-80]									NOP
	mov	r3, #0                                          mov	r4, #0
	str	r3, [fp, #-108]									NOP
	str	r4, [fp, #-104]									NOP
	sub	r4, fp, #60									    NOP
	ldmia	r4, {r3-r4}									NOP
	mov	r0, r3                                          mov	r1, r4
	bl	__aeabi_d2ulz                                   mov	r3, r0
	mov	r4, r1                                          str	r3, [fp, #-100]
	str	r4, [fp, #-96]									NOP
	sub	r3, fp, #76									    NOP
	mov	r0, r3                                          mov	r1, #0
	bl	shiftl128                                       sub	r3, fp, #92
	mov	r0, r3                                          mov	r1, #62
	bl	shiftl128                                       sub	r3, fp, #108
	mov	r0, r3                                          mov	r1, #24
	bl	shiftl128                                       mov	r3, #0
	str	r3, [fp, #-52]                                  b	.L14
.L21:
	sub	r4, fp, #76									    NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-124]									NOP
	str	r4, [fp, #-120]									NOP
	sub	r4, fp, #68									    NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-116]									NOP
	str	r4, [fp, #-112]                                 mov	r3, #16
	str	r3, [fp, #-48]                                  b	.L15
.L16:
	ldr	r3, [fp, #-52]									NOP
	sub	ip, fp, #124									str	r3, [sp, #8]
	mov	r2, sp                                          sub	r3, fp, #116
	ldmia	r3, {r0, r1}								NOP
	stmia	r2, {r0, r1}								NOP
	sub	r3, fp, #124									NOP
	ldmia	r3, {r2, r3}                                mov	r0, ip
	bl	addShift                                        ldr	r3, [fp, #-48]
	sub	r3, r3, #1									    NOP
	str	r3, [fp, #-48]									NOP
.L15:
	ldr	r3, [fp, #-48]									NOP
	cmp	r3, #0                                          bne	.L16
	sub	r3, fp, #124									NOP
	ldmia	r3, {r2-r3}									NOP
	str	r2, [fp, #-188]									NOP
	str	r3, [fp, #-184]									NOP
	sub	r4, fp, #108									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-180]									NOP
	str	r4, [fp, #-176]									NOP
	ldr	r4, [fp, #-176]									NOP
	ldr	r2, [fp, #-184]									NOP
	cmp	r4, r2                                          bhi	.L17
	ldr	r3, [fp, #-176]									NOP
	ldr	r4, [fp, #-184]									NOP
	cmp	r3, r4                                          bne	.L23
	ldr	r2, [fp, #-180]									NOP
	ldr	r3, [fp, #-188]									NOP
	cmp	r2, r3									        bhi	.L17
	ldr	r4, [fp, #-180]									NOP
	ldr	r2, [fp, #-188]									NOP
	cmp	r4, r2									        NOP
.L23:
	sub	r4, fp, #124									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-172]									NOP
	str	r4, [fp, #-168]									NOP
	sub	r3, fp, #108									NOP
	ldmia	r3, {r2-r3}									NOP
	str	r2, [fp, #-164]									NOP
	str	r3, [fp, #-160]									NOP
	ldr	r3, [fp, #-172]									NOP
	ldr	r4, [fp, #-164]									NOP
	cmp	r3, r4									        bne	.L19
	ldr	r2, [fp, #-168]									NOP
	ldr	r3, [fp, #-160]									NOP
	cmp	r2, r3                                          bne	.L19
	sub	r3, fp, #116									NOP
	ldmia	r3, {r2-r3}									NOP
	str	r2, [fp, #-156]									NOP
	str	r3, [fp, #-152]									NOP
	sub	r4, fp, #100									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-148]									NOP
	str	r4, [fp, #-144]									NOP
	ldr	r4, [fp, #-152]									NOP
	ldr	r2, [fp, #-144]									NOP
	cmp	r4, r2                                          bhi	.L19
	ldr	r3, [fp, #-152]									NOP
	ldr	r4, [fp, #-144]									NOP
	cmp	r3, r4                                          bne	.L17
	ldr	r2, [fp, #-156]									NOP
	ldr	r3, [fp, #-148]									NOP
	cmp	r2, r3									        bhi	.L19
	ldr	r4, [fp, #-156]									NOP
	ldr	r2, [fp, #-148]									NOP
	cmp	r4, r2							        		NOP
.L17:
	ldr	r3, [fp, #-52]									NOP
	sub	ip, fp, #140                                    str	r3, [sp, #8]
	mov	r2, sp                                          sub	r3, fp, #84
	ldmia	r3, {r0, r1}								NOP
	stmia	r2, {r0, r1}								NOP
	sub	r3, fp, #92									    NOP
	ldmia	r3, {r2, r3}                                mov	r0, ip
	bl	addShift                                        sub	r4, fp, #124
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-76]									NOP
	str	r4, [fp, #-72]									NOP
	sub	r4, fp, #116									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-68]									NOP
	str	r4, [fp, #-64]									NOP
	sub	r4, fp, #140									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-92]									NOP
	str	r4, [fp, #-88]									NOP
	sub	r4, fp, #132									NOP
	ldmia	r4, {r3-r4}									NOP
	str	r3, [fp, #-84]									NOP
	str	r4, [fp, #-80]									NOP
.L19:
	ldr	r3, [fp, #-52]									NOP
	add	r3, r3, #1									    NOP
	str	r3, [fp, #-52]									NOP
.L14:
	ldr	r3, [fp, #-52]									NOP
	and	r3, r3, #128									NOP
	cmp	r3, #0									        beq	.L21
	sub	r4, fp, #92									    NOP
	ldmia	r4, {r3-r4}									NOP
	mov	r0, r3                                          mov	r1, r4
	bl	__aeabi_ul2d                                    mov	r3, r0
	mov	r4, r1                                          str	r3, [fp, #-44]
	str	r4, [fp, #-40]									NOP
	sub	r4, fp, #84									    NOP
	ldmia	r4, {r3-r4}									NOP
	mov	r0, r3                                          mov	r1, r4
	bl	__aeabi_ul2d                                    mov	r3, r0
	mov	r4, r1                                          mov	r5, #0
	mov	r6, #1124073472									NOP
	add	r6, r6, #15728640								NOP
	mov	r0, r3                                          mov	r1, r4
	mov	r2, r5                                          mov	r3, r6
	bl	__aeabi_ddiv                                    mov	r3, r0
	mov	r4, r1                                          str	r3, [fp, #-36]
	str	r4, [fp, #-32]									NOP
	sub	r4, fp, #44									    NOP
	ldmia	r4, {r3-r4}									sub	r6, fp, #36
	ldmia	r6, {r5-r6}                                 mov	r0, r3
	mov	r1, r4                                          mov	r2, r5
	mov	r3, r6                                          bl	__aeabi_dadd
	mov	r3, r0                                          mov	r4, r1
	mov	r5, #0                                          mov	r6, #1124073472
	add	r6, r6, #13631488                               mov	r0, r3
	mov	r1, r4                                          mov	r2, r5
	mov	r3, r6                                          bl	__aeabi_ddiv
	mov	r3, r0                                          mov	r4, r1
	str	r3, [fp, #-28]									NOP
	str	r4, [fp, #-24]									NOP
	ldr	r0, .L24+4                                      sub	r3, fp, #28
	ldmia	r3, {r2-r3}                                 bl	printf
	sub	sp, fp, #16									    NOP
	ldmfd	sp!, {r4, r5, r6, fp, lr}					NOP
	bx	lr									            NOP
.L25:
	.align	2
.L24:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits