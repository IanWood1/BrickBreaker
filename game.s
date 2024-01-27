	.text
	.syntax unified
	.eabi_attribute	67, "2.09"	@ Tag_conformance
	.cpu	cortex-a5
	.eabi_attribute	6, 10	@ Tag_CPU_arch
	.eabi_attribute	7, 65	@ Tag_CPU_arch_profile
	.eabi_attribute	8, 1	@ Tag_ARM_ISA_use
	.eabi_attribute	9, 2	@ Tag_THUMB_ISA_use
	.fpu	neon-vfpv4
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
	.globl	ClearVGA                        @ -- Begin function ClearVGA
	.p2align	2
	.type	ClearVGA,%function
	.code	32                              @ @ClearVGA
ClearVGA:
	.fnstart
@ %bb.0:
	.pad	#8
	sub	sp, sp, #8
	str	r0, [sp, #4]
	mov	r0, #0
	str	r0, [sp]
	b	.LBB0_1
.LBB0_1:                                @ =>This Inner Loop Header: Depth=1
	ldr	r0, [sp]
	lsr	r0, r0, #10
	cmp	r0, #74
	bhi	.LBB0_4
	b	.LBB0_2
.LBB0_2:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp, #4]
	movw	r1, :lower16:PIX_BUFFER
	movt	r1, :upper16:PIX_BUFFER
	ldr	r1, [r1]
	ldr	r2, [sp]
	str	r0, [r1, r2, lsl #2]
	b	.LBB0_3
.LBB0_3:                                @   in Loop: Header=BB0_1 Depth=1
	ldr	r0, [sp]
	add	r0, r0, #1
	str	r0, [sp]
	b	.LBB0_1
.LBB0_4:
	add	sp, sp, #8
	bx	lr
.Lfunc_end0:
	.size	ClearVGA, .Lfunc_end0-ClearVGA
	.cantunwind
	.fnend
                                        @ -- End function
	.ident	"clang version 17.0.1"
	.section	".note.GNU-stack","",%progbits
	.addrsig
	.addrsig_sym PIX_BUFFER
	.eabi_attribute	30, 6	@ Tag_ABI_optimization_goals
