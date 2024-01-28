	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a9
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.eabi_attribute	42, 1	@ Tag_MPextension_use
	.eabi_attribute	34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute	68, 1	@ Tag_Virtualization_use
	.eabi_attribute	17, 1	@ Tag_ABI_PCS_GOT_use
	.eabi_attribute	20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute	21, 0	@ Tag_ABI_FP_exceptions
	.eabi_attribute	23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute	24, 1	@ Tag_ABI_align_needed
	.eabi_attribute	25, 1	@ Tag_ABI_align_preserved
	.eabi_attribute	38, 1	@ Tag_ABI_FP_16bit_format
	.eabi_attribute	18, 4	@ Tag_ABI_PCS_wchar_t
	.eabi_attribute	26, 2	@ Tag_ABI_enum_size
	.eabi_attribute	14, 0	@ Tag_ABI_PCS_R9_use
	.file	"game.c"
	.globl	setup_vga_buffers               @ -- Begin function setup_vga_buffers
	.p2align	2
	.type	setup_vga_buffers,%function
	.code	32                              @ @setup_vga_buffers
setup_vga_buffers:
	.fnstart
@ %bb.0:
	.pad	#4
	sub	sp, sp, #4
	movw	r0, :lower16:pixel_buffer
	mov	r1, #251658240
	movt	r0, :upper16:pixel_buffer
	mov	r2, #-939524096
	str	r1, [r0]
	movw	r1, #12324
	movt	r1, #65312
	str	r2, [r1, #-4]
	str	r2, [r1]
	orr	r2, r1, #8
	str	r2, [sp]
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r2, [sp]
	ldrb	r2, [r2]
	tst	r2, #1
	bne	.LBB0_1
@ %bb.2:
	ldr	r0, [r0]
	str	r0, [r1]
	add	sp, sp, #4
	bx	lr
.Lfunc_end0:
	.size	setup_vga_buffers, .Lfunc_end0-setup_vga_buffers
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	clear_vga                       @ -- Begin function clear_vga
	.p2align	2
	.type	clear_vga,%function
	.code	32                              @ @clear_vga
clear_vga:
	.fnstart
@ %bb.0:
	movw	r1, :lower16:pixel_buffer
	mov	r12, #0
	movt	r1, :upper16:pixel_buffer
	ldr	r1, [r1]
.LBB1_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB1_2 Depth 2
	mov	r3, #0
.LBB1_2:                                @   Parent Loop BB1_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r2, r1, r3
	add	r3, r3, #1024
	cmp	r3, #245760
	strh	r0, [r2]
	bne	.LBB1_2
@ %bb.3:                                @   in Loop: Header=BB1_1 Depth=1
	add	r12, r12, #1
	add	r1, r1, #2
	cmp	r12, #320
	bxeq	lr
	b	.LBB1_1
.Lfunc_end1:
	.size	clear_vga, .Lfunc_end1-clear_vga
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	bit_blit                        @ -- Begin function bit_blit
	.p2align	2
	.type	bit_blit,%function
	.code	32                              @ @bit_blit
bit_blit:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r10, r11, lr}
	.setfp	r11, sp, #24
	add	r11, sp, #24
	ldrh	r5, [r0]
	cmp	r5, #0
	beq	.LBB2_13
