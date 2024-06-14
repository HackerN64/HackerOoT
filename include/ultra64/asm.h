#ifndef ASM_H
#define ASM_H

#ifdef __sgi
#define _MIPS_ISA_MIPS1 1
#define _MIPS_ISA_MIPS2 2
#define _MIPS_ISA_MIPS3 3
#define _MIPS_ISA_MIPS4 4
#endif

#ifndef _LANGUAGE_C

#define LEAF(x)                 \
    .balign 4                  ;\
    .globl x                   ;\
    .type x, @function         ;\
    x:                         ;\
        .ent x, 0              ;\
        .frame $sp, 0, $ra

#define XLEAF(x)                \
    .balign 4                  ;\
    .globl x                   ;\
    .type x, @function         ;\
    x:                         ;\
        .aent x, 0

#define NESTED(x, fsize, ra)    \
    .globl x                   ;\
    x:                         ;\
        .ent x, 0              ;\
        .frame $sp, fsize, ra

#define XNESTED(x)              \
    .globl x                   ;\
    x:                         ;\
        .aent x, 0

#define END(x)                  \
    .size x, . - x             ;\
    .end x

#define IMPORT(x, size)         \
    .extern x, size

#define EXPORT(x)               \
    .globl x                   ;\
    x:

#define DATA(x)                 \
    .balign 4                  ;\
    .globl x                   ;\
    .type x, @object           ;\
    x:

#define ENDDATA(x)              \
    .size x, . - x

#if !defined(_MIPS_SIM) || _MIPS_SIM != _ABIO32
.set $t4, $ta0
.set $t5, $ta1
.set $t6, $ta2
.set $t7, $ta3
#endif

#endif

/**
 *  Stack Alignment
 */
#if defined(_MIPS_SIM) && _MIPS_SIM == _ABIO32
#define NARGSAVE 4      // space for 4 args must be allocated
#define ALSZ    (8-1)
#define ALMASK ~(8-1)
#else
#define NARGSAVE 0      // no caller responsibilities
#define ALSZ    (16-1)
#define ALMASK ~(16-1)
#endif

#define FRAMESZ(size) (((size) + ALSZ) & ALMASK)

/**
 *  Register Size
 */
#if   (_MIPS_ISA == _MIPS_ISA_MIPS1 || _MIPS_ISA == _MIPS_ISA_MIPS2)
#define SZREG 4
#elif (_MIPS_ISA == _MIPS_ISA_MIPS3 || _MIPS_ISA == _MIPS_ISA_MIPS4)
#define SZREG 8
#endif

#endif
