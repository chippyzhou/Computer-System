# 计算机系统 (Computer Systems) 实验仓库

本项目记录了我在计算机系统课程中，基于 **Basys3 FPGA 开发板** 与 **MIPS 架构** 完成的所有实验内容。仓库包含完整的逻辑设计源码、约束文件、实验任务书以及辅助开发工具。

---

## 📂 仓库目录结构

### 1. 📝 课程笔记 (`/Notes`)
* **核心理论**：涵盖 MIPS 指令集架构、单周期数据通路分析、控制单元逻辑设计。
* **实践经验**：记录了 Vivado 仿真调试技巧、七段数码管动态扫描原理以及硬件调试中的常见问题（如时序冲突、信号悬空等）。

### 2. 📚 实验任务书与附加资料 (`/Docs`)
本目录收录了课程官方指南及硬件开发的关键配置文件：

* **📄 实验手册 (Manuals)**
    * 实验一：Vivado 设计流程与 IP 集成入门。
    * 实验二：基于 Verilog HDL 的基础逻辑设计。
    * 实验三：MIPS 计算机系统设计与实现（含 I/O 交互与指令扩展）。

* **⚙️ 设计与约束文件 (Design & Constraints)**
    * **`basys3.xdc`**：核心管脚约束文件。针对 Artix-7 芯片定义了逻辑信号与物理引脚的映射，包括：
        * **输入信号**：16 路拨码开关 (`SW0-SW15`)、手动复位及功能按钮。
        * **输出信号**：16 路用户 LED 灯。
        * **显示接口**：四位七段数码管的段选 (`SEG`) 与位选 (`AN`) 信号。
        * **系统时钟**：100MHz 板载晶振输入 (`CLK`)。

* **🛠️ 辅助开发工具**
    * **MARS (MIPS Assembler and Runtime Simulator)**：用于编写、调试 MIPS 汇编代码，并导出 `.dat` 格式的内存镜像文件（指令内存 `memfile.dat` 与数据内存 `datamem.dat`）。

### 3. 💻 实验代码实现 (`/Hardware`)
包含基于 Vivado 开发的三个阶段性工程文件夹：

#### 🔹 [Lab 1] Vivado 工作流与 IP 集成
* 通过 IP Integrator 搭建门电路，熟悉从创建工程到下载比特流（Bitstream）的硬件设计全过程。

#### 🔹 [Lab 2] Verilog HDL 基础建模
* 使用 Verilog 语言进行硬件逻辑描述，编写 Testbench 并通过 Vivado Simulator 进行行为仿真与时序仿真。

#### 🔹 [Lab 3] MIPS 计算机系统设计与实现
* **任务 1-2：仿真运行**：实现并仿真单周期 MIPS 处理器模块。
* **任务 3：软硬件交互 (MMIO)**：
    * **地址译码**：实现 0x7FF0 (LED)、0x7FF1 (数码管)、0x7FF2 (开关) 的内存映射。
    * **动态显示**：在 Basys3 四位七段数码管上动态扫描并显示 "SCUT" 等字符。
* **任务 4：指令扩展 (SLL)**：
    * **硬件修改**：在 ALU 和译码器中增加对 `SLL` (逻辑左移) 指令的支持。
    * **应用演示**：编写 MIPS 汇编程序实现数码管内容的向左滚动显示。

---
## 🛠 开发环境
* **硬件平台**: Digilent Basys3 (Xilinx Artix-7 XC7A35T)
* **开发软件**: Xilinx Vivado (2014.4 或更高版本)
* **汇编工具**: MARS (MIPS Assembler and Runtime Simulator)
* **运行环境**: Java JDK (用于运行 MARS)

---

## 🚀 快速上手说明

1.  **准备环境**：确保安装了 Xilinx Vivado (2014.4+) 和 Java 运行环境（用于运行 MARS）。
2.  **代码编译**：使用 MARS 打开 `.asm` 汇编文件，导出 `memfile.dat` 和 `datamem.dat` 至工程目录。
3.  **运行项目**：在 Vivado 中打开 `.xpr` 工程，确保 `basys3.xdc` 已加入约束分支。
4.  **运行仿真**：点击 `Run Simulation` 查看处理器波形。
5.  **上板验证**：连接 Basys3，点击 `Generate Bitstream` 并在 `Hardware Manager` 中烧录至 FPGA，观察数码管与 LED 的实时响应。
6.  **一键清理**：实验结束后可运行 `clean.bat` 脚本清理临时文件，节省磁盘空间。

---

## ⚠️ 学术诚信声明
本项目代码仅供学习参考，请勿直接复制本项目内容用于课程作业提交。
