.global onTimed_assembly

onTimed_assembly:
	subi sp, sp, 8
	stw ra, 0(sp)
	stw r8, 4(sp)

	mov r2, r0
	CHECK_XL:
		movi r8, 188
		bgt r4, r8, CHECK_XU
		br AFTER_CLASSIC
	CHECK_XU:
		movi r8, 289
		blt r4, r8, CHECK_YL
		br AFTER_CLASSIC
	CHECK_YL:
		movi r8, 142
		bgt r5, r8, CHECK_YU
		br AFTER_CLASSIC
	CHECK_YU:
		movi r8, 191
		blt r5, r8,MODIFY_RET
		br AFTER_CLASSIC
	MODIFY_RET:
		movi r2, 0x1
		
	AFTER_CLASSIC:
		stw ra, 0(sp)
		stw r8, 4(sp)
		addi sp, sp, 8
ret
