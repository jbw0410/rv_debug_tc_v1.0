OUTPUT_ARCH( "riscv" )

SECTIONS
{
  . = 0x10110000;
  .text : { *(.text) }
  .data : { *(.data) }
  . = ALIGN(32);
  __tohost_start__ = .;
  .tohost : { *(.tohost) }
  __tohost_end__ = .;
  . = ALIGN(32);
  __fromhost_start__ = .;
  .fromhost : { *(.fromhost) }
  __fromhost_end__ = .;

}
