	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a9
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	neon-fp16
	.eabi_attribute	36, 1	@ Tag_FP_HP_extension
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
	movw	r0, #12324
	movw	r1, :lower16:pixel_buffer
	movt	r0, #65312
	movt	r1, :upper16:pixel_buffer
	ldrb	r2, [r0, #8]
	mov	r3, #251658240
	str	r3, [r1]
	mov	r3, #-939524096
	cmp	r2, #0
	str	r3, [r0, #-4]
	str	r3, [r0]
	beq	.LBB0_2
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	b	.LBB0_1
.LBB0_2:
	ldr	r1, [r1]
	str	r1, [r0]
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
	movw	r2, :lower16:pixel_buffer
	mov	r12, #0
	movt	r2, :upper16:pixel_buffer
	ldr	r2, [r2]
.LBB1_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB1_2 Depth 2
	mov	r3, #0
.LBB1_2:                                @   Parent Loop BB1_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r1, r2, r3
	add	r3, r3, #1024
	cmp	r3, #245760
	strh	r0, [r1]
	bne	.LBB1_2
@ %bb.3:                                @   in Loop: Header=BB1_1 Depth=1
	add	r12, r12, #1
	add	r2, r2, #2
	cmp	r12, #320
	bxeq	lr
	b	.LBB1_1
.Lfunc_end1:
	.size	clear_vga, .Lfunc_end1-clear_vga
	.cantunwind
	.fnend
                                        @ -- End function
	.globl	_start                          @ -- Begin function _start
	.p2align	2
	.type	_start,%function
	.code	32                              @ @_start
_start:
	.fnstart
@ %bb.0:
	movw	r0, :lower16:pixel_buffer
	mov	r12, #251658240
	movt	r0, :upper16:pixel_buffer
	mov	r1, #0
	mov	lr, #0
	str	r12, [r0]
.LBB2_1:                                @ =>This Loop Header: Depth=1
                                        @     Child Loop BB2_2 Depth 2
	add	r3, r12, lr, lsl #1
	mov	r0, #0
.LBB2_2:                                @   Parent Loop BB2_1 Depth=1
                                        @ =>  This Inner Loop Header: Depth=2
	add	r2, r3, r0
	add	r0, r0, #1024
	cmp	r0, #245760
	strh	r1, [r2]
	bne	.LBB2_2
@ %bb.3:                                @   in Loop: Header=BB2_1 Depth=1
	add	r0, lr, #1
	subs	lr, r0, #320
	movne	lr, r0
	b	.LBB2_1
.Lfunc_end2:
	.size	_start, .Lfunc_end2-_start
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
