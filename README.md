a solution for:
******************************************************************************************************
Languages: Verilog/VHDL
Simulator: Any available (https://en.wikipedia.org/wiki/List_of_HDL_simulators).

1. Clock domain crossing.

Please, write synthesizable code.

First clock domain(CD) frequency is 277 Mhz, Second – 103 MHz. There is a signal “A” in 1st CD 
which becomes active spontaneously with a variable rate. The task is to send every 1000 cycles in 2nd 
CD the amount of 1st CD periods the signal “A” has been active.

Input signals: clk1, clk2, A
Output signals: value[11:0], valid
*******************************************************************************************************

open Vivado 2021.1 and run test_1.tcl from project folder
