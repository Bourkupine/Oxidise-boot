/*
 * Memory Layout
 * ================
 *
 * 0x80000000-0x801FFFFF: OpenSBI
 * 0x80200000-0x803FFFFF: bootloader
 * 0x80400000->: kernel
 *
 * ---------------
 *
 * 0x80200000: entry point (_start)
 * 0x80400000: kernel load address
 *
 */

OUTPUT_ARCH( "riscv" )

ENTRY( _start )

SECTIONS
{
    /* OpenSBI load address */
    . = 0x80200000;

    .text : {
        *(.text.start)
        *(.text .text.*)
    }

    .rodata : {
        *(.rodata .rodata.*)
    }

    .data : {
        *(.data .data.*)
    }

    __global_pointer = .;

    __bss_start = .;
    .bss : {
        *(.bss .bss.*)
    }
    __bss_end = .;

    /*  align for stack */
    . = ALIGN(4096);
    __stack_start = .;
    . = . + 0x80000; 
    __stack_end = .;
    
}
