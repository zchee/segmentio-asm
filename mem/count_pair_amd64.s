// Code generated by command: go run count_pair_asm.go -pkg mem -out ../mem/count_pair_amd64.s -stubs ../mem/count_pair_amd64.go. DO NOT EDIT.

#include "textflag.h"

// func countPair1(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT
TEXT ·countPair1(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x01, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ    DX, BX
	INCQ    BX
	MOVB    (AX), SI
	MOVB    1(AX), DI
	CMPB    SI, DI
	CMOVQEQ BX, DX
	ADDQ    $0x01, AX
	SUBQ    $0x01, CX
	CMPQ    CX, $0x00
	JG      generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000101
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VMOVDQU   129(AX), Y9
	VMOVDQU   161(AX), Y11
	VMOVDQU   193(AX), Y13
	VMOVDQU   225(AX), Y15
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQB  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQB  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQB  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	VPCMPEQB  Y8, Y9, Y9
	VPMOVMSKB Y9, R9
	VPCMPEQB  Y10, Y11, Y11
	VPMOVMSKB Y11, R10
	VPCMPEQB  Y12, Y13, Y13
	VPMOVMSKB Y13, R11
	VPCMPEQB  Y14, Y15, Y15
	VPMOVMSKB Y15, R12
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	POPCNTQ   R9, R9
	POPCNTQ   R10, R10
	POPCNTQ   R11, R11
	POPCNTQ   R12, R12
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      R10, R9
	ADDQ      R12, R11
	ADDQ      R11, R9
	ADDQ      R9, BX
	ADDQ      BX, DX
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000101
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x81
	JL        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VMOVDQU   65(AX), Y5
	VMOVDQU   97(AX), Y7
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQB  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQB  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQB  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x41
	JL        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   1(AX), Y1
	VMOVDQU   33(AX), Y3
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQB  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	ADDQ      SI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x21
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   1(AX), Y1
	VPCMPEQB  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x11
	JL        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   1(AX), X1
	VPCMPEQB  X0, X1, X1
	VPMOVMSKB X1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	JMP tail

// func countPair2(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT
TEXT ·countPair2(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x02, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ    DX, BX
	INCQ    BX
	MOVW    (AX), SI
	MOVW    2(AX), DI
	CMPW    SI, DI
	CMOVQEQ BX, DX
	ADDQ    $0x02, AX
	SUBQ    $0x02, CX
	CMPQ    CX, $0x00
	JG      generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000102
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VMOVDQU   130(AX), Y9
	VMOVDQU   162(AX), Y11
	VMOVDQU   194(AX), Y13
	VMOVDQU   226(AX), Y15
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQW  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQW  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQW  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	VPCMPEQW  Y8, Y9, Y9
	VPMOVMSKB Y9, R9
	VPCMPEQW  Y10, Y11, Y11
	VPMOVMSKB Y11, R10
	VPCMPEQW  Y12, Y13, Y13
	VPMOVMSKB Y13, R11
	VPCMPEQW  Y14, Y15, Y15
	VPMOVMSKB Y15, R12
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	POPCNTQ   R9, R9
	POPCNTQ   R10, R10
	POPCNTQ   R11, R11
	POPCNTQ   R12, R12
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      R10, R9
	ADDQ      R12, R11
	ADDQ      R11, R9
	ADDQ      R9, BX
	ADDQ      BX, DX
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000102
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x82
	JL        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VMOVDQU   66(AX), Y5
	VMOVDQU   98(AX), Y7
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQW  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQW  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQW  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x42
	JL        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   2(AX), Y1
	VMOVDQU   34(AX), Y3
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQW  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	ADDQ      SI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x22
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   2(AX), Y1
	VPCMPEQW  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x12
	JL        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   2(AX), X1
	VPCMPEQW  X0, X1, X1
	VPMOVMSKB X1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	SHRQ $0x01, DX
	JMP  tail

// func countPair4(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT
TEXT ·countPair4(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x04, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ    DX, BX
	INCQ    BX
	MOVL    (AX), SI
	MOVL    4(AX), DI
	CMPL    SI, DI
	CMOVQEQ BX, DX
	ADDQ    $0x04, AX
	SUBQ    $0x04, CX
	CMPQ    CX, $0x00
	JG      generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000104
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VMOVDQU   132(AX), Y9
	VMOVDQU   164(AX), Y11
	VMOVDQU   196(AX), Y13
	VMOVDQU   228(AX), Y15
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQD  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQD  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQD  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	VPCMPEQD  Y8, Y9, Y9
	VPMOVMSKB Y9, R9
	VPCMPEQD  Y10, Y11, Y11
	VPMOVMSKB Y11, R10
	VPCMPEQD  Y12, Y13, Y13
	VPMOVMSKB Y13, R11
	VPCMPEQD  Y14, Y15, Y15
	VPMOVMSKB Y15, R12
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	POPCNTQ   R9, R9
	POPCNTQ   R10, R10
	POPCNTQ   R11, R11
	POPCNTQ   R12, R12
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      R10, R9
	ADDQ      R12, R11
	ADDQ      R11, R9
	ADDQ      R9, BX
	ADDQ      BX, DX
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000104
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x84
	JL        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VMOVDQU   68(AX), Y5
	VMOVDQU   100(AX), Y7
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQD  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQD  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQD  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x44
	JL        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   4(AX), Y1
	VMOVDQU   36(AX), Y3
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQD  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	ADDQ      SI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x24
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   4(AX), Y1
	VPCMPEQD  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x14
	JL        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   4(AX), X1
	VPCMPEQD  X0, X1, X1
	VPMOVMSKB X1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	SHRQ $0x02, DX
	JMP  tail

// func countPair8(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT
TEXT ·countPair8(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x08, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ    DX, BX
	INCQ    BX
	MOVQ    (AX), SI
	MOVQ    8(AX), DI
	CMPQ    SI, DI
	CMOVQEQ BX, DX
	ADDQ    $0x08, AX
	SUBQ    $0x08, CX
	CMPQ    CX, $0x00
	JG      generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000108
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   128(AX), Y8
	VMOVDQU   160(AX), Y10
	VMOVDQU   192(AX), Y12
	VMOVDQU   224(AX), Y14
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VMOVDQU   136(AX), Y9
	VMOVDQU   168(AX), Y11
	VMOVDQU   200(AX), Y13
	VMOVDQU   232(AX), Y15
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQQ  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQQ  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	VPCMPEQQ  Y8, Y9, Y9
	VPMOVMSKB Y9, R9
	VPCMPEQQ  Y10, Y11, Y11
	VPMOVMSKB Y11, R10
	VPCMPEQQ  Y12, Y13, Y13
	VPMOVMSKB Y13, R11
	VPCMPEQQ  Y14, Y15, Y15
	VPMOVMSKB Y15, R12
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	POPCNTQ   R9, R9
	POPCNTQ   R10, R10
	POPCNTQ   R11, R11
	POPCNTQ   R12, R12
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      R10, R9
	ADDQ      R12, R11
	ADDQ      R11, R9
	ADDQ      R9, BX
	ADDQ      BX, DX
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000108
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0x88
	JL        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y6
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VMOVDQU   72(AX), Y5
	VMOVDQU   104(AX), Y7
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQQ  Y4, Y5, Y5
	VPMOVMSKB Y5, DI
	VPCMPEQQ  Y6, Y7, Y7
	VPMOVMSKB Y7, R8
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x48
	JL        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   8(AX), Y1
	VMOVDQU   40(AX), Y3
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	ADDQ      SI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x28
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   8(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	CMPQ      CX, $0x18
	JL        avx2_tail
	VMOVDQU   (AX), X0
	VMOVDQU   8(AX), X1
	VPCMPEQQ  X0, X1, X1
	VPMOVMSKB X1, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x10, AX
	SUBQ      $0x10, CX

avx2_tail:
	VZEROUPPER
	SHRQ $0x03, DX
	JMP  tail

// func countPair16(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT, SSE2, SSE4.1
TEXT ·countPair16(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x10, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ     DX, BX
	INCQ     BX
	MOVOU    (AX), X0
	MOVOU    16(AX), X1
	PCMPEQQ  X0, X1
	PMOVMSKB X1, SI
	CMPL     SI, $0x0000ffff
	CMOVQEQ  BX, DX
	ADDQ     $0x10, AX
	SUBQ     $0x10, CX
	CMPQ     CX, $0x00
	JG       generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000110
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VMOVDQU    64(AX), Y4
	VMOVDQU    96(AX), Y6
	VMOVDQU    128(AX), Y8
	VMOVDQU    160(AX), Y10
	VMOVDQU    192(AX), Y12
	VMOVDQU    224(AX), Y14
	VPERM2I128 $0x21, Y2, Y0, Y1
	VPERM2I128 $0x21, Y4, Y2, Y3
	VPERM2I128 $0x21, Y6, Y4, Y5
	VPERM2I128 $0x21, Y8, Y6, Y7
	VPERM2I128 $0x21, Y10, Y8, Y9
	VPERM2I128 $0x21, Y12, Y10, Y11
	VPERM2I128 $0x21, Y14, Y12, Y13
	VMOVDQU    240(AX), Y15
	VPCMPEQQ   Y0, Y1, Y1
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPCMPEQQ   Y2, Y3, Y3
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	VPCMPEQQ   Y4, Y5, Y5
	VPERMQ     $0xb1, Y5, Y4
	VPAND      Y5, Y4, Y4
	VPMOVMSKB  Y4, DI
	VPCMPEQQ   Y6, Y7, Y7
	VPERMQ     $0xb1, Y7, Y6
	VPAND      Y7, Y6, Y6
	VPMOVMSKB  Y6, R8
	VPCMPEQQ   Y8, Y9, Y9
	VPERMQ     $0xb1, Y9, Y8
	VPAND      Y9, Y8, Y8
	VPMOVMSKB  Y8, R9
	VPCMPEQQ   Y10, Y11, Y11
	VPERMQ     $0xb1, Y11, Y10
	VPAND      Y11, Y10, Y10
	VPMOVMSKB  Y10, R10
	VPCMPEQQ   Y12, Y13, Y13
	VPERMQ     $0xb1, Y13, Y12
	VPAND      Y13, Y12, Y12
	VPMOVMSKB  Y12, R11
	VPCMPEQQ   Y14, Y15, Y15
	VPERMQ     $0xb1, Y15, Y14
	VPAND      Y15, Y14, Y14
	VPMOVMSKB  Y14, R12
	POPCNTQ    BX, BX
	POPCNTQ    SI, SI
	POPCNTQ    DI, DI
	POPCNTQ    R8, R8
	POPCNTQ    R9, R9
	POPCNTQ    R10, R10
	POPCNTQ    R11, R11
	POPCNTQ    R12, R12
	ADDQ       SI, BX
	ADDQ       R8, DI
	ADDQ       DI, BX
	ADDQ       R10, R9
	ADDQ       R12, R11
	ADDQ       R11, R9
	ADDQ       R9, BX
	ADDQ       BX, DX
	ADDQ       $0x00000100, AX
	SUBQ       $0x00000100, CX
	CMPQ       CX, $0x00000110
	JGE        avx2_loop256

avx2_tail128:
	CMPQ       CX, $0x90
	JL         avx2_tail64
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VMOVDQU    64(AX), Y4
	VMOVDQU    96(AX), Y6
	VPERM2I128 $0x21, Y2, Y0, Y1
	VPERM2I128 $0x21, Y4, Y2, Y3
	VPERM2I128 $0x21, Y6, Y4, Y5
	VMOVDQU    112(AX), Y7
	VPCMPEQQ   Y0, Y1, Y1
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPCMPEQQ   Y2, Y3, Y3
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	VPCMPEQQ   Y4, Y5, Y5
	VPERMQ     $0xb1, Y5, Y4
	VPAND      Y5, Y4, Y4
	VPMOVMSKB  Y4, DI
	VPCMPEQQ   Y6, Y7, Y7
	VPERMQ     $0xb1, Y7, Y6
	VPAND      Y7, Y6, Y6
	VPMOVMSKB  Y6, R8
	POPCNTQ    BX, BX
	POPCNTQ    SI, SI
	POPCNTQ    DI, DI
	POPCNTQ    R8, R8
	ADDQ       SI, BX
	ADDQ       R8, DI
	ADDQ       DI, BX
	ADDQ       BX, DX
	ADDQ       $0x00000080, AX
	SUBQ       $0x00000080, CX

avx2_tail64:
	CMPQ       CX, $0x50
	JL         avx2_tail32
	VMOVDQU    (AX), Y0
	VMOVDQU    32(AX), Y2
	VPERM2I128 $0x21, Y2, Y0, Y1
	VMOVDQU    48(AX), Y3
	VPCMPEQQ   Y0, Y1, Y1
	VPERMQ     $0xb1, Y1, Y0
	VPAND      Y1, Y0, Y0
	VPMOVMSKB  Y0, BX
	VPCMPEQQ   Y2, Y3, Y3
	VPERMQ     $0xb1, Y3, Y2
	VPAND      Y3, Y2, Y2
	VPMOVMSKB  Y2, SI
	POPCNTQ    BX, BX
	POPCNTQ    SI, SI
	ADDQ       SI, BX
	ADDQ       BX, DX
	ADDQ       $0x00000040, AX
	SUBQ       $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x30
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   16(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPERMQ    $0xb1, Y1, Y0
	VPAND     Y1, Y0, Y0
	VPMOVMSKB Y0, BX
	POPCNTQ   BX, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	VZEROUPPER
	SHRQ $0x04, DX
	JMP  tail

// func countPair32(b []byte) int
// Requires: AVX, AVX2, CMOV, POPCNT, SSE2, SSE4.1
TEXT ·countPair32(SB), NOSPLIT, $0-32
	MOVQ b_base+0(FP), AX
	MOVQ b_len+8(FP), CX
	XORQ DX, DX
	SUBQ $0x20, CX
	BTL  $0x08, github·com∕segmentio∕asm∕cpu·X86+0(SB)
	JCS  avx2

tail:
	CMPQ CX, $0x00
	JLE  done

generic:
	MOVQ     DX, BX
	INCQ     BX
	MOVOU    (AX), X0
	MOVOU    16(AX), X1
	MOVOU    32(AX), X2
	MOVOU    48(AX), X3
	PCMPEQQ  X0, X2
	PCMPEQQ  X1, X3
	PMOVMSKB X2, SI
	PMOVMSKB X3, DI
	ANDL     DI, SI
	CMPL     SI, $0x0000ffff
	CMOVQEQ  BX, DX
	ADDQ     $0x20, AX
	SUBQ     $0x20, CX
	CMPQ     CX, $0x00
	JG       generic

done:
	MOVQ DX, ret+24(FP)
	RET

avx2:
	CMPQ CX, $0x00000120
	JL   avx2_tail128
	XORQ BX, BX
	XORQ SI, SI
	XORQ DI, DI
	XORQ R8, R8
	XORQ R9, R9
	XORQ R10, R10
	XORQ R11, R11
	XORQ R12, R12

avx2_loop256:
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y5
	VMOVDQU   128(AX), Y7
	VMOVDQU   160(AX), Y8
	VMOVDQU   192(AX), Y9
	VMOVDQU   224(AX), Y10
	VMOVDQU   256(AX), Y11
	VPCMPEQQ  Y0, Y2, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y4, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQQ  Y4, Y5, Y0
	VPMOVMSKB Y0, DI
	VPCMPEQQ  Y5, Y7, Y6
	VPMOVMSKB Y6, R8
	VPCMPEQQ  Y7, Y8, Y0
	VPMOVMSKB Y0, R9
	VPCMPEQQ  Y8, Y9, Y0
	VPMOVMSKB Y0, R10
	VPCMPEQQ  Y9, Y10, Y0
	VPMOVMSKB Y0, R11
	VPCMPEQQ  Y10, Y11, Y11
	VPMOVMSKB Y11, R12
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	POPCNTQ   R9, R9
	POPCNTQ   R10, R10
	POPCNTQ   R11, R11
	POPCNTQ   R12, R12
	SHRQ      $0x05, BX
	SHRQ      $0x05, SI
	SHRQ      $0x05, DI
	SHRQ      $0x05, R8
	SHRQ      $0x05, R9
	SHRQ      $0x05, R10
	SHRQ      $0x05, R11
	SHRQ      $0x05, R12
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      R10, R9
	ADDQ      R12, R11
	ADDQ      R11, R9
	ADDQ      R9, BX
	ADDQ      BX, DX
	ADDQ      $0x00000100, AX
	SUBQ      $0x00000100, CX
	CMPQ      CX, $0x00000120
	JGE       avx2_loop256

avx2_tail128:
	CMPQ      CX, $0xa0
	JL        avx2_tail64
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y4
	VMOVDQU   96(AX), Y5
	VMOVDQU   128(AX), Y6
	VPCMPEQQ  Y0, Y2, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y4, Y3
	VPMOVMSKB Y3, SI
	VPCMPEQQ  Y4, Y5, Y0
	VPMOVMSKB Y0, DI
	VPCMPEQQ  Y5, Y6, Y6
	VPMOVMSKB Y6, R8
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	POPCNTQ   DI, DI
	POPCNTQ   R8, R8
	SHRQ      $0x05, BX
	SHRQ      $0x05, SI
	SHRQ      $0x05, DI
	SHRQ      $0x05, R8
	ADDQ      SI, BX
	ADDQ      R8, DI
	ADDQ      DI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000080, AX
	SUBQ      $0x00000080, CX

avx2_tail64:
	CMPQ      CX, $0x60
	JL        avx2_tail32
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y2
	VMOVDQU   64(AX), Y3
	VPCMPEQQ  Y0, Y2, Y1
	VPMOVMSKB Y1, BX
	VPCMPEQQ  Y2, Y3, Y3
	VPMOVMSKB Y3, SI
	POPCNTQ   BX, BX
	POPCNTQ   SI, SI
	SHRQ      $0x05, BX
	SHRQ      $0x05, SI
	ADDQ      SI, BX
	ADDQ      BX, DX
	ADDQ      $0x00000040, AX
	SUBQ      $0x00000040, CX

avx2_tail32:
	CMPQ      CX, $0x40
	JL        avx2_tail16
	VMOVDQU   (AX), Y0
	VMOVDQU   32(AX), Y1
	VPCMPEQQ  Y0, Y1, Y1
	VPMOVMSKB Y1, BX
	POPCNTQ   BX, BX
	SHRQ      $0x05, BX
	ADDQ      BX, DX
	ADDQ      $0x00000020, AX
	SUBQ      $0x00000020, CX

avx2_tail16:
	VZEROUPPER
	JMP tail
