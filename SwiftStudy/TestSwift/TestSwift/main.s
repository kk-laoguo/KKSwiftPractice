	.section	__TEXT,__text,regular,pure_instructions
	.build_version macos, 10, 15	sdk_version 10, 15
	.globl	_main
	.p2align	4, 0x90
_main:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$64, %rsp
	movq	_$sypN@GOTPCREL(%rip), %rax
	addq	$8, %rax
	movl	$1, %ecx
	movl	%edi, -4(%rbp)
	movq	%rcx, %rdi
	movq	%rsi, -16(%rbp)
	movq	%rax, %rsi
	callq	_$ss27_allocateUninitializedArrayySayxG_BptBwlF
	leaq	L___unnamed_1(%rip), %rdi
	movl	$13, %esi
	movl	$1, %r8d
	movq	%rdx, -24(%rbp)
	movl	%r8d, %edx
	movq	%rax, -32(%rbp)
	callq	_$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
	movq	_$sSSN@GOTPCREL(%rip), %rcx
	movq	-24(%rbp), %rsi
	movq	%rcx, 24(%rsi)
	movq	%rax, (%rsi)
	movq	%rdx, 8(%rsi)
	callq	_$ss5print_9separator10terminatoryypd_S2StFfA0_
	movq	%rax, -40(%rbp)
	movq	%rdx, -48(%rbp)
	callq	_$ss5print_9separator10terminatoryypd_S2StFfA1_
	movq	-32(%rbp), %rdi
	movq	-40(%rbp), %rsi
	movq	-48(%rbp), %rcx
	movq	%rdx, -56(%rbp)
	movq	%rcx, %rdx
	movq	%rax, %rcx
	movq	-56(%rbp), %r8
	callq	_$ss5print_9separator10terminatoryypd_S2StF
	movq	-56(%rbp), %rdi
	callq	_swift_bridgeObjectRelease
	movq	-48(%rbp), %rdi
	callq	_swift_bridgeObjectRelease
	movq	-32(%rbp), %rdi
	callq	_swift_bridgeObjectRelease
	xorl	%eax, %eax
	addq	$64, %rsp
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	_$ss5print_9separator10terminatoryypd_S2StFfA0_
	.globl	_$ss5print_9separator10terminatoryypd_S2StFfA0_
	.weak_definition	_$ss5print_9separator10terminatoryypd_S2StFfA0_
	.p2align	4, 0x90
_$ss5print_9separator10terminatoryypd_S2StFfA0_:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L___unnamed_2(%rip), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
	popq	%rbp
	retq
	.cfi_endproc

	.private_extern	_$ss5print_9separator10terminatoryypd_S2StFfA1_
	.globl	_$ss5print_9separator10terminatoryypd_S2StFfA1_
	.weak_definition	_$ss5print_9separator10terminatoryypd_S2StFfA1_
	.p2align	4, 0x90
_$ss5print_9separator10terminatoryypd_S2StFfA1_:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	L___unnamed_3(%rip), %rdi
	movl	$1, %esi
	movl	$1, %edx
	callq	_$sSS21_builtinStringLiteral17utf8CodeUnitCount7isASCIISSBp_BwBi1_tcfC
	popq	%rbp
	retq
	.cfi_endproc

	.section	__TEXT,__cstring,cstring_literals
L___unnamed_1:
	.asciz	"Hello, World!"

L___unnamed_3:
	.asciz	"\n"

L___unnamed_2:
	.asciz	" "

	.private_extern	___swift_reflection_version
	.section	__TEXT,__const
	.globl	___swift_reflection_version
	.weak_definition	___swift_reflection_version
	.p2align	1
___swift_reflection_version:
	.short	3

	.no_dead_strip	___swift_reflection_version
	.linker_option "-lswiftFoundation"
	.linker_option "-lswiftCore"
	.linker_option "-lswiftObjectiveC"
	.linker_option "-lswiftDarwin"
	.linker_option "-framework", "Foundation"
	.linker_option "-lswiftCoreFoundation"
	.linker_option "-framework", "CoreFoundation"
	.linker_option "-lswiftDispatch"
	.linker_option "-framework", "Combine"
	.linker_option "-framework", "ApplicationServices"
	.linker_option "-lswiftCoreGraphics"
	.linker_option "-framework", "CoreGraphics"
	.linker_option "-lswiftIOKit"
	.linker_option "-framework", "IOKit"
	.linker_option "-framework", "ColorSync"
	.linker_option "-framework", "ImageIO"
	.linker_option "-framework", "CoreServices"
	.linker_option "-framework", "Security"
	.linker_option "-framework", "CFNetwork"
	.linker_option "-framework", "DiskArbitration"
	.linker_option "-framework", "CoreText"
	.linker_option "-lswiftXPC"
	.linker_option "-lswiftSwiftOnoneSupport"
	.linker_option "-lobjc"
	.section	__DATA,__objc_imageinfo,regular,no_dead_strip
L_OBJC_IMAGE_INFO:
	.long	0
	.long	83953472


.subsections_via_symbols
