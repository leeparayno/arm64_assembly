//
// hello world
//

// hello world
.global _main
.align 2 // Needs to be aligned to 64-bit boundary for arm64

// main
_main:
    b _printf
    b _terminate

_printf:
    // Print hello world
    mov X0, #1          // file descriptor for stdout
    adr X1, helloworld  // address of hello world string
    mov X2, #12         // length of hello world string
    mov X16, #4         // syscall number for write
    svc 0               // syscall


_reboot:
    mov X0, #1  // instant reboot
    mov X16, #55 // reboot
    svc 0           // syscall

_terminate:
    mov X0, #0  // return 0
    // Terminate register, make supervisor call
    mov X16, #1
    // make supervisor call
    svc 0

// hello world string
helloworld:
    .asciz "hello world\n"
//    .align 2 // Needs to be aligned to 64-bit boundary for arm64