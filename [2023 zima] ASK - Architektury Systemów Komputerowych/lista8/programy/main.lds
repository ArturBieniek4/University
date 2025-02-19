OUTPUT_FORMAT("elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)
PHDRS
{
  code   PT_LOAD FLAGS(5);
  rodata PT_LOAD FLAGS(4);
  data   PT_LOAD FLAGS(6);
}
SECTIONS
{
  . = 0x400000 + SIZEOF_HEADERS;

  .text :
  {
    *(.text .text.*)
  } : code

  .rodata :
  {
    *(.rodata .rodata.*)
  } : rodata

  .data : 
  {
    *(.data .data.*)
  } : data

  .bss :
  {
   *(.bss .bss.*)
   *(COMMON)
  } : data

  /DISCARD/ :
  {
    *(.note.gnu.property)
  }
}
