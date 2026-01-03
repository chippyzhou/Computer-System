# 测试SLL指令
.data
pattern: .word 0x6D393E31

.text
restart:
        addi $t4,$0,6     # initialize a loopcounter for displaying the pattern
        lw $t0, pattern    # load the display pattern
show: 
        sw $t0, 0x7ff1($0)  # write to the display IO device
        addi $t4, $t4, -1      # decrement loopcounter
        beq $t4, $0, restart     # if the loopcounter is zero, restart 
        sll  $t0, $t0, 8         # shift left 8 bits
delay:
        addi $t2, $0, 0       # clear counter
        addi $t3, $0, 0x0020  # set delay count
wait:
        beq $t2,$t3,show	 # wait for the delay
        addi  $t2, $t2, 1     # increment counter
        j wait
