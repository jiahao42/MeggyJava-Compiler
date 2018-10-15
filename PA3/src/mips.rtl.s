#####################     
# _printint  
#
# void _printint ( int p1 )
#
# Pass number to print on stack.
#
# Upon entry to this function, the RTS should look like
# the following:
#       |     |
# $sp ->|  p1 |
#       | ... |
#
# The stack pointer should be pointing at the top value in
# the stack and that value should be the first parameter to printint.
#
# The printint prologue will set up the RTS as follows:
# $fp ->|         |
# $sp ->| old $fp |
#       | old $ra |
#       |  p1     |
#       | ...     |

#####################     
    .text                 
    .globl _printint      
_printint:                
    #### prologue
    addi    $sp, $sp, -4    # push return address
    sw      $ra, 0($sp)     #
            
    addi    $sp, $sp, -4    # push frame pointer
    sw      $fp, 0($sp)     #
    
    addi    $fp, $sp, -4    # set up new frame pointer

    # formal param will be put into $a0 for syscall 
    lw      $a0, 12($fp)   
    li      $v0, 1          # code for print integer      
    syscall               
    la      $a0, newl     
    li      $v0, 4          # code for print string
    syscall               
    
    #### epilogue
exit_printint:
    lw      $fp, 0($sp)     # pop frame pointer
    addi    $sp, $sp, 4     #
            
    lw      $ra, 0($sp)     # pop return address
    addi    $sp, $sp, 4     #
            
    jr      $ra


         .data            
         .globl newl      
         .align   0       
newl:    .asciiz "\n"  

#####################
# _halloc
#
# void* _halloc(int n)
#
# pass number of bytes to allocate on stack at 0($sp)
# returns pointer to allocated space at top of stack.
#
# Expects the parameter to be passed on the top
# of the run-time stack (RTS).
# Upon entry to this function, the RTS should look like
# the following:
#       |     |
# $sp ->|  p1 |
#       | ... |
#
# The stack pointer should be pointing at the top value in
# the stack and that value should be the first parameter.
#
# The halloc prologue will set up the RTS as follows:
#
# $fp ->|         |
# $sp ->| old $fp |
#       | old $ra |
#       | ret     |
#       |  p1     |
#       | ...     |
#
# where ret is the slot for placing
# the return value.
########

#####################
    .text
    .globl _halloc
_halloc:                  
    #### prologue
    addi    $sp, $sp, -4    # make space for retval

    addi    $sp, $sp, -4    # push return address
    sw      $ra, 0($sp)     #
            
    addi    $sp, $sp, -4    # push frame pointer
    sw      $fp, 0($sp)     #    
    
    addi    $fp, $sp, -4    # set up new frame pointer


    # formal param will be put into $a0 for syscall
    lw      $a0, 16($fp)
    li      $v0, 9
    syscall
    # store the result of the sbrk system call on stack
    sw      $v0, 12($fp)    # return result
    
    #### epilogue
exit_halloc:
    lw      $fp, 0($sp)     # pop frame pointer
    addi    $sp, $sp, 4     #
            
    lw      $ra, 0($sp)     # pop return address
    addi    $sp, $sp, 4     #
            
    jr      $ra

#####################
# _initArray        
# void* _initArray(int n)
#
# pass the size of the array on stack at 0($sp)
# Returns a pointer to heap allocation for array.
#
# The array allocation will be big enough to prepend an
# integer that indicates the size of the array.
# 
# The _initArray prologue will set up the RTS as follows:
#
# $fp ->|         |
# $sp ->| old $fp |
#       | old $ra |
#       | ret     |
#       |  p1     |
#       | ...     |
#
# where ret is the slot for placing
# the return value.
###################### 
    .text            
    .globl _initArray
_initArray:         
    #### prologue
    addi    $sp, $sp, -4    # make space for retval

    addi    $sp, $sp, -4    # push return address
    sw      $ra, 0($sp)     #
            
    addi    $sp, $sp, -4    # push frame pointer
    sw      $fp, 0($sp)     #    
    
    addi    $fp, $sp, -4    # set up new frame pointer

    # load number of elements for array
    lw      $t0, 16($fp)
    # calculate number of bytes needed for array allocation
    addi    $t0, $t0, 1 
    li      $t1, 4          # assuming each element is 4 bytes
    mul     $t0, $t0, $t1 

    # call halloc to get memory allocation
    addi    $sp, $sp, -4
    sw      $t0, 0($sp)
    jal     _halloc
    # load address of array into t0
    lw      $t0, 0($sp)
    addi    $sp, $sp, 8     # pop retval and param
    # store address of array into return value slot
    sw      $t0, 12($fp)

    # store size of array into first word
    lw      $t1, 16($fp)
    sw      $t1, 0($t0)
    #### initialize all array entries to 0
loopstart1:
    beq     $t1, $0, loopend1
    # increment ptr to array
    addi    $t0, $t0, 4
    # init location to 0
    sw      $0, 0($t0)
    # decrement the array count
    addi    $t1, $t1, -1
    j       loopstart1
loopend1:
    #### epilogue
exit_initArray:
    lw      $fp, 0($sp)     # pop frame pointer
    addi    $sp, $sp, 4     #
            
    lw      $ra, 0($sp)     # pop return address
    addi    $sp, $sp, 4     #
            
    jr      $ra


