@
@  Copyright (c) 2012, Texas Instruments Incorporated
@  All rights reserved.
@ 
@  Redistribution and use in source and binary forms, with or without
@  modification, are permitted provided that the following conditions
@  are met:
@ 
@  *  Redistributions of source code must retain the above copyright
@     notice, this list of conditions and the following disclaimer.
@ 
@  *  Redistributions in binary form must reproduce the above copyright
@     notice, this list of conditions and the following disclaimer in the
@     documentation and/or other materials provided with the distribution.
@ 
@  *  Neither the name of Texas Instruments Incorporated nor the names of
@     its contributors may be used to endorse or promote products derived
@     from this software without specific prior written permission.
@ 
@  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
@  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
@  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
@  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
@  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
@  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
@  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
@  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
@  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
@  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
@  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
@
@
@ ======== TimestampProvider_asm.asm ========
@
@

    .global ti_sysbios_family_arm_a15_TimestampProvider_get32__E
    .global ti_sysbios_family_arm_a15_TimestampProvider_getOverflowCCNT__I
    .global ti_sysbios_family_arm_a15_TimestampProvider_initCCNT__I

    .text
    .func ti_sysbios_family_arm_a15_TimestampProvider_get32__E

ti_sysbios_family_arm_a15_TimestampProvider_get32__E:
    mrc     p15, #0, r0, c9, c13, #0
    bx      lr
    .endfunc


    .text
    .func ti_sysbios_family_arm_a15_TimestampProvider_getOverflowCCNT__I

@
@ Get and reset the CCNT overflow status
@
ti_sysbios_family_arm_a15_TimestampProvider_getOverflowCCNT__I:
    mrc     p15, #0, r0, c9, c12, #3
    and     r0, r0, #0x80000000
    mcr     p15, #0, r0, c9, c12, #3
    bx      lr
    .endfunc


    .text
    .func ti_sysbios_family_arm_a15_TimestampProvider_initCCNT__I

ti_sysbios_family_arm_a15_TimestampProvider_initCCNT__I:
    mov     r0, #4                     @ reset CCNT
    mcr     p15, #0, r0, c9, c12, #0
    mov     r0, #1                     @ enable all counters
    mcr     p15, #0, r0, c9, c12, #0
    mov     r0, #0x80000000            @ enable CCNT
    mcr     p15, #0, r0, c9, c12, #1
    bx      lr
    .endfunc
    .end
