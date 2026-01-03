# 数据存储器、IO设备和输入设备测试
.data
pattern: .word 0x6D393E31

.text
main:
        # 测试数码管显示SCUT
        lw   $t0, 0($zero)              # 数码管显示数据
        sw   $t0, 0x7ff1($zero)         # 写入数码管

        # 测试数据存储器
        addi $t0, $zero, 0xFF           # 准备测试数据
        sw   $t0, 0($zero)              # 写入数据存储器
        lw   $t1, 0($zero)              # 读取数据
        sw   $t1, 0x7ff0($zero)         # 输出到LED
        bne  $t0, $t1, fail             # 比较读写结果

# 循环读取开关状态并显示
loop:
        lw   $t5, 0x7ff2($zero)         # 读取开关值
        sw   $t5, 0x7ff0($zero)         # 将开关值输出到LED
        j    loop                       # 无限循环读取开关状态

fail:
        # 测试失败 - 显示0x00
        sw   $zero, 0x7ff0($zero)       # 结果显示在LED上
        j    fail                       # 无限循环