@ %bb.1:
	ldrh	r3, [r0, #2]
	cmp	r3, #0
	beq	.LBB2_13
@ %bb.2:
	sub	lr, r1, r5, lsr #1
	add	r1, r1, r2, lsl #9
	sub	r1, r1, r5, lsr #1
	sub	r12, r2, r3, lsr #1
	lsr	r2, r3, #1
	movw	r8, :lower16:pixel_buffer
	movt	r8, :upper16:pixel_buffer
	sub	r1, r1, r2, lsl #9
	mov	r2, #0
	mov	r6, r3
	lsl	r1, r1, #1
	b	.LBB2_5
.LBB2_3:                                @   in Loop: Header=BB2_5 Depth=1
	mov	r6, #0
.LBB2_4:                                @   in Loop: Header=BB2_5 Depth=1
	add	r2, r2, #1
	add	r1, r1, #2
	cmp	r2, r5
	bhs	.LBB2_13
.LBB2_5:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB2_9 Depth 2
	cmp	r6, #0
	beq	.LBB2_3
@ %bb.6:                                @   in Loop: Header=BB2_5 Depth=1
	add	r7, r2, lr
	lsr	r7, r7, #6
	cmp	r7, #4
	bhi	.LBB2_4
@ %bb.7:                                @   in Loop: Header=BB2_5 Depth=1
	ldr	r5, [r8]
	mov	r6, #0
	add	r5, r5, r1
	b	.LBB2_9
.LBB2_8:                                @   in Loop: Header=BB2_9 Depth=2
	add	r6, r6, #1
	add	r5, r5, #1024
	cmp	r6, r3
	bhs	.LBB2_12
.LBB2_9:                                @   Parent Loop BB2_5 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r7, r12, r6
	cmp	r7, #239
	bhi	.LBB2_8
@ %bb.10:                               @   in Loop: Header=BB2_9 Depth=2
	ldrh	r7, [r0]
	ldrh	r4, [r0, #4]
	mla	r7, r6, r7, r2
	add	r7, r0, r7, lsl #1
	ldrh	r7, [r7, #6]
	cmp	r7, r4
	beq	.LBB2_8
@ %bb.11:                               @   in Loop: Header=BB2_9 Depth=2
	strh	r7, [r5]
	ldrh	r3, [r0, #2]
	b	.LBB2_8
.LBB2_12:                               @   in Loop: Header=BB2_5 Depth=1
	ldrh	r5, [r0]
	mov	r6, r3
	b	.LBB2_4
.LBB2_13:
	pop	{r4, r5, r6, r7, r8, r10, r11, pc}
.Lfunc_end2:
	.size	bit_blit, .Lfunc_end2-bit_blit
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	clear_text_buffer               @ -- Begin function clear_text_buffer
	.p2align	2
	.type	clear_text_buffer,%function
	.code	32                              @ @clear_text_buffer
clear_text_buffer:
	.fnstart
@ %bb.0:
	mov	r0, #0
	mov	r1, #-922746880
	mov	r2, #32
.LBB3_1:                                @ =>This Inner Loop Header: Depth=1
	strb	r2, [r1, -r0]
	sub	r0, r0, #1
	cmn	r0, #4800
	bne	.LBB3_1
@ %bb.2:
	bx	lr
.Lfunc_end3:
	.size	clear_text_buffer, .Lfunc_end3-clear_text_buffer
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	draw_string                     @ -- Begin function draw_string
	.p2align	2
	.type	draw_string,%function
	.code	32                              @ @draw_string
draw_string:
	.fnstart
@ %bb.0:
	ldrb	r3, [r2]
	cmp	r3, #0
	bxeq	lr
.LBB4_1:
	add	r1, r1, r1, lsl #2
	add	r0, r0, r1, lsl #4
	add	r1, r2, #1
	add	r0, r0, #-922746880
.LBB4_2:                                @ =>This Inner Loop Header: Depth=1
	strb	r3, [r0], #1
	ldrb	r3, [r1], #1
	cmp	r3, #0
	bne	.LBB4_2
@ %bb.3:
	bx	lr
.Lfunc_end4:
	.size	draw_string, .Lfunc_end4-draw_string
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	apply_movement                  @ -- Begin function apply_movement
	.p2align	2
	.type	apply_movement,%function
	.code	32                              @ @apply_movement
apply_movement:
	.fnstart
@ %bb.0:
	ldrh	r1, [r0, #4]
	ldrh	r2, [r0]
	add	r1, r2, r1
	ldrh	r2, [r0, #2]
	strh	r1, [r0]
	ldrh	r1, [r0, #6]
	add	r1, r2, r1
	strh	r1, [r0, #2]
	bx	lr
.Lfunc_end5:
	.size	apply_movement, .Lfunc_end5-apply_movement
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	detect_collision                @ -- Begin function detect_collision
	.p2align	2
	.type	detect_collision,%function
	.code	32                              @ @detect_collision
detect_collision:
	.fnstart
@ %bb.0:
	.save	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	push	{r4, r5, r6, r7, r8, r9, r10, r11, lr}
	.setfp	r11, sp, #28
	add	r11, sp, #28
	.pad	#4
	sub	sp, sp, #4
	movw	r8, :lower16:SpriteList
	movt	r8, :upper16:SpriteList
	ldr	r7, [r8]
	cmp	r7, #0
	beq	.LBB6_15
@ %bb.1:
	movw	r10, :lower16:CollisionCounter
	movw	r0, :lower16:num_blocks
	movt	r0, :upper16:num_blocks
	movt	r10, :upper16:CollisionCounter
	ldr	r12, [r10]
	ldr	r0, [r0]
	str	r0, [sp]                        @ 4-byte Spill
	b	.LBB6_3
.LBB6_2:                                @   in Loop: Header=BB6_3 Depth=1
	ldr	r7, [r8, #4]!
	cmp	r7, #0
	beq	.LBB6_15
.LBB6_3:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB6_6 Depth 2
	mov	lr, #4
	b	.LBB6_6
.LBB6_4:                                @   in Loop: Header=BB6_6 Depth=2
	cmp	r3, #2
	moveq	r7, r4
	ldrh	r0, [r7, #6]
	rsb	r0, r0, #0
	strh	r0, [r7, #6]
.LBB6_5:                                @   in Loop: Header=BB6_6 Depth=2
	ldr	r7, [r8, lr]
	add	lr, lr, #4
	cmp	r7, #0
	beq	.LBB6_2
.LBB6_6:                                @   Parent Loop BB6_3 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	ldr	r4, [r8]
	cmp	r4, r7
	beq	.LBB6_5
@ %bb.7:                                @   in Loop: Header=BB6_6 Depth=2
	ldrh	r6, [r7, #8]
	ldrh	r3, [r7]
	ldrh	r2, [r4, #8]
	add	r1, r3, r6, lsr #1
	uxth	r0, r1
	ldrh	r1, [r4]
	sub	r5, r1, r2, lsr #1
	uxth	r5, r5
	cmp	r5, r0
	bhi	.LBB6_5
@ %bb.8:                                @   in Loop: Header=BB6_6 Depth=2
	lsr	r0, r2, #1
	lsr	r2, r6, #1
	sub	r2, r3, r2
	add	r0, r0, r1
	uxth	r2, r2
	uxth	r0, r0
	cmp	r0, r2
	blo	.LBB6_5
@ %bb.9:                                @   in Loop: Header=BB6_6 Depth=2
	ldrh	r3, [r7, #10]
	ldrh	r6, [r4, #10]
	ldrh	r1, [r7, #2]
	ldrh	r9, [r4, #2]
	add	r0, r1, r3, lsr #1
	sub	r2, r9, r6, lsr #1
	uxth	r0, r0
	uxth	r2, r2
	cmp	r2, r0
	bhi	.LBB6_5
@ %bb.10:                               @   in Loop: Header=BB6_6 Depth=2
	sub	r0, r1, r3, lsr #1
	add	r1, r9, r6, lsr #1
	uxth	r0, r0
	uxth	r1, r1
	cmp	r1, r0
	blo	.LBB6_5
@ %bb.11:                               @   in Loop: Header=BB6_6 Depth=2
	ldrb	r3, [r4, #16]
	add	r12, r12, #1
	str	r12, [r10]
	cmp	r3, #1
	beq	.LBB6_4
@ %bb.12:                               @   in Loop: Header=BB6_6 Depth=2
	ldrb	r1, [r7, #16]
	cmp	r1, #1
	beq	.LBB6_4
@ %bb.13:                               @   in Loop: Header=BB6_6 Depth=2
	cmp	r3, #3
	cmpne	r1, #3
	bne	.LBB6_5
@ %bb.14:                               @   in Loop: Header=BB6_6 Depth=2
	cmp	r3, #3
	mov	r0, r7
	movw	r2, :lower16:EmptyPixMap
	moveq	r0, r4
	mov	r1, #0
	movt	r2, :upper16:EmptyPixMap
	str	r1, [r0, #8]
	strb	r1, [r0, #16]
	ldr	r1, [sp]                        @ 4-byte Reload
	str	r2, [r0, #12]
	movw	r0, :lower16:num_blocks
	sub	r1, r1, #1
	movt	r0, :upper16:num_blocks
	str	r1, [sp]                        @ 4-byte Spill
	str	r1, [r0]
	b	.LBB6_4
.LBB6_15:
	sub	sp, r11, #28
	pop	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
.Lfunc_end6:
	.size	detect_collision, .Lfunc_end6-detect_collision
	.cantunwind
	.fnend
                                        @ -- End function
	.type	pixel_buffer,%object            @ @pixel_buffer
	.bss
	.globl	pixel_buffer
	.p2align	2, 0x0
pixel_buffer:
	.long	0
	.size	pixel_buffer, 4

	.ident	"clang version 17.0.1"
	.section	".note.GNU-stack","",%progbits
	.eabi_attribute	30, 2	@ Tag_ABI_optimization_goals
