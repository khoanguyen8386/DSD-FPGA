# Digital System Design Laboratory - Lab 1: Basic Combination Logic Circuits
This is technically my first time designing my own custom silicon chip (if you count wiring logic gates from scratch on an FPGA, which I absolutely do!).
This repository contains the Verilog HDL source code for 7 combinational logic circuit experiments, fully implemented and validated on physical hardware. 
* **Hardware:** Terasic DE2-115 FPGA Kit (Intel Cyclone IV E).
* **Source Code:** You can explore or download the Quartus project files and Verilog modules inside their respective experiment folders.

---

## Hardware Implementations & Demonstrations

Below are the real-world operational results after successfully programming the Verilog RTL onto the DE2-115 board.

### Experiment 1: Basic Logic Gates
*(Drag and drop your GIF demonstrating the AND, OR, NOT, NAND, NOR, XOR, and XNOR gates here)*
* The circuit utilizes onboard SW switches for inputs and LEDG indicators to display the logic outputs.

### Experiment 4: Ripple Carry Adder
*(Drag and drop your 4-bit ripple carry adder GIF here)*
* Detailed source code is located in the `/Lab1_Experiment_4` directory.

### Experiment 7: 16:1 Multiplexer
*(Drag and drop your 16:1 MUX channel-switching GIF here)*
* This 16:1 multiplexer is built using a structural model assembled from five 4:1 MUX modules. Detailed source code is located in the `/Lab1_Experiment_7` directory.
