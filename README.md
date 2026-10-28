
# Digital System Design Laboratory - Lab 1: Basic Combination Logic Circuits
This is technically my first time designing my own custom silicon chip (if you count wiring logic gates from scratch on an FPGA, which I absolutely do!).
This repository contains the Verilog HDL source code for 7 combinational logic circuit experiments, fully implemented and validated on physical hardware. 
* **Hardware:** Terasic DE2-115 FPGA Kit (Intel Cyclone IV E).
* **Source Code:** You can explore or download the Quartus project files and Verilog modules inside their respective experiment folders.

---

## Hardware Implementations & Demonstrations

Below are the real-world operational results after successfully programming the Verilog RTL onto the DE2-115 board.

### Experiment 1: Basic Logic Gates
https://github.com/user-attachments/assets/800e6fdd-1739-4b0e-8660-2a07ba306629

* The circuit utilizes onboard SW switches for inputs and LEDG indicators to display the logic outputs.
* **Logic Gate LED Mapping**
The two input variables (`a` and `b`) are controlled by physical switches `SW[1]` and `SW[2]`. The outputs of the combinational logic circuits are mapped positionally to the green LEDs (`LEDG`) as follows:
* **LEDG[5]:** AND Gate (`SW[1] & SW[2]`)
* **LEDG[4]:** OR Gate (`SW[1] | SW[2]`)
* **LEDG[3]:** NOT Gate (`~SW[1]`)
* **LEDG[2]:** NAND Gate (`~(SW[1] & SW[2])`)
* **LEDG[1]:** NOR Gate (`~(SW[1] | SW[2])`)
* **LEDG[0]:** XOR Gate (`SW[1] ^ SW[2]`)

### Experiment 4: Ripple Carry Adder
*(Drag and drop your 4-bit ripple carry adder GIF here)*
* Detailed source code is located in the `/Lab1_Experiment_4` directory.

### Experiment 7: 16:1 Multiplexer
*(Drag and drop your 16:1 MUX channel-switching GIF here)*
* This 16:1 multiplexer is built using a structural model assembled from five 4:1 MUX modules. Detailed source code is located in the `/Lab1_Experiment_7` directory.
