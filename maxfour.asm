## CS 254 Program 11
##
## Find the largest of four integers.
##
## Programmer: Andrew Krasuski
## Date: (04/25/2021)
##
## Register use table:
## $v0  used to store typed in integer, also stores largest int
## $s0  first integer
## $t1  second integer
## $t2  third integer
## $t3  fourth integer
## $t0  final largest integer


           .text
           .globl main

main:      sub       $sp,$sp,4         # push $s0
           sw        $s0,($sp)

           jal       pread             # jump to pread
           move      $s0,$v0           # move typed integer to $s0

           jal       pread             # jump to pread
           move      $t1,$v0           # move typed integer to $t1

           jal       pread             # jump to pread
           move      $t2,$v0           # move typed integer to $t2

           jal       pread             # jump to pread
           move      $t3,$v0           # move typed integer to $t3


           move      $v0,$s0           # max = $s0
           bgt       $s0,$t1,secif     # if $t1 > $s0
           move      $v0,$t1           # max = $t1

secif:     bgt       $v0,$t2,finalif   # if $t2 > $v0
           move      $v0,$t2           # max = $t2

finalif:   bgt       $v0,$t3,finish    # if $t3 > $v0
           move      $v0,$t3           # max = $t3

finish:    lw        $s0,($sp)         # pop $s0
           add       $sp,$sp,4

           move      $t0,$v0           # move largest int to $t0

           li        $v0,4             # Loads $2 with 4, to print largest
           la        $a0,largest       # Address of largest is loaded to $4
           syscall                     # largest is printed

           li        $v0,1             # Loads $v0 with 2, to print a integer
           move      $a0,$t0           # Largest integer is moved to $a0
           syscall


           li        $v0,10            # halt
           syscall


           .data
largest:   .asciiz "The largest integer is "

## End of file
