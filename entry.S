.global _start

.section .text
_start:
    /* initialise stack pointer */
    la sp, __stack_start

    /* initialise global pointer */
    la gp, __global_pointer


    /* call rust main func */

